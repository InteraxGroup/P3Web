using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Threading.Tasks;
using Paradigm3.datalayer;
using System.Windows.Forms;
using System.Web.Security;
using System.Text;

namespace Paradigm3
{
	public partial class ViewActionItemOtherUser : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				await Fill_Table();
			}
		}

		#region Initialize
		protected async Task Fill_Table()
		{
			DataTable dt = await Get_AIData();
			DataView dv = new DataView(dt)
			{
				Sort = "SendDate DESC"
			};
			gvAIList.DataSource = dv;
			gvAIList.DataBind();

			// Update total items
			lblTotalAI.Text = gvAIList.Rows.Count.ToString();

			// Update Users Field
			txtUsers.Text = "";
			List<string> assigned = new List<string>();
			DataTable dtAssigned = (DataTable)Session["dtSelected"];
			foreach (DataRow drs in dtAssigned.Rows)
			{
				assigned.Add(drs["ControlFullName"].ToString());
			}
			assigned = assigned.Distinct().ToList();

			
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < assigned.Count; i++)
			{
				sb.Append(assigned[i]);
				sb.Append(", ");
			}
			string userList = sb.ToString();
			userList = userList.Substring(0, userList.Length - 2);
			txtUsers.Text = userList;

			Session["AIIDs"] = null;
			List<string> AIList = new List<string>();
			if (gvAIList.Rows.Count > 0)
			{
				for (int i = 0; i < gvAIList.Rows.Count; i++)
				{
					AIList.Add(gvAIList.DataKeys[i].Values["AIID"].ToString());
				}
			}
			Session["AIIDs"] = AIList;
		}

		protected async Task<DataTable> Get_AIData()
		{
			DataTable dtSelected = (DataTable)Session.Contents["dtSelected"];
			DataTable dtMerged = new DataTable();
			if (dtSelected.Rows.Count > 0)
			{
				foreach (DataRow dr in dtSelected.Rows)
				{
					int ControlID = Convert.ToInt32(dr["ControlID"]);
					int ControlType = Convert.ToInt32(dr["ControlType"]);
					DataTable dtAI = await ActionItem.Get_OtherUsersAIAsync(ControlID, ControlType);
					dtMerged.Merge(dtAI, true, MissingSchemaAction.Add);
					dtAI.Dispose();
				}				
			}
			DataTable dtFinal = dtMerged.DefaultView.ToTable(true);
			dtMerged.Dispose();
			return dtFinal;
		}

		#endregion

		#region Gridview Methods

		protected void Gv_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			gvAIList.SelectedIndex = -1;
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				// Set Status text value based on int value
				int Status = Convert.ToInt32(gvAIList.DataKeys[e.Row.RowIndex].Values["Status"]);
				if (Status == 2)
				{
					e.Row.Cells[3].Text = "Open";
				}
				else
				{
					e.Row.Cells[3].Text = "Complete";
				}

				// Set Module text value based on int value
				int ShowModuleID = Convert.ToInt32(gvAIList.DataKeys[e.Row.RowIndex].Values["ShowModuleID"]);
				switch (ShowModuleID)
				{
					case 3:
						e.Row.Cells[4].Text = "Documents";
						break;
					case 4:
						e.Row.Cells[4].Text = "Records";
						break;
					case 6:
						e.Row.Cells[4].Text = "Improvements";
						break;
					case 12:
						e.Row.Cells[4].Text = "Training";
						break;
					default:
						e.Row.Cells[4].Text = "None";
						break;
				}

				// Set row/cell color based on notified status.
				int NotifiedStatus = Convert.ToInt32(gvAIList.DataKeys[e.Row.RowIndex].Values["NotifiedStatus"]);
				switch (NotifiedStatus)
				{
					case 0:
					case -1:
						e.Row.ForeColor = System.Drawing.Color.Black;
						e.Row.Font.Bold = false;
						break;
					case 1:
						e.Row.ForeColor = System.Drawing.Color.Black;
						e.Row.Font.Bold = true;
						break;
					case 2:
						e.Row.ForeColor = System.Drawing.Color.Black;
						e.Row.Cells[6].ForeColor = System.Drawing.Color.Red;
						e.Row.Font.Bold = true;
						break;
				}

				DateTime DateDue = Convert.ToDateTime(e.Row.Cells[6].Text);
				string DateCompleted = e.Row.Cells[10].Text;
				if (DateDue < DateTime.Now && string.IsNullOrEmpty(DateCompleted))
				{
					e.Row.Cells[4].ForeColor = System.Drawing.Color.Red;
				}

				int Priority = Convert.ToInt32(gvAIList.DataKeys[e.Row.RowIndex].Values["Priority"]);
				switch (Priority)
				{
					case 0:
						e.Row.Cells[10].Text = "Low";
						break;
					case 1:
						e.Row.Cells[10].Text = "Normal";
						break;
					case 2:
						e.Row.Cells[10].Text = "Urgent";
						e.Row.Cells[10].ForeColor = System.Drawing.Color.Red;
						e.Row.Cells[10].Font.Bold = true;
						break;
				}

				string AIID = gvAIList.DataKeys[e.Row.RowIndex].Values["AIID"].ToString();
				//string AIModuleID = gvAIList.DataKeys[e.Row.RowIndex].Values["ShowModuleID"].ToString();
				//string strViewAIVar = AIID + "," + AIModuleID + ",1";
				e.Row.Attributes["onclick"] = "saveSearchScrollPos(); " + Page.ClientScript.GetPostBackClientHyperlink(gvAIList, "Select$" + e.Row.RowIndex);
				e.Row.Attributes.Add("ondblclick", "openAIWindow(" + AIID + ");");
				e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
				e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
			}			
		}

		protected void Gv_SelectedIndexChanged(object sender, EventArgs e)
		{

		}

		protected async void SortGv(object sender, GridViewSortEventArgs e)
		{
			DataTable dt = await Get_AIData();
			string sortDirection;
			if (Direction == SortDirection.Ascending)
			{
				Direction = SortDirection.Descending;
				sortDirection = " DESC";
			}
			else
			{
				Direction = SortDirection.Ascending;
				sortDirection = " ASC";
			}
			dt.DefaultView.Sort = e.SortExpression + sortDirection;
			gvAIList.DataSource = dt;
			gvAIList.DataBind();
		}

		public SortDirection Direction
		{
			get
			{
				if (ViewState["sortDirection"] == null)
				{
					ViewState["sortDirection"] = SortDirection.Ascending;
				}
				return (SortDirection)ViewState["sortDirection"];
			}
			set
			{
				ViewState["sortDirection"] = value;
			}
		}

		#endregion

		#region Button Methods

		protected void Button_Click(object sender, EventArgs e)
		{
			if (gvAIList.SelectedIndex > -1)
			{
				string AIID = gvAIList.DataKeys[gvAIList.SelectedIndex].Values["AIID"].ToString();
				ScriptManager.RegisterStartupScript(udpButtons, GetType(), "view", "openAIWindow(" + AIID + ");", true);
			}
			else
			{
				ScriptManager.RegisterStartupScript(udpButtons, GetType(), "noneselected", "alert('You must select an item to view.');", true);
			}
		}

		protected async void BtnRefreshAI_Click(object sender, EventArgs e)
		{
			await Fill_Table();
			//string ParentGroupID = "2";
			//int UserID = 0;
			//int selIndex = gvAIList.SelectedIndex;
			//if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			//{
			//	string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
			//	FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
			//	string UserData = authTicket.UserData;
			//	string[] UserValues = UserData.Split(',');
			//	UserID = Convert.ToInt32(UserValues[0]);
			//}
			//DataTable dt = P3General.Get_ItemList(14, UserID, ParentGroupID);
			//HttpCookie sortCookie = Request.Cookies["P3WebSort"];
			//string sortExp = "SendDate DESC";
			//if (sortCookie != null && !string.IsNullOrEmpty(sortCookie.Values["aiSort"]))
			//{
			//	sortExp = sortCookie.Values["aiSort"];
			//}
			//dt.DefaultView.Sort = sortExp;
			//gvAIList.DataSource = dt;
			//gvAIList.DataBind();
			//if (selIndex >= gvAIList.Rows.Count)
			//{
			//	gvAIList.SelectedIndex = -1;
			//}
			//else
			//{
			//	gvAIList.SelectedIndex = selIndex;
			//}
		}

		#endregion
	}
}