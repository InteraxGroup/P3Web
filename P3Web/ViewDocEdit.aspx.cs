using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Paradigm3.datalayer;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;
using System.Threading.Tasks;
using System.Net;
using System.ComponentModel;

namespace Paradigm3
{
    public partial class ViewDocEdit : SqlViewStatePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                int DocStatus = Convert.ToInt32(Request.QueryString["Status"]);
                bool IsServer = Convert.ToBoolean(Request.QueryString["IsServer"]);
                if (IsServer)
                {
                    pnlBrowse.Visible = false;
                }
                if (DocStatus == 2)
                {
                    lblDocStatus.Text = "Check in DRAFT Document";
                }
                else
                {
                    lblDocStatus.Text = "Check in COLLABORATE Document";
                }
                Get_DraftDocumentData(OrigID, DocStatus);
            }
        }

        protected void Get_DraftDocumentData(int OrigID, int DocStatus)
        {
            // Retrieve User Data.
            int UserID = 0;
            string UserFullName = string.Empty;
            int UserStatus = 0;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
                UserFullName = UserValues[1];
                UserStatus = Convert.ToInt32(UserValues[3]);
            }

            // Retrieve Draft/Collaborate document data.
            DataTable DocData = Document.Get_EditVersion(OrigID, DocStatus);
            int DocID = Convert.ToInt32(DocData.Rows[0]["ItemID"]);
            string DocName = DocData.Rows[0]["Name"].ToString();
            Session["DocName"] = DocName;
            string DocVersion = DocData.Rows[0]["Version"].ToString();
            string DocDetails = DocName + " (" + DocVersion + ")";
            int IsCheckedOut = 0;
            if (DocData.Rows[0]["IsCheckedOut"] != DBNull.Value)
            {
                IsCheckedOut = Convert.ToInt32(DocData.Rows[0]["IsCheckedOut"]);
            }
            string CheckedOutBy = string.Empty;
            if (DocData.Rows[0]["CheckedOutBy"] != DBNull.Value)
            {
                CheckedOutBy = DocData.Rows[0]["CheckedOutBy"].ToString();
            }
            if (CheckedOutBy.Equals(UserFullName))
            {
                CheckedOutBy = "you";
            }
            string CheckInMessage = string.Empty;
            if (IsCheckedOut == 1)
            {
                pnlCheckIn.Visible = true;
                if (UserStatus == 1)
                {
                    btnCancelCheckOut.Visible = true;
                }
                CheckInMessage = "This item is currently checked out by <strong>" + CheckedOutBy + "</strong>.";
            }
            else
            {
                //pnlCheckOut.Visible = true;
                CheckInMessage = "This item is available for check-out";
            }
            lblTitle.Text = DocDetails;
            lblConfirmCheckIn.Text = CheckInMessage;
        }

        protected async void btnCheckIn_Click(object sender, EventArgs e)
        {
            // Retrieve user information.
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                string UserFullName = UserValues[1];

                int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                int DocStatus = Convert.ToInt32(Request.QueryString["status"]);
                bool IsServer = Convert.ToBoolean(Request.QueryString["IsServer"]);
                DataTable DocData = Document.Get_EditVersion(OrigID, DocStatus);
                int ItemID = Convert.ToInt32(DocData.Rows[0]["ItemID"]);
                string dName = DocData.Rows[0]["Name"].ToString();
                string lName = DocData.Rows[0]["LabelName"].ToString();
                string FileExtension = DocData.Rows[0]["FileExtension"].ToString();
                dName = dName + "." + FileExtension;

                // Get Paths
                string P3FileName = "D" + ItemID.ToString().PadLeft(7, '0') + "." + FileExtension;
                string DocPath = ConfigurationManager.AppSettings["DocumentPath"];
                string PublicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"] + User.Identity.Name + @"\");
                string CheckedOutPath = PublicPath + dName;
                try
                {
                    if (!IsServer)
                    {
                        ConfirmValue.Value = "No";
                        HttpPostedFile postedFile = Request.Files["CheckInUploader"];                        

                        if (postedFile != null && postedFile.ContentLength > 0)
                        {
                            string uploadPath = PublicPath + Path.GetFileName(postedFile.FileName);
                            if (Path.GetFileName(postedFile.FileName) != dName)
                            {
                                mpeConfirm.Show();
                                //ClientScript.RegisterStartupScript(GetType(), "nameConfirm", "nameConfirm();", true);
                                //if (ConfirmValue.Value == "Yes")
                                //{
                                //    try
                                //    {
                                //        // Upload file to public folder
                                //        postedFile.SaveAs(uploadPath);

                                //        // Copy edited file back into DOCS
                                //        using (FileStream source = File.Open(CheckedOutPath, FileMode.Open))
                                //        {
                                //            using (FileStream destination = File.Create(DocPath + P3FileName))
                                //            {
                                //                await source.CopyToAsync(destination);
                                //            }
                                //        }

                                //        // Delete file from Public folder.
                                //        File.Delete(CheckedOutPath);
                                //        Session["IsCheckedOut"] = false;

                                //        // Update File information in database
                                //        await Document.Update_CheckOutStatusAsync(OrigID, UserFullName, 0);
                                //        await Document.Edit_Document_HistoryAsync(3, OrigID, Path.GetFileNameWithoutExtension(dName), lName, "Item has been checked in.", UserFullName, string.Empty);
                                //        ClientScript.RegisterStartupScript(GetType(), "checkedin", "documentRefresh();editRefresh(false, false, false);", true);
                                //    }
                                //    catch (Exception ex)
                                //    {
                                //        ClientScript.RegisterStartupScript(GetType(), "nofile", "alert('" + ex.Message + "');", true);
                                //    }
                                //}
                                //else
                                //{
                                //    lblCheckIn.Text = "Checkin aborted";
                                //}
                            }
                            else
                            {
                                // Upload file to public folder.
                                postedFile.SaveAs(uploadPath);

                                // Copy edited file back into DOCS
                                using (FileStream source = File.Open(CheckedOutPath, FileMode.Open))
                                {
                                    using (FileStream destination = File.Create(DocPath + P3FileName))
                                    {
                                        await source.CopyToAsync(destination);
                                    }
                                }

                                // Delete file from Public folder.
                                File.Delete(CheckedOutPath);
                                Session["IsCheckedOut"] = false;

                                // Update File information in database
                                await Document.Update_CheckOutStatusAsync(OrigID, UserFullName, 0);
                                await Document.Edit_Document_HistoryAsync(3, OrigID, Path.GetFileNameWithoutExtension(dName), lName, "Item has been checked in.", UserFullName, string.Empty);
                                ClientScript.RegisterStartupScript(GetType(), "checkedin", "documentRefresh();editRefresh(false, false, false);", true);
                            }                            
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(GetType(), "nofile", "alert('You must select a file to check in.');", true);
                        }
                    }
                    else
                    {
                        // Copy edited file back into DOCS
                        using (FileStream source = File.Open(CheckedOutPath, FileMode.Open))
                        {
                            using (FileStream destination = File.Create(DocPath + P3FileName))
                            {
                                await source.CopyToAsync(destination);
                            }
                        }

                        // Delete file from Public folder.
                        File.Delete(CheckedOutPath);
                        Session["IsCheckedOut"] = false;

                        // Update File information in database
                        await Document.Update_CheckOutStatusAsync(OrigID, UserFullName, 0);
                        await Document.Edit_Document_HistoryAsync(3, OrigID, Path.GetFileNameWithoutExtension(dName), lName, "Item has been checked in.", UserFullName, string.Empty);

                        ClientScript.RegisterStartupScript(GetType(), "checkedin", "documentRefresh();editRefresh(false, false, true);", true);
                    }  
                }
                catch (Exception ex)
                {
                    lblCheckIn.Text = ex.Message;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "checkedin", "alert('Your session has timed out. Please log in and try again.');", true);
            }
        }

        protected async void btnCheckOut_Click(object sender, EventArgs e)
        {
            // Retrieve User Data.
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                string UserID = UserValues[0];
                string UserFullName = UserValues[1];

                // Retrieve Draft document data.
                int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                int DocStatus = Convert.ToInt32(Request.QueryString["status"]);
                DataTable DocData = Document.Get_EditVersion(OrigID, DocStatus);
                int DocID = Convert.ToInt32(DocData.Rows[0]["ItemID"]);
                string DocName = DocData.Rows[0]["Name"].ToString();
                string FileExtension = DocData.Rows[0]["FileExtension"].ToString();
                DocName = DocName + "." + FileExtension;
                string LabelName = DocData.Rows[0]["LabelName"].ToString();

                // Get Physical draft file properties
                string FileName = DocID.ToString();
                FileName = FileName.PadLeft(7, '0');
                FileName = FileName.PadLeft(8, 'D');
                FileName = FileName + "." + FileExtension;
                string docPath = ConfigurationManager.AppSettings["DocumentPath"].ToString();
                string PublicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"]);

                string FullDocPath = @"" + docPath + FileName;
                if (!Directory.Exists(PublicPath + UserID))
                {
                    Directory.CreateDirectory(PublicPath + UserID);
                }
                PublicPath = @"" + PublicPath + UserID + "\\" + DocName;

                if (File.Exists(FullDocPath))
                {
                    try
                    {
                        // Copy file to Public from DOCS
                        using (FileStream source = File.Open(FullDocPath, FileMode.Open))
                        {
                            using (FileStream dest = File.Create(PublicPath))
                            {
                                await source.CopyToAsync(dest);
                            }
                        }
                        //File.Copy(FullDocPath, PublicPath, true);
                        //btnCheckOut.Enabled = false;
                        //await Document.Edit_Document_HistoryAsync(3, OrigID, Path.GetFileNameWithoutExtension(DocName), LabelName, "Item has been checked out.", UserFullName, string.Empty);
                        //await Document.Update_CheckOutStatusAsync(DocID, UserFullName, 1);
                        //Session["IsCheckedOut"] = true;
                        //ClientScript.RegisterStartupScript(GetType(), "checkedout", "documentRefresh();editRefresh(true, false);", true);


                    // Download file to "Documents" folder:
                    //string localPath = @"C:\Temp\";//Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + @"\";
                    //string remoteUri = ToAbsoluteUrl(ConfigurationManager.AppSettings["PublicPath"] + UserID + "/");
                    //lblCheckOut.Text = localPath;
                    //ClientScript.RegisterStartupScript(GetType(), "download", "downloadDocument('" + remoteUri + DocName + "');", true);
                    //using (WebClient client = new WebClient())
                    //{
                    //    string myStringResource = remoteUri + DocName;
                    //    //client.DownloadFile(new Uri(myStringResource), localPath + DocName);
                    //    client.DownloadFile(myStringResource, DocName);
                    //    //client.DownloadFileCompleted += new AsyncCompletedEventHandler(client_DownloadFileCompleted);
                    //}
                    //btnCheckOut.Enabled = false;
                    //await Document.Edit_Document_HistoryAsync(3, OrigID, Path.GetFileNameWithoutExtension(DocName), LabelName, "Item has been checked out.", UserFullName, string.Empty);
                    //await Document.Update_CheckOutStatusAsync(DocID, UserFullName, 1);
                    //Session["IsCheckedOut"] = true;
                }
                    catch (Exception ex)
                    {
                        throw ex;
                        //lblCheckOut.Text = ex.Message;
                    }

                }
                else
                {
                    //lblCheckOut.Text = "P3Web cannot locate file: " + FullDocPath;
                }
            }
            else
            {
                //lblCheckOut.Text = "You session has timed out. Please log in and try again";
            }
            
        }

        protected void btnCancelCheckOut_Click(object sender, EventArgs e)
        {
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            int DocStatus = Convert.ToInt32(Request.QueryString["Status"]);
            DataTable DocData = Document.Get_EditVersion(OrigID, DocStatus);
            int DocID = Convert.ToInt32(DocData.Rows[0]["ItemID"]);

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                string UserFullName = UserValues[1];

                try
                {
                    Document.Cancel_Checkout(DocID);                    
                    string publicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"] + "/" + User.Identity.Name) + "/";
                    string fileName = DocData.Rows[0]["Name"].ToString();
                    string fileExtension = "." + DocData.Rows[0]["FileExtension"].ToString();
                    string strFileInfo = publicPath + fileName + fileExtension;
                    if (File.Exists(strFileInfo))
                    {
                        File.Delete(strFileInfo);
                    }
                    ClientScript.RegisterStartupScript(GetType(), "cancelcheckout", "documentRefresh();editRefresh(false, true);window.close();", true);
                }
                catch (Exception ex)
                {
                    lblCheckIn.Text = ex.Message;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "nologin", "alert('Your session has timed out. Please log in and try again.');");
            }
        }

        public static string ToAbsoluteUrl(string relativeUrl)
        {
            if (string.IsNullOrEmpty(relativeUrl))
                return relativeUrl;

            if (HttpContext.Current == null)
                return relativeUrl;

            if (relativeUrl.StartsWith("/"))
                relativeUrl = relativeUrl.Insert(0, "~");
            if (!relativeUrl.StartsWith("~/"))
                relativeUrl = relativeUrl.Insert(0, "~/");

            var url = HttpContext.Current.Request.Url;
            var port = url.Port != 80 ? (":" + url.Port) : String.Empty;

            return String.Format("{0}://{1}{2}{3}",
                url.Scheme, url.Host, port, VirtualPathUtility.ToAbsolute(relativeUrl));
        }

        void client_DownloadFileCompleted(object sender, AsyncCompletedEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "checkedout", "documentRefresh();editRefresh(true, false);", true);
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "closeWindow", "window.close();", true);
        }

        
    }
}