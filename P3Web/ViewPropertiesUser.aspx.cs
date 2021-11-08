using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Data;
using Paradigm3.datalayer;
using System.Text;
using System.Web.Security;
using System.Configuration;

namespace Paradigm3
{
	public partial class ViewPropertiesUser : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
				if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
				{
					ClientScript.RegisterStartupScript(GetType(), "sessionexpired", "alert('Your Paradigm 3 user session has expired. Please restart your browser and try again');window.close();", true);
				}
				await InitializeUserProperties();
			}
		}

		private async Task InitializeUserProperties()
		{
			//int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
			int UserID = -1000;
			if (Session["SelUserID"] != null)
			{
				UserID = Convert.ToInt32(Session["SelUserID"]);
			}
			//lblUserID.Text = UserID.ToString();
			ViewState["FirstLoad"] = true;
			if (UserID > 0)
			{
				await GetUserData(UserID);
				// General Tab
				txtLoginName.Enabled = false;
				if (rbNormal.Checked)
				{
					chkDefReq.Enabled = true;
					chkTrainingAnalysis.Enabled = true;
					chkViewOtherAssessment.Enabled = true;
				}
			}
			else
			{
				chkDefReq.Enabled = false;
				chkTrainingAnalysis.Enabled = false;
				chkViewOtherAssessment.Enabled = false;
				rbRestricted.Checked = true;
				cblModules.Items[1].Selected = true;
				cblModules.Items[5].Selected = true;
				btnAddMembership.Enabled = false;
				btnAddUserAI.Enabled = false;
				txtSF3.Text = DateTime.Now.ToShortDateString();
				txtSF4.Text = DateTime.Now.ToShortDateString();
			}
		}

		#region Data

		private async Task GetUserData(int UserID)
		{
			DataTable dt = await Properties.Get_PropertiesAsync(UserID, 1, 0);
			ViewState["UserData"] = dt;
			// General Tab
			txtLoginName.Text = dt.Rows[0]["Name"].ToString();
			txtFirstName.Text = dt.Rows[0]["FirstName"].ToString();
			txtLastName.Text = dt.Rows[0]["LastName"].ToString();
			txtPasssword.Attributes["Value"] = "JunkPassword01";
			txtConfirmPassword.Attributes["Value"] = "JunkPassword01";
			txtEmail.Text = dt.Rows[0]["Email"].ToString();
			txtMobileNumber.Text = dt.Rows[0]["MobileNumber"].ToString();
			txtSF1.Text = dt.Rows[0]["SpareField01"].ToString();
			txtSF2.Text = dt.Rows[0]["SpareField02"].ToString();
			txtSF3.Text = DateTime.Now.ToShortDateString();
			if (dt.Rows[0]["SpareField03"] != DBNull.Value)
			{
				txtSF3.Text = Convert.ToDateTime(dt.Rows[0]["SpareField03"]).ToShortDateString();
			}
			txtSF4.Text = DateTime.Now.ToShortDateString();
			if (dt.Rows[0]["SpareField04"] != DBNull.Value)
			{
				txtSF4.Text = Convert.ToDateTime(dt.Rows[0]["SpareField04"]).ToShortDateString();
			}			
			txtDescription.Text = dt.Rows[0]["Description"].ToString();

			// Membership Tab
			int UserStatus = Convert.ToInt32(dt.Rows[0]["Status"]);
			string[] ModuleAccess = dt.Rows[0]["ModuleAccess"].ToString().Split('_');
			chkTrainingAnalysis.Enabled = false; chkDefReq.Enabled = false; chkViewOtherAssessment.Enabled = false;
			if (ModuleAccess[0] == "0|-2") rbExtenalUser.Checked = true;
			if (ModuleAccess[0] == "0|-1") rbRestricted.Checked = true;
			if (ModuleAccess[0] == "0|0") rbNormal.Checked = true;
			if (ModuleAccess[0] == "0|1") rbAdministrator.Checked = true;

			switch (ModuleAccess[0])
			{
				case "0|-2":
					cblModules.Enabled = false;
					cblModules.CssClass = "checkboxlist-disabled";
					cblModules.Items[0].Selected = false;
					cblModules.Items[1].Selected = false;
					cblModules.Items[2].Selected = false;
					cblModules.Items[3].Selected = false;
					cblModules.Items[4].Selected = false;
					cblModules.Items[5].Selected = true;
					break;
				case "0|-1":
				case "0|0":
					cblModules.Enabled = true;
					foreach (string mod in ModuleAccess)
					{
						if (mod == "1|1") cblModules.Items[0].Selected = true;
						if (mod == "3|1") cblModules.Items[1].Selected = true;
						if (mod == "4|1") cblModules.Items[2].Selected = true;
						if (mod == "6|1") cblModules.Items[3].Selected = true;
						if (mod == "12|1") cblModules.Items[4].Selected = true;

					}
					cblModules.Items[5].Selected = true;
					cblModules.Items[5].Enabled = false;
					break;
				case "0|1":
					cblModules.Enabled = false;
					cblModules.CssClass = "checkboxlist-disabled";
					cblModules.Items[0].Selected = true;
					cblModules.Items[1].Selected = true;
					cblModules.Items[2].Selected = true;
					cblModules.Items[3].Selected = true;
					cblModules.Items[4].Selected = true;
					cblModules.Items[5].Selected = true;
					break;
			}

			DataTable dtMemberships = await Properties.Get_UserMembershipsAsync(UserID);
			gvMemberships.DataSource = dtMemberships;
			gvMemberships.DataBind();
			PopulateRootLevel(1, UserID, "1", p3Tree2);

			// Options Tab
			string[] OptionSet = dt.Rows[0]["OptionSet"].ToString().Split('_');
			if (OptionSet.Length > 2)
			{
				if (OptionSet[0] == "1|1") cbChangePassword.Checked = true;
				if (OptionSet[1] == "2|1") cbDisableUser.Checked = true;
				if (OptionSet[2] == "3|1") cbEmailSummary.Checked = true;
				if (OptionSet[3] == "4|1") cbEmailAll.Checked = true;
				if (OptionSet[4] == "5|1") cbEmailUrgent.Checked = true;
				if (OptionSet[6] == "6|1") cbEmailStep.Checked = true;
				if (OptionSet[7] == "7|1") cbSMS.Checked = true;
			}			
			cbHeaderFooter.Enabled = false;
			if (UserStatus == 1 || UserStatus == 0)
			{
				cbHeaderFooter.Enabled = true;
				if (OptionSet.Length > 2)
				{
					if (OptionSet[8] == "8|1") cbHeaderFooter.Checked = true;
				}				
			}

			// Training Tab
			DataTable dtUserTraining = await Properties.Get_UserTrainingAsync(UserID);
			gvUserTraining.DataSource = dtUserTraining;
			gvUserTraining.DataBind();

			// Other User AI tab
			DataTable dtOthAI = await Properties.Get_UserOtherUserAIListAsync(UserID);
			gvOtherUserAI.DataSource = dtOthAI;
			gvOtherUserAI.DataBind();

			PopulateRootLevel(1, UserID, "1", p3Tree);
		}

		private async Task AddNewUser()
		{
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				string[] miscData = ConfigurationManager.AppSettings["MiscData"].Split('-');
				string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				string UserData = authTicket.UserData;
				string[] UserValues = UserData.Split(',');
				int CurrentUserID = Convert.ToInt32(UserValues[0]);

				int ParentGroupID = Convert.ToInt32(Session["ParentGroupID"]);
				string Name = txtLoginName.Text;
				string FirstName = txtFirstName.Text;
				string LastName = txtLastName.Text;
				string Password = txtPasssword.Text;
				string ConfirmPassword = txtConfirmPassword.Text;
				string Email = txtEmail.Text;
				string Mobile = txtMobileNumber.Text;
				string Spare01 = txtSF1.Text;
				string Spare02 = txtSF2.Text;
				DateTime Spare03 = Convert.ToDateTime(txtSF3.Text);
				DateTime Spare04 = Convert.ToDateTime(txtSF4.Text);
				string Description = txtDescription.Text;
				
				// set status
				int Status = -1;
				if (rbExtenalUser.Checked)
				{
					Status = -2;
				}
				if (rbNormal.Checked)
				{
					Status = 0;
				}
				if (rbAdministrator.Checked)
				{
					Status = 1;
				}

				// Check License
				int TotalAvailable = await Properties.Get_TotalLicenses(Status);
				bool IsWithinLicense = false;
				switch (Status)
				{
					case 0:
					case 1:
						if (TotalAvailable < Convert.ToInt32(miscData[0]))
						{
							IsWithinLicense = true;
						}
						break;
					case -1:
						if (TotalAvailable < Convert.ToInt32(miscData[1]))
						{
							IsWithinLicense = true;
						}
						break;
					case -2:
						if (TotalAvailable < Convert.ToInt32(miscData[2]))
						{
							IsWithinLicense = true;
						}
						break;
				}

				if (IsWithinLicense)
				{
					// set ModuleAccess
					string ModuleAccess = "0|1_14|1_-1|0_-2|0_-3|0";
					StringBuilder sbModuleAccess = new StringBuilder();
					if (Status != 1)
					{
						sbModuleAccess.Append("0|" + Status + "_");
						for (int i = 0; i < cblModules.Items.Count; i++)
						{
							string mod;
							switch (i)
							{
								case 0:
									mod = "1";
									break;
								case 1:
									mod = "3";
									break;
								case 2:
									mod = "4";
									break;
								case 3:
									mod = "6";
									break;
								case 4:
									mod = "12";
									break;
								case 5:
									mod = "14";
									break;
								default:
									mod = "1";
									break;
							}
							string sel = "0";
							if (cblModules.Items[i].Selected)
							{
								sel = "1";
							}
							sbModuleAccess.Append(mod);
							sbModuleAccess.Append("|");
							sbModuleAccess.Append(sel);
							sbModuleAccess.Append("_");
							mod = "";
							sel = "";
						}
						sbModuleAccess.Append("-1|0_-2|0_-3|0");
						ModuleAccess = sbModuleAccess.ToString();
					}
					// Set Optionset
					string[] ArrOptionSet = "1|0_2|0_3|0_4|0_5|0_6|0_7|0_8|0_9|0".Split('_');
					if (cbChangePassword.Checked)
					{
						ArrOptionSet[0] = "1|1";
					}
					if (cbDisableUser.Checked)
					{
						ArrOptionSet[1] = "2|1";
					}
					if (cbEmailSummary.Checked)
					{
						ArrOptionSet[2] = "3|1";
					}
					if (cbEmailAll.Checked)
					{
						ArrOptionSet[3] = "4|1";
					}
					if (cbEmailUrgent.Checked)
					{
						ArrOptionSet[4] = "5|1";
					}
					if (cbEmailStep.Checked)
					{
						ArrOptionSet[5] = "6|1";
					}
					if (cbSMS.Checked)
					{
						ArrOptionSet[6] = "7|1";
					}
					if (cbHeaderFooter.Checked)
					{
						ArrOptionSet[7] = "8|1";
					}
					StringBuilder sbOptionSet = new StringBuilder();
					foreach (string s in ArrOptionSet)
					{
						sbOptionSet.Append(s);
						sbOptionSet.Append("_");
					}
					string OptionSet = sbOptionSet.ToString().TrimEnd('_');
					string Language = ddlLanguage.SelectedValue;

					// VALIDATION
					try
					{
						if (string.IsNullOrEmpty(Name))
						{
							throw new Exception("You must enter a username");
						}
						if (string.IsNullOrEmpty(FirstName))
						{
							throw new Exception("You must enter a first name");
						}
						if (string.IsNullOrEmpty(LastName))
						{
							throw new Exception("You must enter a last name");
						}
						if (string.IsNullOrEmpty(Password) || Password.Length < 6)
						{
							throw new Exception("Password must be at least 6 characters long'");
						}
						if (Password != ConfirmPassword)
						{
							throw new Exception("Passwords do not match");
						}
						string encPassword = await P3Security.EncryptAsync(Password, Name.ToUpper(), P3Security.IsFIPS());
						bool usrExists = await P3Security.IsUserValidAsync(Name, encPassword);
						if (usrExists)
						{
							throw new Exception("A user with this username already exists.");
						}
						await Properties.Add_NewUserAsync(Name, ParentGroupID, FirstName, LastName, encPassword, Email, Mobile, Spare01, Spare02, Spare03, Spare04, Description, Status, ModuleAccess, OptionSet, Language, CurrentUserID);
						ClientScript.RegisterStartupScript(GetType(), "useradded", "alert('User successfully added');userRefresh();window.close();", true);
					}
					catch (Exception ex)
					{
						ClientScript.RegisterStartupScript(GetType(), "errmsg", "alert('" + ex.Message + "');", true);
					}
				}
				else
				{
					ClientScript.RegisterStartupScript(GetType(), "errmsg", "alert('You are already at the maximum allowable number for users of this type');", true);
				}			
			}
		}

		private async Task UpdateUser(int UserID)
		{
			DataTable dtUserData = (DataTable)ViewState["UserData"];
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				string[] miscData = ConfigurationManager.AppSettings["MiscData"].Split('-');
				string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				string UserData = authTicket.UserData;
				string[] UserValues = UserData.Split(',');
				int CurrentUserID = Convert.ToInt32(UserValues[0]);
				string Name = txtLoginName.Text;
				string FirstName = txtFirstName.Text;
				string LastName = txtLastName.Text;
				string Password = txtPasssword.Text;
				string ConfirmPassword = txtConfirmPassword.Text;
				string Email = txtEmail.Text;
				string Mobile = txtMobileNumber.Text;
				string Spare01 = txtSF1.Text;
				string Spare02 = txtSF2.Text;
				DateTime Spare03 = Convert.ToDateTime(txtSF3.Text);
				DateTime Spare04 = Convert.ToDateTime(txtSF4.Text);
				string Description = txtDescription.Text;

				// set status
				int Status = Convert.ToInt32(dtUserData.Rows[0]["Status"]);
				if (rbExtenalUser.Checked)
				{
					Status = -2;
				}
				if (rbRestricted.Checked)
				{
					Status = -1;
				}
				if (rbNormal.Checked)
				{
					Status = 0;
				}
				if (rbAdministrator.Checked)
				{
					Status = 1;
				}

				// Check License
				int TotalAvailable = await Properties.Get_TotalLicenses(Status);
				bool IsWithinLicense = false;
				switch (Status)
				{
					case 0:
					case 1:
						if (TotalAvailable < Convert.ToInt32(miscData[0]))
						{
							IsWithinLicense = true;
						}
						break;
					case -1:
						if (TotalAvailable < Convert.ToInt32(miscData[1]))
						{
							IsWithinLicense = true;
						}
						break;
					case -2:
						if (TotalAvailable < Convert.ToInt32(miscData[2]))
						{
							IsWithinLicense = true;
						}
						break;
				}

				if (IsWithinLicense)
				{
					// set ModuleAccess
					string ModuleAccess = dtUserData.Rows[0]["ModuleAccess"].ToString();
					StringBuilder sbModuleAccess = new StringBuilder();
					if (Status != 1)
					{
						sbModuleAccess.Append("0|" + Status + "_");
						for (int i = 0; i < cblModules.Items.Count; i++)
						{
							string mod;
							switch (i)
							{
								case 0:
									mod = "1";
									break;
								case 1:
									mod = "3";
									break;
								case 2:
									mod = "4";
									break;
								case 3:
									mod = "6";
									break;
								case 4:
									mod = "12";
									break;
								case 5:
									mod = "14";
									break;
								default:
									mod = "1";
									break;
							}
							string sel = "0";
							if (cblModules.Items[i].Selected)
							{
								sel = "1";
							}
							sbModuleAccess.Append(mod);
							sbModuleAccess.Append("|");
							sbModuleAccess.Append(sel);
							sbModuleAccess.Append("_");
							mod = "";
							sel = "";
						}
						sbModuleAccess.Append("-1|0_-2|0_-3|0");
						ModuleAccess = sbModuleAccess.ToString();
					}
					// Set Optionset
					string[] ArrOptionSet = dtUserData.Rows[0]["OptionSet"].ToString().Split('_');
					if (cbChangePassword.Checked)
					{
						ArrOptionSet[0] = "1|1";
					}
					if (cbDisableUser.Checked)
					{
						ArrOptionSet[1] = "2|1";
						Status = 9;
					}
					else
					{
						ArrOptionSet[1] = "2|0";
						if (rbExtenalUser.Checked)
						{
							Status = -2;
						}
						if (rbRestricted.Checked)
						{
							Status = -1;
						}
						if (rbNormal.Checked)
						{
							Status = 0;
						}
						if (rbAdministrator.Checked)
						{
							Status = 1;
						}
					}
					if (cbEmailSummary.Checked)
					{
						ArrOptionSet[2] = "3|1";
					}
					if (cbEmailAll.Checked)
					{
						ArrOptionSet[3] = "4|1";
					}
					if (cbEmailUrgent.Checked)
					{
						ArrOptionSet[4] = "5|1";
					}
					if (cbEmailStep.Checked)
					{
						ArrOptionSet[5] = "6|1";
					}
					if (cbSMS.Checked)
					{
						ArrOptionSet[6] = "7|1";
					}
					if (cbHeaderFooter.Checked)
					{
						ArrOptionSet[7] = "8|1";
					}
					StringBuilder sbOptionSet = new StringBuilder();
					foreach (string s in ArrOptionSet)
					{
						sbOptionSet.Append(s);
						sbOptionSet.Append("_");
					}
					string OptionSet = sbOptionSet.ToString().TrimEnd('_');
					string Language = ddlLanguage.SelectedValue;

					try
					{
						if (Password != "JunkPassword01")
						{
							if (Password.Length < 6)
							{
								throw new Exception("Password must be at least 6 characters in length");
							}
							if (Password != ConfirmPassword)
							{
								throw new Exception("Passwords do not match.");
							}
							Password = await P3Security.EncryptAsync(Password, Name.ToUpper(), P3Security.IsFIPS());
						}						
						await Properties.Update_UserAsync(UserID, FirstName, LastName, Password, Email, Mobile, Spare01, Spare02, Spare03, Spare04, Description, Status,
								ModuleAccess, OptionSet, Language, CurrentUserID);
						ClientScript.RegisterStartupScript(GetType(), "success", "alert('User successfully updated');userRefresh();window.close();", true);
					}
					catch (Exception ex)
					{
						ClientScript.RegisterStartupScript(GetType(), "errmsg", "alert('" + ex.Message + "');", true);
					}					
				}				
			}
		}

		#endregion

		#region Controls

		protected void rb_CheckedChanged(object sender, EventArgs e)
		{
			RadioButton rb = (RadioButton)sender;
			DataTable dt = (DataTable)ViewState["UserData"];
			string[] ModuleAccess = "0|-2_1|0_3|0_4|0_6|0_12|0_14|1_-1|0_-2|0_-3|0".Split('_');
			if (Request.QueryString["UserID"] != "0")
			{
				ModuleAccess = dt.Rows[0]["ModuleAccess"].ToString().Split('_');
			}
			//int UserStatus = Convert.ToInt32(dt.Rows[0]["Status"]);
			switch (rb.ID)
			{
				case "rbExtenalUser":
					if (rb.Checked)
					{
						rbRestricted.Checked = false;
						rbNormal.Checked = false;
						rbAdministrator.Checked = false;
						chkDefReq.Enabled = false;
						chkTrainingAnalysis.Enabled = false;
						chkViewOtherAssessment.Enabled = false;

						foreach (ListItem li in cblModules.Items)
						{
							if (li.Value != "14")
							{
								li.Selected = false;
							}
						}
						cblModules.Enabled = false;
					}
					break;
				case "rbRestricted":
					if (rb.Checked)
					{
						rbExtenalUser.Checked = false;
						rbNormal.Checked = false;
						rbAdministrator.Checked = false;
						chkDefReq.Enabled = false;
						chkTrainingAnalysis.Enabled = false;
						chkViewOtherAssessment.Enabled = false;

						//switch (UserStatus)
						//{
						//	case 1:
						//		foreach (ListItem li in cblModules.Items)
						//		{
						//			li.Selected = true;
						//		}
						//		cblModules.Enabled = true;
						//		break;
						//	case -2:
						//	case 0:
						//	case -1:
						//		foreach (ListItem li in cblModules.Items)
						//		{
						//			li.Selected = false;
						//			switch (li.Value)
						//			{
						//				case "1":
						//					if (ModuleAccess[1] == "1|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "3":
						//					if (ModuleAccess[2] == "3|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "4":
						//					if (ModuleAccess[3] == "4|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "6":
						//					if (ModuleAccess[4] == "6|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "12":
						//					if (ModuleAccess[5] == "12|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "14":
						//					li.Selected = true;
						//					break;
						//			}
						//		}
						//		cblModules.Enabled = true;
						//		break;
						//}
					}
					break;
				case "rbNormal":
					if (rb.Checked)
					{
						rbExtenalUser.Checked = false;
						rbRestricted.Checked = false;
						rbAdministrator.Checked = false;
						chkDefReq.Enabled = true;
						chkTrainingAnalysis.Enabled = true;
						chkViewOtherAssessment.Enabled = true;

						//switch (UserStatus)
						//{
						//	case 1:
						//		foreach (ListItem li in cblModules.Items)
						//		{
						//			li.Selected = true;
						//		}
						//		cblModules.Enabled = true;
						//		break;
						//	case -2:
						//	case 0:
						//	case -1:
						//		foreach (ListItem li in cblModules.Items)
						//		{
						//			li.Selected = false;
						//			switch (li.Value)
						//			{
						//				case "1":
						//					if (ModuleAccess[1] == "1|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "3":
						//					if (ModuleAccess[2] == "3|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "4":
						//					if (ModuleAccess[3] == "4|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "6":
						//					if (ModuleAccess[4] == "6|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "12":
						//					if (ModuleAccess[5] == "12|1")
						//					{
						//						li.Selected = true;
						//					}
						//					break;
						//				case "14":
						//					li.Selected = true;
						//					break;
						//			}
						//		}
						//		cblModules.Enabled = true;
						//		break;
						//}
					}
					break;
				case "rbAdministrator":
					if (rb.Checked)
					{
						rbExtenalUser.Checked = false;
						rbNormal.Checked = false;
						rbRestricted.Checked = false;
						chkDefReq.Enabled = false;
						chkTrainingAnalysis.Enabled = false;
						chkViewOtherAssessment.Enabled = false;

						foreach (ListItem li in cblModules.Items)
						{
							if (!li.Selected)
							{
								li.Selected = true;
							}
						}
						cblModules.Enabled = false;
					}
					break;
			}
		}

		protected void cbl_SelectedIndexChanged(object sender, EventArgs e)
		{
			CheckBoxList cbl = (CheckBoxList)sender;
			switch (cbl.ID)
			{
				case "cblTrainColumns":
					bool enabled = false;
					foreach (ListItem li in cbl.Items)
					{
						if (li.Selected)
						{
							enabled = true;
						}
					}
					if (enabled)
					{
						btnSubmitExportTraining.Enabled = true;
					}
					mpeExportTraining.Show();
					break;
			}
		}

		protected async void Button_Click(object sender, EventArgs e)
		{
			Button btn = (Button)sender;
			int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
			switch (btn.CommandArgument)
			{
				case "ShowMe":
					int ItemID = Convert.ToInt32(gvUserTraining.DataKeys[gvUserTraining.SelectedIndex].Values["ItemID"]);
					int OrigID = Convert.ToInt32(gvUserTraining.DataKeys[gvUserTraining.SelectedIndex].Values["OrigID"]);
					int ParentGroupID = Convert.ToInt32(gvUserTraining.DataKeys[gvUserTraining.SelectedIndex].Values["ParentGroupID"]);
					string strVar = "12," + ItemID.ToString() + ",0," + ParentGroupID.ToString() + ",0";
					ClientScript.RegisterStartupScript(GetType(), "showme", "openRecordWindow(" + strVar + ");", true);
					break;
				case "GoThere":
					int ItemID2 = Convert.ToInt32(gvUserTraining.DataKeys[gvUserTraining.SelectedIndex].Values["ItemID"]);
					int OrigID2 = Convert.ToInt32(gvUserTraining.DataKeys[gvUserTraining.SelectedIndex].Values["OrigID"]);
					int ParentGroupID2 = Convert.ToInt32(gvUserTraining.DataKeys[gvUserTraining.SelectedIndex].Values["ParentGroupID"]);
					Session["ModuleID"] = 12;
					Session["GTGroupID"] = ParentGroupID2;
					Session["GTItemID"] = OrigID2;
					Session["GTIsItemID"] = 1;
					ClientScript.RegisterStartupScript(GetType(), "gothere", "clickGoThere();window.close();", true);
					break;
				case "CheckAll":
					foreach (ListItem cb in cblTrainColumns.Items)
					{
						if (!cb.Selected)
						{
							cb.Selected = true;
						}
						mpeExportTraining.Show();
					}
					btnSubmitExportTraining.Enabled = true;
					break;
				case "UncheckAll":
					foreach (ListItem cb in cblTrainColumns.Items)
					{
						if (cb.Selected)
						{
							cb.Selected = false;
						}
						btnSubmitExportTraining.Enabled = false;
						mpeExportTraining.Show();
					}
					break;
				case "ExportTraining":
					Response.Clear();
					Response.Buffer = true;
					Response.AddHeader("content-disposition", "attachment;filename=P3Web_ExportedTrainingRecords.csv");
					Response.Charset = "";
					Response.ContentType = "application/text";
					gvUserTraining.AllowPaging = false;
					gvUserTraining.DataSource = await Properties.Get_UserTrainingAsync(UserID);
					gvUserTraining.DataBind();
					StringBuilder columnbind = new StringBuilder();
					// Create CSV Columns
					foreach (ListItem hr in cblTrainColumns.Items)
					{
						if (hr.Selected)
						{
							int index = Convert.ToInt32(hr.Value);
							columnbind.Append(gvUserTraining.Columns[index].HeaderText + ',');
						}

					}
					columnbind.Append("\r\n");
					// Create CSV Rows
					for (int i = 0; i < gvUserTraining.Rows.Count; i++)
					{
						for (int k = 0; k < cblTrainColumns.Items.Count; k++)
						{
							if (cblTrainColumns.Items[k].Selected)
							{
								columnbind.Append(gvUserTraining.Rows[i].Cells[k + 1].Text.Replace("&nbsp;", " ") + ",");
							}
						}
						columnbind.Append("\r\n");
					}

					foreach (ListItem x in cblTrainColumns.Items)
					{
						x.Selected = false;
					}
					mpeExportTraining.Hide();
					Response.Output.Write(columnbind.ToString());
					Response.Flush();
					Response.End();
					break;
				case "AddUserEntity":
					ViewState["FirstLoad"] = false;
					mpeOtherUserAI.Show();
					break;
				case "AddToList":
					// Create DataTable to hold changes
					DataTable dtAdded = new DataTable();
					dtAdded.Columns.Add("ControlID", typeof(int));
					dtAdded.Columns.Add("ControlFullName", typeof(string));
					dtAdded.Columns.Add("ControlType", typeof(int));

					// If gvAdded List has rows, add them to the temp table
					if (gvAdded.Rows.Count > 0)
					{
						foreach (GridViewRow gvr in gvAdded.Rows)
						{
							int gvrControlID = Convert.ToInt32(gvAdded.DataKeys[gvr.RowIndex].Values["ControlID"]);
							string gvrControlFullName = gvAdded.DataKeys[gvr.RowIndex].Values["ControlFullName"].ToString();
							int gvrControlType = Convert.ToInt32(gvAdded.DataKeys[gvr.RowIndex].Values["ControlType"]);

							DataRow dr = dtAdded.NewRow();
							dr["ControlID"] = gvrControlID;
							dr["ControlFullName"] = gvrControlFullName;
							dr["ControlType"] = gvrControlType;
							dtAdded.Rows.Add(dr);
						}
					}

					int ControlType = 0;
					if (p3Tree.SelectedNode.ImageUrl == "~/images/user.png")
					{
						ControlType = 1;
					}
					if (p3Tree.SelectedNode.ImageUrl == "~/images/entity.png")
					{
						ControlType = 6;
					}
					if (ControlType == 1 || ControlType == 6)
					{
						DataRow dr = dtAdded.NewRow();
						dr["ControlID"] = Convert.ToInt32(p3Tree.SelectedValue);
						dr["ControlFullName"] = p3Tree.SelectedNode.Text;
						dr["ControlType"] = ControlType;
						dtAdded.Rows.Add(dr);
					}

					dtAdded = dtAdded.DefaultView.ToTable(true);

					gvAdded.DataSource = dtAdded;
					gvAdded.DataBind();
					dtAdded.Dispose();
					mpeOtherUserAI.Show();
					break;
				case "RemoveFromList":
					DataTable dtRemove = new DataTable();
					dtRemove.Columns.Add("ControlID", typeof(int));
					dtRemove.Columns.Add("ControlFullName", typeof(string));
					dtRemove.Columns.Add("ControlType", typeof(int));

					foreach (GridViewRow gvr in gvAdded.Rows)
					{
						int gvrControlID = Convert.ToInt32(gvAdded.DataKeys[gvr.RowIndex].Values["ControlID"]);
						string gvrControlFullName = gvAdded.DataKeys[gvr.RowIndex].Values["ControlFullName"].ToString();
						int gvrControlType = Convert.ToInt32(gvAdded.DataKeys[gvr.RowIndex].Values["ControlType"]);

						DataRow dr = dtRemove.NewRow();
						dr["ControlID"] = gvrControlID;
						dr["ControlFullName"] = gvrControlFullName;
						dr["ControlType"] = gvrControlType;
						dtRemove.Rows.Add(dr);
					}

					List<DataRow> toDelete = new List<DataRow>();
					foreach (DataRow drRem in dtRemove.Rows)
					{
						int contID = Convert.ToInt32(gvAdded.DataKeys[gvAdded.SelectedIndex].Values["ControlID"]);
						int contType = Convert.ToInt32(gvAdded.DataKeys[gvAdded.SelectedIndex].Values["ControlType"]);
						if (drRem["ControlID"].Equals(contID) && drRem["ControlType"].Equals(contType))
						{
							toDelete.Add(drRem);
						}
					}
					foreach (DataRow d in toDelete)
					{
						dtRemove.Rows.Remove(d);
					}
					gvAdded.DataSource = dtRemove;
					gvAdded.DataBind();
					dtRemove.Dispose();
					gvAdded.SelectedIndex = -1;
					mpeOtherUserAI.Show();
					break;
				case "UpdateWithNewUsers":
					if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
					{
						string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
						FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
						string UserData = authTicket.UserData;
						string[] UserValues = UserData.Split(',');
						int CurrentUserID = Convert.ToInt32(UserValues[0]);

						// Create DataTable to hold changes
						DataTable dtAddedFinal = new DataTable();
						dtAddedFinal.Columns.Add("ControlID", typeof(int));
						dtAddedFinal.Columns.Add("ControlFullName", typeof(string));
						dtAddedFinal.Columns.Add("ControlType", typeof(int));

						// Transfer AddedItems to temp table
						if (gvAdded.Rows.Count > 0)
						{
							foreach (GridViewRow gvrFinal in gvAdded.Rows)
							{
								int gvrControlID = Convert.ToInt32(gvAdded.DataKeys[gvrFinal.RowIndex].Values["ControlID"]);
								string gvrControlFullName = gvAdded.DataKeys[gvrFinal.RowIndex].Values["ControlFullName"].ToString();
								int gvrControlType = Convert.ToInt32(gvAdded.DataKeys[gvrFinal.RowIndex].Values["ControlType"]);

								DataRow dr = dtAddedFinal.NewRow();
								dr["ControlID"] = gvrControlID;
								dr["ControlFullName"] = gvrControlFullName;
								dr["ControlType"] = gvrControlType;
								dtAddedFinal.Rows.Add(dr);
								dtAddedFinal.AcceptChanges();
							}
						}

						foreach (GridViewRow gvr in gvOtherUserAI.Rows)
						{
							int othControlID = Convert.ToInt32(gvOtherUserAI.DataKeys[gvr.RowIndex].Values["ControlID"]);
							string othControlFullName = gvOtherUserAI.DataKeys[gvr.RowIndex].Values["ControlFullName"].ToString();
							int othControlType = Convert.ToInt32(gvOtherUserAI.DataKeys[gvr.RowIndex].Values["ControlType"]);

							DataRow dr1 = dtAddedFinal.NewRow();
							dr1["ControlID"] = othControlID;
							dr1["ControlFullName"] = othControlFullName;
							dr1["ControlType"] = othControlType;

							dtAddedFinal.Rows.Add(dr1);
							dtAddedFinal.AcceptChanges();
						}

						dtAddedFinal = dtAddedFinal.DefaultView.ToTable(true);
						foreach (DataRow dr2 in dtAddedFinal.Rows)
						{
							int cid = Convert.ToInt32(dr2["ControlID"]);
							string cfn = dr2["ControlFullName"].ToString();
							int ct = Convert.ToInt32(dr2["ControlType"]);
							await Properties.Update_OtherUserAIListAsync(UserID, cid, cfn, ct, CurrentUserID);
						}						
						gvOtherUserAI.DataSource = await Properties.Get_UserOtherUserAIListAsync(UserID);
						gvOtherUserAI.DataBind();
						p3Tree.Nodes.Clear();
						PopulateRootLevel(1, CurrentUserID, "1", p3Tree);
						p3Tree.Nodes[0].Expand();
					}
					mpeOtherUserAI.Hide();
					break;
				case "CancelOtherUserChanges":
					gvAdded.DataSource = null;
					gvAdded.DataBind();
					PopulateRootLevel(1, UserID, "1", p3Tree);
					p3Tree.Nodes[0].Expand();
					mpeOtherUserAI.Hide();
					break;
				case "AddMemberToList":
					if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
					{
						string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
						FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
						string UserData = authTicket.UserData;
						string[] UserValues = UserData.Split(',');
						int LoggedOnUserID = Convert.ToInt32(UserValues[0]);

						// Create DataTable to hold changes
						DataTable dtAddedMembers = new DataTable();
						dtAddedMembers.Columns.Add("ControlID", typeof(int));
						dtAddedMembers.Columns.Add("ControlFullName", typeof(string));
						dtAddedMembers.Columns.Add("ControlType", typeof(int));

						// Transfer AddedItems to temp table
						if (gvMembers.Rows.Count > 0)
						{
							foreach (GridViewRow gvm in gvMembers.Rows)
							{
								int gvmControlID = Convert.ToInt32(gvMembers.DataKeys[gvm.RowIndex].Values["ControlID"]);
								string gvmControlFullName = gvMembers.DataKeys[gvm.RowIndex].Values["ControlFullName"].ToString();
								int gvmControlType = Convert.ToInt32(gvMembers.DataKeys[gvm.RowIndex].Values["ControlType"]);

								DataRow dr2 = dtAddedMembers.NewRow();
								dr2["ControlID"] = gvmControlID;
								dr2["ControlFullName"] = gvmControlFullName;
								dr2["ControlType"] = gvmControlType;
								dtAddedMembers.Rows.Add(dr2);
							}
						}

						DataRow dr = dtAddedMembers.NewRow();
						dr["ControlID"] = Convert.ToInt32(p3Tree2.SelectedValue);
						dr["ControlFullName"] = p3Tree2.SelectedNode.Text;
						dr["ControlType"] = 6;
						dtAddedMembers.Rows.Add(dr);

						dtAdded = dtAddedMembers.DefaultView.ToTable(true);

						gvMembers.DataSource = dtAdded;
						gvMembers.DataBind();
						dtAddedMembers.Dispose();
						mpeAddMemberShips.Show();
					}
					break;
				case "RemoveMemberFromList":
					DataTable dtMemRem = new DataTable();
					dtMemRem.Columns.Add("ControlID", typeof(int));
					dtMemRem.Columns.Add("ControlFullName", typeof(string));
					dtMemRem.Columns.Add("ControlType", typeof(int));

					foreach (GridViewRow gvr in gvMembers.Rows)
					{
						int gvrControlID2 = Convert.ToInt32(gvMembers.DataKeys[gvr.RowIndex].Values["ControlID"]);
						string gvrControlFullName2 = gvMembers.DataKeys[gvr.RowIndex].Values["ControlFullName"].ToString();
						int gvrControlType2 = Convert.ToInt32(gvMembers.DataKeys[gvr.RowIndex].Values["ControlType"]);

						DataRow drMem = dtMemRem.NewRow();
						drMem["ControlID"] = gvrControlID2;
						drMem["ControlFullName"] = gvrControlFullName2;
						drMem["ControlType"] = gvrControlType2;
						dtMemRem.Rows.Add(drMem);
					}

					List<DataRow> toRemMem = new List<DataRow>();
					foreach (DataRow drMemRem in dtMemRem.Rows)
					{
						int contID2 = Convert.ToInt32(gvMembers.DataKeys[gvMembers.SelectedIndex].Values["ControlID"]);
						int contType2 = Convert.ToInt32(gvMembers.DataKeys[gvMembers.SelectedIndex].Values["ControlType"]);
						if (drMemRem["ControlID"].Equals(contID2) && drMemRem["ControlType"].Equals(contType2))
						{
							toRemMem.Add(drMemRem);
						}
					}
					foreach (DataRow d in toRemMem)
					{
						dtMemRem.Rows.Remove(d);
					}
					gvMembers.DataSource = dtMemRem;
					gvMembers.DataBind();
					dtMemRem.Dispose();
					gvMembers.SelectedIndex = -1;
					mpeAddMemberShips.Show();
					break;
				case "UpdateWithNewMembers":
					if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
					{
						string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
						FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
						string UserData = authTicket.UserData;
						string[] UserValues = UserData.Split(',');
						int cUid = Convert.ToInt32(UserValues[0]);

						DataTable dtFinalMembers = new DataTable();
						dtFinalMembers.Columns.Add("ControlID", typeof(int));
						dtFinalMembers.Columns.Add("ControlFullName", typeof(string));
						dtFinalMembers.Columns.Add("ControlType", typeof(int));

						if (gvMembers.Rows.Count > 0)
						{
							foreach (GridViewRow gvr in gvMembers.Rows)
							{
								DataRow dry = dtFinalMembers.NewRow();
								dry["ControlID"] = Convert.ToInt32(gvMembers.DataKeys[gvr.RowIndex].Values["ControlID"]);
								dry["ControlFullName"] = gvMembers.DataKeys[gvr.RowIndex].Values["ControlFullName"].ToString();
								dry["ControlType"] = 6;
								dtFinalMembers.Rows.Add(dry);
								dtFinalMembers.AcceptChanges();
							}
						}

						DataTable dtz = dtFinalMembers.DefaultView.ToTable(true);
						foreach (DataRow dr in dtz.Rows)
						{
							int contId = Convert.ToInt32(dr["ControlID"]);
							string contFullName = dr["ControlFullName"].ToString();

							await Properties.Update_UserMembershipsAsync(UserID, contId, contFullName, cUid);
						}
					}

					DataTable z = await Properties.Get_UserMembershipsAsync(UserID);
					gvMemberships.DataSource = z;
					gvMemberships.DataBind();
					p3Tree2.CollapseAll();
					p3Tree2.Nodes[0].Selected = true;
					p3Tree2.Nodes[0].Expand();
					break;
				case "CancelMemberChanges":
					p3Tree2.CollapseAll();
					p3Tree2.Nodes[0].Selected = true;
					p3Tree2.Nodes[0].Expand();
					gvMembers.DataSource = null;
					gvMembers.DataBind();
					break;
			}
		}

		protected async void btnRemoveMembership_Click(object sender, EventArgs e)
		{
			if (gvMemberships.SelectedIndex != -1)
			{
				int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
				int GroupID = Convert.ToInt32(gvMemberships.DataKeys[gvMemberships.SelectedIndex].Values["GroupID"]);
				//ScriptManager.RegisterStartupScript(udpMembership, GetType(), "test", "console.log(" + gid + ");", true);
				await Properties.Remove_UserMembershipAsync(UserID, GroupID);
				DataTable dt = await Properties.Get_UserMembershipsAsync(UserID);
				gvMemberships.DataSource = dt;
				gvMemberships.DataBind();
			}
		}

		protected async void btnOK_Click(object sender, EventArgs e)
		{
			int UserID = -1000;
			if (Session["SelUserID"] != null)
			{
				UserID = Convert.ToInt32(Session["SelUserID"]);//Convert.ToInt32(Request.QueryString["UserID"]);
			}
			if (UserID == -1000)
			{
				ClientScript.RegisterStartupScript(GetType(), "nouser", "alert('This process is invalid');window.close();", true);
			}
			else if (UserID == 0)
			{				
				await AddNewUser();
			}
			else
			{
				await UpdateUser(UserID);
			}
		}

		#endregion

		#region TreeView

		protected void P3Tree_TreeNodePopulate(object sender, TreeNodeEventArgs e)
		{
			int UserID = 0;
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				string UserData = authTicket.UserData;
				string[] UserValues = UserData.Split(',');
				UserID = Convert.ToInt32(UserValues[0]);
			}

			int moduleID = Convert.ToInt32(Session.Contents["ModuleID"]);
			PopulateSubLevel(moduleID, Convert.ToInt32(e.Node.Value), e.Node, UserID);
		}

		private void PopulateRootLevel(int moduleID, int userID, string rootID, TreeView tv)
		{
			tv.Nodes.Clear();
			DataTable dt = P3General.Get_DisplayGroups(moduleID, Convert.ToInt32(rootID), userID);
			if (tv.ID == "p3Tree2")
			{
				DataView dv = new DataView(dt);
				dv.RowFilter = "GroupID <> 3";
				dt = dv.ToTable();
			}
			DataRow[] root = dt.Select("GroupID=" + rootID);
			if (root.Length > 0)
			{
				TreeNode rootnode = new TreeNode(root[0]["Name"].ToString(), root[0]["GroupID"].ToString());
				tv.Nodes.Add(rootnode);
				tv.Nodes[0].Selected = true;
				PopulateNodes(dt, tv.FindNode(rootID).ChildNodes, Convert.ToInt32(rootID));
			}
			else
			{
				//throw new Exception("There is no root level found");
				ClientScript.RegisterStartupScript(GetType(), "noroot", "alert('There is no root level found');", true);
			}

			dt.Dispose();
		}

		private void PopulateNodes(DataTable dt, TreeNodeCollection nodes, int ParentID)
		{
			foreach (DataRow dr in dt.Rows)
			{
				if (!dr["GroupID"].Equals(ParentID))
				{
					string icon = "~/images/users2.png";
					if (dr["ObjTypeID"].Equals(6))
					{
						icon = "~/images/entity.png";
					}
					TreeNode tn = new TreeNode
					{
						Text = dr["Name"].ToString(),
						Value = dr["GroupID"].ToString(),
						ImageUrl = icon,
					};
					nodes.Add(tn);
					tn.PopulateOnDemand = (Convert.ToInt32(dr["childnodecount"]) > 0);
				}
			}
		}

		private void PopulateSubLevel(int ModuleID, int ParentGroupID, TreeNode parentNode, int userID)
		{
			// Populate TreeView sublevels based upon which menu item in TabContainer1 is selected.
			DataTable dt = P3General.Get_DisplayGroups(ModuleID, ParentGroupID, userID);
			PopulateNodes(dt, parentNode.ChildNodes, ParentGroupID);
			dt.Dispose();
		}

		protected void P3Tree_SelectedNodeChanged(object sender, EventArgs e)
		{
			TreeView tv = (TreeView)sender;
			tv.SelectedNode.Expand();			
			if (tv.ID == "p3Tree" && tv.SelectedNode.ValuePath.StartsWith("1/3"))
			{
				gvAdded.SelectedIndex = -1;			
				mpeOtherUserAI.Show();
			}
			else
			{
				gvMembers.SelectedIndex = -1;
				mpeAddMemberShips.Show();
			}
			
		}

		protected async void p3Tree_TreeNodeCollapsedExpanded(object sender, TreeNodeEventArgs e)
		{
			TreeView tv = (TreeView)sender;
			e.Node.Selected = true;
			bool FirstLoad = (bool)ViewState["FirstLoad"];
			if (FirstLoad && e.Node.Value == "1")
			{
				mpeOtherUserAI.Hide();
				mpeAddMemberShips.Hide();
			}
			else
			{
				if (tv.ID == "p3Tree")
				{
					if (e.Node.ValuePath.StartsWith("1/3"))
					{
						await GetUsersForNode(Convert.ToInt32(e.Node.Value));
					}					
					mpeOtherUserAI.Show();
				}
				else
				{
					mpeAddMemberShips.Show();
				}
		}
	}

		protected void FindMyNode(string searchstring, TreeView tvNodes)
		{
			try
			{
				for (int i = 0; i < tvNodes.Nodes.Count; i++)
				{
					TreeNode trNode = tvNodes.Nodes[i];

					if (trNode.Value == searchstring)
					{
						trNode.Selected = true;
					}
					else
					{
						TreeNode trAnswerNode = FindChildNodes(trNode, searchstring);
						if (trAnswerNode != null)
						{
							trAnswerNode.Selected = true;
						}
					}
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		private TreeNode FindChildNodes(TreeNode trNode, string searchstring)
		{
			try
			{
				for (int i = 0; i < trNode.ChildNodes.Count; i++)
				{
					TreeNode trChildNode = trNode.ChildNodes[i];
					if (trChildNode.Value == searchstring)
					{
						return trChildNode;
					}

					else
					{
						TreeNode trAnswerNode = FindChildNodes(trChildNode, searchstring);
						if (trAnswerNode != null)
						{
							return trAnswerNode;
						}
					}
				}
				return null;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		private async Task GetUsersForNode(int NodeId)
		{
			DataTable dt = await P3General.Get_Users_For_SelectedNode(NodeId);
			TreeNode parent = p3Tree.SelectedNode;
			if (dt.Rows.Count > 0)
			{
				foreach (DataRow dr in dt.Rows)
				{
					TreeNode tn = new TreeNode()
					{
						Text = dr["ControlFullName"].ToString(),
						Value = dr["ControlID"].ToString(),
						ImageUrl = "~/images/user.png"
					};
					parent.ChildNodes.Add(tn);
				}
			}
		}

		#endregion

		#region GridView
		protected void GV_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			GridView gv = (GridView)sender;
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
				e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
				e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);

				if (gv.ID == "gvUserTraining")
				{
					Image imgIcon = (Image)e.Row.Cells[0].FindControl("imgIcon");
					string Status = e.Row.Cells[3].Text;
					imgIcon.ImageUrl = "~/images/training.png";
					if (Status == "Complete")
					{
						imgIcon.ImageUrl = "~/images/check.png";
					}
					int TrainItemID = Convert.ToInt32(gvUserTraining.DataKeys[e.Row.RowIndex].Values["ItemID"]);
					int TrainParentGroupID = Convert.ToInt32(gvUserTraining.DataKeys[e.Row.RowIndex].Values["ParentGroupID"]);
					string trnVar = "12," + TrainItemID.ToString() + ",0," + TrainParentGroupID.ToString() + ",0";
					e.Row.Attributes.Add("ondblclick", "openRecordWindow(" + trnVar + ");");
				}

				if (gv.ID == "gvOtherUserAI")
				{
					Image imgTypeIcon = (Image)e.Row.Cells[0].FindControl("imgTypeIcon");
					int ControlType = Convert.ToInt32(gvOtherUserAI.DataKeys[e.Row.RowIndex].Values["ControlType"]);
					if (ControlType == 1)
					{
						imgTypeIcon.ImageUrl = "~/images/user.png";
					}
				}

				if (gv.ID == "gvAdded")
				{
					Image imgAddedIcon = (Image)e.Row.Cells[0].FindControl("imgAddedIcon");
					int ControlType = Convert.ToInt32(gvAdded.DataKeys[e.Row.RowIndex].Values["ControlType"]);
					e.Row.Cells[2].Text = "Entity";
					if (ControlType == 1)
					{
						imgAddedIcon.ImageUrl = "~/images/user.png";
						e.Row.Cells[2].Text = "User";
					}
				}
			}
		}

		protected void GV_SelectedIndexChanged(object sender, EventArgs e)
		{
			GridView gv = (GridView)sender;
			if (gv.ID == "gvAdded")
			{
				mpeOtherUserAI.Show();
			}
			if (gv.ID == "gvMembers")
			{
				mpeAddMemberShips.Show();
			}
		}

		#endregion
	}
}