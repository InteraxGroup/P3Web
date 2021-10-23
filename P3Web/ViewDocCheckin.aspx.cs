using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data;
using Paradigm3.datalayer;
using System.Threading.Tasks;
using System.IO;

namespace Paradigm3
{
	public partial class ViewDocCheckin : SqlViewStatePage
	{
		#region Initialization
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
					int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
					int DocStatus = Convert.ToInt32(Request.QueryString["Status"]);
					bool IsServer = Convert.ToBoolean(Request.QueryString["IsServer"]);

					ViewState["DocumentData"] = Document.Get_EditVersion(OrigID, DocStatus);

					lblDocStatus.Text = "Check in COLLABORATE Document";
					if (DocStatus == 2)
					{
						lblDocStatus.Text = "Check in DRAFT Document";
					}
					if (!IsServer)
					{
						pnlUpload.Visible = true;
						pnlCheckIn.Visible = false;
					}
					else
					{
						pnlUpload.Visible = false;
						pnlCheckIn.Visible = true;
					}

					await InitializePage();
				}	
			}
		}

		protected async Task InitializePage()
		{
			DataTable document = await Task.FromResult((DataTable)ViewState["DocumentData"]);
			lblTitle.Text = document.Rows[0]["Name"].ToString() + " (" + document.Rows[0]["Version"].ToString() + ")";
			lblCheckoutStatus.Text = "This item is currently checked out by <strong>" + document.Rows[0]["CheckedOutBy"].ToString() + "</strong>.";
		}

		#endregion

		#region Buttons
		protected async void btnCommit_Click(object sender, EventArgs e)
		{
			//DataTable document = await Task.FromResult((DataTable)ViewState["DocumentData"]);
			HttpPostedFile postedFile = await Task.FromResult(Request.Files["uploader"]);
			//string serverDocument = document.Rows[0]["Name"].ToString() + "." + document.Rows[0]["FileExtension"].ToString();
			if (postedFile == null || postedFile.ContentLength == 0)
			{
				ClientScript.RegisterStartupScript(GetType(), "nofile", "alert('You must select a file to upload');", true);
			}
			else
			{
				await CheckinFileAsync();
			}			
		}

		protected async void btnConfirmedCheckin_Click(object sender, EventArgs e)
		{
			await CheckinFileAsync();
		}

		protected async void btnCheckIn_Click(object sender, EventArgs e)
		{
			await CheckinFileAsync();
		}

		protected void btnCancelCheckOut_Click(object sender, EventArgs e)
		{
			int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
			int Status = Convert.ToInt32(Request.QueryString["Status"]);
			DataTable DocData = (DataTable)ViewState["DocumentData"];
			int ItemID = Convert.ToInt32(DocData.Rows[0]["ItemID"]);

			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				string UserData = authTicket.UserData;
				string[] UserValues = UserData.Split(',');
				string UserFullName = UserValues[1];

				try
				{
					Document.Cancel_Checkout(ItemID);
					bool CheckoutToServer = false;
					if (ConfigurationManager.AppSettings["CheckoutToServer"] != null)
					{
						CheckoutToServer = Convert.ToBoolean(ConfigurationManager.AppSettings["CheckoutToServer"]);
					}

					string FullUserInfo = @"" + User.Identity.Name;
					string[] uName = FullUserInfo.Split('\\');
					string userName = uName[0];
					if (uName.Length > 1)
					{
						userName = uName[1];
					}

					string publicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"] + "/" + userName) + "/";
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
					ClientScript.RegisterStartupScript(GetType(), "nologin", "alert('" + ex.Message + "');");					
				}
			}
			else
			{
				ClientScript.RegisterStartupScript(GetType(), "nologin", "alert('Your session has timed out. Please log in and try again.');");
			}
		}

		protected async void btnConfirmNameCheck_Click(object sender, EventArgs e)
		{
			await CheckinFileAsync();
		}

		#endregion

		#region Tasks

		protected async Task CheckinFileAsync()
		{
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				string UserData = authTicket.UserData;
				string[] UserValues = UserData.Split(',');
				int UserID = Convert.ToInt32(UserValues[0]);
				string UserFullName = UserValues[1];

				// return all variables
				bool IsServer = Convert.ToBoolean(Request.QueryString["IsServer"]);
				DataTable document = (DataTable)ViewState["DocumentData"];
				int OrigID = Convert.ToInt32(document.Rows[0]["OrigID"]);
				string ServerFileName = "D" + document.Rows[0]["ItemID"].ToString().PadLeft(7, '0') + "." + document.Rows[0]["FileExtension"].ToString();
				string EditFileName = document.Rows[0]["Name"].ToString() + "." + document.Rows[0]["FileExtension"].ToString();
				string LabelName = document.Rows[0]["LabelName"].ToString();
				string DocsPath = @"" + ConfigurationManager.AppSettings["DocumentPath"];
				string PublicPath = @"" + ConfigurationManager.AppSettings["PublicPath"] + UserID.ToString() + "/";

				try
				{
					// Perform checkin from external client if required
					if (!IsServer)
					{
						if (File.Exists(Server.MapPath(PublicPath + EditFileName)))
						{
							File.Delete(Server.MapPath(PublicPath + EditFileName));
						}
						uploader.PostedFile.SaveAs(Server.MapPath(PublicPath + EditFileName));
					}

					// Copy edited file from personal public folder to DOCS.
					using (FileStream source = File.Open(Server.MapPath(PublicPath + EditFileName), FileMode.Open))
					{
						using (FileStream target = File.Create(DocsPath + ServerFileName))
						{
							await source.CopyToAsync(target);
						}
					
					}
					
					// Delete file from personal public folder
					File.Delete(Server.MapPath(PublicPath + EditFileName));

					// Update database
					await Document.Update_CheckOutStatusAsync(OrigID, UserFullName, 0);
					await Document.Edit_Document_HistoryAsync(3, OrigID, Path.GetFileNameWithoutExtension(EditFileName), LabelName, "Item has been checked in.", UserFullName, string.Empty);

					// confirm complete
					ClientScript.RegisterStartupScript(GetType(), "checkedin", "documentRefresh();editRefresh(false, false, '" + IsServer.ToString() + "');window.close();", true);
				}
				catch (Exception ex)
				{
					ClientScript.RegisterStartupScript(GetType(), "nologin", "alert('" + ex.Message + "');", true);
				}
			}
			else
			{
				ClientScript.RegisterStartupScript(GetType(), "nologin", "alert('Your session has timed out. Please log in and try again.');", true);
			}
		}

		#endregion
		
	}
}