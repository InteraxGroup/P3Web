using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading.Tasks;
using Paradigm3.datalayer;
using System.Web.Security;

namespace Paradigm3
{
	public partial class ViewPrintRecord : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
			int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			if (!IsPostBack)
			{
				bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
				if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
				{
					Response.Redirect("Default.aspx", false);
				}
				else
				{
					await Initialize(ModuleID);
				}				
			}
		}

		protected async Task Initialize(int moduleId)
		{
			lblCompanyName.Text = await CompanyNameAsync();
			await GetDataAsync(moduleId);
		}

		#region Data

		private async Task<string> CompanyNameAsync()
		{
			string CName = string.Empty;
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				SqlCommand cmd = new SqlCommand("SELECT [Value1] FROM [dbo].[SystemSettings] WHERE [P3Key] = 'CompanyName'", conn);
				SqlDataReader sdr = cmd.ExecuteReader();
				while (sdr.Read())
				{
					CName = sdr["Value1"].ToString();
				}
			}

			return await Task.FromResult(CName);
		}

		private async Task<string> ParentFolderAsync(int moduleId, int groupID)
		{
			string queryTable = string.Empty;
			switch (moduleId)
			{
				case 4:
					queryTable = "SELECT [Name] FROM [dbo].[Groups4]";
					break;
				case 6:
					queryTable = "SELECT [Name] FROM [dbo].[Groups6]";
					break;
				case 12:
					queryTable = "SELECT [Name] FROM [dbo].[Groups12]";
					break;
			}
			string result = string.Empty;
			string sql = queryTable + " WHERE [GroupID] = @GroupID";
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				SqlCommand cmd = new SqlCommand(sql, conn);
				cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = groupID;
				SqlDataReader sdr = cmd.ExecuteReader();
				while (sdr.Read())
				{
					result = sdr["Name"].ToString();
				}
			}
			return await Task.FromResult(result);
		}

		private async Task GetDataAsync(int moduleId)
		{
			// Get Record Data from session
			DataSet ds = await Task.FromResult((DataSet)Session["PrintData"]);
			// Populate Header Fields
			lblItemName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
			lblItemParentFolder.Text = await ParentFolderAsync(moduleId, Convert.ToInt32(ds.Tables[0].Rows[0]["ParentGroupID"]));
			lblItemCreatedBy.Text = ds.Tables[0].Rows[0]["CreateBy"].ToString();
			lblItemCreatedOn.Text = ds.Tables[0].Rows[0]["CreateDate"].ToString();
			int RecordStatus = Convert.ToInt32(ds.Tables[0].Rows[0]["Status"].ToString());
			lblItemStatus.Text = "Open";
			if (RecordStatus == 0)
			{
				lblItemStatus.Text = "Complete";
			}
			lblItemCompletedDate.Text = string.Empty;
			if (RecordStatus == 0)
			{
				lblItemCompletedDate.Text = ds.Tables[0].Rows[0]["VersionDate"].ToString();
			}

			// Populate Page Repeater Data
			DataTable dtPages = ds.Tables[1];
			rptStep.DataSource = dtPages;
			rptStep.DataBind();

		}

		private async Task<DataTable> Get_StepDueDateAndResponsible(int ItemID, int ObjTypeID)
		{
			DataTable dt = new DataTable();
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				string sql = "SELECT a.[DueDate], b.[ControlFullName] " +
					"FROM[dbo].[DueDate] AS a " +
					"INNER JOIN[dbo].[ControlLists] AS b ON a.[ObjTypeID] = b.[ObjTypeID] AND b.[OrigID] = @ItemID " +
					"WHERE a.[OrigID] = @ItemID AND a.[ObjTypeID] = @ObjTypeID";
				SqlCommand cmd = new SqlCommand(sql, conn);
				cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
				cmd.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
				SqlDataReader sdr = cmd.ExecuteReader();
				dt.Load(sdr);
			}
			return await Task.FromResult(dt);
		}

		#endregion

		#region Repeater Events

		protected async void rptStep_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				DataRowView drv = (DataRowView)e.Item.DataItem;
				DataSet ds = await Task.FromResult((DataSet)Session["PrintData"]);
				int ItemID = Convert.ToInt32(ds.Tables[0].Rows[0]["ItemID"]);
				int ObjTypeID = Convert.ToInt32(drv["ObjTypeID"]);
				int moduleId = Convert.ToInt32(Request.QueryString["ModuleID"]);
				Label lblStepType = (Label)e.Item.FindControl("lblStepType");
				
				switch (moduleId)
				{
					case 4:
					case 12:
						lblStepType.Text = "Page";
						break;
					case 6:
						lblStepType.Text = "Step";
						// Define Step Due Date and Responsible (if applicable)
						Label lblStepDueDate = (Label)e.Item.FindControl("lblStepDueDate");
						Label lblStepResponsible = (Label)e.Item.FindControl("lblStepResponsible");
						DataTable dtDDR = await Get_StepDueDateAndResponsible(ItemID, ObjTypeID);
						lblStepDueDate.Text = "Not Set";
						lblStepResponsible.Text = "Not Set";
						if (dtDDR.Rows.Count > 0)
						{
							if (dtDDR.Rows[0]["DueDate"] != DBNull.Value)
							{
								lblStepDueDate.Text = dtDDR.Rows[0]["DueDate"].ToString();
							}

							string Resp = string.Empty;
							foreach (DataRow dr1 in dtDDR.Rows)
							{
								Resp += dr1["ControlFullName"] + ",";
							}
							lblStepResponsible.Text = Resp.TrimEnd(',');
						}

						// Show Panels
						Panel pnlStepDueDate = (Panel)e.Item.FindControl("pnlStepDueDate");
						Panel pnlStepResponsible = (Panel)e.Item.FindControl("pnlStepResponsible");
						Panel pnlStepCompleted = (Panel)e.Item.FindControl("pnlStepCompleted");
						pnlStepDueDate.Visible = true;
						pnlStepResponsible.Visible = true;
						pnlStepCompleted.Visible = true;
						break;
				}

				DataTable dt = ds.Tables[2].AsEnumerable().Where(row => row.Field<int>("ObjTypeID") == ObjTypeID && row.Field<int>("FieldType") != 10).CopyToDataTable();

				Repeater rptStepData = (Repeater)e.Item.FindControl("rptStepData");
				rptStepData.DataSource = dt;
				rptStepData.DataBind();
			}
		}

		protected async void rptStepData_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				DataRowView dr = (DataRowView)e.Item.DataItem;
				int FieldID = Convert.ToInt32(dr["FieldID"]);
				int FieldType = Convert.ToInt32(dr["FieldType"]);
				DataSet ds = await Task.FromResult((DataSet)Session["PrintData"]);
				DataTable dt = ds.Tables[3].AsEnumerable().Where(row => row.Field<int>("FieldID") == FieldID).CopyToDataTable();
				Label lblFieldData = (Label)e.Item.FindControl("lblFieldData");

				switch (FieldType)
				{
					case 0:
					case 3:
					case 7:
						lblFieldData.Text = dt.Rows[0]["TextData"].ToString();
						break;
					case 1:
						lblFieldData.Text = dt.Rows[0]["TextData"].ToString();
						break;
					case 6:
						lblFieldData.Text = P3General.RTFtoText(dt.Rows[0]["MemoData"].ToString());
						break;
					case 4:
					case 16:
						lblFieldData.Text = Convert.ToDateTime(dt.Rows[0]["DateData"]).ToShortDateString();
						break;
					case 8:
						lblFieldData.Text = dt.Rows[0]["NumData"].ToString();
						break;
					case 2:
						bool IsChecked = Convert.ToBoolean(dt.Rows[0]["NumData"]);
						if (IsChecked)
						{
							lblFieldData.Text = "Yes";
						}
						else
						{
							lblFieldData.Text = "No";
						}
						break;
				}
			}
		}

		#endregion
	}
}