using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paradigm3.datalayer;
using System.Data;
using System.Web.Security;
using System.Web.Configuration;
using System.IO;
using System.Threading.Tasks;
using System.Configuration;

namespace P3Web
{
    public partial class ViewExportDocument : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    string Message = GetLocalResourceObject("SessionTimeout").ToString();
                    ClientScript.RegisterStartupScript(GetType(), "sessiontimeout", "alert('" + Message + "');window.close();", true);
                }
                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                int UserID = 0;

                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    // Get user status information from authentication cookie.
                    string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    UserID = Convert.ToInt32(UserValues[0]);
                }
                Session["itemid"] = 0;
                await Get_VersionOptionsAsync(ModuleID, OrigID, UserID);
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewExportDocument.aspx";
        }

        protected async Task Get_VersionOptionsAsync(int ModuleID, int OrigID, int UserID)
        {
            DataTable dtDocumentVersions = await Document.Get_DocumentAllVersionsAsync(OrigID, UserID);

            if (dtDocumentVersions.Rows.Count > 0)
            {
                Session["FileExtension"] = dtDocumentVersions.Rows[0]["FileExtension"].ToString();
                Session["FileName"] = dtDocumentVersions.Rows[0]["Name"].ToString();
                grdvwItems.DataSource = dtDocumentVersions;
                grdvwItems.DataBind();
            }
        }

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;

            switch (arg)
            {
                case "Submit":
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);
                        int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                        int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');
                        string UserFullName = UserValues[1];
                        DateTime CurrentTime = DateTime.Now;
                        int itemid = Convert.ToInt32(Request.Form["rbSelect"]);
                        if (itemid.ToString() != "0")
                        {
                            string FileExtension = Session["FileExtension"].ToString();
                            string DocPath = WebConfigurationManager.AppSettings["DocumentPath"];
                            DocPath = @"" + DocPath.Replace(@"\\", @"\");
                            string SourceFileName = "D" + itemid.ToString().PadLeft(7, '0') + "." + FileExtension;
                            string DestinationFileName = Session["FileName"].ToString() + "." + FileExtension;
                            string SourcePath = Path.Combine(DocPath, SourceFileName);
                            FileInfo file = new FileInfo(SourcePath);
                            if (file.Exists)
                            {
                                string HistoryMemo = "User Name: " + UserFullName + "\n" +
                                    "Time: " + CurrentTime + "\n" +
                                    "Action: [P3Web] - Item has been exported (" + UserFullName + ")\n" +
                                    "( ItemID = " + itemid + ")\n\n" +
                                    "****************************************************************\n";

                                await Document.Update_DocumentHistoryMemo(ModuleID, OrigID, 1, HistoryMemo);
                                // Clear Rsponse reference  
                                Response.Clear();
                                // Add header by specifying file name  
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + DestinationFileName);
                                // Add header for content length  
                                Response.AddHeader("Content-Length", file.Length.ToString());
                                // Specify content type - Right now we are supporting only word  
                                Response.ContentType = "application/octet-stream";
                                // Clearing flush  
                                Response.Flush();
                                // Transimiting file  
                                Response.TransmitFile(file.FullName);
                                Response.Flush();
                                Response.SuppressContent = true;
                                HttpContext.Current.ApplicationInstance.CompleteRequest();
                                break;
                            }
                            else
                            {

                                Page.ClientScript.RegisterStartupScript(GetType(), "alert", "showStatusMessage(3, 'Document does not exists', false);docRefresh();", true);

                            }
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();showStatusMessage(3, 'Please select the Doc', false);", true);
                            break;
                        }

                    }
                    break;
                case "Cancel":
                    Page.ClientScript.RegisterStartupScript(GetType(), "closeStatus", "closeP3Window();", true);
                    break;
            }
        }

        protected void grdvwItems_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.ToolTip = "Click radio button to select this item.";
            }
        }

        protected void grdvwItems_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grdvwItems.Rows)
            {
                if (row.RowIndex == grdvwItems.SelectedIndex)
                {

                    row.BackColor = System.Drawing.Color.CornflowerBlue;
                }
                else
                {

                    row.BackColor = System.Drawing.Color.White;
                }
            }
            Session["itemid"] = grdvwItems.SelectedDataKey.Value.ToString();

        }
    }
}