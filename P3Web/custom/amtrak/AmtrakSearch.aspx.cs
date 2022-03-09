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
					string typeFilter = string.Empty;
					string fleetFilter = string.Empty;
					string systemFilter = string.Empty;
					string locationFilter = string.Empty;
					string externalFilter = string.Empty;

					// Set Type Filters
					foreach(ListItem li in LBType.Items)
					{
						if (li.Selected)
						{
							if (string.IsNullOrEmpty(typeFilter))
							{
								typeFilter = "[CatID] = " + li.Value + " OR";
							}
							else
							{
								typeFilter = typeFilter + " [CatID] = " + li.Value + " OR";
							}
						}
					}

					// Set Fleet Filters
					foreach (ListItem li in LBFleet.Items)
					{
						if (li.Selected)
						{
							if (string.IsNullOrEmpty(fleetFilter))
							{
								fleetFilter = " [CatID] = " + li.Value + " OR";
							}
							else
							{
								fleetFilter = fleetFilter + " [CatID] = " + li.Value + " OR";
							}
						}
					}

					// Set System Filters
					foreach(ListItem li in LBSystem.Items)
					{
						if (li.Selected)
						{
							if (string.IsNullOrEmpty(systemFilter))
							{
								systemFilter = " [CatID] = " + li.Value + " OR";
							}
							else
							{
								systemFilter = systemFilter + " [CatID] = " + li.Value + " OR";
							}
						}
					}

					// Set Location Filters
					foreach (ListItem li in LBLocation.Items)
					{
						if (li.Selected)
						{
							if (string.IsNullOrEmpty(locationFilter))
							{
								locationFilter = " [CatID] = " + li.Value + " OR";
							}
							else
							{
								locationFilter = locationFilter + " [CatID] = " + li.Value + " OR";
							}
						}
					}

					// Set External Filters
					foreach (ListItem li in LBExternal.Items)
					{
						if (li.Selected)
						{
							if (string.IsNullOrEmpty(externalFilter))
							{
								externalFilter = " [CatID] = " + li.Value + " OR";
							}
							else
							{
								externalFilter = externalFilter + " [CatID] = " + li.Value + " OR";
							}
						}
					}

					// Build complete Search Filter string
					string searchFilter = typeFilter + fleetFilter + systemFilter + locationFilter + externalFilter;
					if (!string.IsNullOrEmpty(searchFilter))
					{
						searchFilter = searchFilter.Substring(0, searchFilter.Length - 3);
						searchFilter = " AND (" + searchFilter + ") ";
					}
					// Build Sql Command string
					string sqlcmd = "SELECT a.[ItemID], a.[OrigID], a.[Name], a.[LabelName], a.[Version], a.[VersionDate] " +
					"FROM[dbo].[Items3] AS a " +
					"LEFT JOIN[dbo].[CatgryValues] AS b ON a.[OrigID] = b.[OrigID] AND b.[ModuleID] = 3 AND b.[IDType] = 1 " +
					"WHERE a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithDrawn] = 0 AND a.[TypeOfPublish] > 0 AND ISNULL(a.[Name], '') <> '' " + searchFilter +
					"GROUP BY a.[ItemID], a.[OrigID], a.[Name], a.[LabelName], a.[Version], a.[VersionDate] " +
					"ORDER BY a.[Name]";

					//Response.Write(sqlcmd);

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
					break;
			}


		}

		protected void GVResults_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				string itemid = GVResults.DataKeys[e.Row.RowIndex].Values["OrigID"].ToString();
				e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GVResults, "Select$" + e.Row.RowIndex);
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