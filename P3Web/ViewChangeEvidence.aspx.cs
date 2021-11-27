using Paradigm3.datalayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;

namespace Paradigm3
{
    public partial class ViewChangeEvidence : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
            if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
            {
                string Message = GetLocalResourceObject("SessionTimeout").ToString();
                ClientScript.RegisterStartupScript(GetType(), "sessiontimeout", "alert('" + Message + "');window.close();", true);
            }
        }
        protected async void btnSubmit_Click(object sender, EventArgs e)
        {
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            int UserID = Convert.ToInt32(Request.QueryString["UserID"]); 
            int IsEvidence = Convert.ToInt32(Request.QueryString["isEvidence"]);

            if (IsEvidence!= 1)
            {
                string msg = "Item changed to evidence successfully";
                await P3General.ChangeToEvidenceAsync(ModuleID, OrigID, UserID, IsEvidence);
                ClientScript.RegisterStartupScript(GetType(), "complete", "documentRefresh();alert('" + msg + "');window.close();", true);
            }


            else
            {
                string msg = "Evidence changed to Item successfully";
                await P3General.ChangeToEvidenceAsync(ModuleID, OrigID, UserID, IsEvidence);
                ClientScript.RegisterStartupScript(GetType(), "complete", "documentRefresh();alert('" + msg + "');window.close();", true);
            }
        }

       
    }
    }