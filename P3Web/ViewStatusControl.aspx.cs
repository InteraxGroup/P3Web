using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Text;
using System.Web.Security;
using System.Threading.Tasks;
using System.Configuration;

namespace Paradigm3
{
    public partial class ViewStatusControl : SqlViewStatePage
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
                else
				{
                    int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    int StatusFrom = Convert.ToInt32(Request.QueryString["StatusFrom"]);
                    int StatusTo = Convert.ToInt32(Request.QueryString["StatusTo"]);
                    ViewState["dtDoc"] = null;
                    await LoadDocumentInfo(ItemID, StatusFrom, StatusTo);
                }                
            }            
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewStatusControl.aspx";
        }

        protected async Task LoadDocumentInfo(int ItemID, int StatusFrom, int StatusTo)
        {
            LockFields(true, StatusTo);

            // Retrieve Document Data and Populate Fields            
            DataTable dtDoc = await Document.Get_DocumentAsync(ItemID, true, StatusFrom);
            ViewState["dtDoc"] = dtDoc;
            string DocName = dtDoc.Rows[0]["Name"].ToString();
            string CurrentVersion = dtDoc.Rows[0]["Version"].ToString();
            int index = rblRevisionType.SelectedIndex;
            FillNewVersion(CurrentVersion, index);
            lblDocName.Text = DocName;
            txtCurrVersion.Text = CurrentVersion;
            txtEffectiveDate.Text = DateTime.Today.ToString("MM/dd/yyyy");
            dtDoc.Dispose();
        }

        protected void LockFields(bool IsLocked, int StatusTo)
        {
            if (IsLocked == true && StatusTo == 9)
            {
                // Lock fields.
                txtCurrVersion.ReadOnly = true;
                txtCurrVersion.Style.Add("background-color", "#F0F0F0");
                txtNewVersion.ReadOnly = true;
                txtNewVersion.Style.Add("background-color", "#F0F0F0");
                txtEffectiveDate.ReadOnly = true;
                txtEffectiveDate.Style.Add("background-color", "#F0F0F0");
                ceEffectiveDate.Enabled = false;
            }
            else if (IsLocked == true && StatusTo == 7)
            {
                txtCurrVersion.ReadOnly = true;
                txtCurrVersion.Style.Add("background-color", "#F0F0F0");
                txtNewVersion.ReadOnly = true;
                txtNewVersion.Style.Add("background-color", "#F0F0F0");
                txtEffectiveDate.ReadOnly = false;
                txtEffectiveDate.Style.Add("background-color", "none");
                ceEffectiveDate.Enabled = true;
            }
            else if (IsLocked == false && StatusTo == 9)
            {
                txtCurrVersion.ReadOnly = false;
                txtCurrVersion.Style.Add("background-color", "none");
                txtNewVersion.ReadOnly = false;
                txtNewVersion.Style.Add("background-color", "none");
                txtEffectiveDate.ReadOnly = true;
                txtEffectiveDate.Style.Add("background-color", "#F0F0F0");
                ceEffectiveDate.Enabled = false;
            }
            else if (IsLocked = false && StatusTo == 7)
            {
                txtCurrVersion.ReadOnly = false;
                txtCurrVersion.Style.Add("background-color", "none");
                txtNewVersion.ReadOnly = false;
                txtNewVersion.Style.Add("background-color", "none");
                txtEffectiveDate.ReadOnly = false;
                txtEffectiveDate.Style.Add("background-color", "none");
                ceEffectiveDate.Enabled = true;
            }
        }

        protected void FillNewVersion(string CurrentVersion, int index)
        {
            string[] arrVer = CurrentVersion.Split('.');
            string nv = string.Empty;
            var str0 = CurrentVersion.Split('.')[0];
            var str1 = "0";
            var str2 = "0";
            int i = 0;
            switch (index)
            {
                case 0:
                    str0 = CurrentVersion.Split('.')[0];
                    i = Convert.ToInt32(str0) + 1;
                    nv = i.ToString() + ".0";
                    break;
                case 1:
                    if (arrVer.Length == 2)
                    {
                        str1 = CurrentVersion.Split('.')[1];                        
                    }
                    i = Convert.ToInt32(str1) + 1;
                    nv = str0.ToString() + "." + i.ToString();
                    break;
                case 2:
                    if (arrVer.Length == 3)
                    {
                        str2 = CurrentVersion.Split('.')[2];
                    } 
                    i = Convert.ToInt32(str2) + 1;
                    nv = str0.ToString() + "." + str1.ToString() + "." + i.ToString();
                    break;
            }            
            txtNewVersion.Text = nv;
        }

        protected void rblRevisionMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            int StatusTo = Convert.ToInt32(Request.QueryString["StatusTo"]);
            int index = rblRevisionMethod.SelectedIndex;
            
            switch (index)
            {
                case 0:
                    LockFields(true, StatusTo);                                        
                    break;
                case 1:
                    LockFields(false, StatusTo);
                    break;
                case 2:
                    LockFields(true, StatusTo);
                    txtNewVersion.Text = txtCurrVersion.Text;
                    break;
            }
        }

        protected void rblRevisionType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = rblRevisionType.SelectedIndex;
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            DataTable dt = (DataTable)ViewState["dtDoc"];//Document.Get_Document(ItemID, 0);
            string CurrentVersion = dt.Rows[0]["Version"].ToString();
            FillNewVersion(CurrentVersion, index);
        }

        protected async void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get Variables            
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            DataTable dtLatest = Document.Get_Latest(OrigID);
            int LatestItemID = Convert.ToInt32(dtLatest.Rows[0]["ItemID"]);
            int StatusFrom = Convert.ToInt32(Request.QueryString["StatusFrom"]);
            int StatusTo = Convert.ToInt32(Request.QueryString["StatusTo"]);
            DateTime EffectiveDate = DateTime.Now;
            if (StatusTo == 7)
            {
                EffectiveDate = Convert.ToDateTime(txtEffectiveDate.Text);
            }
            DataTable dtDoc = (DataTable)ViewState["dtDoc"];//Document.Get_Document(ItemID, 0);
            int ParentGroupID = Convert.ToInt32(dtDoc.Rows[0]["ParentGroupID"]);
            string NewVersion = txtNewVersion.Text;
            string ItemName = dtDoc.Rows[0]["Name"].ToString();
            string LabelName = dtDoc.Rows[0]["LabelName"].ToString();
            string NewStatus = "CURRENT";
            if (StatusTo == 7)
            {
                NewStatus = "PENDING";
            }
            string TaskName = string.Empty;
            string OldStatus = string.Empty;
            switch (StatusFrom)
            {
                case 0:
                    OldStatus = "OBSOLETE";
                    break;
                case 2:
                    OldStatus = "DRAFT";
                    break;
                case 3:
                    OldStatus = "COLLABORATE";
                    break;
                case 5:
                    OldStatus = "REVIEW";
                    break;
                case 6:
                    OldStatus = "READY";
                    break;
                case 7:
                    OldStatus = "PENDING";
                    break;
                case 9:
                    OldStatus = "CURRENT";
                    break;

            }
            OldStatus = OldStatus + " (" + txtCurrVersion.Text + ")";
            string HistoryDetails = txtHistory.Text;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                string UserFullName = UserValues[1];

				List<int> EventIndexes = new List<int>();

				if (StatusTo == 9)
				{
					//EventIndexes.Add(19);
					int RevType = Convert.ToInt32(rblRevisionType.SelectedValue);
					switch (RevType)
					{
						case 0:
							EventIndexes.Add(19);
							EventIndexes.Add(24);
							break;
						case 1:
							EventIndexes.Add(19);
							EventIndexes.Add(25);
							break;
						case 2:
							EventIndexes.Add(19);
							EventIndexes.Add(27);
							break;
					}
					int RevLevel = Convert.ToInt32(rblRevisionType.SelectedValue);
					string TaskName0 = "Converted from CURRENT (" + txtCurrVersion.Text + "). Converted to OBSOLETE (" + txtCurrVersion.Text + ").";
					await Document.Edit_Document_HistoryAsync(3, OrigID, ItemName, LabelName, TaskName0, UserFullName, string.Empty);
				}
				else
				{
					EventIndexes.Add(21);
				}

				Status.Convert_Status(3, ItemID, OrigID, NewVersion, StatusFrom, StatusTo, EffectiveDate, UserID, UserFullName);
				TaskName = "Converted from " + OldStatus + ". Converted to " + NewStatus + " (" + NewVersion + ").";
				await Document.Edit_Document_HistoryAsync(3, OrigID, ItemName, LabelName, TaskName, UserFullName, HistoryDetails);

				// Trigger Event if there is one set.
				try
				{
					for (int i = 0; i < EventIndexes.Count; i++)
					{
						TriggerEvent(EventIndexes[i], ParentGroupID, OrigID, LatestItemID, ItemName, LabelName, HistoryDetails, StatusFrom, StatusTo);
					}

                    if(chkbxReTraining.Checked == true)
                    {
                        DataTable dt = await Status.Get_TrainingItemsAsync(ItemID, 3);
                        if (dt.Rows.Count > 1)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++) {
                                int TrainingRecordOrigID = Convert.ToInt32(dt.Rows[0]["ItemOrigid"]);
                                int TrainingRecordItemID = Convert.ToInt32(dt.Rows[0]["ItemID"]);
                                Status.Update_LinkedDocument(ItemID, OrigID, UserID, UserFullName);
                                Status.Open_TrainingRecord(ItemID, OrigID, UserID, TrainingRecordOrigID, TrainingRecordItemID);
                            }
                        }
                    }
                    Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, 'Status successfully updated!', false)", true);
                }
				catch (Exception ex)
				{
					Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, " + ex.Message + ", true)", true);
					throw ex;
				}
			}
			else
			{
				ClientScript.RegisterStartupScript(GetType(), "AIAbort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
			}           
        }

        protected void TriggerEvent(int EventIndexID, int ParentGroupID, int OrigID, int LatestItemID, string ItemName, string LabelName, string HistoryDetails, int StatusFrom, int StatusTo)
        {
            // Trigger Event if there is one set.
            DataTable dt = new DataTable();
            //int ParentGroupID = Convert.ToInt32(dtDoc.Rows[0]["ParentGroupID"]);
            int ModuleID = Convert.ToInt32(Session["ModuleID"]);
            if (Document.Has_Trigger_Event(EventIndexID, OrigID, ModuleID).Rows.Count > 0)
            {
                dt = Document.Has_Trigger_Event(EventIndexID, OrigID, ModuleID);
            }
            else
            {
                dt = Document.Has_Trigger_Event(EventIndexID, ParentGroupID, ModuleID);
            }

            if (dt.Rows.Count > 0)
            {
                // Create recipients table
                DataTable dtRecip = new DataTable();
                dtRecip.Columns.Add("ControlID", typeof(int));
                dtRecip.Columns.Add("ControlFullName", typeof(string));

                // Trigger all events related to the task
                foreach (DataRow row in dt.Rows)
				{
                    int EventID = Convert.ToInt32(row["EventID"]);
                    string EventTitle = row["Name"].ToString();
                    string Details = row["Details"].ToString();
                    int RelatedType = Convert.ToInt32(row["RelatedType"]);
                    int RecpientID = 0;
                    string RecipientName = string.Empty;
                    DataTable dtDist = Document.Get_EventAssigned(EventID);
                    if (dtDist.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dtDist.Rows)
                        {
                            int ControlType = Convert.ToInt32(dr["ControlType"]);
                            switch (ControlType)
                            {
                                case 1:
                                    RecpientID = Convert.ToInt32(dr["ControlID"]);
                                    RecipientName = dr["ControlFullName"].ToString();
                                    DataRow drRecip = dtRecip.NewRow();
                                    drRecip["ControlID"] = RecpientID;
                                    drRecip["ControlFullName"] = RecipientName;
                                    dtRecip.Rows.Add(drRecip);
                                    break;
                                case 5:
                                    int CatID = Convert.ToInt32(dr["ControlID"]);
                                    DataTable dtRole = Document.Get_RoleMember(CatID, OrigID);
                                    foreach (DataRow drRole in dtRole.Rows)
                                    {
                                        if (Convert.ToInt32(drRole["ControlType"]) == 6)
                                        {
                                            int PTID = Convert.ToInt32(drRole["ControlID"]);
                                            DataTable dtPT = Document.Get_PTtitleMember(PTID);
                                            foreach (DataRow drPT in dtPT.Rows)
                                            {
                                                RecpientID = Convert.ToInt32(drPT["ControlID"]);
                                                RecipientName = drPT["ControlFullName"].ToString();
                                                DataRow drRecip_1 = dtRecip.NewRow();
                                                drRecip_1["ControlID"] = RecpientID;
                                                drRecip_1["ControlFullName"] = RecipientName;
                                                dtRecip.Rows.Add(drRecip_1);
                                                dtRecip.AcceptChanges();
                                            }
                                            dtPT.Dispose();
                                        }
                                        else
                                        {
                                            RecpientID = Convert.ToInt32(drRole["ControlID"]);
                                            RecipientName = drRole["ControlFullName"].ToString();
                                            DataRow drRecip_2 = dtRecip.NewRow();
                                            drRecip_2["ControlID"] = RecpientID;
                                            drRecip_2["ControlFullName"] = RecipientName;
                                            dtRecip.Rows.Add(drRecip_2);
                                            dtRecip.AcceptChanges();
                                        }
                                    }
                                    dtRole.Dispose();
                                    break;
                                case 6:
                                    int PTitleID = Convert.ToInt32(dr["ControlID"]);
                                    DataTable dtPTitle = Document.Get_PTtitleMember(PTitleID);
                                    foreach (DataRow drPTitle in dtPTitle.Rows)
                                    {
                                        RecpientID = Convert.ToInt32(drPTitle["ControlID"]);
                                        RecipientName = drPTitle["ControlFullName"].ToString();
                                        DataRow drRecip_3 = dtRecip.NewRow();
                                        drRecip_3["ControlID"] = RecpientID;
                                        drRecip_3["ControlFullName"] = RecipientName;
                                        dtRecip.Rows.Add(drRecip_3);
                                        dtRecip.AcceptChanges();
                                    }
                                    dtPTitle.Dispose();
                                    break;
                            }
                        }
                    }
                    DataTable DistRecip = dtRecip.DefaultView.ToTable(true);
                    foreach (DataRow user in DistRecip.Rows)
                    {
                        RecpientID = Convert.ToInt32(user["ControlID"]);
                        RecipientName = user["ControlFullName"].ToString();
                        Document.Trigger_Event(EventID, EventTitle, 3, LatestItemID, ParentGroupID, ItemName, LabelName, Details, HistoryDetails, RecpientID, RecipientName, StatusFrom, StatusTo);
                    }
                    dtRecip.Dispose();
                    dtDist.Dispose();
                }
            }
        }
    }
}