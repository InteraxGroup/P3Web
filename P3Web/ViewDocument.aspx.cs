using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Web.Security;
using System.Configuration;
using System.IO;
using System.Threading.Tasks;
using Microsoft.Office.Core;
using Saml;

namespace Paradigm3
{
    public partial class ViewDocument : SqlViewStatePage
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

                int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                bool IsItemID = Convert.ToBoolean(Request.QueryString["IsItemID"]);
                int ItemStatus = Convert.ToInt32(Request.QueryString["ItemStatus"]);
                await Initialize_DocumentAsync(ItemID, IsItemID, ItemStatus);
            }            
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewDocument.aspx";
        }

        #region Initialization

        protected async Task Initialize_DocumentAsync(int ItemID, bool IsItemID, int ItemStatus)
        {
            DataTable dt = await Document.Get_DocumentAsync(ItemID, IsItemID, ItemStatus);
            if (dt.Rows.Count > 0)
            {
                // Get published file name.
                string PubFileName = dt.Rows[0]["OrigIDFileName"].ToString();
                bool IsEvidence = Convert.ToBoolean(dt.Rows[0]["IsEvidence"]);
                if (IsItemID && ItemStatus != 9 && !IsEvidence)
                {
                    PubFileName = dt.Rows[0]["ItemIDFileName"].ToString();
                }

                // Establish the file extension from the publish settings in the Document module.
                string FileExtension = dt.Rows[0]["FileExtension"].ToString();
                int PublishFormat = Convert.ToInt32(dt.Rows[0]["TypeOfPublish"]);
                string PubFileExtension = string.Empty;
                switch (PublishFormat)
                {
                    case 1:
                        PubFileExtension = ".htm";
                        break;
                    case 2:
                        switch (FileExtension.ToUpper())
                        {
                            case "DOC":
                            case "DOCX":
                            case "XLS":
                            case "XLSX":
                            case "XLSM":
                            case "PPT":
                            case "PPTX":
                            case "RTF":
                                PubFileExtension = ".htm";
                                break;
                            default:
                                PubFileExtension = "." + FileExtension;
                                break;
                        }
                        break;
                    case 3:
                        PubFileExtension = "." + FileExtension;
                        break;
                    case 4:
                        PubFileExtension = ".pdf";
                        break;
                    case 5:
                        switch (FileExtension.ToUpper())
                        {
                            case "DOC":
                            case "DOCX":
                            case "XLS":
                            case "XLSX":
                            case "XLSM":
                            case "PPT":
                            case "PPTX":
                            case "RTF":
                            case "DWG":
                                PubFileExtension = ".pdf";
                                break;
                            default:
                                PubFileExtension = "." + FileExtension;
                                break;
                        }
                        break;
                    default:
                        break;
                }

                btnProperties.Attributes.Add("onclick", "openProperties(" + dt.Rows[0]["ItemID"].ToString() + ", 3, 0);");

                // Activate Para-Link button.
                if (!dt.Rows[0]["HasPLink"].Equals(DBNull.Value))
                {
                    bool HasParaLink = Convert.ToBoolean(dt.Rows[0]["HasPLink"]);
                    if (HasParaLink)
                    {
                        pnlParaLink.Visible = true;
                        btnParaLink.Attributes.Add("onclick", "openParaLink(" + dt.Rows[0]["OrigID"].ToString() + ", 3);");
                    }
                    else
                    {
                        pnlParaLink.Visible = false;
                        btnParaLink.Attributes.Remove("onclick");
                    }
                }
                else
                {
                    pnlParaLink.Visible = false;
                    btnParaLink.Attributes.Remove("onclick");
                }

                // Activate Related AI button.
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    string strOrigID = Server.UrlEncode(dt.Rows[0]["OrigID"].ToString());
                    pnlRelatedAI.Visible = true;
                    btnRelatedAI.Attributes.Add("onclick", "openRelatedAI(" + strOrigID + ", 3);");
                }
                else
                {
                    pnlRelatedAI.Visible = false;
                    btnRelatedAI.Attributes.Remove("onclick");
                }

                // Populate Document Details fields.
                // Name
                lblNameData.Text = dt.Rows[0]["Name"].ToString();
                // Converted Date or Last Modified
                lblReleasedData.Text = "Not Specified";
                if (!dt.Rows[0]["VersionDate"].Equals(DBNull.Value))
                {
                    lblReleasedData.Text = Convert.ToDateTime(dt.Rows[0]["VersionDate"]).ToString("d");
                }
                else if (!dt.Rows[0]["LastModified"].Equals(DBNull.Value))
                {
                    lblReleasedData.Text = Convert.ToDateTime(dt.Rows[0]["LastModified"]).ToString("d");
                }
                // Converted By
                if (!dt.Rows[0]["VersionedBy"].Equals(DBNull.Value))
                {
                    lblReleasedByData.Text = dt.Rows[0]["VersionedBy"].ToString();
                }
                // Label
                if (!dt.Rows[0]["LabelName"].Equals(DBNull.Value))
                {
                    lblLabelData.Text = dt.Rows[0]["LabelName"].ToString();
                }
                // Version and status
                if (!dt.Rows[0]["Version"].Equals(DBNull.Value))
                {
                    lblVersionData.Text = dt.Rows[0]["Version"].ToString();
                }
                else
                {
                    lblVersionData.Text = "0";
                }
                if (!dt.Rows[0]["StatusText"].Equals(DBNull.Value))
                {
                    lblStatusData.Text = "(" + dt.Rows[0]["StatusText"].ToString() + ")";
                }
                else
                {
                    lblStatusData.Text = "(NOT APPLICABLE)";
                }


                // Retrieve document publish path from web.config.
                int UserID = 0;
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    UserID = Convert.ToInt32(UserValues[0]);
                }

                string PublicUrl = ConfigurationManager.AppSettings["PublicPath"].ToString() + UserID.ToString() + "/";
                if (!Directory.Exists(Server.MapPath(PublicUrl)))
                {
                    Directory.CreateDirectory(Server.MapPath(PublicUrl));
                }
                bool UseInterop = Convert.ToBoolean(ConfigurationManager.AppSettings["UseInterop"]);
                if (UseInterop)
                {
                    string MainDocUrl = ConfigurationManager.AppSettings["DocumentPath"];
                    string MainDocName = PubFileName;
                    string MainFileExtension = "." + FileExtension;
                    if (File.Exists(MainDocUrl + MainDocName + MainFileExtension))
                    {
                        string UniqueID = DateTime.Now.ToString("yyyyMMddHHmmssfff");
                        PublicUrl = PublicUrl + MainDocName + "_" + UniqueID;
                        switch (FileExtension.ToUpper())
                        {
                            case "DOC":
                            case "DOCX":
                            case "DOCM":                            
                            case "RTF":
                            case "PPT":
                            case "PPTX":                                
                            case "XLS":
                            case "XLSX":
                            case "XLSM":
                                if (PublishFormat == 3)
                                {
                                    PublicUrl = PublicUrl + "." + FileExtension;
                                    await CopyItemAsync(MainDocUrl + MainDocName + MainFileExtension, Server.MapPath(PublicUrl));
                                }
                                else
                                {
                                    PublicUrl += PublicUrl + ".PDF";
                                    //await ConvertItemAsync(FileExtension, MainDocUrl + MainDocName + MainFileExtension, Server.MapPath(PublicUrl));
                                    ConvertItem(FileExtension, MainDocUrl + MainDocName + MainFileExtension, Server.MapPath(PublicUrl));
                                }
                                break;
                            default:
                                PublicUrl = PublicUrl + "." + FileExtension;
                                await CopyItemAsync(MainDocUrl + MainDocName + MainFileExtension, Server.MapPath(PublicUrl));
                                break;
                        }
                        DocViewer.Attributes.Add("src", PublicUrl);
                        Session["ViewDoc"] = PublicUrl;
                    }
                    else
                    {
                        DocViewer.Attributes.Add("src", "DocNotFound.html");
                    }
                }
                else
                {
                    string docURL = ConfigurationManager.AppSettings["PublishPath"].ToString();
                    string fullDocPath = docURL + PubFileName + PubFileExtension;
                    if (File.Exists(Server.MapPath(fullDocPath)))                    {
                        
                        DateTime now = DateTime.Now;
                        string uniqueId = now.ToString("yyyyMMddHHmmssfff");
                        string viewDocPath = PublicUrl + dt.Rows[0]["Name"].ToString() + "_" + uniqueId + PubFileExtension;
                        await CopyAsync(Server.MapPath(fullDocPath), Server.MapPath(viewDocPath));
                        DocViewer.Attributes.Add("src", viewDocPath);
                        //ScriptManager.RegisterStartupScript(udpDocument, GetType(), "test", "alert('" + DocViewer.Src + "')", true);
                        Session["ViewDoc"] = viewDocPath;
                    }
                    else
                    {
                        DocViewer.Attributes.Add("src", "DocNotFound.html");
                    }
                }
                

                dt.Dispose();
            }
            else
            {
                DocViewer.Attributes.Add("src", "DocNotFound.html");
            }
        }

        public static void ConvertItem(string type, string input, string output)
        {
            object oMissing = System.Reflection.Missing.Value;
            switch (type.ToUpper())
            {
                case "DOC":
                case "DOCX":
                case "DOCM":
                case "RTF":
                    // Create an instance of Word.exe
                    Microsoft.Office.Interop.Word._Application oWord = new Microsoft.Office.Interop.Word.Application
                    {
                        // Make this instance of word invisible (Can still see it in the taskmgr).
                        Visible = false
                    };

                    try
                    {
                        // Interop requires objects.
                        object isVisible = true;
                        object readOnly = true;     // Does not cause any word dialog to show up --object readOnly = false;  // Causes a word object dialog to show at the end of the conversion
                        object oInput = input;
                        object oOutput = output;
                        object oFormat = Microsoft.Office.Interop.Word.WdSaveFormat.wdFormatPDF;//format;

                        // Load a document into our instance of word.exe
                        Microsoft.Office.Interop.Word._Document oDoc = oWord.Documents.Open(
                            ref oInput, ref oMissing, ref readOnly, ref oMissing, ref oMissing,
                            ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing,
                            ref oMissing, ref isVisible, ref oMissing, ref oMissing, ref oMissing, ref oMissing
                            );

                        // Make this document the active document.
                        oDoc.Activate();
                        oDoc.Fields.Update();
                        // Save this document using Word
                        oDoc.ExportAsFixedFormat(output, Microsoft.Office.Interop.Word.WdExportFormat.wdExportFormatPDF);
                        // Close the document without saving.
                        oDoc.Close(Microsoft.Office.Interop.Word.WdSaveOptions.wdDoNotSaveChanges, Microsoft.Office.Interop.Word.WdOriginalFormat.wdOriginalDocumentFormat, false);

                        // Always close Word.exe.
                        oWord.Quit(ref oMissing, ref oMissing, ref oMissing);
                    }
                    catch (Exception ex)
                    {
                        // Always close Word.exe.
                        oWord.Quit(ref oMissing, ref oMissing, ref oMissing);
                        throw ex;
                    }
                    break;
                case "XLS":
                case "XLSX":
                case "XLSM":
                    Microsoft.Office.Interop.Excel.Application excelApp = new Microsoft.Office.Interop.Excel.Application
                    {
                        Visible = false
                    };

                    try
                    {
                        Microsoft.Office.Interop.Excel.Workbook excelDocument = excelApp.Workbooks.Open(input);
                        foreach (Microsoft.Office.Interop.Excel.Worksheet sheet in excelDocument.Worksheets)
                        {
                            sheet.PageSetup.Orientation = Microsoft.Office.Interop.Excel.XlPageOrientation.xlLandscape;
                        }
                        excelDocument.ExportAsFixedFormat(Microsoft.Office.Interop.Excel.XlFixedFormatType.xlTypePDF, output);
                        excelDocument.Close(false, "", false);
                        excelApp.Quit();
                    }
                    catch (Exception ex)
                    {
                        excelApp.Quit();
                        throw ex;
                        
                    }
                    break;
                case "PPT":
                case "PPTX":
                    Microsoft.Office.Interop.PowerPoint.Application pptApp = new Microsoft.Office.Interop.PowerPoint.Application();
                    try
                    {
                        Microsoft.Office.Interop.PowerPoint.Presentation pptDoc = pptApp.Presentations.Open(input, MsoTriState.msoTrue, WithWindow: MsoTriState.msoFalse);
                        pptDoc.SaveAs(output, Microsoft.Office.Interop.PowerPoint.PpSaveAsFileType.ppSaveAsPDF, MsoTriState.msoTrue);
                        pptDoc.Close();
                        pptApp.Quit();
                    }
                    catch (Exception ex)
                    {
                        pptApp.Quit();
                        throw ex;
                    }
                    break;
            }
        }

        private static Task ConvertItemAsync(string type, string input, string output)
        {
            return Task.Run(() => { ConvertItem(type, input, output); });
        }

        protected async Task CopyItemAsync(string input, string output)
        {
            using (FileStream inputStream = File.Open(input, FileMode.Open))
            {
                using (FileStream outputStream = File.Create(output))
                {
                    await inputStream.CopyToAsync(outputStream);
                }
            }
        }

        #endregion

        #region Button Events

        protected void BtnGoThere_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "GoThere", "clickGoThere();closeP3Window();", true);
        }

		protected async void btnCloseDoc_Click(object sender, EventArgs e)
		{
			if (Session["ViewDoc"] != null)
			{
				string viewDocPath = Session.Contents["ViewDoc"].ToString();
				if (File.Exists(Server.MapPath(viewDocPath)))
				{
                    viewDocPath = Server.MapPath(viewDocPath);
                    await DeleteAsync(viewDocPath);
				}				
                string localPath = @"%USERPROFILE%\Downloads\";
                var localFilePath = Environment.ExpandEnvironmentVariables(localPath);
                string localFileName = Path.GetFileName(viewDocPath);
                if (File.Exists(localFilePath + localFileName))
                {
                    await DeleteAsync(localFilePath + localFileName);
                }
                Session.Remove("ViewDoc");
            }
            ScriptManager.RegisterStartupScript(udpDocData, GetType(), "closeDoc", "window.close()", true);
		}

		#endregion

		private static Task DeleteAsync(string viewDocPath)
        {
            return Task.Run(() => { File.Delete(viewDocPath); });
        }

        private static Task CopyAsync(string fullDocPath, string viewDocPath)
        {
            return Task.Run(() => { File.Copy(fullDocPath, viewDocPath); });
        }
	}
}