using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Saml;
using Paradigm3.datalayer;

namespace Paradigm3
{
	public partial class LoginSAML : SqlViewStatePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
                Session["IsValidSAML"] = null;
                bool useCustomAttribute = Convert.ToBoolean(ConfigurationManager.AppSettings["UseCustomAttribute"]);
                string customAttribute = ConfigurationManager.AppSettings["CustomAttributeName"];
                string samlCertificate = ConfigurationManager.AppSettings["SAMLCert"];
                Response samlResponse = new Response(samlCertificate, Request.Form["SAMLResponse"]);

                // 3. We're done!
                if (samlResponse.IsValid())
                {
                    string username = samlResponse.GetNameID();
                    if (useCustomAttribute)
                    {
                        username = samlResponse.GetCustomAttribute(customAttribute);
                    }

                    if (P3Security.IsWinP3User(username))
					{
                        P3Security.Do_WinLogin(username);
					}
                    else
                    {
                        P3Security.Do_SAMLGuestLogin();
                    }

                    Session["IsValidSAML"] = username;
                    Response.Redirect("Default.aspx");
                }
            }
		}
	}
}