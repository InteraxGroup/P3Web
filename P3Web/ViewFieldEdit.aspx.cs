using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paradigm3.datalayer;
using System.Configuration;
using System.Web.Security;

namespace Paradigm3
{
    public partial class ViewFieldEdit : SqlViewStatePage
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

                string FieldID = Request.QueryString["FieldID"];
                Get_FieldName(FieldID);
            }
        }

        protected void Get_FieldName(string FieldID)
        {
            string[] fielddata = FieldID.Split('_');
            int fielIDdata = Convert.ToInt32(fielddata[0]);
            string FieldName = Record.Get_FieldName(fielIDdata);
            lblFieldName.Text = "Edit Field - <strong>'" + FieldName + "'</strong>:";
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch(arg)
            {
                case "submit":
                    Session["UpdateFieldID"] = Request.QueryString["FieldID"];
                    Session["UpdatedValue"] = txtFieldContents.Text;
                    if (txtFieldContents.Text != string.Empty)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "editvalue", "fieldRefresh();window.close();", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('You must add some text to the field');", true);
                    }
                    
                    break;
                case "cancel":
                    ClientScript.RegisterStartupScript(GetType(), "close", "window.close();", true);
                    break;
            }
        }
    }
}