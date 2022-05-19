using System;
using System.Web;
using System.Diagnostics;
using Paradigm3.datalayer;
using System.Web.Security;
using P3Web;

namespace Paradigm3
{
    public class Global : HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            if (Server.GetLastError() != null)
            {
                string eventLog = "Application";
                string eventSource = "Paradigm 3 Web";
                string myErrorMessage = string.Empty;
                string PageSource = HttpContext.Current.Request.Url.ToString();

                // Fires when an error occurs
                Exception myError = Server.GetLastError().GetBaseException();

                myErrorMessage += "Message:\r\n" + myError.Message.ToString() + "\r\n\r\n";
                myErrorMessage += "Source:\r\n" + myError.Source.ToString() + "\r\n\r\n";
                myErrorMessage += "Target Site:\r\n" + myError.TargetSite.ToString() + "\r\n\r\n";
                myErrorMessage += "Stack Trace:\r\n" + myError.StackTrace.ToString() + "\r\n\r\n";

                EventLog myLog = new EventLog(eventLog)
                {
                    Source = eventSource
                };

                // Write the error entry to the event log.    
                myLog.WriteEntry("An error occurred in the application " + eventSource + ":\r\n\r\n" + myErrorMessage, EventLogEntryType.Error);
                Application[eventSource] = myError;

                //Check if HTTP exceptions
                HttpException httpException = myError as HttpException;
                if (httpException != null)
                {
                    switch (httpException.GetHttpCode())
                    {
                        case 404:
                        case 504:
                            return;
                    }
                }

                //Write error to DB
                int userID;
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {

                    //Retrieve http authentication cookie.
                    string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    userID = Convert.ToInt32(UserValues[0]);

                    Exceptions myExceptionClass = new Exceptions();
                    string userIP = HttpContext.Current.Request.UserHostAddress;
                    string url = HttpContext.Current.Request.Url.ToString();
                    myExceptionClass.LogExceptiontoDB(myErrorMessage, userID, userIP, url);
                }
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {
            P3Security.Do_Logout();
            Response.Redirect("~/");
        }

        protected void Application_End(object sender, EventArgs e)
        {
            P3Security.Do_Logout();
            Response.Redirect("~/");
        }
    }
}