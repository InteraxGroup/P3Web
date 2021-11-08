using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Saml;
using Paradigm3.datalayer;
using System.Web.Security;

namespace Paradigm3
{
	public partial class LoginSAML : SqlViewStatePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{                
                Session["IsValidSAML"] = null;
                string samlCertificate = ConfigurationManager.AppSettings["SAMLCert"];
                Saml.Response samlResponse = new Response(samlCertificate, Request.Form["SAMLResponse"]);

                // 3. We're done!
                if (samlResponse.IsValid())
                {
                    string user = samlResponse.GetNameID();
                    string[] userinfo = samlResponse.GetEmail().Split('@');
                    string username = userinfo[0];                    
                    if (P3Security.IsWinP3User(username))
					{
                        P3Security.Do_WinLogin(username);
                        //ClientScript.RegisterStartupScript(GetType(), "", "alert('" + username + "');", true);
                    }
                    else
					{
                        P3Security.Do_SSONonP3Login(username);
                        //ClientScript.RegisterStartupScript(GetType(), "", "alert('Not a user');", true);
                    }

                    Session["IsValidSAML"] = username;
                    //ClientScript.RegisterStartupScript(GetType(), "", "alert('" + Session["IsValidSAML"].ToString() + "');", true);
                    Response.Redirect("Default.aspx", false);
                }
            }
		}
	}
}