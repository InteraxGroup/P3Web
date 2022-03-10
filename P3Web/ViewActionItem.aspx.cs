using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paradigm3.datalayer;
using System.Web.Security;
using System.Data;
using System.Threading.Tasks;
using System.Configuration;
using System.Linq;

namespace Paradigm3
{
    public partial class ViewActionItem : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
            if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
            {
                string Message = GetLocalResourceObject("SessionTimeout").ToString();
                ClientScript.RegisterStartupScript(GetType(), "sessiontimeout", "alert('" + Message + "');window.close();", true);
            }

            Session["SourcePage"] = "ViewActionItem.aspx";
            int AIID = Convert.ToInt32(Request.QueryString["AIID"]);
            await Initialize_AI(AIID);
            if (!Page.IsPostBack)
            {
                DataTable dtAI = ActionItem.Get_ActionItem(AIID);
                if (dtAI.Rows.Count > 0)
                {
                    AI_GetResults(Convert.ToInt32(dtAI.Rows[0]["EventID"]));
                }
                else
                {
                    ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "noitem", "alert('There was an error returning the Action Item data.  Please contact an administrator for assistance.')", true);
                }
                dtAI.Dispose();
            }
        }

        #region Initialize Action Item

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewActionItem.aspx";
        }

        protected async Task Initialize_AI(int aiid)
        {
            DataTable dtAI = await ActionItem.Get_ActionItemAsync(aiid);
            ViewState["ActionItem"] = dtAI;
            if (dtAI.Rows.Count > 0)
            {
                int ModuleID = Convert.ToInt32(dtAI.Rows[0]["ShowModuleID"]);
                // If Show Me is enabled, display the Show Me and Go There buttons
                if (dtAI.Rows[0]["ShowMeEnabled"] != DBNull.Value)
                {
                    bool ShowMeEnabled = Convert.ToBoolean(dtAI.Rows[0]["ShowMeEnabled"]);
                    if (ShowMeEnabled)
                    {
                        pnlShowMe.Visible = true;
                        pnlGoThere.Visible = true;
                        int ShowID = Convert.ToInt32(dtAI.Rows[0]["ShowID"]);
                        bool ShowIsItemID = Convert.ToBoolean(dtAI.Rows[0]["ShowIsItemID"]);
                        int ShowGroupID = Convert.ToInt32(dtAI.Rows[0]["ShowGroupID"]);
                        switch (ModuleID)
                        {
                            case 3:
                                string publishPath = ConfigurationManager.AppSettings["PublishPath"];
                                string ShowMeItemProperties = await ActionItem.Get_ShowMeFileExtensionAndPublishTypeAsync(ShowID, ShowIsItemID);
                                string[] SMIP = ShowMeItemProperties.Split(',');
                                if (SMIP.Length > 0)
                                {
                                    string ShowItemID = SMIP[0];
                                    string ShowOrigID = SMIP[1];
                                    string fileExtension = SMIP[2];
                                    string typeOfPublish = SMIP[3];
                                    string fileStatus = SMIP[4];
                                    btnShowMe.Attributes.Add("onclick", "openDocWindow('" + ShowItemID + "','" + ShowOrigID + "','" + fileStatus + "','" + ShowIsItemID.ToString() + "','" + publishPath + "','." + fileExtension + "','" + typeOfPublish + "');");
                                }
                                else
                                {
                                    btnShowMe.Attributes.Add("onclick", "alert('The SHOW ME item is unavailable.');");
                                }
                                break;
                            default:
                                int objTypeID = P3General.Get_ObjTypeID(ModuleID, ShowGroupID);
                                btnShowMe.Attributes.Add("onclick", "openRecordWindow(" + ModuleID.ToString() + "," + ShowID.ToString() + "," + objTypeID.ToString() + "," + ShowGroupID.ToString() + ",0" + ");");
                                break;
                        }
                    }
                }

                // Populate display fields
                lblTitle.Text = dtAI.Rows[0]["Name"].ToString();
                switch (Convert.ToInt32(dtAI.Rows[0]["Priority"]))
                {
                    case 0:
                        lblPriority.Text = "Low";
                        lblPriority.ForeColor = System.Drawing.Color.Blue;
                        break;
                    case 1:
                        lblPriority.Text = "Normal";
                        lblPriority.ForeColor = System.Drawing.Color.Black;
                        break;
                    case 2:
                        lblPriority.Text = "Urgent";
                        lblPriority.ForeColor = System.Drawing.Color.Red;
                        lblPriority.Font.Bold = true;
                        break;
                }

                if (dtAI.Rows[0]["Status"].Equals(2))
                {
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        int authUserID = 0;
                        int userStatus = -1;
                        if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                        {
                            string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                            string UserData = ticket.UserData;
                            string[] UserValues = UserData.Split(',');
                            authUserID = Convert.ToInt32(UserValues[0]);
                            userStatus = Convert.ToInt32(UserValues[3]);
                        }
                        int assUserID = Convert.ToInt32(dtAI.Rows[0]["UserID"]);

                        if (userStatus == 1 || authUserID == assUserID)
                        {
                            bool IsPwdCnf = await ActionItem.Get_PasswordComepleteStatus(Convert.ToInt32(dtAI.Rows[0]["EventID"]));
                            if (IsPwdCnf)
                            {
                                pnlCompletePwd.Visible = true;
                            }
                            else
                            {
                                pnlComplete.Visible = true;
                            }
                        }
                        else
                        {
                            pnlComplete.Visible = false;
                        }
                    }
                    else
                    {
                        pnlComplete.Visible = false;
                    }

                    // Display Due Date...
                    lblDateDue.Text = Convert.ToDateTime(dtAI.Rows[0]["DateDue"]).ToShortDateString();
                    lblStatus.Text = "Open";
                    lblComplete.Text = "Date Due";
                }
                else
                {
                    pnlComplete.Visible = false;

                    // Display Completed Date...
                    if (dtAI.Rows[0]["CompleteDate"] != DBNull.Value)
                    {
                        lblDateDue.Text = Convert.ToDateTime(dtAI.Rows[0]["CompleteDate"]).ToShortDateString();
                    }
                    lblStatus.Text = "Complete";
                    lblComplete.Text = "Completed";
                }

                // Display Sender Name and Sent Date...
                lblSender.Text = dtAI.Rows[0]["SenderName"].ToString();
                lblSent.Text = Convert.ToDateTime(dtAI.Rows[0]["SendDate"]).ToShortDateString();

                // Display Action Item Type...
                if (dtAI.Rows[0]["AIType"].Equals(0))
                {
                    lblCategory.Text = "Event Generated";
                }
                else
                {
                    lblCategory.Text = "Manually Generated";
                }

                // Display Action Item Details...
                txtDetails.Text = dtAI.Rows[0]["Details"].ToString();
            }
            int AIID = Convert.ToInt32(dtAI.Rows[0]["AIID"]);
            dtAI.Dispose();
            ActionItem.Set_NotifiedStatusRead(AIID);
            ScriptManager.RegisterStartupScript(udpActionItem, udpActionItem.GetType(), "StatusRead", "aiRefresh();", true);
        }

        private void AI_GetResults(int EventID)
        {
            DataTable dt = ActionItem.Get_Results(EventID);
            if (dt.Rows.Count > 0)
            {
                lblSelectResult.Visible = true;
                ddlResults.Visible = true;
                ddlResults.DataSource = dt;
                ddlResults.DataTextField = "Name";
                ddlResults.DataValueField = "EventID";
                ddlResults.DataBind();
                ddlResults.SelectedValue = "0";
            }
            else
            {
                lblSelectResult.Visible = false;
                ddlResults.Visible = false;
                ddlResults.Enabled = false;
            }
        }

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            DataTable dtAI = (DataTable)ViewState["ActionItem"];

            switch (arg)
            {
                case "CompleteActionItem":
                    int AIID = Convert.ToInt32(Request.QueryString["AIID"]);
                    int ResultID = 0;
                    string ResultText = string.Empty;
                    if (ddlResults.Visible == true)
                    {
                        ResultID = Convert.ToInt32(ddlResults.SelectedItem.Value);
                        ResultText = ddlResults.SelectedItem.Text;
                    }
                    string Comments = txtComments.Text;

                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');

                        string UserFullName = UserValues[1].ToString();
                        int UserID = Convert.ToInt32(UserValues[0]);

                        ActionItem.AI_Complete(AIID, ResultID, ResultText, Comments, UserFullName, UserID);
                        ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "AIComlpete", "aiRefresh();alert('Action Item successfully completed');", true);
                        await Initialize_AI(AIID);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "AIAbort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
                    }
                    break;
                case "ForwardActionItem":
                    int fwAIID = Convert.ToInt32(Request.QueryString["AIID"]);
                    int fwModuleID = Convert.ToInt32(dtAI.Rows[0]["ShowModuleID"]);
                    if (gvModalSelected.Rows.Count > 0)
                    {
                        Forward_AI(fwAIID, fwModuleID);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "myScript", "alert('You must select at least one recipient')", true);
                        mpForwardAI.Hide();
                        mpFWUserSelect.Show();
                    }
                    break;
                case "ReplyActionItem":
                    int reAIID = Convert.ToInt32(Request.QueryString["AIID"]);
                    int reModuleID = Convert.ToInt32(dtAI.Rows[0]["ShowModuleID"]);
                    Reply_AI(reAIID, reModuleID);
                    break;
                case "AddUsers":
                    // Create tables
                    DataTable dtAdd = new DataTable();
                    dtAdd.Columns.Add("NumData");
                    dtAdd.Columns.Add("TextData");
                    dtAdd.Columns.Add("Type");

                    // Check if there are already assigned users and add them to temp table.
                    if (gvModalSelected.Rows.Count > 0)
                    {
                        foreach (GridViewRow gvr in gvModalSelected.Rows)
                        {
                            DataRow dr = dtAdd.NewRow();
                            string strUserID = gvr.Cells[0].Text;
                            string strUserName = gvr.Cells[1].Text;
                            string strType = gvr.Cells[2].Text;
                            dr["NumData"] = strUserID;
                            dr["TextData"] = strUserName;
                            dr["Type"] = strType;
                            dtAdd.Rows.Add(dr);
                        }
                        dtAdd.AcceptChanges();
                    }

                    // Select additonal user(s)
                    switch (ddlModal.SelectedIndex)
                    {
                        case 1:
                            foreach (ListItem li in lbModalSelect.Items)
                            {
                                if (li.Selected == true)
                                {
                                    DataRow dr = dtAdd.NewRow();
                                    dr["NumData"] = li.Value;
                                    dr["TextData"] = li.Text;
                                    dr["Type"] = "User";
                                    dtAdd.Rows.Add(dr);
                                }
                            }
                            break;
                        case 2:
                            DataRow dr2 = dtAdd.NewRow();
                            dr2["NumData"] = P3Tree.SelectedNode.Value;
                            dr2["TextData"] = P3Tree.SelectedNode.Text;
                            dr2["Type"] = "Entity";
                            dtAdd.Rows.Add(dr2);
                            break;
                    }
                    dtAdd.AcceptChanges();

                    // Remove duplicate entries from datatable and bind gridview.
                    DataView dv = new DataView(dtAdd);
                    DataTable dt2 = dv.ToTable("dt2", true);
                    gvModalSelected.DataSource = dt2;
                    gvModalSelected.DataBind();
                    break;
                case "RemoveUsers":
                    DataTable dtRemove = new DataTable();
                    dtRemove.Columns.Add("NumData");
                    dtRemove.Columns.Add("TextData");
                    dtRemove.Columns.Add("Type");

                    if (gvModalSelected.Rows.Count > 0)
                    {
                        string strNumData = null;
                        string strTextData = null;
                        string strTypeData = null;

                        int TotalRows = (gvModalSelected.Rows.Count - 1);
                        foreach (GridViewRow gvr in gvModalSelected.Rows)
                        {
                            strNumData = gvr.Cells[0].Text;
                            strTextData = gvr.Cells[1].Text;
                            strTypeData = gvr.Cells[2].Text;
                            if (gvr.RowState == DataControlRowState.Normal)
                            {
                                DataRow dr = dtRemove.NewRow();
                                dr["NumData"] = strNumData;
                                dr["TextData"] = strTextData;
                                dr["Type"] = strTypeData;
                                dtRemove.Rows.Add(dr);
                            }
                        }
                        dtRemove.AcceptChanges();
                        gvModalSelected.DataSource = dtRemove;
                        gvModalSelected.DataBind();
                        gvModalSelected.SelectedIndex = -1;
                    }
                    break;
                case "PwdCnf":
                    await ConfirmPasswordAsync(txtPwdCnf.Text);
                    break;
                case "ShowCompleteModal":
                    mpCompleteAI.Show();
                    break;
            }
        }

        protected void ImageButton_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string arg = btn.CommandArgument;
            int AIID = Convert.ToInt32(Request.QueryString["AIID"]);
            DataTable dtAI = ActionItem.Get_ActionItem(AIID);
            switch (arg)
            {
                case "GoThere":
                    //DataTable dtAI = ActionItem.Get_ActionItem(AIID);
                    int ShowModuleID = Convert.ToInt32(dtAI.Rows[0]["ShowModuleID"]);
                    int ItemID = Convert.ToInt32(dtAI.Rows[0]["ShowID"].ToString());
                    bool ShowIsItemID = Convert.ToBoolean(dtAI.Rows[0]["ShowIsItemID"]);
                    int ShowGroupID = P3General.Get_ParentGroupID(ShowModuleID, ItemID);

                    DataTable dtShowItem = ActionItem.Get_AttachedRecord(ItemID, ShowModuleID, ShowIsItemID, string.Empty);
                    int ShowOrigID = Convert.ToInt32(dtShowItem.Rows[0]["OrigID"]);

                    Session["ModuleID"] = ShowModuleID;
                    Session["GTGroupID"] = ShowGroupID;
                    Session["GTItemID"] = ShowOrigID;
                    Session["GTIsItemID"] = ShowIsItemID;
                    ScriptManager.RegisterStartupScript(udpActionItem, udpActionItem.GetType(), "GoThere", "clickGoThere();closeP3Window();", true);
                    break;
                case "CloseWindow":
                    ScriptManager.RegisterStartupScript(udpActionItem, udpActionItem.GetType(), "closeAI", "closeP3Window();", true);
                    break;
                case "OpenCompleteAIModal":

                    int showAction = Convert.ToInt32(dtAI.Rows[0]["ShowAction"]);
                    if (showAction == 3)
                    {
                        mpAIPwdCnf.Show();
                        btnSubmitPwd.Focus();
                    }
                    else
                    {
                        mpCompleteAI.Show();
                        txtComments.Focus();
                    }
                    break; ;
                case "OpenCompleteAIPwdModal":
                    mpAIPwdCnf.Show();
                    btnSubmitPwd.Focus();
                    break;
                case "Previous":
                    if (Session["AIIDs"] != null)
                    {
                        List<string> AIListForPrev = (List<string>)Session["AIIDs"];
                        if (AIListForPrev.Count > 0)
                        {
                            int pindex = AIListForPrev.IndexOf(AIID.ToString());
                            string prevAIID;
                            if (pindex - 1 > 0)
                            {
                                prevAIID = AIListForPrev[pindex - 1];
                            }
                            else
                            {
                                prevAIID = AIListForPrev[AIListForPrev.Count - 1];
                            }
                            ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "previous", "document.getElementById('pleasewait').style.display = 'block';window.location.href = 'ViewActionItem.aspx?AIID=" + prevAIID + "'", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "previous", "alert('There is no other Action Item to display');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "previous", "alert('There is no other Action Item to display');", true);
                    }
                    break;
                case "Next":
                    if (Session["AIIDs"] != null)
                    {
                        List<string> AIListForNext = (List<string>)Session["AIIDs"];
                        if (AIListForNext.Count > 0)
                        {
                            int pindex = AIListForNext.IndexOf(AIID.ToString());
                            string nextAIID;
                            if (pindex + 1 < (AIListForNext.Count - 1))
                            {
                                nextAIID = AIListForNext[pindex + 1];
                            }
                            else
                            {
                                nextAIID = AIListForNext[0];
                            }
                            ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "previous", "document.getElementById('pleasewait').style.display = 'block';window.location.href = 'ViewActionItem.aspx?AIID=" + nextAIID + "'", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "previous", "alert('There is no other Action Item to display');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "previous", "alert('There is no other Action Item to display');", true);
                    }
                    break;
            }
        }

        #endregion

        #region Forward/Reply Events

        protected void rem_selListBoxItems(object sender, EventArgs e)
        {
            ImageButton remBtn = (ImageButton)sender;
            string strFieldID = remBtn.CommandArgument;
            DataTable dt = new DataTable();
            ListBox selListBox = (ListBox)this.FindControl(strFieldID);
            foreach (ListItem li in selListBox.Items)
            {
                if (li.Selected == false)
                {
                    DataRow dr = dt.NewRow();
                    dr["NumData"] = li.Value;
                    dr["TextData"] = li.Text;
                    dt.Rows.Add(dr);
                }
                dt.AcceptChanges();
            }
            selListBox.Items.Clear();
            selListBox.DataSource = dt;
            selListBox.DataTextField = "TextData";
            selListBox.DataValueField = "NumData";
            selListBox.DataBind();
            ViewState["dt" + strFieldID] = dt;
            ViewState["IsUpdated"] = true;
        }

        protected void ddlModal_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (Convert.ToInt32(ddlModal.SelectedValue))
            {
                case 0:
                    lbModalSelect.Visible = true;
                    P3Tree.Visible = false;
                    lbModalSelect.Items.Clear();
                    P3Tree.Nodes.Clear();
                    break;
                case 1:
                    lbModalSelect.Visible = true;
                    P3Tree.Visible = false;
                    Fill_Users();
                    P3Tree.Nodes.Clear();
                    break;
                case 2:
                    lbModalSelect.Visible = false;
                    P3Tree.Visible = true;
                    int UserID = 0;
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        UserID = Convert.ToInt32(UserValues[0]);
                    }
                    Fill_Tree(1, UserID, 4);
                    lbModalSelect.Items.Clear();
                    break;
            }
        }

        protected void Fill_Users()
        {
            DataTable dt = ActionItem.Get_ListUsers();
            foreach (DataRow dr in dt.Rows)
            {
                lbModalSelect.Items.Add(new ListItem(dr["LastName"].ToString() + ", " + dr["FirstName"].ToString(), dr["UserID"].ToString()));
            }
        }

        protected void Fill_Tree(int moduleID, int userID, int rootID)
        {
            DataTable dt = P3General.Get_DisplayGroups(moduleID, Convert.ToInt32(rootID), userID);
            DataRow[] root = dt.Select("GroupID = " + rootID);
            if (root.Length > 0)
            {
                TreeNode rootnode = new TreeNode(root[0]["Name"].ToString(), root[0]["GroupID"].ToString());
                P3Tree.Nodes.Add(rootnode);
                PopulateNodes(dt, P3Tree.FindNode(rootID.ToString()).ChildNodes, Convert.ToInt32(rootID));
            }
            else
            {
                throw new Exception("There is no root level found");
            }
            //int UserID = 0;
            //// Get user information from authentication cookie.
            //if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            //{
            //    string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
            //    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
            //    string UserData = authTicket.UserData;
            //    string[] UserValues = UserData.Split(',');
            //    int userID = Convert.ToInt32(UserValues[0]);
            //}           

            //// Get Root Organization Name and populate root level of tree.
            //string GroupName = P3General.Get_GroupName(1, 4);
            //PopulateRootLevel(1, UserID, "4", GroupName);
        }

        protected void P3Tree_TreeNodePopulate(object sender, TreeNodeEventArgs e)
        {
            int moduleID = 1;
            int UserID = 0;
            // Get user information from authentication cookie.
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int userID = Convert.ToInt32(UserValues[0]);
            }

            PopulateSubLevel(moduleID, Convert.ToInt32(e.Node.Value), e.Node, UserID);
        }

        private void PopulateNodes(DataTable dt, TreeNodeCollection nodes, int ParentID)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (!dr["GroupID"].Equals(ParentID))
                {
                    TreeNode tn = new TreeNode
                    {
                        Text = dr["Name"].ToString(),
                        Value = dr["GroupID"].ToString()
                    };
                    nodes.Add(tn);
                    tn.PopulateOnDemand = (Convert.ToInt32(dr["childnodecount"]) > 0);
                }
            }
            //string UserStatus = "-1";
            //int UserID = 0;
            //if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            //{
            //    string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
            //    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
            //    string UserData = authTicket.UserData;
            //    string[] UserValues = UserData.Split(',');
            //    UserID = Convert.ToInt32(UserValues[0]);
            //    UserStatus = UserValues[3];
            //}

            //foreach (DataRow dr in dt.Rows)
            //{
            //    if (Convert.ToInt32(dr["ControlType"]) == 1)
            //    {
            //        bool isPermitted = false;
            //        if (Convert.ToInt32(UserStatus) == 1)
            //        {
            //            isPermitted = true;
            //        }
            //        else
            //        {
            //            DataTable dtPermitted = P3General.Get_GroupSecurity(ModuleID, Convert.ToInt32(dr["GroupID"]));
            //            foreach (DataRow dr1 in dtPermitted.Rows)
            //            {
            //                if (Convert.ToInt32(dr1["ControlType"]) == 6)
            //                {
            //                    DataTable dtUsers1 = P3General.Get_PermittedUsers(Convert.ToInt32(dr1["ControlID"]));
            //                    foreach (DataRow dr2 in dtUsers1.Rows)
            //                    {

            //                        if (UserID == Convert.ToInt32(dr2["ControlID"]))
            //                        {
            //                            isPermitted = true;
            //                        }
            //                    }
            //                    dtUsers1.Dispose();

            //                    DataTable dtPositions = P3General.Get_PermittedPositions(Convert.ToInt32(dr1["ControlID"]));
            //                    foreach (DataRow dr3 in dtPositions.Rows)
            //                    {
            //                        DataTable dtUsers2 = P3General.Get_PermittedUsers(Convert.ToInt32(dr3["ControlID"]));
            //                        foreach (DataRow dr4 in dtUsers2.Rows)
            //                        {
            //                            if (UserID == Convert.ToInt32(dr4["ControlID"]))
            //                            {
            //                                isPermitted = true;
            //                            }
            //                        }
            //                        dtUsers2.Dispose();
            //                    }
            //                    dtPositions.Dispose();
            //                }
            //                else
            //                {
            //                    if (UserID == Convert.ToInt32(dr1["ControlID"]))
            //                    {
            //                        isPermitted = true;
            //                    }
            //                }
            //            }
            //            dtPermitted.Dispose();
            //        }
            //        if (isPermitted == true)
            //        {
            //            TreeNode tn = new TreeNode();
            //            tn.Text = dr["Name"].ToString();
            //            tn.Value = dr["GroupID"].ToString();
            //            nodes.Add(tn);
            //            tn.PopulateOnDemand = (Convert.ToInt32(dr["childnodecount"]) > 0);
            //        }
            //    }
            //    else
            //    {
            //        TreeNode tn = new TreeNode();
            //        tn.Text = dr["Name"].ToString();
            //        tn.Value = dr["GroupID"].ToString();
            //        nodes.Add(tn);
            //        tn.PopulateOnDemand = (Convert.ToInt32(dr["childnodecount"]) > 0);
            //    }
            //}
            //dt.Dispose();
        }

        private void PopulateSubLevel(int ModuleID, int ParentGroupID, TreeNode parentNode, int userID)
        {
            // Populate TreeView sublevels based upon which menu item in TabContainer1 is selected.
            DataTable dt = P3General.Get_DisplayGroups(ModuleID, ParentGroupID, userID);
            PopulateNodes(dt, parentNode.ChildNodes, ModuleID);
            dt.Dispose();
        }

        protected void P3Tree_SelectedNodeChanged(object sender, EventArgs e)
        {
            P3Tree.SelectedNode.Expand();
        }

        protected TreeNode FindMyNode(string searchstring, TreeView tvNodes)
        {
            try
            {
                for (int vLoop = 0; vLoop < tvNodes.Nodes.Count; vLoop++)
                {
                    TreeNode trNode = tvNodes.Nodes[vLoop];


                    if (trNode.Value == searchstring)
                        return trNode;
                    else
                    {
                        TreeNode trAnswerNode = FindChildNodes(trNode, searchstring);
                        if (trAnswerNode != null)
                            return trAnswerNode;
                    }
                }
                return null;
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
                for (int vLoop = 0; vLoop < trNode.ChildNodes.Count; vLoop++)
                {
                    TreeNode trChildNode = trNode.ChildNodes[vLoop];
                    if (trChildNode.Value == searchstring)
                        return trChildNode;
                    else
                    {
                        TreeNode trAnswerNode = FindChildNodes(trChildNode, searchstring);
                        if (trAnswerNode != null)
                            return trAnswerNode;
                    }
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void gvModalSelected_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvModalSelected, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
            }
        }

        protected void Forward_AI(int AIID, int ModuleID)
        {
            // Define all variables...
            DataTable dtAI = (DataTable)ViewState["ActionItem"];
            string AIComments = txtFWComments.Text;
            string SendToUserNameFinal = null;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                string UserFullName = UserValues[1].ToString();

                //  Retrieve all Action Item recipients.
                if (gvModalSelected.Rows.Count > 0)
                {
                    DataTable dtInit = new DataTable();
                    dtInit.Columns.Add("UserID");
                    dtInit.Columns.Add("UserFullName");

                    DataTable dtFinal = new DataTable();

                    int Max = (gvModalSelected.Rows.Count - 1);
                    for (int i = 0; i <= Max; i++)
                    {
                        if (gvModalSelected.Rows[i].Visible == true)
                        {

                            if (gvModalSelected.Rows[i].Cells[2].Text == "User")
                            {
                                int SendToUserID = Convert.ToInt32(gvModalSelected.Rows[i].Cells[0].Text);
                                string SendToUserName = gvModalSelected.Rows[i].Cells[1].Text;
                                string[] names = SendToUserName.Split(',');
                                SendToUserNameFinal = names[1] + " " + names[0];

                                DataRow ir = dtInit.NewRow();
                                ir["UserID"] = SendToUserID;
                                ir["UserFullName"] = SendToUserNameFinal;
                                dtInit.Rows.Add(ir);
                            }
                            else // Entity
                            {
                                // Get ID of Entity
                                string EntityID = gvModalSelected.Rows[i].Cells[0].Text;

                                // Find TreeNode equivalent to Entity in P3Tree and find all Child nodes
                                P3Tree.ExpandAll();
                                TreeNode tn = FindMyNode(EntityID, P3Tree);
                                DataTable dtEntity = new DataTable();
                                dtEntity.Columns.Add("ControlID");
                                dtEntity.Columns.Add("ControlFullName");
                                DataRow fr = dtEntity.NewRow();
                                fr["ControlID"] = Convert.ToInt32(tn.Value);
                                fr["ControlFullName"] = tn.Text;
                                dtEntity.Rows.Add(fr);
                                Queue<TreeNode> queue = new Queue<TreeNode>();
                                TreeNode top;
                                foreach (TreeNode topTn in tn.ChildNodes)
                                {
                                    queue.Enqueue(topTn);
                                }
                                while (queue.Count > 0)
                                {
                                    top = queue.Dequeue();
                                    DataRow dr = dtEntity.NewRow();
                                    dr["ControlID"] = top.Value;
                                    dr["ControlFullName"] = top.Text;
                                    dtEntity.Rows.Add(dr);
                                    foreach (TreeNode nod in top.ChildNodes)
                                    {
                                        queue.Enqueue(nod);
                                    }
                                }
                                P3Tree.CollapseAll();
                                P3Tree.Nodes[0].Expand();

                                foreach (DataRow er in dtEntity.Rows)
                                {
                                    DataTable dtMembers = ActionItem.Get_UsersFromEntity(Convert.ToInt32(er["ControlID"]));
                                    foreach (DataRow mr in dtMembers.Rows)
                                    {
                                        int SendToMemberID = Convert.ToInt32(mr["ControlID"]);
                                        string SendToMamberName = mr["ControlFullName"].ToString();
                                        DataRow nr = dtInit.NewRow();
                                        nr["UserID"] = SendToMemberID;
                                        nr["UserFullName"] = SendToMamberName;
                                        dtInit.Rows.Add(nr);
                                    }
                                }
                            }
                        }
                    }

                    // Remove duplicate rows and send Action Items.
                    dtFinal = dtInit.DefaultView.ToTable(true);
                    if (UserID != 0)
                    {
                        foreach (DataRow fr in dtFinal.Rows)
                        {
                            int stUserUD = Convert.ToInt32(fr["UserID"]);
                            string stUserFullName = fr["UserFullName"].ToString();
                            ActionItem.Forward_ActionItem(AIID, ModuleID, stUserUD, stUserFullName, UserID, UserFullName, AIComments);
                        }
                        ScriptManager.RegisterStartupScript(udpActionItem, udpActionItem.GetType(), "myScript", "aiRefresh();alert('Action Item was successfully forwarded');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpActionItem, udpActionItem.GetType(), "myScript", "alert('UserID not found.  You must be logged on to forward Action Items!');", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "AIAbort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
            }
        }

        protected void Reply_AI(int AIID, int ModuleID)
        {
            DataTable dtAI = (DataTable)ViewState["ActionItem"];
            int UserID = 0;
            string UserFullName = string.Empty;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
                UserFullName = UserValues[1].ToString();
            }

            if (UserID != 0)
            {
                string Comments = txtReplyComments.Text;
                ActionItem.Reply_ActionItem(AIID, ModuleID, UserID, UserFullName, Comments);
                ScriptManager.RegisterStartupScript(udpActionItem, udpActionItem.GetType(), "myScript", "aiRefresh();alert('Action Item reply successfully sent');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpActionItem, udpActionItem.GetType(), "myScript", "alert('User ID not found.  You must be logged in to reply to Action Items!');", true);
            }
        }

        #endregion

        #region Password Confirm

        protected async Task ConfirmPasswordAsync(string password)
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
                string username = UserValues[7];
                bool IsFips = P3Security.IsFIPS();
                string encPassword = await P3Security.EncryptAsync(password, username.ToUpper(), IsFips);
                bool IsPwdCnf = await P3Security.Confirm_PasswordAsync(username, encPassword);
                if (IsPwdCnf)
                {
                    pnlCompletePwd.Visible = false;
                    pnlComplete.Visible = true;
                    mpCompleteAI.Show();
                    txtComments.Text = "Completed with password confirmation - " + DateTime.Now;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "TEST", "alert('Password not accepted. Please try again.');", true);

                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "TEST", "alert('You are not logged in. Please log in and try again');", true);
            }
        }

        #endregion
    }
}