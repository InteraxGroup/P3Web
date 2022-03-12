using System;
using System.Web;
using System.Diagnostics;
using Paradigm3.datalayer;

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