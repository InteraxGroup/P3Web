using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Web.Security;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace Paradigm3
{
    public partial class ViewProperties : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {            
            if (!Page.IsPostBack)
            {
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    Response.Redirect("Default.aspx", false);
                }
                else
				{
                    int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                    int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
                    // Initialise all other Properties details
                    await Initialize_PropertiesAsync(ItemID, ModuleID, IsGroup);
                }                
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewProperties.aspx";
        }

        protected async Task Initialize_PropertiesAsync(int ItemID, int ModuleID, int IsGroup)
        {
            // General Tab
            DataTable dt = await Properties.Get_PropertiesAsync(ItemID, ModuleID, IsGroup);
            int ID = 0;
            int OrigID = 0;
            if (dt.Rows.Count > 0)
            {                
                if (IsGroup == 1)
                {
                    ID = Convert.ToInt32(dt.Rows[0]["GroupID"]);
                    lblName.Text = dt.Rows[0]["Name"].ToString();
                    trainingTab.Visible = false;
                }
                else
				{
                    if (ModuleID == 1)
					{
                        ID = Convert.ToInt32(dt.Rows[0]["UserID"]);
                        lblName.Text = dt.Rows[0]["FullName"].ToString();
                    }
                    else
					{
                        ID = Convert.ToInt32(dt.Rows[0]["ItemID"]);
                        lblName.Text = dt.Rows[0]["Name"].ToString();
                    }
				}
                if (dt.Rows[0]["LabelName"] != DBNull.Value)
                {
                    lblLabel.Text = dt.Rows[0]["LabelName"].ToString();
                }
                else
                {
                    lblLabel.Text = string.Empty;
                }
                if (IsGroup == 1)
                {
                    lblIDs.Text = ID.ToString();
                    lblType.Text = "Folder";
                }
                else
                {
                    lblIDs.Text = ID.ToString() + "/" + dt.Rows[0]["OrigID"];
                    switch (ModuleID)
                    {
                        case 3:
                            lblType.Text = "Document";
                            break;
                        case 4:
                            lblType.Text = "Record";
                            break;
                        case 6:
                            lblType.Text = "Improvement";
                            break;
                        case 12:
                            lblType.Text = "Training";
                            break;
                    }
                }
                if (dt.Rows[0]["CreateDate"] != DBNull.Value)
				{
                    lblCreatedDate.Text = Convert.ToDateTime(dt.Rows[0]["CreateDate"]).ToString("d");
                }                
                if (dt.Rows[0]["CreateBy"] != DBNull.Value)
                {
                    lblCreatedBy.Text = dt.Rows[0]["CreateBy"].ToString();
                }
                if (dt.Rows[0]["LastModified"] != DBNull.Value)
				{
                    lblModifiedDate.Text = Convert.ToDateTime(dt.Rows[0]["LastModified"]).ToString("d");
                }                
                if (dt.Rows[0]["ModifiedBy"] != DBNull.Value)
                {
                    lblModifiedBy.Text = dt.Rows[0]["ModifiedBy"].ToString();
                }
                if (dt.Rows[0]["Notes"] != DBNull.Value)
                {
                    txtNotes.Text = dt.Rows[0]["Notes"].ToString();
                }

                if (IsGroup == 1)
                {
                    OrigID = Convert.ToInt32(dt.Rows[0]["GroupID"]);
                }
                else
                {
                    OrigID = Convert.ToInt32(dt.Rows[0]["OrigID"]);
                }

            }
            dt.Dispose();

            // Show/Hide Roles/Event Date/Training/Categories tabs
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                // Get user information from authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int userID = Convert.ToInt32(UserValues[0]);
                int userStatus = Convert.ToInt32(UserValues[3]);

                // General Tab                
                if (ModuleID != 1 && (userStatus == 1 || userStatus == 0))
                {
                    txtNotes.ReadOnly = false;
                }

                // Roles Tab
                rolesTab.Visible = false;
                if (ModuleID != 1)
				{
                    rolesTab.Visible = true;
                    await Get_RolesAsync(ModuleID);
                    if (userStatus == 1 && IsGroup == 1)
                    {
                        btnApplySubItems.Visible = true;
                        btnApplySubFolders.Visible = true;
                    }
                    else if (userStatus == 0 && IsGroup == 1)
                    {
                        bool HasRolePermission = await P3General.HasRolePermissionAsync(ModuleID, ItemID, userID, IsGroup);
                        if (HasRolePermission)
                        {
                            btnApplySubItems.Visible = true;
                            btnApplySubFolders.Visible = true;
                        }
                    }
                }

                // Event Dates Tab
                eventDateTab.Visible = false;
                if (ModuleID != 1)
				{
                    eventDateTab.Visible = true;
                    int IDType = 1;
                    if (IsGroup == 1)
                    {
                        IDType = 0;
                    }
                    await Get_EventDatesAsync(ModuleID, OrigID, IDType);
                    bool CanEditEventDates = await P3General.HasEventDatePermissionsAsync(ModuleID, OrigID, IsGroup, userID);
                    if (CanEditEventDates)
                    {
                        if (IDType != 1)
                        {
                            btnApplyEventDateToSubItems.Enabled = true;
                            btnApplyEventDateToSubFolders.Enabled = true;
                        }
                        btnEditEventDates.Enabled = true;

                        await Get_EventDateListAsync(ModuleID);
                    }
                }

                // Categories Tab
                categoriesTab.Visible = false;
                if (ModuleID != 1)
				{
                    DataTable dtCategories = SearchData.Get_SearchVar(ModuleID).Tables[4];
                    DataTable dtItemCategories = await Properties.Get_ItemCategoriesAsync(ModuleID, OrigID, IsGroup);
                    ViewState["ItemCategories"] = dtItemCategories;
                    dtItemCategories.Dispose();

                    rptCategories.DataSource = dtCategories;
                    rptCategories.DataBind();
                    bool CanEditCategories = await P3General.HasCategoryPermissionsAsync(ModuleID, OrigID, IsGroup, userID);
                    if (CanEditCategories)
                    {
                        foreach (RepeaterItem item in rptCategories.Items)
                        {
                            CheckBox cb = (CheckBox)item.FindControl("chkCategory");
                            cb.Enabled = true;
                        }

                        if (IsGroup == 1)
                        {
                            btnApplyCategoriesToSubItems.Enabled = true;
                            btnApplyCategoriesToSubFolders.Enabled = true;
                        }
                    }
                }

                // Training tab
                trainingTab.Visible = false;
                if (ModuleID != 1)
				{
                    if (ModuleID != 12 && IsGroup != 1)
                    {
                        trainingTab.Visible = true;
                        await Get_RelatedTrainingAsync(ID, ModuleID);
                    }
                }
            }
            else
            {
                rolesTab.Visible = false;
                trainingTab.Visible = false;
            }

            // History Tab
            await Get_ItemHistoryAsync(OrigID, ModuleID, IsGroup);
        }

        #region Buttons

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int OrigID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
            switch (arg)
            {
                case "AddRoleMembers":
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "addRoles", "openSelect('Roles')", true);
                    break;
                case "RemoveRoleMember":
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int UserID = Convert.ToInt32(UserValues[0]);
                        string UserFullName = UserValues[1];

                        int ID = Convert.ToInt32(gvRoleMembers.DataKeys[gvRoleMembers.SelectedIndex].Values["ID"]);
                        int CatID = Convert.ToInt32(gvRoles.DataKeys[gvRoles.SelectedIndex].Values["CatID"]);
                        await Properties.Remove_RoleMemberAsync(ID, ModuleID, OrigID, IsGroup, CatID);
                        await Get_RoleMembersAsync(ModuleID, OrigID, CatID, IsGroup);

                        if (IsGroup == 1)
                        {
                            await P3General.Edit_Group_HistoryAsync(ModuleID, OrigID, string.Empty, string.Empty, string.Empty, 1, UserFullName);
                        }
                    }
                    break;
                case "UpdateRoleMembers":
                    if (Session.Contents["dtSelected"] != null)
                    {
                        if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                        {
                            string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                            FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                            string UserData = authTicket.UserData;
                            string[] UserValues = UserData.Split(',');
                            int UserID = Convert.ToInt32(UserValues[0]);
                            string UserFullName = UserValues[1];
                            int RoleCatID = Convert.ToInt32(gvRoles.SelectedValue);

                            DataTable dtRoles = (DataTable)Session.Contents["dtSelected"];
                            foreach (DataRow dr in dtRoles.Rows)
                            {

                                int RoleControlID = Convert.ToInt32(dr["ControlID"]);
                                string RoleControlFullName = dr["ControlFullName"].ToString();
                                int RoleControlType = Convert.ToInt32(dr["ControlType"]);
                                await Properties.Add_RoleMemberAsync(ModuleID, OrigID, IsGroup, RoleCatID, RoleControlID, RoleControlFullName, RoleControlType, UserID, UserFullName);
                            }
                            await Get_RoleMembersAsync(ModuleID, OrigID, RoleCatID, IsGroup);
                        }
                    }
                    break;
                case "ApplyRolesToItems":
                    int iRoleCatID = Convert.ToInt32(gvRoles.SelectedValue);
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int iUsrID = Convert.ToInt32(UserValues[0]);
                        string iUsrFullName = UserValues[1];

                        int iGroupID = OrigID;

                        try
                        {
                            await Properties.Purge_RoleMembersAsync(0, ModuleID, OrigID, iRoleCatID);
                            if (gvRoleMembers.Rows.Count > 0)
                            {
                                await Properties.Apply_RoleMemberToSubsAsync(1, ModuleID, iGroupID, iRoleCatID, iUsrFullName, iUsrID);
                            }
                            ScriptManager.RegisterStartupScript(udpProperties, GetType(), "success", "alert('Successfully applied selected role to sub-items.')", true);
                        }
                        catch (SqlException ex)
                        {
                            //throw ex;
                            string imsg = ex.Message.Replace(Environment.NewLine, string.Empty);
                            imsg = imsg.Replace("'", string.Empty);
                            ScriptManager.RegisterStartupScript(udpProperties, GetType(), "roleerror", "alert('" + imsg + "')", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpProperties, GetType(), "nologin", "alert('Your login has timed out.  Please log in and try again.')", true);
                    }
                    break;
                case "ApplyRolesToSubGroups":
                    int gRoleCatID = Convert.ToInt32(gvRoles.SelectedValue);
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int gUsrID = Convert.ToInt32(UserValues[0]);
                        string gUsrFullName = UserValues[1];

                        int gGroupID = OrigID;

                        try
                        {
                            await Properties.Purge_RoleMembersAsync(1, ModuleID, OrigID, gRoleCatID);
                            if (gvRoleMembers.Rows.Count > 0)
                            {
                                await Properties.Apply_RoleMemberToSubsAsync(0, ModuleID, gGroupID, gRoleCatID, gUsrFullName, gUsrID);
                            }
                            ScriptManager.RegisterStartupScript(udpProperties, GetType(), "success", "alert('Successfully applied selected role to sub-groups and items.')", true);
                        }
                        catch (SqlException ex)
                        {
                            // throw ex;
                            string gmsg = ex.Message.Replace(Environment.NewLine, string.Empty);
                            gmsg = gmsg.Replace("'", string.Empty);
                            ScriptManager.RegisterStartupScript(udpProperties, GetType(), "roleerror", "alert('" + gmsg + "')", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpProperties, GetType(), "nologin", "alert('Your login has timed out.  Please log in and try again.')", true);
                    }
                    break;
                case "ShowMe":
                    string ShowItemID = gvTraining.DataKeys[gvTraining.SelectedIndex].Values["ItemID"].ToString();
                    string ShowObjTypeID = gvTraining.DataKeys[gvTraining.SelectedIndex].Values["ObjTypeID"].ToString();
                    string ShowParentGroupID = gvTraining.DataKeys[gvTraining.SelectedIndex].Values["ParentGroupID"].ToString();
                    string strVar = "12," + ShowItemID + "," + ShowObjTypeID + "," + ShowParentGroupID + ",0";
                    ScriptManager.RegisterStartupScript(udpTraining, udpTraining.GetType(), "showme", "openRecordWindow(" + strVar + ")", true);
                    break;
                case "GoThere":
                    string GoItemID = gvTraining.DataKeys[gvTraining.SelectedIndex].Values["ItemID"].ToString();
                    string GoParentGroupID = gvTraining.DataKeys[gvTraining.SelectedIndex].Values["ParentGroupID"].ToString();
                    Session["ModuleID"] = "12";
                    Session["GTGroupID"] = GoParentGroupID;
                    Session["GTItemID"] = GoItemID;
                    ScriptManager.RegisterStartupScript(udpTraining, udpTraining.GetType(), "gothere", "clickGoThere();closeP3Window();", true);
                    break;
                case "Close":
                    ClientScript.RegisterStartupScript(GetType(), "close", "window.close()", true);
                    break;
                case "EditEventDates":
                    mpeEditEventDate.Show();
                    break;
                case "SaveEventDateDetails":
                    await Save_EventDateDetailsAsync();
                    break;
                case "ApplyEventDateToSubItems":
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "ConfirmApplyEventDatesToSubItems", "confirmApplyEventDatesToItems();", true);
                    break;
                case "ApplyEventDateToSubFolders":
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "ConfirmApplyEventDatesToSubItems", "confirmApplyEventDatesToFolders();", true);
                    break;
                case "ApplyCategoriesToSubItems":
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "ConfirmApplyEventDatesToSubItems", "confirmApplyCategoriesToItems();", true);
                    break;
                case "ApplyCategoriesToSubFolders":
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "ConfirmApplyEventDatesToSubItems", "confirmApplyCategoriesToFolders();", true);
                    break;
                case "CloseProperties":
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int UserStatus = Convert.ToInt32(UserValues[3]);

                        if (UserStatus == 1)
                        {
                            await Save_ItemCategoriesAsync(ModuleID, OrigID, IsGroup);
                            await Save_ItemNotesAsync(ModuleID, OrigID);
                        }
                    }
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "closeproperties", "window.close();", true);
                    break;
            }
        }

        protected void RadioButton_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = (RadioButton)sender;
            switch (rb.ID)
            {
                case "rbNotSet":
                    rbSetDate.Checked = false;
                    rbSetStatus.Checked = false;
                    break;
                case "rbSetDate":
                    rbNotSet.Checked = false;
                    rbSetStatus.Checked = false;
                    break;
                case "rbSetStatus":
                    rbNotSet.Checked = false;
                    rbSetDate.Checked = false;
                    break;
                case "rbOnceOnly":
                    rbEvery.Checked = false;
                    break;
                case "rbEvery":
                    rbOnceOnly.Checked = false;
                    break;
            }
            mpeEditEventDate.Show();
        }

        protected async void btnApplyEDTSI_Click(object sender, EventArgs e)
        {
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int GroupID = Convert.ToInt32(Request.QueryString["ItemID"]);

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                //Get user information from http cookie.
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                string UserName = UserValues[1];

                try
                {
                    await Properties.Save_EventDateToSubItemsAsync(ModuleID, GroupID);
                    await Properties.Update_HistoryAsync(ModuleID, GroupID, 1, UserName, 0);
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "Success", "alert('Event Dates Applied Successfully');", true);
                }
                catch (Exception ex)
                {
                    string msg = ex.Message;
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "Success", "alert('An error occurred when applying Event Dates');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpProperties, GetType(), "nologin", "alert('Your session has timed out. Please log in and try again.');", true);
            }

        }

        protected async void btnApplyEDTSF_Click(object sender, EventArgs e)
        {
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int GroupID = Convert.ToInt32(Request.QueryString["ItemID"]);

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                //Get user information from http cookie.
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                string UserName = UserValues[1];

                try
                {
                    await Properties.Save_EventDateToSubFoldersAsync(ModuleID, GroupID);
                    await Properties.Update_HistoryAsync(ModuleID, GroupID, 1, UserName, 0);
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "Success", "alert('Event Dates Applied Successfully');", true);
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpProperties, GetType(), "nologin", "alert('Your session has timed out. Please log in and try again.');", true);
            }
        }

        protected async void btnApplyCTSI_Click(object sender, EventArgs e)
        {
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int GroupID = Convert.ToInt32(Request.QueryString["ItemID"]);
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                try
                {
                    await Save_ItemCategoriesAsync(ModuleID, GroupID, 1);
                    await Properties.Save_CategoriesToSubItemsAsync(ModuleID, GroupID);
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "Success", "alert('Categories Applied Successfully');", true);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpProperties, GetType(), "nologin", "alert('Your session has timed out. Please log in and try again.');", true);
            }
        }

        protected async void btnApplyCTSF_Click(object sender, EventArgs e)
		{
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int GroupID = Convert.ToInt32(Request.QueryString["ItemID"]);
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                try
                {
                    // Apply Changes to selected folder and its sub-items
                    await Save_ItemCategoriesAsync(ModuleID, GroupID, 1);
                    await Properties.Save_CategoriesToSubItemsAsync(ModuleID, GroupID);
                    // Apply Changes to sub-folders and their sub-items
                    await Properties.Save_CategoriesToSubFoldersAsync(ModuleID, GroupID);
                    ScriptManager.RegisterStartupScript(udpProperties, GetType(), "Success", "alert('Categories Applied Successfully');", true);
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpProperties, GetType(), "nologin", "alert('Your session has timed out. Please log in and try again.');", true);
            }
            await Task.Delay(100);
        }

        #endregion

        #region Data Access

        protected async Task Get_ItemHistoryAsync(int OrigID, int ModuleID, int IsGroup)
        {
            string ItemHistory = await Properties.Get_HistoryAsync(OrigID, ModuleID, IsGroup);
            txtHistory.Text = ItemHistory;
        }

        protected async Task Get_RelatedTrainingAsync(int ItemID, int ModuleID)
        {
            DataTable dt = await Properties.Get_TrainingForItemAsync(ItemID, ModuleID);
            gvTraining.DataSource = dt;
            gvTraining.DataBind();
            dt.Dispose();
        }

        protected async Task Get_RolesAsync(int ModuleID)
        {
            DataTable dt = await Properties.Get_RolesAsync(ModuleID);
            gvRoles.DataSource = dt;
            gvRoles.DataBind();
            dt.Dispose();
        }

        protected async Task Get_RoleMembersAsync(int ModuleID, int ID, int CatID, int IsGroup)
        {
            DataTable dt = await Properties.Get_RoleMembersAsync(ModuleID, ID, CatID, IsGroup);
            DataView dv = new DataView(dt)
            {
                Sort = "ControlFullName"
            };
            gvRoleMembers.DataSource = dv;
            gvRoleMembers.DataBind();
            dv.Dispose();
            dt.Dispose();
        }

        protected async Task Get_EventDatesAsync(int ModuleID, int OrigID, int IDType)
        {
            DataTable dt = await Properties.Get_EventDatesAsync(ModuleID, OrigID, IDType);
            gvEventDates.DataSource = dt;
            gvEventDates.DataBind();
        }

        protected async Task Get_EventDateListAsync(int ModuleID)
        {
            DataTable dt = await Properties.Get_EventDateListAsync(ModuleID);
            gvDates.DataSource = dt;
            gvDates.DataBind();
            gvDates.SelectedIndex = 0;

            int OrigID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int CatID = Convert.ToInt32(gvDates.DataKeys[0].Values["CatID"]);
            int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
            int IDType = 1;
            if (IsGroup == 1)
            {
                IDType = 0;
            }

            await Get_EventDateDetailsAsync(ModuleID, OrigID, CatID, IDType);
        }

        protected async Task Get_EventDateDetailsAsync(int ModuleID, int OrigID, int CatID, int IDType)
        {
            DataTable dt = await Properties.Get_EventDateDetailsAsync(ModuleID, OrigID, CatID, IDType);
            int EventDateID = 0;
            if (dt.Rows.Count > 0)
            {
                EventDateID = Convert.ToInt32(dt.Rows[0]["DateID"]);
                int SetType = Convert.ToInt32(dt.Rows[0]["SetType"]);
                int DateType = Convert.ToInt32(dt.Rows[0]["DateType"]);
                int Repeat = Convert.ToInt32(dt.Rows[0]["Repeat"]);
                int IntervalNum = Convert.ToInt32(dt.Rows[0]["IntervalNum"]);
                int IntervalType = Convert.ToInt32(dt.Rows[0]["IntervalType"]);
                DateTime DateValue = Convert.ToDateTime(dt.Rows[0]["DateValue"]);
                int TriggerNum = Convert.ToInt32(dt.Rows[0]["TriggerNum"]);
                int TriggerType = Convert.ToInt32(dt.Rows[0]["TriggerType"]);
                DateTime TriggerDate = Convert.ToDateTime(dt.Rows[0]["TriggerDate"]);
                int TriggerBeforeAfter = Convert.ToInt32(dt.Rows[0]["TriggerBeforeAfter"]);
                int StopCalculation = 0;
                if (!dt.Rows[0]["StopCalculation"].Equals(DBNull.Value))
                {
                    StopCalculation = Convert.ToInt32(dt.Rows[0]["StopCalculation"]);
                }


                if (StopCalculation == 0)
                {
                    // Set Event Date Trigger
                    switch (SetType)
                    {
                        case 2:
                            rbNotSet.Checked = false;
                            rbSetDate.Checked = false;
                            rbSetStatus.Checked = true;
                            txtSetDate.Text = DateTime.Now.ToShortDateString();
                            ddlStatus.SelectedValue = DateType.ToString();
                            break;
                        case 1:
                            rbNotSet.Checked = false;
                            rbSetDate.Checked = true;
                            rbSetStatus.Checked = false;
                            txtSetDate.Text = DateValue.ToShortDateString();
                            break;
                    }
                    // Set Event Date Frequency
                    switch (Repeat)
                    {
                        case 0:
                            rbOnceOnly.Checked = true;
                            rbEvery.Checked = false;
                            break;
                        default:
                            rbOnceOnly.Checked = false;
                            rbEvery.Checked = true;
                            txtRepeatNum.Text = IntervalNum.ToString();
                            ddlRepeatPeriod.SelectedValue = IntervalType.ToString();
                            break;
                    }
                    // Set Event Date Action Item
                    txtAITriggerNum.Text = TriggerNum.ToString();
                    ddlAITriggerPeriod.SelectedValue = TriggerType.ToString();
                    ddlAITriggerWhen.SelectedValue = TriggerBeforeAfter.ToString();
                }
            }
            else
            {
                // Set Event Date Trigger
                rbNotSet.Checked = true;
                rbSetDate.Checked = false;
                txtSetDate.Text = DateTime.Now.ToShortDateString();
                rbSetStatus.Checked = false;
                ddlStatus.SelectedValue = "2";
                // Set Event Date Frequency
                rbOnceOnly.Checked = true;
                rbEvery.Checked = false;
                txtRepeatNum.Text = "1";
                ddlRepeatPeriod.SelectedValue = "6";
                // Set Event Date Action Item
                txtAITriggerNum.Text = "1";
                ddlAITriggerPeriod.SelectedValue = "3";
                ddlAITriggerWhen.SelectedValue = "0";
            }
            ViewState["DateID"] = EventDateID;
        }

        protected async Task Save_ItemNotesAsync(int ModuleID, int OrigID)
		{
            int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
            int IDType = 1;
            if (IsGroup == 1)
			{
                IDType = 0;
			}
            string Notes = txtNotes.Text;
            await Properties.Save_NotesAsync(ModuleID, OrigID, IDType, Notes);
		}

        protected async Task Save_ItemCategoriesAsync(int ModuleID, int OrigID, int IsGroup)
		{
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                string UserName = UserValues[1];

                foreach (RepeaterItem item in rptCategories.Items)
                {
                    HiddenField hdnCatID = (HiddenField)item.FindControl("hdnCatID");
                    CheckBox chkCategory = (CheckBox)item.FindControl("chkCategory");
                    int CatID = Convert.ToInt32(hdnCatID.Value);

                    Properties.Update_Category(ModuleID, OrigID, CatID, IsGroup, chkCategory.Checked);
                }
                if (IsGroup == 1)
                {
                    await Properties.Update_HistoryAsync(ModuleID, OrigID, IsGroup, UserName, 1);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpProperties, GetType(), "nologon", "alert('Your session has timed out. Please log on and try again.');", true);
            }
        }

        protected async Task Save_EventDateDetailsAsync()
		{
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                string UserName = UserValues[1];

                // Create and Set Variables
                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
                int OrigID = Convert.ToInt32(Request.QueryString["ItemID"]);
                int CatID = Convert.ToInt32(gvDates.DataKeys[gvDates.SelectedIndex].Values["CatID"]);
                int SetType = 0;
                int DateType = 2;
                int Repeat = 0;
                int IntervalNum = 1;
                int IntervalType = 6;
                DateTime DateValue = Convert.ToDateTime("1900-01-01");
                int TriggerNum = Convert.ToInt32(txtAITriggerNum.Text);
                int TriggerType = Convert.ToInt32(ddlAITriggerPeriod.SelectedValue);
                DateTime? TriggerDate = Convert.ToDateTime("1900-01-01");
                int TriggerBeforeAfter = Convert.ToInt32(ddlAITriggerWhen.SelectedValue);

                // If not set
                if (rbNotSet.Checked)
                {
                    SetType = 0;
                }

                // If set on specific date
                if (rbSetDate.Checked)
                {
                    SetType = 1;
                    DateType = 0;
                    DateValue = Convert.ToDateTime(txtSetDate.Text);
                }

                // If set based on status
                if (rbSetStatus.Checked)
                {
                    SetType = 2;
                    DateType = Convert.ToInt32(ddlStatus.SelectedValue);
                }

                // If repeating.
                if (rbEvery.Checked)
                {
                    Repeat = 1;
                    IntervalNum = Convert.ToInt32(txtRepeatNum.Text);
                    IntervalType = Convert.ToInt32(ddlRepeatPeriod.SelectedValue);
                }

                await Properties.Save_EventDateAsync(ModuleID, IsGroup, OrigID, CatID, SetType, DateType, Repeat, IntervalNum, IntervalType, DateValue, TriggerNum, TriggerType, TriggerDate, TriggerBeforeAfter);
                await Properties.Update_HistoryAsync(ModuleID, OrigID, IsGroup, UserName, 0);
                await Get_ItemHistoryAsync(OrigID, ModuleID, IsGroup);
                int IDType = 1;
                if (IsGroup == 1)
                {
                    IDType = 0;
                }
                await Get_EventDatesAsync(ModuleID, OrigID, IDType);
            }
            else
			{
                ScriptManager.RegisterStartupScript(udpProperties, GetType(), "nologon", "alert('Your session has timed out. Please log on and try again.');", true);
			}
		}

        #endregion

        #region GridView

        protected void gvRoles_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvRoles, "Select$" + e.Row.RowIndex);
            }
        }

        protected async void gvRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                gvRoleMembers.SelectedIndex = -1;
                // Get user information from authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                int UserStatus = Convert.ToInt32(UserValues[3]);

                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                int ID = Convert.ToInt32(Request.QueryString["ItemID"]);
                int CatID = Convert.ToInt32(gvRoles.DataKeys[gvRoles.SelectedIndex].Values["CatID"]);
                int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);

                await Get_RoleMembersAsync(ModuleID, ID, CatID, IsGroup);

                if (UserStatus == 1)
                {
                    btnAddRoles.Visible = true;
                    btnRemoveRole.Visible = false;
                    if (IsGroup == 1 && gvRoles.SelectedIndex > -1)
                    {
                        btnApplySubFolders.Enabled = true;
                        btnApplySubItems.Enabled = true;
                    }
                }
                else if (UserStatus == 0)
                {
                    bool HasPermission = await P3General.HasRolePermissionAsync(ModuleID, ID, UserID, IsGroup);
                    if (HasPermission)
                    {
                        btnAddRoles.Visible = true;
                        btnRemoveRole.Visible = false;
                        if (IsGroup == 1 && gvRoles.SelectedIndex != -1)
                        {
                            btnApplySubFolders.Enabled = true;
                            btnApplySubItems.Enabled = true;
                        }
                    }
                }
            }
        }

        protected void gvRoleMembers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvRoleMembers, "Select$" + e.Row.RowIndex);

                int ControlType = Convert.ToInt32(gvRoleMembers.DataKeys[e.Row.RowIndex].Values["ControlType"]);
                Image imgRoleMember = (Image)e.Row.Cells[0].FindControl("imgRoleMember");
                Label lblMemberType = (Label)e.Row.Cells[2].FindControl("lblMemberType");
                if (ControlType == 1)
                {
                    imgRoleMember.ImageUrl = "~/images/user.png";
                    lblMemberType.Text = "User";

                }
                else
                {
                    imgRoleMember.ImageUrl = "~/images/entity.png";
                    lblMemberType.Text = "Entity";
                }
            }
        }

        protected async void gvRoleMembers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                // Get user information from authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                int UserStatus = Convert.ToInt32(UserValues[3]);

                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                int OrigID = Convert.ToInt32(Request.QueryString["ItemID"]);
                int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);

                if (UserStatus == 1) // Administrator
                {
                    btnRemoveRole.Visible = true;
                }
                else if (UserStatus == 0) // Normal User with permission
                {
                    bool HasPermission = await P3General.HasRolePermissionAsync(ModuleID, OrigID, UserID, IsGroup);
                    if (HasPermission)
                    {
                        btnRemoveRole.Visible = true;
                    }
                }
            }
        }

        protected void gvTraining_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string ItemID = gvTraining.DataKeys[e.Row.RowIndex].Values["ItemID"].ToString();
                string ObjTypeID = gvTraining.DataKeys[e.Row.RowIndex].Values["ObjTypeID"].ToString();
                string ParentGroupID = gvTraining.DataKeys[e.Row.RowIndex].Values["ParentGroupID"].ToString();
                string strVar = "12," + ItemID + "," + ObjTypeID + "," + ParentGroupID + ",0";
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvTraining, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("ondblclick", "openRecordWindow(" + strVar + ");");
            }
        }

        protected void gvEventDates_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvEventDates, "Select$" + e.Row.RowIndex);

                int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
                DateTime TriggerDate = Convert.ToDateTime(e.Row.Cells[2].Text);
                if (IsGroup == 1)
				{
                    e.Row.Cells[1].Text = string.Empty;
                    e.Row.Cells[2].Text = string.Empty;
				}

                if (e.Row.Cells[2].Text.Contains("1/1/1900"))
				{
                    e.Row.Cells[2].Text = string.Empty;
                }
            }
        }

        protected async void gvEventDates_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SelectedCatID = Convert.ToInt32(gvEventDates.DataKeys[gvEventDates.SelectedIndex].Values["CatID"]);
            foreach (GridViewRow gvr in gvDates.Rows)
            {
                int DateCatID = Convert.ToInt32(gvDates.DataKeys[gvr.RowIndex].Values["CatID"]);
                if (SelectedCatID == DateCatID)
                {
                    gvDates.SelectedIndex = gvr.RowIndex;
                    int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                    int OrigID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
                    int IDType = 1;
                    if (IsGroup == 1)
                    {
                        IDType = 0;
                    }
                    await Get_EventDateDetailsAsync(ModuleID, OrigID, DateCatID, IDType);
                }
            }
        }

        protected void gvDates_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvDates, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
            }
        }

        protected async void gvDates_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CatID = Convert.ToInt32(gvDates.DataKeys[gvDates.SelectedIndex].Values["CatID"]);
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int OrigID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
            int IDType = 1;
            if (IsGroup == 1)
			{
                IDType = 0;
			}

            await Get_EventDateDetailsAsync(ModuleID, OrigID, CatID, IDType);
            mpeEditEventDate.Show();
        }        

        #endregion

        #region Repeater

        protected void rptCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataTable dtItemCategories = (DataTable)ViewState["ItemCategories"];
                CheckBox cbCategory = (CheckBox)e.Item.FindControl("chkCategory");
                HiddenField hdnCatID = (HiddenField)e.Item.FindControl("hdnCatID");
                foreach (DataRow dr in dtItemCategories.Rows)
                {
                    if (dr["CatID"].ToString() == hdnCatID.Value)
                    {
                        cbCategory.Checked = true;
                    }
                }
            }
        }

		#endregion
		
	}
}