using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paradigm3.datalayer;
using System.Data;
using System.Web.Security;
using System.Threading.Tasks;
using System.Configuration;
using System.IO;

namespace Paradigm3
{
    public partial class ViewDocumentAdd : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)            
            {
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    Response.Redirect("Default.aspx", false);
                }
                else
				{
                    string Status = Request.QueryString["Status"];
                    switch (Status)
                    {
                        case "9":
                            lblAddTitle.Text += " as CURRENT";
                            break;
                        case "4":
                            lblAddTitle.Text += " as READY";
                            break;
                        case "5":
                            lblAddTitle.Text += " as REVIEW";
                            break;
                        case "3054":
                            lblAddTitle.Text += " as EVIDENCE";
                            break;
                        default:
                            lblAddTitle.Text += " as DRAFT";
                            break;
                    }

                    int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
                    string GroupOptionSet = await P3General.Get_GroupOptionSetAsync(3, GroupID);
                    if (!string.IsNullOrEmpty(GroupOptionSet) && GroupOptionSet.Contains("1_6"))
                    {
                        string NameFormula = await Record.Get_NameFormulaAsync(3, GroupID);
                        string[] NameFormulaValues = NameFormula.Split('|');
                        string NameF = NameFormulaValues[0];
                        string LabelF = NameFormulaValues[1];
                        if (!string.IsNullOrEmpty(NameF))
                        {
                            Session["NewDocName"] = NameF;
                        }

                        if (!string.IsNullOrEmpty(LabelF))
                        {
                            Session["NewDocLabel"] = LabelF;
                        }
                    }
                }                
            }
        }

        protected async void btnOK_Click(object sender, EventArgs e)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                string UserName = UserValues[1];

                try
				{
                    List<Task> tasks = new List<Task>();
                    string PublicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"]) + UserID + @"/";
                    if (!Directory.Exists(PublicPath))
					{
                        Directory.CreateDirectory(PublicPath);
					}
                    foreach(HttpPostedFile postedfile in FileUpload1.PostedFiles)
					{
                        postedfile.SaveAs(PublicPath + postedfile.FileName);
                        string fn = Path.GetFileNameWithoutExtension(postedfile.FileName);
                        string fex = Path.GetExtension(postedfile.FileName);
						//lblTEST.Text = lblTEST.Text + "<br />" + fex;
						tasks.Add(ImportFile(fn, string.Empty, fex, UserID, UserName));
					}

					await Task.WhenAll(tasks);
					if (FileUpload1.PostedFiles.Count > 1)
					{
						ClientScript.RegisterStartupScript(GetType(), "finishup", "showStatusMessage(3, '" + FileUpload1.PostedFiles.Count.ToString() + " Documents successfully imported!', false);", true);
					}
					else
					{
						ClientScript.RegisterStartupScript(GetType(), "finishup", "showStatusMessage(3, 'Document successfully imported!', false);", true);
					}

				}
                catch (Exception ex)
				{
                    string msg = ex.Message.Replace(Environment.NewLine, string.Empty);
					msg = msg.Replace("'", string.Empty);
					msg = msg.Replace(",", string.Empty);
					ClientScript.RegisterStartupScript(GetType(), "docerror", "showStatusMessage(3, '" + msg + "', true);", true);
				}
            }
            else
			{
                ClientScript.RegisterStartupScript(GetType(), "needlogin", "showStatusMessage(3, 'Your session has timed out.  Please log in and try again.', true);", true);
            }





				//if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
				//{
				//	string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				//	FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				//	string UserData = authTicket.UserData;
				//	string[] UserValues = UserData.Split(',');
				//	int UserID = Convert.ToInt32(UserValues[0]);
				//	string UserName = UserValues[1];
				//	try
				//	{
				//		List<Task> tasks = new List<Task>();
				//		DirectoryInfo PublicPath = new DirectoryInfo(Server.MapPath(ConfigurationManager.AppSettings["PublicPath"] + "import/"));
				//		FileInfo[] files = PublicPath.GetFiles();
				//		foreach (FileInfo file in files)
				//		{
				//			string FileName = file.Name;
				//			string FileExtension = file.Extension;
				//			string LabelName = string.Empty;
				//			if (Session["NewDocName"] != null)
				//			{
				//				FileName = Session["NewDocName"].ToString();
				//			}

				//			if (Session["NewDocLabel"] != null)
				//			{
				//				LabelName = Session["NewDocLabel"].ToString();
				//			}

				//			FileName = FileName.Substring(0, FileName.Length - FileExtension.Length);
				//			FileExtension = FileExtension.Substring(1);
				//			tasks.Add(ImportFile(FileName, LabelName, FileExtension, UserID, UserName));
				//		}
				//		await Task.WhenAll(tasks);
				//		ClientScript.RegisterStartupScript(GetType(), "finishup", "showStatusMessage(3, 'Document successfully imported!', false);", true);
				//	}
				//	catch (Exception ex)
				//	{
				//		string msg = ex.Message.Replace(Environment.NewLine, string.Empty);
				//		msg = msg.Replace("'", string.Empty);
				//		msg = msg.Replace(",", string.Empty);
				//		ClientScript.RegisterStartupScript(GetType(), "docerror", "showStatusMessage(3, '" + msg + "', true);", true);
				//	}
				//}
				//else
				//{
				//	ClientScript.RegisterStartupScript(GetType(), "needlogin", "showStatusMessage(3, 'Your session has timed out.  Please log in and try again.', true);", true);
				//}
			}

        private async Task ImportFile(string FileName, string LabelName, string FileExtension, int UserID, string UserName)
        {
            string PublicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"] + UserID.ToString() + @"/");
            string DocumentPath = ConfigurationManager.AppSettings["DocumentPath"];

            if (File.Exists(PublicPath + FileName + FileExtension))
            {
                int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
                int Status = Convert.ToInt32(Request.QueryString["Status"]);
                int FinalStatus;
                bool IsEvidence = false;
                switch (Status)
                {
                    case 3054:
                        FinalStatus = 9;
                        IsEvidence = true;
                        break;
                    default:
                        FinalStatus = Status;
                        break;
                }

                try
                {
                    //throw new Exception("This is an error.");
                    int ItemID = await Document.Add_DocumentAsync(0, GroupID, FileName, FileExtension.Substring(1), FinalStatus, IsEvidence, LabelName, UserID, UserName);
                    await Document.Edit_Document_HistoryAsync(3, ItemID, FileName, string.Empty, "Imported new item", UserName, string.Empty);
                    await P3General.Edit_Group_HistoryAsync(3, GroupID, FileName, string.Empty, "Imported new item", 0, UserName);
                    await Document.Add_RolesToNewDocumentAsync(GroupID, ItemID, UserName, UserID);
                    await Document.Add_EventDatesAsync(ItemID, GroupID);
                    int EventID = await P3General.Has_TriggerEventAsync(1, GroupID, 3);
                    if (EventID > 0)
                    {
                        await P3General.Trigger_EventAsync(EventID, GroupID, 3, ItemID, UserName, UserID);
                    }
                    string DocName = "D" + ItemID.ToString().PadLeft(7, '0') + FileExtension;
                    ViewState["DocName"] = DocName;
                    ViewState["ItemID"] = ItemID;
                    File.Copy(PublicPath + FileName + FileExtension, DocumentPath + DocName, true);
                }
                catch (Exception ex)
                {
                    if (ViewState["DocName"] != null)
                    {
                        string DocName = ViewState["DocName"].ToString();
                        if (File.Exists(DocumentPath + DocName))
                        {
                            File.Delete(DocumentPath + DocName);
                        }
                    }

                    if (ViewState["ItemID"] != null)
                    {
                        int ItemID = Convert.ToInt32(ViewState["ItemID"]);
                        await Document.Remove_DocRowAsync(ItemID);
                    }

                    throw ex;
                }
                finally
                {
                    File.Delete(PublicPath + FileName + "." + FileExtension);
                }
            }
            else
            {
                throw new Exception("Document import failed.");
            }


            //if (!FileName.Contains("Do_Not_Delete"))
            //{

            //}
        }
    }
}