using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Paradigm3.datalayer;
using System.Threading.Tasks;
using System.Web.Security;
using System.Text;

namespace Paradigm3.custom.amtrak
{
	public partial class AmtrakSearch : SqlViewStatePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
				if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
				{
					string Message = GetLocalResourceObject("SessionTimeout").ToString();
					ClientScript.RegisterStartupScript(GetType(), "sessiontimeout", "alert('" + Message + "');window.close();", true);
				}
				Init_App();
			}
		}

		#region Initialization

		protected void Init_App()
		{
			List<AmtrakCategory> categories = Amtrak_Categories();
			ViewState["Categories"] = categories;

			Get_Types();
			Get_Fleets();
			Get_Systems();
			Get_Locations();
			Get_External();
		}

		private void Get_Types()
		{
			LBType.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.StartsWith("1_")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBType.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		private void Get_Fleets()
		{
			LBFleet.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.StartsWith("2_")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBFleet.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		private void Get_Systems()
		{
			LBSystem.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.StartsWith("3_")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBSystem.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		private void Get_Locations()
		{
			LBLocation.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.StartsWith("4_")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBLocation.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}		

		private void Get_External()
		{
			LBExternal.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.StartsWith("5_")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBExternal.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		#endregion

		#region Element Methods

		protected async void Button_Click(object sender, EventArgs e)
		{
			Button btn = (Button)sender;
			string arg = btn.CommandArgument;
			switch (arg)
			{
				case "submit":					
					bool FleetSelected = false;
					bool SystemSelected = false;
					bool LocationSelected = false;
					bool ExternalSelected = false;
					string typeQuery = string.Empty;
					string typeFilter = string.Empty;
					string fleetFilter = string.Empty;
					string systemFilter = string.Empty;
					string locationFilter = string.Empty;
					string externalFilter = string.Empty;

					StringBuilder sbSQL = new StringBuilder();
					sbSQL.Append("SELECT z.[ItemID], z.[OrigID], z.[Name], z.[LabelName], z.[Version], z.[VersionDate] FROM ");

					// Type Field Filter and Query
					for (int i = 0; i < LBType.Items.Count; i++)
                    {
						if (LBType.Items[i].Selected)
                        {
							if (string.IsNullOrEmpty(typeFilter))
                            {
								typeFilter = "AND (b.[CatID] = " + LBType.Items[i].Value;
                            }
							else
                            {
								typeFilter += " OR b.[CatID] = " + LBType.Items[i].Value;
                            }
                        }
                    }

					if (!string.IsNullOrEmpty(typeFilter))
                    {
						typeFilter += ")";
                    }

					StringBuilder sbType = new StringBuilder();
					sbType.Append("(");
					sbType.Append("SELECT a.[ItemID], a.[OrigID], a.[Name], a.[LabelName], a.[Version], a.[VersionDate] ");
					sbType.Append("FROM [dbo].[Items3] AS a ");
					sbType.Append("LEFT JOIN [dbo].[CatgryValues] AS b ON a.[OrigID] = b.[OrigID] AND b.[ModuleID] = 3 AND b.[IDType] = 1 ");
					sbType.Append("WHERE a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithDrawn] = 0 AND a.[TypeOfPublish] > 0 AND ISNULL(a.[Name], '') <> '' ");
					sbType.Append(typeFilter);
					sbType.Append(") ");
					sbType.Append("AS Z");
					sbSQL.Append(sbType.ToString());

					// Fleet Field Filter and Query
					for (int i = 0; i < LBFleet.Items.Count; i++)
					{
						if (LBFleet.Items[i].Selected)
						{
							FleetSelected = true;
							if (string.IsNullOrEmpty(fleetFilter))
							{
								fleetFilter = "AND (b.[CatID] = " + LBFleet.Items[i].Value;
							}
							else
							{
								fleetFilter += " OR b.[CatID] = " + LBFleet.Items[i].Value;
							}
						}						
					}

					if (!string.IsNullOrEmpty(fleetFilter))
					{
						fleetFilter += ")";
					}

					if (FleetSelected)
					{
						StringBuilder sbFleet = new StringBuilder();
						sbFleet.Append(" INNER JOIN ");
						sbFleet.Append("(");
						sbFleet.Append("SELECT a.[ItemID], a.[OrigID], a.[Name], a.[LabelName], a.[Version], a.[VersionDate] ");
						sbFleet.Append("FROM [dbo].[Items3] AS a ");
						sbFleet.Append("LEFT JOIN [dbo].[CatgryValues] AS b ON a.[OrigID] = b.[OrigID] AND b.[ModuleID] = 3 AND b.[IDType] = 1 ");
						sbFleet.Append("WHERE a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithDrawn] = 0 AND a.[TypeOfPublish] > 0 AND ISNULL(a.[Name], '') <> '' ");
						sbFleet.Append(fleetFilter);
						sbFleet.Append(") ");
						sbFleet.Append("AS Y ON y.[OrigID] = z.[OrigID]");
						sbSQL.Append(sbFleet.ToString());
					}

					// System Field Filter and Query
					for (int i = 0; i < LBSystem.Items.Count; i++)
					{
						if (LBSystem.Items[i].Selected)
						{
							SystemSelected = true;
							if (string.IsNullOrEmpty(systemFilter))
							{
								systemFilter = "AND (b.[CatID] = " + LBSystem.Items[i].Value;
							}
							else
							{
								systemFilter += " OR b.[CatID] = " + LBSystem.Items[i].Value;
							}
						}
					}

					if (!string.IsNullOrEmpty(systemFilter))
					{
						systemFilter += ")";
					}

					if (SystemSelected)
					{
						StringBuilder sbSystem = new StringBuilder();
						sbSystem.Append(" INNER JOIN ");
						sbSystem.Append("(");
						sbSystem.Append("SELECT a.[ItemID], a.[OrigID], a.[Name], a.[LabelName], a.[Version], a.[VersionDate] ");
						sbSystem.Append("FROM [dbo].[Items3] AS a ");
						sbSystem.Append("LEFT JOIN [dbo].[CatgryValues] AS b ON a.[OrigID] = b.[OrigID] AND b.[ModuleID] = 3 AND b.[IDType] = 1 ");
						sbSystem.Append("WHERE a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithDrawn] = 0 AND a.[TypeOfPublish] > 0 AND ISNULL(a.[Name], '') <> '' ");
						sbSystem.Append(systemFilter);
						sbSystem.Append(") ");
						sbSystem.Append("AS X ON x.[OrigID] = z.[OrigID]");
						sbSQL.Append(sbSystem.ToString());
					}

					// Location Field Filter and Query
					for (int i = 0; i < LBLocation.Items.Count; i++)
					{
						if (LBLocation.Items[i].Selected)
						{
							LocationSelected = true;
							if (string.IsNullOrEmpty(locationFilter))
							{
								locationFilter = "AND (b.[CatID] = " + LBLocation.Items[i].Value;
							}
							else
							{
								locationFilter += " OR b.[CatID] = " + LBLocation.Items[i].Value;
							}
						}
					}
					
					if (!string.IsNullOrEmpty(locationFilter))
					{
						locationFilter += ")";
					}

					if (LocationSelected)
					{
						StringBuilder sbLocation = new StringBuilder();
						sbLocation.Append(" INNER JOIN ");
						sbLocation.Append("(");
						sbLocation.Append("SELECT a.[ItemID], a.[OrigID], a.[Name], a.[LabelName], a.[Version], a.[VersionDate] ");
						sbLocation.Append("FROM [dbo].[Items3] AS a ");
						sbLocation.Append("LEFT JOIN [dbo].[CatgryValues] AS b ON a.[OrigID] = b.[OrigID] AND b.[ModuleID] = 3 AND b.[IDType] = 1 ");
						sbLocation.Append("WHERE a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithDrawn] = 0 AND a.[TypeOfPublish] > 0 AND ISNULL(a.[Name], '') <> '' ");
						sbLocation.Append(locationFilter);
						sbLocation.Append(") ");
						sbLocation.Append("AS W ON w.[OrigID] = z.[OrigID]");
						sbSQL.Append(sbLocation.ToString());
					}

					// External Field Filter and Query
					for (int i = 0; i < LBExternal.Items.Count; i++)
					{
						if (LBExternal.Items[i].Selected)
						{
							ExternalSelected = true;
							if (string.IsNullOrEmpty(externalFilter))
							{
								externalFilter = "AND (b.[CatID] = " + LBExternal.Items[i].Value;
							}
							else
							{
								externalFilter += " OR b.[CatID] = " + LBExternal.Items[i].Value;
							}
						}
					}

					if (!string.IsNullOrEmpty(externalFilter))
					{
						externalFilter += ")";
					}

					if (ExternalSelected)
					{
						StringBuilder sbExternal = new StringBuilder();
						sbExternal.Append(" INNER JOIN ");
						sbExternal.Append("(");
						sbExternal.Append("SELECT a.[ItemID], a.[OrigID], a.[Name], a.[LabelName], a.[Version], a.[VersionDate] ");
						sbExternal.Append("FROM [dbo].[Items3] AS a ");
						sbExternal.Append("LEFT JOIN [dbo].[CatgryValues] AS b ON a.[OrigID] = b.[OrigID] AND b.[ModuleID] = 3 AND b.[IDType] = 1 ");
						sbExternal.Append("WHERE a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithDrawn] = 0 AND a.[TypeOfPublish] > 0 AND ISNULL(a.[Name], '') <> '' ");
						sbExternal.Append(externalFilter);
						sbExternal.Append(") ");
						sbExternal.Append("AS V ON v.[OrigID] = z.[OrigID]");
						sbSQL.Append(sbExternal.ToString());
					}

					sbSQL.Append(" GROUP BY z.[ItemID], z.[OrigID], z.[Name], z.[LabelName], z.[Version], z.[VersionDate]");
					sbSQL.Append(" ORDER BY z.[Name];");

					string sqlcmd = sbSQL.ToString();

					DataTable dt = await Get_Results(sqlcmd);
					ViewState["FinalResults"] = dt;
					GVResults.DataSource = dt;
					GVResults.DataBind();
					lblTotal.Text = dt.Rows.Count.ToString() + " items found!";

					ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "restore", "setDisplay()", true);
					break;
				case "reset":
					foreach (ListItem li in LBType.Items)
					{
						if (li.Selected)
						{
							li.Selected = false;
						}
					}
					foreach (ListItem li in LBFleet.Items)
					{
						if (li.Selected)
						{
							li.Selected = false;
						}
					}
					foreach (ListItem li in LBSystem.Items)
					{
						if (li.Selected)
						{
							li.Selected = false;
						}
					}
					foreach (ListItem li in LBLocation.Items)
					{
						if (li.Selected)
						{
							li.Selected = false;
						}
					}
					foreach (ListItem li in LBExternal.Items)
					{
						if (li.Selected)
						{
							li.Selected = false;
						}
					}

					ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "restore", "resetDisplay()", true);
					GVResults.DataSource = null;
					GVResults.DataBind();
					lblTotal.Text = string.Empty;
					GVResults.SelectedIndex = -1;
					break;
			}

		}

		protected void GVResults_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				string itemid = GVResults.DataKeys[e.Row.RowIndex].Values["OrigID"].ToString();
				e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GVResults, "Select$" + e.Row.RowIndex) + ";";
				e.Row.Attributes.Add("ondblclick", "openAmtrakDocument(" + itemid + ");");
			}
		}

		protected void GVResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			GVResults.SelectedIndex = -1;
			DataTable FinalResults = (DataTable)ViewState["FinalResults"];
			GVResults.DataSource = FinalResults;
			GVResults.PageIndex = e.NewPageIndex;
			GVResults.DataBind();
		}

		#endregion

		#region Data Access Layer

		private List<AmtrakCategory> Amtrak_Categories()
		{
			List<AmtrakCategory> categories = new List<AmtrakCategory>();
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				SqlCommand cmd = new SqlCommand("SELECT [CatID], [CatCaption] " +
					"FROM [dbo].[CatDateSet] " +
					"WHERE [ModuleID] = 3 AND [CatClass] = 0 " +
					"ORDER BY [CatClass]", conn);
				SqlDataReader sdr = cmd.ExecuteReader();
				while (sdr.Read())
				{
					AmtrakCategory cat = new AmtrakCategory()
					{
						CatID = Convert.ToInt32(sdr["CatID"]),
						CatCaption = sdr["CatCaption"].ToString()
					};
					categories.Add(cat);
				}
			}

			return categories;
		}

		private async Task<DataTable> Get_Results(string sqlcmd)
		{
			DataTable dt = new DataTable();
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				await conn.OpenAsync();
				SqlCommand cmd = new SqlCommand(sqlcmd, conn)
				{
					CommandType = CommandType.Text
				};
				SqlDataReader sdr = await cmd.ExecuteReaderAsync();
				dt.Load(sdr);
			}
			return dt;
		}

		#endregion
		
	}
}