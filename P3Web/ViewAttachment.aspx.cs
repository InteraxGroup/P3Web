using System;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Configuration;
using System.IO;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Web.Security;

namespace Paradigm3
{
    public partial class ViewAttachment : SqlViewStatePage
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

                int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                int IsEdit = Convert.ToInt32(Request.QueryString["IsEdit"]);
                int ObjID = Convert.ToInt32(Request.QueryString["ObjID"]);

                if (IsEdit == 1)
                {
                    btnAdd.Visible = true;
                    btnDelete.Visible = true;
                    btnUpdate.Visible = true;
                    txtNotes.ReadOnly = false;
                    ModalPopupExtender1.TargetControlID = "btnAdd";
                }
                else
                {
                    btnAdd.Visible = false;
                    btnDelete.Visible = false;
                    btnUpdate.Visible = false;
                    txtNotes.ReadOnly = true;
                    ModalPopupExtender1.TargetControlID = "btnHidden";
                }

                Get_TabList(ItemID, ModuleID);
                if (DDLTabs.Items.Count > 0)
                {
                    foreach (ListItem li in DDLTabs.Items)
                    {
                        if (li.Value == ObjID.ToString())
                        {
                            li.Selected = true;
                        }
                    }
                    gvAttach.DataSource = Attachment.Get_Attachments(ItemID, ObjID, ModuleID);
                    gvAttach.DataBind();
                }
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewAttachment.aspx";
        }

        #region Initialize Data

        protected void Get_TabList(int ItemID, int ModuleID)
        {
            DataTable dt = Attachment.Get_TabList(ItemID, ModuleID);
            DDLTabs.DataSource = dt;
            DDLTabs.DataTextField = "Caption";
            DDLTabs.DataValueField = "ObjID";
            DDLTabs.DataBind();
        }

        protected void GVAttach_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string AttachType = e.Row.Cells[1].Text;
                switch (AttachType)
                {
                    case "doc":
                    case "docx":
                        e.Row.Cells[1].Text = "Word Document";
                        break;
                    case "xls":
                    case "xlsx":
                        e.Row.Cells[1].Text = "Excel Spreadsheet";
                        break;
                    case "ppt":
                    case "pptx":
                        e.Row.Cells[1].Text = "PowerPoint Slideshow";
                        break;
                    case "pdf":
                        e.Row.Cells[1].Text = "PDF Document";
                        break;
                    case "gif":
                        e.Row.Cells[1].Text = "GIF Image";
                        break;
                    case "png":
                        e.Row.Cells[1].Text = "PNG Image";
                        break;
                    case "jpg":
                        e.Row.Cells[1].Text = "JPG Image";
                        break;
                    default:
                        e.Row.Cells[1].Text = "Unknown";
                        break;
                }
            }

            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvAttach, "Select$" + e.Row.RowIndex);
            e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
            e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
        }

        protected void DDLTabs_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ObjID = Convert.ToInt32(DDLTabs.SelectedValue);
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            gvAttach.DataSource = Attachment.Get_Attachments(ItemID, ObjID, ModuleID);
            gvAttach.DataBind();
            gvAttach.SelectedIndex = -1;
            txtNotes.Text = string.Empty;
            lblTabError.Text = string.Empty;
            lblTabError.ForeColor = System.Drawing.Color.DarkGreen;
        }

        protected void GVAttach_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtNotes.Text = string.Empty;
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ObjID = Convert.ToInt32(DDLTabs.SelectedValue);
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int index = gvAttach.SelectedIndex;
            string Notes = Attachment.Get_Attachments(ItemID, ObjID, ModuleID).Rows[index]["Notes"].ToString();
            txtNotes.Text = P3General.RTFtoText(Notes);
        }        

        protected void FU1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            string publicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"]);
            string fileNametoupload = publicPath + e.FileName.ToString();
            //ScriptManager.RegisterStartupScript(udpModal, GetType(), "test", "alert('" + fileNametoupload + "')", true);
            FU1.SaveAs(fileNametoupload);
            Session["UploadFilePath"] = fileNametoupload;
        }

        protected bool UseAttachFolder()
		{
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    conn.Open();
				}
                SqlCommand cmd = new SqlCommand("SELECT [Value1],[Value2] FROM [dbo].[SystemSettings] WHERE [P3Key] = 'UseDocFldrForAtchmnts'", conn)
                {
                    CommandType = CommandType.Text
                };
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
				{
                    result = Convert.ToBoolean(sdr["Value1"]);
				}
			}

            return result;
		}

        protected void GetAttachment()
		{
            if (gvAttach.Rows.Count > 0)
            {
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    //Retrieve http authentication cookie.
                    string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                    //Get user information from http cookie.
                    string UserData = ticket.UserData;
                    string[] UserValues = UserData.Split(',');
                    int UserID = Convert.ToInt32(UserValues[0]);


                    if (gvAttach.SelectedIndex != -1)
                    {
                        // Get Attachment Details
                        int AtchID = Convert.ToInt32(gvAttach.DataKeys[gvAttach.SelectedIndex].Values["AtchID"]);
                        string fileType = gvAttach.DataKeys[gvAttach.SelectedIndex].Values["AtchExtension"].ToString();
                        string fileName = Server.UrlEncode(gvAttach.DataKeys[gvAttach.SelectedIndex].Values["AtchName"].ToString());
                        int AtchSerialNo = Convert.ToInt32(gvAttach.DataKeys[gvAttach.SelectedIndex].Values["AtchSerialNo"]);
                        // Get Public folder location
                        string publicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"] + "/" + UserID.ToString()) + "/";
                        // Get Attachment Location
                        bool IsFolder = UseAttachFolder();
                        string destPath = string.Empty;

                        Response.Clear();
                        switch (fileType.ToLower())
                        {
                            case "doc":
                            case "docx":
                                Response.ContentType = "application/ms-word";
                                break;
                            case "xls":
                            case "xlsx":
                                Response.ContentType = "application/ms-excel";
                                break;
                            case "ppt":
                            case "pptx":
                                Response.ContentType = "application/ms-powerpoint";
                                break;
                            case "pdf":
                                Response.ContentType = "application/pdf";
                                break;
                            case ".gif":
                                Response.ContentType = "image/gif";
                                break;
                            case ".png":
                                Response.ContentType = "image/png";
                                break;
                            case ".jpg":
                                Response.ContentType = "image/jpg";
                                break;
                        }

                        if (!IsFolder) // if attachment in DB
                        {
                            byte[] atchData = (byte[])Attachment.Get_AttachData(AtchID).Rows[0]["AtchContent"];
                            Response.AppendHeader("Content-Disposition", "attachment;filename=" + fileName + "." + fileType);
                            destPath = publicPath + fileName + "." + fileType;
                            File.Delete(destPath);
                            Response.BinaryWrite(atchData);
                            Response.End();
                        }
                        else // If attachment in folder location
                        {
                            // Do something from file location
                            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                            string sourcePath = ConfigurationManager.AppSettings["DocumentPath"] + $"Attach\\";
                            string attachName = $"D_" + ModuleID.ToString() + "_" + ItemID.ToString().PadLeft(7, '0') + "_" + AtchSerialNo.ToString().PadLeft(3, '0') + "." + fileType;

                            // Copy from Attach folder to public
                            using (FileStream source = File.Open(sourcePath + attachName, FileMode.Open))
							{
                                using (FileStream destination = File.Create(publicPath + attachName))
								{
                                    source.CopyTo(destination);
                                }
							}

                            Response.AppendHeader("Content-Disposition", "attachment;filename=" + fileName + "." + fileType);
                            Response.TransmitFile(publicPath + attachName);
                            Response.End();
                        }
                    }
                    else
                    {
                        lblTabError.Text = "You must select an attachment to view";
                        lblTabError.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
				{
                    ScriptManager.RegisterStartupScript(udpAttachments, GetType(), "nouser", "alert('You are no longer logged in. Please log in and try again');", true);
				}
            }
            else
            {
                lblTabError.Text = "There are no attachments available to view";
                lblTabError.ForeColor = System.Drawing.Color.Red;
            }
        }

        #endregion

        #region Buttons

        protected void BTNView_Click(object sender, EventArgs e)
        {
            GetAttachment();
        }

        protected void BTNClose_Click(object sender, EventArgs e)
        {
            int UserID = 0;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                //Get user information from http cookie.
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
            }
            string publicPath = ConfigurationManager.AppSettings["PublicPath"] + UserID.ToString() + $"/";

            var dir = new DirectoryInfo(Server.MapPath(publicPath));
			foreach (var file in dir.GetFiles())
			{
				if (file.Name.Contains("D_"))
				{
					file.Delete();
				}
			}
			ScriptManager.RegisterStartupScript(udpAttachments, GetType(), "Close", "window.close();", true);
        }

        protected async void btnUpload_Click(object sender, EventArgs e)
        {
            if (DDLTabs.SelectedValue != "0")
            {
                string selVal = DDLTabs.SelectedValue;
                int itemid = Convert.ToInt32(Request.QueryString["ItemID"]);
                int objid = Convert.ToInt32(DDLTabs.SelectedValue);
                int moduleid = Convert.ToInt32(Request.QueryString["ModuleID"]);
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    int UserID = Convert.ToInt32(UserValues[0]);
                    string UserFullName = UserValues[1];

					//  Check for file
					if (Session["UploadFilePath"] != null)
					{
						string UploadedFile = Session["UploadFilePath"].ToString();
						string filename = Path.GetFileName(UploadedFile);
						string fileextension = Path.GetExtension(UploadedFile).TrimStart('.').ToLower();
						string documentType = string.Empty;

						//provide document type based on it's extension
						switch (fileextension)
						{
							case "pdf":
								documentType = "application/pdf";
								break;
							case "xls":
							case "xlsx":
								documentType = "application/ms-excel";
								break;
							case "doc":
							case "docx":
								documentType = "application/ms-word";
								break;
							case "ppt":
							case "pptx":
								documentType = "application/ms-powerpoint";
								break;
							case "gif":
								documentType = "image/gif";
								break;
							case "png":
								documentType = "image/png";
								break;
							case "jpg":
								documentType = "image/jpg";
								break;
                            default:
                                documentType = "application/pdf";
                                break;
						}

						// Create SQL Connection 
						SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
						using (conn)
						{
							if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
							{
								conn.Open();
							}

							SqlCommand cmd = new SqlCommand("[dbo].[v4_Attachment_Add_Attachment]", conn)
							{
								CommandType = CommandType.StoredProcedure
							};
							cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = itemid;
							cmd.Parameters.Add("@ObjID", SqlDbType.Int, 4).Value = objid;
							cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = moduleid;
							cmd.Parameters.Add("@AtchName", SqlDbType.NVarChar, 255).Value = filename;
							cmd.Parameters.Add("@AtchExtension", SqlDbType.NVarChar, 255).Value = fileextension.TrimStart('.').ToLower();
                            if (UseAttachFolder())
							{                                
                                cmd.Parameters.Add("@AtchContent", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                            }
                            else
							{
                                byte[] documentBinary = File.ReadAllBytes(UploadedFile);
                                cmd.Parameters.Add("@AtchContent", SqlDbType.VarBinary, -1).Value = documentBinary;
                            }
							
							cmd.Parameters.Add("@CreatorID", SqlDbType.Int, 4).Value = UserID;
							cmd.Parameters.Add("@CreateBy", SqlDbType.NVarChar, 255).Value = UserFullName;
							cmd.Parameters.Add("@Notes", SqlDbType.NVarChar, 255).Value = txtNotes.Text;
							int result = Convert.ToInt32(cmd.ExecuteScalar());

                            if (UseAttachFolder()) // If using attachment folder
                            {
                                string AttachmentName = "D_" + moduleid.ToString() + "_" + itemid.ToString().PadLeft(7, '0') + "_" + result.ToString().PadLeft(3, '0') + "." + fileextension.TrimStart('.').ToLower();
                                using (FileStream source = File.Open(UploadedFile, FileMode.Open))
                                {
                                    string AttachmentFolder = ConfigurationManager.AppSettings["DocumentPath"] + $"Attach\\";
                                    using (FileStream destination = File.Create(AttachmentFolder + AttachmentName))
                                    {
                                        await source.CopyToAsync(destination);
                                    }
                                }
                            }

                            if (result > 0)
							{
								lblTabError.Text = "File uploaded successfully";
								lblTabError.ForeColor = System.Drawing.Color.DarkGreen;
							}
							gvAttach.DataSource = Attachment.Get_Attachments(itemid, objid, moduleid);
							gvAttach.DataBind();
							DDLTabs.SelectedValue = selVal;
							lblTabError.Text = string.Empty;
                            
                            // Delete temp file and clear path info
							File.Delete(UploadedFile);
							Session["UploadFilePath"] = null;
						}
					}
					else
					{
						ClientScript.RegisterStartupScript(GetType(), "err", "alert('File not found')", true);
					}
				}
				else
				{
					ClientScript.RegisterStartupScript(GetType(), "AIAbort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
				}
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "hi", "alert('Please select a valid tab for attachment')", true);
            }
        }

        protected async void btnDelete_Click(object sender, EventArgs e)
        {
            if (gvAttach.SelectedIndex != -1)
            {
                int itemid = Convert.ToInt32(Request.QueryString["ItemID"]);
                int objid = Convert.ToInt32(DDLTabs.SelectedValue);
                int moduleid = Convert.ToInt32(Request.QueryString["ModuleID"]);
                string selVal = DDLTabs.SelectedValue;
                int AtchID = Convert.ToInt32(gvAttach.DataKeys[gvAttach.SelectedRow.RowIndex].Values["AtchID"]);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
                using (conn)
                {
                    if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[Atchmnts] WHERE [AtchID] = @AtchID", conn);
                    cmd.Parameters.Add("@AtchID", SqlDbType.Int, 4).Value = AtchID;
                    int result = await Task.FromResult(cmd.ExecuteNonQuery());
                    if (result > 0)
                    {
                        lblTabError.Text = "Attachment successfully deleted";
                        lblTabError.ForeColor = System.Drawing.Color.DarkGreen;
                    }
                    gvAttach.DataSource = Attachment.Get_Attachments(itemid, objid, moduleid);
                    gvAttach.DataBind();
                    DDLTabs.SelectedValue = selVal;
                    lblTabError.Text = string.Empty;
                }
            }
            else
            {
                lblTabError.Text = "You must select an attachment to delete";
                lblTabError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnCancelUpload_Click(object sender, EventArgs e)
        {
            if (Session["UploadFilePath"] != null)
            {
                string uplPath = Session["UploadFilePath"].ToString();
                File.Delete(uplPath);
                Session["UploadFilePath"] = null;
            }
            ClientScript.RegisterStartupScript(GetType(), "cancel", "window.close()", true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (gvAttach.SelectedIndex != -1)
            {
                string notes = txtNotes.Text;
                int atchid = Convert.ToInt32(gvAttach.DataKeys[gvAttach.SelectedIndex].Values["AtchID"]);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
                using (conn)
                {
                    if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                    {
                        conn.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE [dbo].[Atchmnts] " + 
                        "SET [Notes] = @Notes " +
                        "WHERE [AtchID] = @AtchID", conn)
                    {
                        CommandType = CommandType.Text
                    };
                    cmd.Parameters.Add("@AtchID", SqlDbType.Int, 4).Value = atchid;
                    cmd.Parameters.Add("@Notes", SqlDbType.NVarChar, -1).Value = notes;
                    int result = cmd.ExecuteNonQuery();
                    if (result != 0)
                    {
                        ScriptManager.RegisterStartupScript(udpAttachments, GetType(), "mustselect", "alert('Notes updated successfully')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpAttachments, GetType(), "mustselect", "alert('An error occurred while updating the attachment note')", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpAttachments, GetType(), "mustselect", "alert('You must select an attachment to update')", true);
            }
        }

        #endregion
    }
}