using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Paradigm3.datalayer;
using System.Xml;
using System.Configuration;
using System.IO;
using System.Drawing;
using ClosedXML.Excel;
using System.Web.Security;

namespace Paradigm3
{
    public partial class ViewReport : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
                int ReportID = Convert.ToInt32(Request.QueryString["ReportID"]);
                try
                {

					string title = GetReportName(ReportID);
					lblTitle.Text = title;
					lblReportName.Text = title;
					lblReportFolder.Text = P3General.Get_GroupName(ModuleID, GroupID);
					
					await gvDataBindAsync(ModuleID, GroupID, ReportID);
				}
                catch (Exception ex)
                {
					string msg = ex.Message.Replace(Environment.NewLine, string.Empty);
					msg = msg.Replace("'", string.Empty);
					ScriptManager.RegisterStartupScript(udpMain, GetType(), "err", "alert('" + msg + "')", true);
				}

            }
        }

		private async Task<string> Get_SqlCommandAsync(int ModuleID, int GroupID, int ReportID)
		{
			string ReportData = await Task.FromResult(Reports.GetSavedReport(ReportID));
			string Filters = string.Empty;
			string Sql;
			string Value = string.Empty;
			string CatID = string.Empty;
			string DBColumn = string.Empty;
			string selItemsTable = string.Empty;
			string selGroupsTable = string.Empty;

			var XmlDoc = new XmlDocument();
			XmlDoc.LoadXml(ReportData);
			XmlNodeList nodes = XmlDoc.SelectNodes("SearchAndReport");
			XmlNode root = nodes[0];
			

			// Select Tables for Query
			switch(ModuleID)
			{
				case 3:
					selItemsTable = "[dbo].[Items3]";
					selGroupsTable = "[dbo].[Groups3]";
					break;
				case 4:
					selItemsTable = "[dbo].[Items4]";
					selGroupsTable = "[dbo].[Groups4]";
					break;
				case 6:
					selItemsTable = "[dbo].[Items6]";
					selGroupsTable = "[dbo].[Groups6]";
					break;
				case 12:
					selItemsTable = "[dbo].[Items12]";
					selGroupsTable = "[dbo].[Groups12]";
					break;
				case 14:
					selItemsTable = "[dbo].[Items14]";
					selGroupsTable = "[dbo].[Groups14]";
					break;
			}

			// Get GroupID if Specified in Report
			string ID = root.ChildNodes[0].ChildNodes[1].InnerText;
			if (!string.IsNullOrEmpty(ID))
			{
				GroupID = Convert.ToInt32(ID);
			}

			// Get Complex Search Criteria if Exsists
			foreach (XmlNode filter in root.ChildNodes[0])
			{
				if (filter.Name == "SearchConditions")
				{
					foreach (XmlNode cond in filter.ChildNodes)
					{
						if (cond.Name == "CmplxSearchCondition2")
						{
							Filters = P3Security.ProcessGTST(cond.ChildNodes[1].InnerText, 2);
							if (Filters.Contains(" Name"))
							{
								string name = "Name";
								string addon = "a.";
								Filters = Filters.Insert(Filters.IndexOf(name), addon);
							}

							if (Filters.Contains("LabelName"))
							{
								string label = "LabelName";
								string addon = "a.";
								Filters = Filters.Insert(Filters.IndexOf(label), addon);
							}

							if (Filters.Contains("Status"))
							{
								string status = "Status";
								string addon = "a.";
								Filters = Filters.Insert(Filters.IndexOf(status), addon);
							}

							if (Filters.Contains("ItemID"))
							{
								string ItemIDtxt = "ItemID";
								string addon = "a.";
								Filters = Filters.Insert(Filters.IndexOf(ItemIDtxt), addon);
							}

							if (Filters.Contains("OrigID"))
							{
								string OrigIDtxt = "OrigID";
								string addon = "a.";
								Filters = Filters.Insert(Filters.IndexOf(OrigIDtxt), addon);
							}
						}
					}
				}

				if (filter.Name == "Categories")
				{
					CatID = filter.ChildNodes[0].InnerText;
					CatID = " AND e.[CatID] = " + CatID + " AND e.[ModuleID] = " + ModuleID;
				}
			}

			// Get Display Fields for Report
			foreach (XmlNode node in root.ChildNodes[1])
			{
				if (node.Name == "ReportFields")
				{
					string[] fieldTags = node.ChildNodes[0].InnerText.Split('_');
					string Tag = fieldTags[fieldTags.Length - 1].Trim();
					string EDTag = fieldTags[fieldTags.Length - 2].Trim();

					if (EDTag == "0")
					{
						switch (Tag)
						{
							case "1":
								DBColumn = "a.[ItemID] AS [ID]";
								break;
							case "2":
								DBColumn = "a.[Name] AS [Item Name]";
								break;
							case "3":
								DBColumn = "a.[LabelName] AS [Item Label]";
								break;
							case "4":
								DBColumn = "a.[OrigID] AS [Orig ID]";
								break;
							case "5":
								switch (ModuleID)
								{
									case 3:
										DBColumn = "CASE a.[Status] " +
											"WHEN 0 THEN 'Obsolete' " +
											"WHEN 2 THEN 'Draft' " +
											"WHEN 3 THEN 'Collaborate' " +
											"WHEN 4 THEN 'Ready' " +
											"WHEN 5 THEN 'Under Review' " +
											"WHEN 7 THEN 'Pending' " +
											"ELSE 'Current' END AS [Item Status]";
										break;
									case 4:
									case 6:
									case 12:
										DBColumn = "CASE a.[Status] " +
											"WHEN 2 THEN 'Open' " +
											"ELSE 'Complete' END AS [Item Status]";
										break;
								}
								break;
							case "6":
								DBColumn = "a.[VersionedBy] AS [Converted By]";
								break;
							case "7":
								DBColumn = "CONVERT(VARCHAR(10), a.[VersionDate], 103) AS [Converted Date]";
								break;
							case "8":
								DBColumn = "a.[Version] AS [Version]";
								break;
							case "9":
								DBColumn = "b.[Name] as [Folder Name]";
								break;
							case "10":
								DBColumn = "(SELECT TOP 1 STUFF((SELECT ','+ z.[CatCaption] " +
									"FROM[dbo].[CatDateSet] AS z " +
									"INNER JOIN [dbo].[CatgryValues] AS zy ON zy.[CatID] = z.[CatID] AND zy.[OrigID] = a.[OrigID] " +
									"WHERE zy.[ModuleID] = @ModuleID " +
									"GROUP BY z.[CatCaption] FOR XML PATH(''), TYPE).value('.','VARCHAR(max)'), 1, 1, '') AS [Category] " +
									"FROM[dbo].[CatDateSet] r) AS [Category]";
								break;
							case "17":
								DBColumn = "CONVERT(VARCHAR(10), a.[EffectDate], 103) AS [Effective Date]";
								break;
							case "21":
								DBColumn = "c.[MemoData] AS [History]";
								break;
							case "22":
								DBColumn = "CONVERT(VARCHAR(10), a.[CreateDate], 103) AS [Date Created]";
								break;
							case "23":
								DBColumn = "CONVERT(VARCHAR(10), a.[LastModified], 103) AS [Last Modified]";
								break;
						}
					}
					else
					{
						string colName = ColumnName(Convert.ToInt32(Tag));
						switch (EDTag)
						{
							case "2":
								DBColumn = "CONVERT(VARCHAR(10), (SELECT ev.[TriggerDate] FROM [dbo].[EventDate] AS ev WHERE ev.[ModuleID] = @ModuleID AND ev.[CatID] = " + Tag + " AND ev.[OrigID] = a.[OrigID]), 103) AS [" + colName + "]";
								break;
							case "4":
								DBColumn = "CONVERT(VARCHAR(10), (SELECT ev.[DateValue] FROM [dbo].[EventDate] AS ev WHERE ev.[ModuleID] = @ModuleID AND ev.[CatID] = " + Tag + " AND ev.[OrigID] = a.[OrigID]), 103) AS [" + colName + "]";
								break;
						}
					}

					Value += "," + DBColumn;
				}

				Value = Value.TrimStart(',');
				Value = Value.TrimEnd(',');
				Value = Value.Trim();
			}

			if (ModuleID == 3)
			{
				Sql = ";WITH cte AS " +
					"(" +
						"SELECT [GroupID] " +
						"FROM " + selGroupsTable + 
						" WHERE ([GroupID] = " + GroupID + " OR [ParentGroupID] = " + GroupID + " ) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '' " +
						"UNION ALL " +
						"SELECT a.[GroupID] " +
						"FROM " + selGroupsTable + " AS a " +
						"INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] " +
						"WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> '' " +
					") " + 
					"SELECT ROW_NUMBER() OVER(PARTITION BY a.[OrigID] ORDER BY a.[Itemid] DESC) AS rn, " +
						"a.[ItemID], a.[OrigID], a.[ParentGroupID], a.[TypeOfPublish], a.[IsEvidence], a.[IsCheckedOut], a.[Status], a.[FileExtension], " + Value +
					"INTO #temptable FROM " + selItemsTable + " AS a " +
					"INNER JOIN " + selGroupsTable + " AS b ON a.[ParentGroupID] = b.[GroupID] AND b.[IsDeleted] = 0 " +
					"INNER JOIN [dbo].[HistoryMemo] AS c ON a.[OrigID] = c.[OrigID] AND c.[ModuleID] = @ModuleID " +
					"LEFT JOIN [dbo].[EventDate] AS d ON a.[OrigID] = d.[OrigID] AND d.[ModuleID] = @ModuleID AND d.[SetType] = 1 " +
					"LEFT JOIN [dbo].[CatgryValues] AS e ON e.[OrigID] = a.[OrigID] " + 
					"WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0 " + Filters + CatID +
					" ORDER BY a.[Name] " +
					"SELECT * FROM #temptable WHERE rn = 1 " +
					"ORDER BY [Item Name] " +
					"DROP TABLE #temptable";
			}
			else
			{
				Sql = ";WITH cte AS " +
					"(SELECT [GroupID] FROM " + selGroupsTable + " WHERE [GroupID] = " + GroupID + " OR [ParentGroupID] = " + GroupID +
					"UNION ALL " +
					"SELECT a.[GroupID] FROM " + selGroupsTable + " AS a INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]) " +
					"SELECT ROW_NUMBER() OVER(PARTITION BY a.[OrigID] ORDER BY a.[Itemid] DESC) AS rn, " +
					"a.[ItemID], a.[OrigID], a.[ParentGroupID], a.[Status], " + Value +
					"INTO #temptable " +
					" FROM " + selItemsTable + " AS a " +
					"INNER JOIN " + selGroupsTable + " AS b ON a.[ParentGroupID] = b.[GroupID] AND b.[IsDeleted] = 0 " +
					"INNER JOIN [dbo].[HistoryMemo] AS c ON a.[OrigID] = c.[OrigID] AND c.[ModuleID] = @ModuleID " +
					"LEFT JOIN [dbo].[EventDate] AS d ON a.[OrigID] = d.[OrigID] AND d.[ModuleID] = @ModuleID AND d.[SetType] = 1 " +
					"LEFT JOIN [dbo].[CatgryValues] AS e ON e.[OrigID] = a.[OrigID] " + 
					"WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0 " + Filters + CatID +
					"ORDER BY a.[Name] " +
					"SELECT * FROM #temptable WHERE rn = 1 " +
					"ORDER BY [Item Name] " +
					"DROP TABLE #temptable";
			}

			//ScriptManager.RegisterStartupScript(udpMain, udpMain.GetType(), "", "alert('" + ID + "');", true);
			//Response.Write(Sql);
			lblReportFolder.Text = await Task.FromResult(P3General.Get_GroupName(ModuleID, Convert.ToInt32(ID)));
			return await Task.FromResult(Sql);
		}

        protected async Task gvDataBindAsync(int ModuleID, int GroupID, int ReportID)
        {			
			string Sql = await Get_SqlCommandAsync(ModuleID, GroupID, ReportID);
            try
            {
				DataTable dt = await GetReportDataAsync(ModuleID, Sql);
				GridView1.DataSource = dt;
				switch (ModuleID)
				{
					case 3:
						GridView1.DataKeyNames = new string[] { "ItemID", "OrigID", "FileExtension", "ParentGroupID", "TypeOfPublish", "IsEvidence", "IsCheckedOut", "Status" };
						break;
					case 4:
					case 6:
					case 12:
						GridView1.DataKeyNames = new string[] { "ItemID", "OrigID", "ParentGroupID", "Status", "ObjTypeID" };
						break;
				}
				GridView1.DataBind();
				lblReport.Text = dt.Rows.Count.ToString();
				ViewState["gvData"] = dt;

			}
            catch (SqlException ex)
            {
				string msg = ex.Message.Replace(Environment.NewLine, string.Empty);
				msg = msg.Replace("'", string.Empty);
				ScriptManager.RegisterStartupScript(udpMain, GetType(), "err", "alert('" + msg + "');window.close();", true);
			}

        }

		protected async Task<DataTable> GetReportDataAsync(int ModuleID, string Sql)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand(Sql, conn);
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return await Task.FromResult(dt);
        }

        protected string GetReportName(int ReportID)
        {
            string result = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [SrchAndRprtName] FROM [dbo].[SearchAndReport] WHERE [SrchAndRprtID] = @ReportID", conn);
                cmd.Parameters.Add("@ReportID", SqlDbType.Int, 4).Value = ReportID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    result = sdr["SrchAndRprtName"].ToString();
                }
            }
            return result;
        }

        private string ColumnName(int id)
        {
            string result = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [CatCaption] FROM [dbo].[CatDateSet] WHERE [CatID] = @CatID", conn);
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = id;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    result = sdr["CatCaption"].ToString();
                }
            }
            return result;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
			int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			if (e.Row.RowType == DataControlRowType.Header)
			{
				e.Row.Cells[0].Visible = false;
				e.Row.Cells[1].Visible = false;
				e.Row.Cells[2].Visible = false;
				e.Row.Cells[3].Visible = false;
				e.Row.Cells[4].Visible = false;
				e.Row.Cells[5].Visible = false;
				if (ModuleID == 3)
				{
					e.Row.Cells[6].Visible = false;
					e.Row.Cells[7].Visible = false;
					e.Row.Cells[8].Visible = false;
				}
			}
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
				e.Row.Attributes["onclick"] = "saveReportScrollPos();" + Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);

				e.Row.Cells[0].Visible = false;
				e.Row.Cells[1].Visible = false;
				e.Row.Cells[2].Visible = false;
				e.Row.Cells[3].Visible = false;
				e.Row.Cells[4].Visible = false;
				e.Row.Cells[5].Visible = false;
				if (ModuleID == 3)
				{
					e.Row.Cells[6].Visible = false;
					e.Row.Cells[7].Visible = false;
					e.Row.Cells[8].Visible = false;
				}

				switch (ModuleID)
                {
                    case 3:
						string pubPath = ConfigurationManager.AppSettings["PublishPath"];
						int ItemID = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values["ItemID"]);
						string ShowItemID = ItemID.ToString();
						string ShowOrigID = GridView1.DataKeys[e.Row.RowIndex].Values["OrigID"].ToString();
						string ShowItemStatus = GridView1.DataKeys[e.Row.RowIndex].Values["Status"].ToString();
						bool ShowIsItemID = false;
						if (ShowItemStatus != "9")
						{
							ShowIsItemID = true;
						}
						string ShowFileExtension = GridView1.DataKeys[e.Row.RowIndex].Values["FileExtension"].ToString();
						string ShowTypeOfPublish = GridView1.DataKeys[e.Row.RowIndex].Values["TypeOfPublish"].ToString();
						string strView = ShowItemID + "," + ShowOrigID + "," + ShowItemStatus + ",'" + ShowIsItemID + "'," + pubPath + ",'" + ShowFileExtension + "'," + ShowTypeOfPublish;
						e.Row.Attributes.Add("ondblclick", "openDocWindow(" + strView + ");");
						break;
                    case 4:
                    case 6:
                    case 12:
                        int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
                        int ObjTypeID = P3General.Get_ObjTypeID(ModuleID, GroupID);
                        string strViewRecordVar = ModuleID.ToString() + "," + e.Row.Cells[1].Text + "," + ObjTypeID.ToString() + "," + GroupID.ToString() + ",0";
                        e.Row.Attributes.Add("ondblclick", "openRecordWindow(" + strViewRecordVar + ");");
                        break;
                }
            }
        }

		protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				e.Row.Attributes["onclick"] = "saveReportScrollPos(); " + Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
			}
		}

		public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

		protected void btnWord_Click(object sender, EventArgs e)
		{
			//int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			//int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
			//int ReportID = Convert.ToInt32(Request.QueryString["ReportID"]);

			Response.Clear();
			Response.Buffer = true;
			Response.AddHeader("content-disposition", "attachment; filename=P3Web_Report.doc");
			Response.Charset = "";
			Response.ContentType = "application/ms-word";
			using (StringWriter sw = new StringWriter())
			{
				HtmlTextWriter hw = new HtmlTextWriter(sw);

				//To Export all pages
				GridView1.AllowPaging = false;
				DataTable dt = (DataTable)ViewState["gvData"];
				GridView1.DataSource = dt;
				GridView1.DataBind();

				GridView1.HeaderRow.BackColor = Color.White;
				foreach (TableCell cell in GridView1.HeaderRow.Cells)
				{
					cell.BackColor = GridView1.HeaderStyle.BackColor;
				}
				foreach (GridViewRow row in GridView1.Rows)
				{
					row.BackColor = Color.White;
					foreach (TableCell cell in row.Cells)
					{
						if (row.RowIndex % 2 == 0)
						{
							cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
						}
						else
						{
							cell.BackColor = GridView1.RowStyle.BackColor;
						}
						cell.CssClass = "textmode";
					}
				}

				GridView1.RenderControl(hw);

				//style to format numbers to string
				string style = @"<style> .textmode { } </style>";
				Response.Write(style);
				Response.Output.Write(sw.ToString());
				Response.Flush();
				Response.End();
			}
		}

		protected void btnExcel_Click(object sender, EventArgs e)
		{
			//int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			//int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
			//int ReportID = Convert.ToInt32(Request.QueryString["ReportID"]);

			Response.Clear();
			Response.Buffer = true;
			Response.ContentType = "application/vnd.ms-excel";
			Response.AddHeader("content-disposition", "attachment;filename=DataExport.xls");

			using (StringWriter sw = new StringWriter())
			{
				HtmlTextWriter hw = new HtmlTextWriter(sw);

				//To Export all pages
				GridView1.AllowPaging = false;
				DataTable dt = (DataTable)ViewState["gvData"];
				GridView1.DataSource = dt;
				GridView1.DataBind();
				//gvDataBindAsync(ModuleID, GroupID, ReportID);

				GridView1.HeaderRow.BackColor = Color.White;
				foreach (TableCell cell in GridView1.HeaderRow.Cells)
				{
					cell.BackColor = GridView1.HeaderStyle.BackColor;
				}
				foreach (GridViewRow row in GridView1.Rows)
				{
					row.BackColor = Color.White;
					foreach (TableCell cell in row.Cells)
					{
						if (row.RowIndex % 2 == 0)
						{
							cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
						}
						else
						{
							cell.BackColor = GridView1.RowStyle.BackColor;
						}
						cell.CssClass = "textmode";
					}
				}

				GridView1.RenderControl(hw);

				//style to format numbers to string
				string style = @"<style> .textmode { } </style>";
				Response.Write(style);
				Response.Output.Write(sw.ToString());
				Response.Flush();
				Response.End();
			}
		}

		private void CreateTable(GridView gv, ref DataTable dt)
		{
			for (int i = 0; i < gv.HeaderRow.Cells.Count; i++)
				dt.Columns.Add(gv.HeaderRow.Cells[i].Text);
			// fill rows             
			foreach (GridViewRow row in gv.Rows)
			{
				DataRow dr;
				dr = dt.NewRow();
				for (int i = 0; i < row.Cells.Count; i++)
				{
					dr[i] = row.Cells[i].Text.Replace("&nbsp;", "");
				}
				dt.Rows.Add(dr);
			}
		}

		protected async void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
			int ReportID = Convert.ToInt32(Request.QueryString["ReportID"]);

			GridView1.PageIndex = e.NewPageIndex;
			await gvDataBindAsync(ModuleID, GroupID, ReportID);
		}
	}
}