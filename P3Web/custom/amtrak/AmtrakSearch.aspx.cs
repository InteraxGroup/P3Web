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

namespace Paradigm3.custom.amtrak
{
	public partial class AmtrakSearch : SqlViewStatePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				Init_App();
			}
		}

		#region Initialization

		protected void Init_App()
		{
			List<AmtrakCategory> categories = Amtrak_Categories();
			ViewState["Categories"] = categories;
			Get_Styles();
			Get_Fleets();
			Get_Types();
			Get_Systems();
			Get_DocTypes();
			Get_Locations();
			Get_Contractors();
		}

		private void Get_Styles()
		{
			LBStyle.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.Contains("1_") && !s.CatCaption.Contains("__")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBStyle.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		private void Get_Fleets()
		{
			LBFleet.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.Contains("2_") && !s.CatCaption.Contains("__")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBFleet.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		private void Get_Types()
		{
			LBType.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.Contains("3_") && !s.CatCaption.Contains("__")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBType.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		private void Get_Systems()
		{
			LBSystem.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.Contains("4_") && !s.CatCaption.Contains("__")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBSystem.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		private void Get_DocTypes()
		{
			LBDocType.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.Contains("5_") && !s.CatCaption.Contains("__")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBDocType.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		private void Get_Locations()
		{
			LBLocation.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.Contains("6_") && !s.CatCaption.Contains("__")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBLocation.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
			}
		}

		private void Get_Contractors()
		{
			LBContractor.Items.Clear();
			List<AmtrakCategory> styles = (List<AmtrakCategory>)ViewState["Categories"];
			styles = styles.Where(s => s.CatCaption.Contains("7_") && !s.CatCaption.Contains("__")).OrderBy(s => s.CatCaption).ToList();
			foreach (AmtrakCategory style in styles)
			{
				LBContractor.Items.Add(new ListItem(style.CatCaption.Substring(2), style.CatID.ToString()));
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
					string styleFilter = string.Empty;
					string fleetFilter = string.Empty;
					string typeFilter = string.Empty;
					string systemFilter = string.Empty;
					string docTypeFilter = string.Empty;
					string locationFilter = string.Empty;
					string contractorFilter = string.Empty;

					// Set Style Filters
					foreach(ListItem li in LBStyle.Items)
					{
						if (li.Selected)
						{
							if (string.IsNullOrEmpty(styleFilter))
							{
								styleFilter = "[CatID] = " + li.Value + " OR";
							}
							else
							{
								styleFilter = styleFilter + " [CatID] = " + li.Value + " OR";
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

					// Set Type Filters
					foreach(ListItem li in LBType.Items)
					{
						if (li.Selected)
						{
							if (string.IsNullOrEmpty(typeFilter))
							{
								typeFilter = " [CatID] = " + li.Value + " OR";
							}
							else
							{
								typeFilter = typeFilter + " [CatID] = " + li.Value + " OR";
							}
						}
					}

					// Set System Filters
					foreach (ListItem li in LBSystem.Items)
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

					// Set Document Type Filters
					foreach (ListItem li in LBDocType.Items)
					{
						if (li.Selected)
						{
							if (string.IsNullOrEmpty(docTypeFilter))
							{
								docTypeFilter = " [CatID] = " + li.Value + " OR";
							}
							else
							{
								docTypeFilter = docTypeFilter + " [CatID] = " + li.Value + " OR";
							}
						}
					}

					// Set Contractor Filters
					foreach (ListItem li in LBContractor.Items)
					{
						if (li.Selected)
						{
							if (string.IsNullOrEmpty(contractorFilter))
							{
								contractorFilter = " [CatID] = " + li.Value + " OR";
							}
							else
							{
								contractorFilter = contractorFilter + " [CatID] = " + li.Value + " OR";
							}
						}
					}

					// Build complete Search Filter string
					string searchFilter = styleFilter + fleetFilter + typeFilter + systemFilter + docTypeFilter + locationFilter + contractorFilter;
					if (!string.IsNullOrEmpty(searchFilter))
					{
						searchFilter = searchFilter.Substring(0, searchFilter.Length - 3);
						searchFilter = " AND (" + searchFilter + ") ";
					}
					// Build Sql Command string
					string sqlcmd = "SELECT a.[ItemID], a.[OrigID], a.[Name], a.[LabelName], a.[Version], a.[VersionDate] " +
					"FROM[dbo].[Items3] AS a " +
					"INNER JOIN[dbo].[CatgryValues] AS b ON a.[OrigID] = b.[OrigID] AND b.[ModuleID] = 3 AND b.[IDType] = 1 " +
					"WHERE a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithDrawn] = 0 AND a.[TypeOfPublish] > 0 AND a.[Name] IS NOT NULL AND a.[Name] <> '' " + searchFilter +
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
					foreach (ListItem li in LBStyle.Items)
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
					foreach (ListItem li in LBType.Items)
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
					foreach (ListItem li in LBDocType.Items)
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
					foreach (ListItem li in LBContractor.Items)
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
				string itemid = GVResults.DataKeys[e.Row.RowIndex].Values["ItemID"].ToString();
				string viewVar = itemid + ", 1";
				e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GVResults, "Select$" + e.Row.RowIndex);
				e.Row.Attributes.Add("ondblclick", "openAmtrakDocument(" + viewVar + ");");
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
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}

				SqlCommand cmd = new SqlCommand(sqlcmd, conn)
				{
					CommandType = CommandType.Text
				};
				SqlDataReader sdr = cmd.ExecuteReader();
				dt.Load(sdr);
			}
			return await Task.FromResult(dt);
		}

		#endregion
		
	}
}