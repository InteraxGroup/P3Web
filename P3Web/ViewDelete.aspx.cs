using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Data;
using Paradigm3.datalayer;
using System.Text;

namespace Paradigm3
{
	public partial class ViewDelete : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
				int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
				int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
				bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
				await InitializeAsync(ModuleID, OrigID, UserID, IsGroup);
			}
		}

		protected async Task InitializeAsync(int ModuleID, int OrigID, int UserID, bool IsGroup)
		{
			if (IsGroup)
			{
				DataTable dtGroup = await P3General.Get_Item_Group_DetailsAsync(ModuleID, OrigID, IsGroup);
				lblTitle.Text = "Delete Folder";
				pnlDeleteFolder.Visible = true;
				lblMessage.Text = "The folder '<b>" + dtGroup.Rows[0]["Name"].ToString() + "</b>' and all sub-folders/items will be deleted<br /><br />" +
					"Do you want to continue with this operation?";

				lblFolderName.Text = dtGroup.Rows[0]["Name"].ToString();
				ViewState["Data"] = dtGroup;
			}
			else
			{						
				pnlDeleteItem.Visible = true;				
				if (ModuleID == 1)
				{
					DataTable dtUser = await P3General.Get_Item_Group_DetailsAsync(ModuleID, OrigID, false);
					lblTitle.Text = "Delete User";
					cblVersion.Visible = false;
					lblUserDetail.Visible = true;
					StringBuilder sb = new StringBuilder();
					sb.Append("User to be deleted:\r\n");
					sb.Append(dtUser.Rows[0]["Name"].ToString());
					sb.Append(" (" + dtUser.Rows[0]["FullName"].ToString() + " -");
					sb.Append(" ID: " + dtUser.Rows[0]["UserID"].ToString() + ")");
					lblUserDetail.Text = sb.ToString();
					lblMessage.Text = "The selected user will be deleted\n" +
					"Do you want to continue with this operation?";
				}
				else
				{
					DataTable dtItem = await P3General.Get_Item_Version_DetailsAsync(ModuleID, OrigID);
					lblTitle.Text = "Delete Item";
					cblVersion.Visible = true;
					lblUserDetail.Visible = false;
					lblMessage.Text = "The selected item version(s) will be deleted\n" +
					"Do you want to continue with this operation?";

					foreach (DataRow dr in dtItem.Rows)
					{
						cblVersion.Items.Add(new ListItem(dr["Version"].ToString() + " (" + dr["Status"].ToString() + ")", dr["ItemID"].ToString()));
					}
					ViewState["Data"] = dtItem;
				}
			}
			
		}

		protected async void btnSubmit_Click(object sender, EventArgs e)
		{
			int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
			int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
			bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
			if (!IsGroup)
			{
				foreach (ListItem li in cblVersion.Items)
				{
					if (li.Selected)
					{
						OrigID = Convert.ToInt32(li.Value);
						await P3General.DeleteAsync(ModuleID, OrigID, UserID, IsGroup);
					}
				}
				
				switch(ModuleID)
				{
					case 1:
						ClientScript.RegisterStartupScript(GetType(), "terminate", "userRefresh();window.close();", true);
						break;
					case 4:
					case 6:
					case 12:
						ClientScript.RegisterStartupScript(GetType(), "terminate", "recordRefresh();window.close();", true);
						break;
					default:
						ClientScript.RegisterStartupScript(GetType(), "terminate", "documentRefresh();window.close();", true);
						break;
				}
			}
			else
			{
				await P3General.DeleteAsync(ModuleID, OrigID, UserID, IsGroup);
				ClientScript.RegisterStartupScript(GetType(), "terminate", "treeRefreshDelete();window.close();", true);
			}
		}
	}
}