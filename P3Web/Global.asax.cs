using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Diagnostics;
using Paradigm3.datalayer;

namespace Paradigm3
{
    public class Global : HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            EO.Web.Runtime.AddLicense(
    "VvvPuIlZl6Sxy59Zl8DyD+NZ6/0BELxbvNO/AuSbmaQHEPGs4PP/6KFqr6ax" +
    "2r1GgaSxy591puX9F+6wtZGby59Zl8AAHeOe6c3/Ee5Z2+UFELxbrrPC4a5r" +
    "p7XEzZ+s7ObWI++i6ekE7PN2mbvA3LVoqbTC5KFZ7ekDHuio5cGz3LBbl7PP" +
    "uIlZl6Sx5/Ki3vLyH/Sr3MK85NGN0f3m+LOPrdjS7NWP5LnI3NmKtMHN2vKi" +
    "3vLyH/Sr3MKetbto4+30EO2s3MKetXXj7fQQ7azcwp61n1mXpM0X6Jzc8gQQ" +
    "yJ21ucTjuGqsusjisXWm8PoO5Kfq6doPvUaBpLHLn3Xj7fQQ7azc6c/nrqXg" +
    "5/YZ8p7cwp61n1mXpM0M66Xm");

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
            // Fires when an error occurs
            Exception myError = null;
            if (Server.GetLastError() != null)
            {
                string eventLog = "Application";
                string eventSource = "Paradigm 3 Web";
                string myErrorMessage = string.Empty;
                string PageSource = HttpContext.Current.Request.Url.ToString();

                myError = Server.GetLastError().GetBaseException();

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
                //Response.Redirect("~/ViewError.aspx?Page=" + PageSource);
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {
            P3Security.Do_Logout();
            Response.Redirect("~/");
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}