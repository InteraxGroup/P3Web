using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Paradigm3
{
    public partial class ViewError : SqlViewStatePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string PageSource = string.Empty;
            if (Request.QueryString["Page"] != null)
            {
                PageSource = Request.QueryString["Page"].ToString();
            }

            Exception P3Error = null;
            string stackTrace = null;
            // lblError.Text = GetLocalResourceObject("ErrorPara3").ToString();
            if ((Exception)Application["Paradigm 3 Web"] != null)
            {
                P3Error = (Exception)Application["Paradigm 3 Web"];
                stackTrace = P3Error.StackTrace.ToString();
                // lblError.Text = P3Error.Message.ToString();
            }

            btnExit.ImageUrl = "~/images/exit.png";
            imgAlert.ImageUrl = "~/images/alert.png";
            btnHome.ImageUrl = "~/images/Home.png";
            if (PageSource.Contains("Default.aspx"))
            {
                btnHome.ImageUrl = "~/images/home.png";
            }
        }

        protected void btnHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnExit_Click(object sender, ImageClickEventArgs e)
        {
            
        }
    }
}