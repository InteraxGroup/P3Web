using System;
using System.Collections.Generic;
using System.Linq;
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

namespace Paradigm3
{
    public partial class ViewStatus : SqlViewStatePage
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
                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                int UserID = 0;
                DataTable dt = await Status.GetCurrentVersionStatusAsync(ModuleID, OrigID);
                string CurrentStatus = dt.Rows[0]["Status"].ToString();
                ViewState["ItemData"] = dt;
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    // Get user status information from authentication cookie.
                    string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    UserID = Convert.ToInt32(UserValues[0]);
                }
                //await Get_StatusOptions(CurrentStatus);
                await Get_VersionOptionsAsync(ModuleID, OrigID, UserID, CurrentStatus);
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewStatus.aspx";
        }

        protected async Task Get_StatusOptions(string CurrentStatus)
        {
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            bool IsSimpleControl = await Status.GetControlOptionAsync(ModuleID, OrigID);
            rbStatus.Items.Clear();
            DataTable dt = (DataTable)ViewState["ItemData"];
            if (dt.Rows.Count > 0)
			{
                string CurrentVersion = dt.Rows[0]["Version"].ToString();
                string VersionLabel = string.Empty;
                switch (CurrentStatus)
                {
                    case "0": // Obsolete
                        if (ModuleID == 3)
                        {
                            if (IsSimpleControl)
                            {
                                VersionLabel = "COMPLETE (" + CurrentVersion + ")";
                                lblVersion.ForeColor = System.Drawing.Color.Black;
                                rbStatus.Items.Add(new ListItem("Create OPEN Item from COMPLETE", "2"));
                            }
                            else
                            {
                                VersionLabel = "OBSOLETE (" + CurrentVersion + ")";
                                lblVersion.ForeColor = System.Drawing.Color.DarkGray;
                            }
                        }
                        else
                        {
                            VersionLabel = "COMPLETE (" + CurrentVersion + ")";
                            lblVersion.ForeColor = System.Drawing.Color.Black;
                            rbStatus.Items.Add(new ListItem("Create OPEN Item from COMPLETE", "2"));
                        }
                        break;
                    case "2": // Draft/Open
                        if (ModuleID == 3)
                        {
                            if (IsSimpleControl)
                            {
                                VersionLabel = "OPEN (" + CurrentVersion + ")";
                                lblVersion.ForeColor = System.Drawing.Color.Red;
                                rbStatus.Items.Add(new ListItem("COMPLETE item from OPEN", "0"));
                            }
                            else
                            {
                                VersionLabel = "DRAFT (" + CurrentVersion + ")";
                                lblVersion.ForeColor = System.Drawing.Color.Red;
                                rbStatus.Items.Add(new ListItem("Convert to CURRENT from DRAFT", "9"));
                                rbStatus.Items.Add(new ListItem("Convert to REVIEW from DRAFT", "5"));
                                rbStatus.Items.Add(new ListItem("Convert to READY from DRAFT", "6"));
                                rbStatus.Items.Add(new ListItem("Convert to COLLABORATE from DRAFT", "3"));
                                rbStatus.Items.Add(new ListItem("Convert to PENDING from DRAFT", "7"));
                            }
                        }
                        else
                        {
                            VersionLabel = "OPEN (" + CurrentVersion + ")";
                            lblVersion.ForeColor = System.Drawing.Color.Red;
                            rbStatus.Items.Add(new ListItem("COMPLETE item from OPEN", "0"));
                        }
                        break;
                    case "3": // Collaborate
                        VersionLabel = "COLLABORATE (" + CurrentVersion + ")";
                        lblVersion.ForeColor = System.Drawing.Color.DarkRed;
                        rbStatus.Items.Add(new ListItem("Convert to DRAFT from COLLABORATE", "2"));
                        rbStatus.Items.Add(new ListItem("Convert to CURRENT from COLLABORATE", "9"));
                        rbStatus.Items.Add(new ListItem("Convert to REVIEW from COLLABORATE", "5"));
                        rbStatus.Items.Add(new ListItem("Convert to READY from COLLABORATE", "6"));
                        rbStatus.Items.Add(new ListItem("Convert to PENDING from COLLABORATE", "7"));
                        break;
                    case "5": // Review
                        VersionLabel = "REVIEW (" + CurrentVersion + ")";
                        lblVersion.ForeColor = System.Drawing.Color.Blue;
                        rbStatus.Items.Add(new ListItem("Convert to CURRENT from REVIEW", "9"));
                        rbStatus.Items.Add(new ListItem("Convert to READY from REVIEW", "6"));
                        rbStatus.Items.Add(new ListItem("Convert to PENDING from REVIEW", "7"));
                        rbStatus.Items.Add(new ListItem("Convert to DRAFT from REVIEW", "2"));
                        rbStatus.Items.Add(new ListItem("Convert to COLLABORATE from REVIEW", "3"));
                        break;
                    case "6": // Ready
                        VersionLabel = "READY (" + CurrentVersion + ")";
                        lblVersion.ForeColor = System.Drawing.Color.DarkViolet;
                        rbStatus.Items.Add(new ListItem("Convert to CURRENT from READY", "9"));
                        rbStatus.Items.Add(new ListItem("Convert to PENDING from READY", "7"));
                        rbStatus.Items.Add(new ListItem("Convert to REVIEW from READY", "5"));
                        rbStatus.Items.Add(new ListItem("Convert to DRAFT from READY", "2"));
                        rbStatus.Items.Add(new ListItem("Convert to COLLABORATE from READY", "3"));
                        break;
                    case "7": // Pending
                        VersionLabel = "PENDING (" + CurrentVersion + ")";
                        lblVersion.ForeColor = System.Drawing.Color.DarkGoldenrod;
                        rbStatus.Items.Add(new ListItem("Convert to CURRENT from PENDING", "9"));
                        rbStatus.Items.Add(new ListItem("Create DRAFT from PENDING", "2"));
                        break;
                    case "9": // Current
                        VersionLabel = "CURRENT (" + CurrentVersion + ")";
                        lblVersion.ForeColor = System.Drawing.Color.Black;
                        rbStatus.Items.Add(new ListItem("Create DRAFT from CURRENT", "2"));
                        break;
                }
                rbStatus.SelectedIndex = 0;
                lblVersion.Text = VersionLabel;
            }            
        }

        protected async Task Get_VersionOptionsAsync(int ModuleID, int OrigID, int UserID, string CurrentStatus)
		{
            DataTable dt = (DataTable)ViewState["ItemData"];
            string RestrictedCanEdit = WebConfigurationManager.AppSettings["RestrictedUser"];
            int CanEdit = 0;
            if (RestrictedCanEdit == "Edit")
			{
                CanEdit = 1;
			}
            DataTable dtStatusOptions = await Status.GetStatusOptionsAsync(ModuleID, OrigID, UserID, CanEdit);
            bool IsSimpleControl = await Status.GetControlOptionAsync(ModuleID, OrigID);
            rbStatus.Items.Clear();
            string CurrentVersion = dt.Rows[0]["Version"].ToString();
            string VersionLabel = string.Empty;
            switch (CurrentStatus)
            {
                case "0": // Obsolete
                    if (ModuleID == 3)
                    {
                        if (IsSimpleControl)
                        {
                            VersionLabel = "COMPLETE (" + CurrentVersion + ")";
                            lblVersion.ForeColor = System.Drawing.Color.Black;
                            foreach (DataRow dr in dtStatusOptions.Rows)
                            {
                                if (dr["LevelID"].Equals(3104))
                                {
                                    rbStatus.Items.Add(new ListItem("Create OPEN Item from COMPLETE", "2"));
                                }
                            }
                        }
                        else
                        {
                            VersionLabel = "OBSOLETE (" + CurrentVersion + ")";
                            lblVersion.ForeColor = System.Drawing.Color.DarkGray;
                        }
                    }
                    else
                    {
                        VersionLabel = "COMPLETE (" + CurrentVersion + ")";
                        lblVersion.ForeColor = System.Drawing.Color.Black;
                        foreach (DataRow dr in dtStatusOptions.Rows)
						{
                            if (dr["LevelID"].Equals(3104))
							{
                                rbStatus.Items.Add(new ListItem("Create OPEN Item from COMPLETE", "2"));
                            }
						}                        
                    }
                    break;
                case "2": // Draft/Open
                    if (ModuleID == 3)
                    {
                        if (IsSimpleControl)
                        {
                            VersionLabel = "OPEN (" + CurrentVersion + ")";
                            lblVersion.ForeColor = System.Drawing.Color.Red;
                            foreach (DataRow dr in dtStatusOptions.Rows)
							{
                                if (dr["LevelID"].Equals(3105))
								{
                                    rbStatus.Items.Add(new ListItem("COMPLETE item from OPEN", "0"));
                                }
							}                            
                        }
                        else
                        {
                            VersionLabel = "DRAFT (" + CurrentVersion + ")";
                            lblVersion.ForeColor = System.Drawing.Color.Red;
                            foreach (DataRow dr in dtStatusOptions.Rows)
							{
                                if (dr["LevelID"].Equals(3105))
								{
                                    rbStatus.Items.Add(new ListItem("Convert to CURRENT from DRAFT", "9"));
                                }
                                if (dr["LevelID"].Equals(3103))
								{
                                    rbStatus.Items.Add(new ListItem("Convert to REVIEW from DRAFT", "5"));
                                }
                                if (dr["LevelID"].Equals(3106))
								{
                                    rbStatus.Items.Add(new ListItem("Convert to READY from DRAFT", "6"));
                                }
                                if (dr["LevelID"].Equals(3108))
								{
                                    rbStatus.Items.Add(new ListItem("Convert to COLLABORATE from DRAFT", "3"));
                                }
                                if (dr["LevelID"].Equals(3107))
								{
                                    rbStatus.Items.Add(new ListItem("Convert to PENDING from DRAFT", "7"));
                                }
							} 
                        }
                    }
                    else
                    {
                        VersionLabel = "OPEN (" + CurrentVersion + ")";
                        lblVersion.ForeColor = System.Drawing.Color.Red;
                        rbStatus.Items.Add(new ListItem("COMPLETE item from OPEN", "0"));
                    }
                    break;
                case "3": // Collaborate
                    VersionLabel = "COLLABORATE (" + CurrentVersion + ")";
                    lblVersion.ForeColor = System.Drawing.Color.DarkRed;
                    foreach (DataRow dr in dtStatusOptions.Rows)
					{
                        if (dr["LevelID"].Equals(3104))
						{
                            rbStatus.Items.Add(new ListItem("Convert to DRAFT from COLLABORATE", "2"));
                        }
                        if (dr["LevelID"].Equals(3105))
						{
                            rbStatus.Items.Add(new ListItem("Convert to CURRENT from COLLABORATE", "9"));
                        }
                        if (dr["LevelID"].Equals(3103))
						{
                            rbStatus.Items.Add(new ListItem("Convert to REVIEW from COLLABORATE", "5"));
                        }
                        if (dr["LevelID"].Equals(3106))
						{
                            rbStatus.Items.Add(new ListItem("Convert to READY from COLLABORATE", "6"));
                        }
                        if (dr["LevelID"].Equals(3107))
						{
                            rbStatus.Items.Add(new ListItem("Convert to PENDING from COLLABORATE", "7"));
                        }
					}
                    break;
                case "5": // Review
                    VersionLabel = "REVIEW (" + CurrentVersion + ")";
                    lblVersion.ForeColor = System.Drawing.Color.Blue;
                    foreach (DataRow dr in dtStatusOptions.Rows)
                    {
                        if (dr["LevelID"].Equals(3104))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to DRAFT from REVIEW", "2"));
                        }
                        if (dr["LevelID"].Equals(3105))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to CURRENT from REVIEW", "9"));
                        }
                        if (dr["LevelID"].Equals(3108))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to COLLABORATE from REVIEW", "7"));
                        }
                        if (dr["LevelID"].Equals(3106))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to READY from REVIEW", "6"));
                        }
                        if (dr["LevelID"].Equals(3107))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to PENDING from REVIEW", "7"));
                        }
                    }
                    break;
                case "6": // Ready
                    VersionLabel = "READY (" + CurrentVersion + ")";
                    lblVersion.ForeColor = System.Drawing.Color.DarkViolet;
                    foreach (DataRow dr in dtStatusOptions.Rows)
                    {
                        if (dr["LevelID"].Equals(3104))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to DRAFT from READY", "2"));
                        }
                        if (dr["LevelID"].Equals(3105))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to CURRENT from READY", "9"));
                        }
                        if (dr["LevelID"].Equals(3108))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to COLLABORATE from READY", "3"));
                        }
                        if (dr["LevelID"].Equals(3103))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to REVIEW from READY", "5"));
                        }
                        if (dr["LevelID"].Equals(3107))
                        {
                            rbStatus.Items.Add(new ListItem("Convert to PENDING from READY", "7"));
                        }
                    }
                    break;
                case "7": // Pending
                    VersionLabel = "PENDING (" + CurrentVersion + ")";
                    lblVersion.ForeColor = System.Drawing.Color.DarkGoldenrod;
                    foreach (DataRow dr in dtStatusOptions.Rows)
					{
                        if (dr["LevelID"].Equals(3105))
						{
                            rbStatus.Items.Add(new ListItem("Convert to CURRENT from PENDING", "9"));
                        }
                        if (dr["LevelID"].Equals(3104))
						{
                            rbStatus.Items.Add(new ListItem("Create DRAFT from PENDING", "2"));
                        }
					}
                    break;
                case "9": // Current
                    VersionLabel = "CURRENT (" + CurrentVersion + ")";
                    lblVersion.ForeColor = System.Drawing.Color.Black;
                    foreach (DataRow dr in dtStatusOptions.Rows)
					{
                        if (dr["LevelID"].Equals(3104))
						{
                            rbStatus.Items.Add(new ListItem("Create DRAFT from CURRENT", "2"));
                        }
					}                    
                    break;
            }
            rbStatus.SelectedIndex = 0;
            lblVersion.Text = VersionLabel;
        }

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            int StatusSet = Convert.ToInt32(rbStatus.SelectedValue);
            switch (arg)
            {
                case "Submit":
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int UserID = Convert.ToInt32(UserValues[0]);
                        string UserFullName = UserValues[1];

						int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
						int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
						int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
						int CurrentStatus = Convert.ToInt32(Status.GetCurrentStatus(ModuleID, OrigID));
						bool IsSimpleStatus = await Status.GetControlOptionAsync(ModuleID, OrigID);
						DataTable dt = Status.GetCurrentVersionStatus(ModuleID, OrigID);
						string CurrentVersion = dt.Rows[0]["Version"].ToString();
						int CurrentVersionItemID = Convert.ToInt32(dt.Rows[0]["ItemID"]);
						int StatusTo = Convert.ToInt32(rbStatus.SelectedValue);
						DateTime EffectiveDate = DateTime.Now;
						DataTable dtDoc = new DataTable();
						if (ModuleID == 3)
						{
							dtDoc = await Document.Get_DocumentAsync(OrigID, false, CurrentStatus);
						}
						else
						{
							dtDoc = Record.GetRecord(ModuleID, ItemID, 0).Tables[0];
						}
						int ParentGroupID = Convert.ToInt32(dtDoc.Rows[0]["ParentGroupID"]);
						string ItemName = dtDoc.Rows[0]["Name"].ToString();
						string LabelName = dtDoc.Rows[0]["LabelName"].ToString();
						string TaskName = string.Empty;
						if (ModuleID == 3)
						{
							if (StatusTo == 9 || StatusTo == 7)
							{
								Response.Redirect("~/ViewStatusControl.aspx?ItemID=" + ItemID + "&OrigID=" + OrigID + "&StatusFrom=" + CurrentStatus + "&StatusTo=" + StatusTo, false);
							}
							else if (StatusTo == 2)
							{
								if (CurrentStatus == 9 || CurrentStatus == 7)
								{
									// Create new DRAFT version history
									if (IsSimpleStatus)
									{
										TaskName = "Converted from " + lblVersion.Text + ". Converted to OPEN (" + CurrentVersion + ").";
									}
									else
									{
										TaskName = "Converted from " + lblVersion.Text + ". Converted to DRAFT (" + CurrentVersion + ").";
									}

									try
									{
										// Update Document Status to DRAFT in DB
										Status.Convert_Status(ModuleID, ItemID, OrigID, CurrentVersion, CurrentStatus, StatusTo, EffectiveDate, UserID, UserFullName);
										try
										{
											// Create physical DRAFT file
											CreateDraftFile(ItemID, OrigID);
										}
										catch (IOException ix)
										{
											Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, '" + ix.Message + "', true)", true);
										}
										Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, 'Status successfully updated!', false);docRefresh();", true);
									}
									catch (Exception ex)
									{
										Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, '" + ex.Message + "', true)", true);
									}
								}
								else
								{
									if (IsSimpleStatus)
									{
										TaskName = "Converted to OPEN (" + CurrentVersion + "). Converted from " + lblVersion.Text + ".";
									}
									else
									{
										TaskName = "Converted to DRAFT (" + CurrentVersion + "). Converted from " + lblVersion.Text + ".";
									}

									try
									{
										// Update Document Status
										Status.Convert_Status(ModuleID, ItemID, OrigID, CurrentVersion, CurrentStatus, StatusTo, EffectiveDate, UserID, UserFullName);
										Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, 'Status successfully updated!', false);docRefresh();", true);
									}
									catch (Exception ex)
									{
										Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, '" + ex.Message + "', true)", true);
									}
								}

								try
								{
									// Trigger Event
									TriggerEvent(ItemID, OrigID, ParentGroupID, ItemName, LabelName, CurrentStatus, StatusTo);

									// Update Document History
									await Document.Edit_Document_HistoryAsync(ModuleID, OrigID, ItemName, LabelName, TaskName, UserFullName, string.Empty);

									// Confirm and close
									//lblStatusMessage.Text = "Status successfully updated!";
									Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, 'Status successfully updated!', false);docRefresh();", true);
								}
								catch (Exception ex)
								{
									Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, '" + ex.Message + "', true)", true);
								}

							}
							else
							{
								try
								{
									// Update Document Status
									Status.Convert_Status(ModuleID, ItemID, OrigID, CurrentVersion, CurrentStatus, StatusTo, EffectiveDate, UserID, UserFullName);

									// Trigger Event
									TriggerEvent(CurrentVersionItemID, OrigID, ParentGroupID, ItemName, LabelName, CurrentStatus, StatusTo);

									// Update Document History
									string NewStatus = string.Empty;
									switch (StatusTo)
									{
										case 0:
											if (IsSimpleStatus)
											{
												NewStatus = "COMPLETE";
											}
											else
											{
												NewStatus = "OBSOLETE";
											}
											break;
										case 3:
											NewStatus = "COLLABORATE";
											break;
										case 5:
											NewStatus = "REVIEW";
											break;
										case 6:
											NewStatus = "READY";
											break;
									}
									TaskName = "Converted from " + lblVersion.Text + ". Converted to " + NewStatus + " (" + CurrentVersion + ").";
									await Document.Edit_Document_HistoryAsync(ModuleID, OrigID, ItemName, LabelName, TaskName, UserFullName, string.Empty);
									Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(" + ModuleID.ToString() + ", 'Status successfully updated!', false)", true);
								}
								catch (Exception ex)
								{
									Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(" + ModuleID.ToString() + ", '" + ex.Message + "', true)", true);
								}
							}
						}
						else
						{
							try
							{
								// Update record Status
								Status.Convert_Status(ModuleID, ItemID, OrigID, CurrentVersion, CurrentStatus, StatusTo, EffectiveDate, UserID, UserFullName);

								// Update Record History
								string NewStatus = string.Empty;
								switch (StatusTo)
								{
									case 0:
										NewStatus = "COMPLETE";
										break;
									case 2:
										NewStatus = "OPEN";
										break;
								}
								TaskName = "Converted From " + lblVersion.Text + ". Converted To " + NewStatus + " (" + CurrentVersion + ").";
								Record.Edit_History(ModuleID, OrigID, LabelName, TaskName, UserFullName);
								Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(" + ModuleID.ToString() + ", 'Status successfully updated!', false);", true);
							}
							catch (Exception ex)
							{
								Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(" + ModuleID.ToString() + ", '" + ex.Message + "', true)", true);
							}
						}
					}
                    else
					{
						ClientScript.RegisterStartupScript(GetType(), "AIAbort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
					}                    
                    break;
                case "Cancel":
                    Page.ClientScript.RegisterStartupScript(GetType(), "closeStatus", "closeP3Window();", true);
                    break;
            }
        }

        protected void CreateDraftFile(int SourceID, int OrigID)
        {
            string DocPath = WebConfigurationManager.AppSettings["DocumentPath"];
            DocPath = @"" + DocPath.Replace(@"\\", @"\");
            DataTable dtDraft = Document.Get_EditVersion(OrigID, 2);
            int ItemID = 0;
            if (dtDraft.Rows.Count > 0)
            {
                // Get file extension.
                string FileExtension = dtDraft.Rows[0]["FileExtension"].ToString();

                // Get source file name
                string SourceFileName = SourceID.ToString().PadLeft(7, '0');
                SourceFileName = SourceFileName.PadLeft(8, 'D');
                SourceFileName = SourceFileName + "." + FileExtension;

                // Create Draft file name
                ItemID = Convert.ToInt32(dtDraft.Rows[0]["ItemID"]);
                string NewFileName = ItemID.ToString().PadLeft(7, '0');
                NewFileName = NewFileName.PadLeft(8, 'D');
                NewFileName = NewFileName + "." + FileExtension;

                // Build source and destination path strings
                string SourcePath = Path.Combine(DocPath, SourceFileName);
                string DestPath = Path.Combine(DocPath, NewFileName);
                //Page.ClientScript.RegisterStartupScript(GetType(), "returnPath", "alert('" + SourcePath + " -- " + DestPath + "');", true);

                // Copy physical source file to destination
                if (File.Exists(SourcePath))
                {
                    File.Copy(SourcePath, DestPath, true);

                    if (!File.Exists(DestPath))
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, 'Could not create file at location, @" + DestPath + "', true)", true);
                        // code to delete new row from DB
                        Document.Remove_DraftRow(ItemID);
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, 'Source file not found', true)", true);
                    // code to delete new row from DB
                    Document.Remove_DraftRow(ItemID);
                }
            }
            else
            {
                dtDraft.Dispose();
            }
            
        }

        protected async Task<bool> DraftFileCreate(int OrigID)
        {
            bool result = false;
            return await Task.FromResult(result);
        }

        protected void TriggerEvent(int ItemID, int OrigID, int ParentGroupID, string ItemName, string LabelName, int CurrentStatus, int StatusTo)
        {
            // Trigger Event
            // Get Event Type for status change.
            int EventIndexID = 0;
            switch (StatusTo)
            {
                case 2: // DRAFT
                    if (CurrentStatus == -1)
                    {
                        EventIndexID = 1;
                    }
                    else
                    {
                        EventIndexID = 18;
                    }                    
                    break;
                case 3: // COLLABORATE
                    EventIndexID = 22;
                    break;
                case 5: // REVIEW
                    EventIndexID = 17;
                    break;
                case 6: // READY
                    EventIndexID = 20;
                    break;
            }

            int ModuleID = Convert.ToInt32(Session["ModuleID"]);
            // If a trigger event exists for the status change, trigger it.
            DataTable dtEvent = new DataTable();
            if (Document.Has_Trigger_Event(EventIndexID, OrigID, ModuleID).Rows.Count > 0)
            {
                dtEvent = Document.Has_Trigger_Event(EventIndexID, OrigID, ModuleID);
            }
            else
            {
                dtEvent = Document.Has_Trigger_Event(EventIndexID, ParentGroupID, ModuleID);
            }

            if (dtEvent.Rows.Count > 0)
            {
                // Create Assigned Table and columns
                DataTable dtRecip = new DataTable();
                dtRecip.Columns.Add("ControlID", typeof(int));
                dtRecip.Columns.Add("ControlFullName", typeof(string));

                // Get Variables
                int EventID = Convert.ToInt32(dtEvent.Rows[0]["EventID"]);
                string EventTitle = dtEvent.Rows[0]["Name"].ToString();
                string Details = dtEvent.Rows[0]["Details"].ToString();
                int RelatedType = Convert.ToInt32(dtEvent.Rows[0]["RelatedType"]);
                int RecpientID = 0;
                string RecipientName = string.Empty;

                // Get Assigned Entities from Event
                DataTable dtDist = Document.Get_EventAssigned(EventID);

                try
                {
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
                                    }
                                    dtPTitle.Dispose();
                                    break;
                            }
                        }
                    }
                    DataTable DistRecip = dtRecip.DefaultView.ToTable(true);
                    foreach (DataRow d in DistRecip.Rows)
                    {
                        RecpientID = Convert.ToInt32(d["ControlID"]);
                        RecipientName = d["ControlFullName"].ToString();
                        Document.Trigger_Event(EventID, EventTitle, 3, ItemID, ParentGroupID, ItemName, LabelName, Details, string.Empty, RecpientID, RecipientName, CurrentStatus, StatusTo);
                    }
                    Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(" + Session.Contents["ModuleID"].ToString() + ", 'Status Updated!', false);", true);
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "close", "alert('" + ex.Message + "');", true);
                    throw ex;
                }
            }
        }
    }
}