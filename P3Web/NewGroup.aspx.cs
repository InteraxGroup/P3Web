using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paradigm3.datalayer;
using System.Configuration;

namespace Paradigm3
{
	public partial class NewGroup1 : SqlViewStatePage
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

				txtFolderName.Focus();
				Form.DefaultButton = "btnOK";
			}
		}

		protected void btnOK_Click(object sender, EventArgs e)
		{
			int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			if (!string.IsNullOrEmpty(txtFolderName.Text))
			{
				if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
				{
					Session["NewGroupName"] = txtFolderName.Text;
					ClientScript.RegisterStartupScript(GetType(), "addfolder", "addNodeToTree();", true);
				}
				else
				{
					ClientScript.RegisterStartupScript(GetType(), "nologin", "showStatusMessage(" + ModuleID + ", 'Your session has expired. Please log in and try again.', true);", true);
				}
			}
			else
			{
				ClientScript.RegisterStartupScript(GetType(), "noname", "showStatusMessage(" + ModuleID + ", 'You must enter a folder name', true);", true);
			}
		}
	}
}