using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Data;
using Paradigm3.datalayer;
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Configuration;

namespace Paradigm3
{
	public partial class ViewRename : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
				if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
				{
					ClientScript.RegisterStartupScript(GetType(), "sessionexpired", "alert('Your Paradigm 3 user session has expired. Please restart your browser and try again');window.close();", true);
				}
				int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
				int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
				bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);

				if (IsGroup)
				{
					lblTitle.Text = "Rename Group";
				}
				else
				{
					lblTitle.Text = "Rename Item";
					if (ModuleID == 1)
					{
						lblTitle.Text = "Rename User";
					}
				}

				await Implement(ModuleID, OrigID, IsGroup);
			}
		}

		protected async Task Implement(int ModuleID, int OrigID, bool IsGroup)
		{
			DataTable dt = await P3General.Get_Item_Group_DetailsAsync(ModuleID, OrigID, IsGroup);
			ViewState["Data"] = dt;
			string Name = dt.Rows[0]["Name"].ToString();
			txtName.Text = Name;
			txtLabel.Text = dt.Rows[0]["LabelName"].ToString();
			if (!IsGroup && ModuleID != 1)
			{
				pnlLabel.Visible = true;
				pnlField.Visible = true;				
			}
			lblMessage.Text = $"Are you sure you want to continue with this operation?\n";
		}

		protected async void btnSubmit_Click(object sender, EventArgs e)
		{
			DataTable dt = (DataTable)ViewState["Data"];
			int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
			int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
			bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
			string OldName = dt.Rows[0]["Name"].ToString();
			string NewName = txtName.Text;
			string OldLabel = dt.Rows[0]["LabelName"].ToString();
			string NewLabel = txtLabel.Text;

			if (Regex.IsMatch(NewName, @"^[a-zA-Z0-9. _\-\)\(]*$") && Regex.IsMatch(NewLabel, @"^[a-zA-Z0-9. _\-\)\(]*$"))
			{				
				if (ModuleID == 1)
				{
					bool UserExists = await P3General.User_ExsistsAsync(NewName);
					ViewState["UserExsists"] = UserExists;
					if (UserExists)
					{
						ClientScript.RegisterStartupScript(GetType(), "errmsg", "alert('This username already exists');", true);
						txtName.Text = OldName;
					}
					else
					{
						await P3General.RenameAsync(ModuleID, OrigID, UserID, IsGroup, OldName, NewName, OldLabel, NewLabel);
					}
				}
				else
				{
					await P3General.RenameAsync(ModuleID, OrigID, UserID, IsGroup, OldName, NewName, OldLabel, NewLabel);
				}				
				if (IsGroup)
				{
					Session["NewGroupName"] = NewName;
					ClientScript.RegisterStartupScript(GetType(), "terminate", "treeRefresh();window.close();", true);
				}
				else
				{
					switch (ModuleID)
					{
						case 1:
							bool UserExists2 = (bool)ViewState["UserExsists"];
							if (!UserExists2)
							{
								ClientScript.RegisterStartupScript(GetType(), "terminate", "userRefresh();window.close();", true);
							}
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
			}
			else
			{
				ClientScript.RegisterStartupScript(GetType(), "invalid", "alert('The value contains one or more invalid characters.  Please try again');", true);
			}			
		}
	}
}