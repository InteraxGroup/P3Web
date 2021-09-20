using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
//using DocumentFormat.OpenXml.Wordprocessing;
using Paradigm3.datalayer;

namespace Paradigm3.custom.tillsonburg
{
	public partial class HomePage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				Menu2.Items[0].Selected = true;
				P3MultiView.ActiveViewIndex = 0;

				Get_InfoTxt();
				Get_HotLinks();

				if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
				{
					string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
					FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
					string UserData = authTicket.UserData;
					string[] UserValues = UserData.Split(',');
					int UserStatus = Convert.ToInt32(UserValues[3]);

					if (UserStatus == 1)
					{
						BtnAdmin.Visible = true;
					}
				}
			}
		}

		protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
		{
			MenuItem item = e.Item;
			item.Selected = true;
			P3MultiView.ActiveViewIndex = Convert.ToInt32(e.Item.Value);

		}

		#region Data Layer

		private void Get_InfoTxt()
		{
			Literal[] ltlText = new Literal[21];
			ltlText[0] = ltlWelcomeTxt;
			ltlText[1] = ltlEmpInfoTxt;
			ltlText[2] = ltlEducationTxt;
			ltlText[3] = ltlEHWTxt;
			ltlText[4] = ltlHIPTxt;
			ltlText[5] = ltlHRTxt;
			ltlText[6] = ltlPayrollTxt;
			ltlText[7] = ltlGenInfoTxt;
			ltlText[8] = ltlAccreditationTxt;
			ltlText[9] = ltlAdministrationTxt;
			ltlText[10] = ltlCommitteesTxt;
			ltlText[11] = ltlERTxt;
			ltlText[12] = ltlEthicsTxt;
			ltlText[13] = ltlICTxt;
			ltlText[14] = ltlIMACTxt;
			ltlText[15] = ltlITTxt;
			ltlText[16] = ltlJHSTxt;
			ltlText[17] = ltlNETxt;
			ltlText[18] = ltlPCTxt;
			ltlText[19] = ltlPSTxt;
			ltlText[20] = ltlRCTxt;

			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			SqlCommand cmd = new SqlCommand("SELECT Text FROM zz_Message", conn);
			DataTable dt = new DataTable();
			using (conn)
			{
				try
				{
					conn.Open();
					SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
					dt.Load(myReader);
					int TotalRows = (dt.Rows.Count - 1);
					int i = 0;
					for (i = 0; i <= TotalRows; i++)
					{
						ltlText[i].Text = dt.Rows[i]["Text"].ToString();
					}
					myReader.Close();
				}
				catch (Exception ex)
				{
					throw ex;
				}
			}			
		}

		private void Get_HotLinks()
		{
			gvHotLinks.DataSource = string.Empty;
			gvHotLinks.DataBind();
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			SqlCommand cmd = new SqlCommand("SELECT * FROM zz_HotLink ORDER BY LinkName", conn);
			using (conn)
			{
				try
				{
					conn.Open();
					SqlDataReader myReader = cmd.ExecuteReader();
					gvHotLinks.DataSource = myReader;
					gvHotLinks.DataBind();
					myReader.Close();
				}
				catch (Exception ex)
				{
					throw ex;
				}
			}
		}

		protected async void gvHotLinks_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				string Type = Server.UrlEncode(gvHotLinks.DataKeys[e.Row.DataItemIndex].Values["Type"].ToString());
				Image imgType = (Image)e.Row.Cells[0].FindControl("imgType");
				switch (Type)
				{
					case "0":
						string ItemID = gvHotLinks.DataKeys[e.Row.DataItemIndex].Values["OrigID"].ToString();
						string OrigID = gvHotLinks.DataKeys[e.Row.DataItemIndex].Values["OrigID"].ToString();
						string FileExtension = await Document.Get_DocumentExtensionAsync(Convert.ToInt32(OrigID));
						int PublishFormat = await Document.Get_DocumentPublishTypeAsync(Convert.ToInt32(OrigID));
						int Status = 9;
						string PubPath = ConfigurationManager.AppSettings["PublishPath"];
						string strViewDocVar = ItemID + "," + OrigID + "," + Status + ",'false','" + PubPath + "','" + FileExtension + "'," + PublishFormat;
						e.Row.Attributes.Add("onclick", "openDocWindow(" + strViewDocVar + ");");
						imgType.ImageUrl = "~/images/doc.png";
						break;
					case "1":
						string GroupID = Server.UrlEncode(gvHotLinks.DataKeys[e.Row.DataItemIndex].Values["GroupID"].ToString());
						e.Row.Attributes.Add("onclick", "goToGroup(3, " + GroupID + ");");
						imgType.ImageUrl = "~/images/folder.png";
						break;
					case "2":
						string Protocol = gvHotLinks.DataKeys[e.Row.DataItemIndex].Values["URLProtocol"].ToString();
						string NavigateUrl = Server.UrlEncode(gvHotLinks.DataKeys[e.Row.DataItemIndex].Values["NavigateUrl"].ToString());
						e.Row.Attributes.Add("onclick", "openExternalWindow('" + Protocol + "','" + NavigateUrl + "');");
						imgType.ImageUrl = "~/images/html.png";
						break;
				}
			}
		}

		#endregion

		protected void BtnAdmin_Click(object sender, ImageClickEventArgs e)
		{
			Response.Redirect("~/custom/tillsonburg/admin/Default.aspx");
		}
	}
}