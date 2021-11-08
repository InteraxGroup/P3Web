using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;

namespace Paradigm3
{
    public partial class ViewError : SqlViewStatePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
			{
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    ClientScript.RegisterStartupScript(GetType(), "sessionexpired", "alert('Your Paradigm 3 user session has expired. Please restart your browser and try again');window.close();", true);
                }
            }
            string PageSource = string.Empty;
            if (Request.QueryString["Page"] != null)
            {
                PageSource = Request.QueryString["Page"].ToString();
            }

            Exception P3Error = null;
            string stackTrace = null;
            lblError.Text = "Error message not returned.";
            if ((Exception)Application["Paradigm 3 Web"] != null)
            {
                P3Error = (Exception)Application["Paradigm 3 Web"];
                stackTrace = P3Error.StackTrace.ToString();
                lblError.Text = P3Error.Message.ToString();
            }

            btnHome.ImageUrl = "~/images/exit.png";
            if (PageSource.Contains("Default.aspx"))
            {
                btnHome.ImageUrl = "~/images/home.png";
            }
        }

        protected void btnHome_Click(object sender, ImageClickEventArgs e)
        {
            if (btnHome.ImageUrl == "~/images/home.png")
            {
                Response.Redirect("~/");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "closeWindow", "window.close();", true);
            }
        }
    }
}