using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using Paradigm3.datalayer;
using System.Web.Security;
using System.Web.Configuration;
using System.Configuration;
using System.Reflection;
using System.Threading.Tasks;
using System.Security.Principal;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using Saml;
using System.Threading;
using System.Globalization;
using System.Resources;

namespace Paradigm3
{
    public partial class Default : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Properties session state
                Session["IsGroup"] = 1;
                Session["IsEvidenceCheck"] = "False";

                // Get application version.
                string version = Assembly.GetExecutingAssembly().GetName().Version.ToString();
                lblVersion.Text = "Version: " + version;
                await PopulateDLinksAsync();

                //SAML Settings
                string ssoAuth = ConfigurationManager.AppSettings["UseSSO"];
                string ssoURL = ConfigurationManager.AppSettings["SSOURL"];
                string issuer = ConfigurationManager.AppSettings["Issuer"];
                string ACS = ConfigurationManager.AppSettings["ACSUrl"];

                if (ssoAuth.ToUpper() == "TRUE" && Session["IsValidSAML"] == null)
                {                    
                    var samlEndpoint = ssoURL;
                    var request = new AuthRequest(issuer, ACS);
                    //redirect the user to the SAML provider
                    Response.Redirect(request.GetRedirectUrl(samlEndpoint), false);
                }
                else
                {
                    // Retrieve authentication type from web.config
                    AuthenticationSection authSection = (AuthenticationSection)ConfigurationManager.GetSection("system.web/authentication");
                    string authType = authSection.Mode.ToString();
                    if (authType == "Windows")
                    {
                        // Get windows Domain and User Name and compare to Paradigm 3 User List.
                        string FullUserInfo = @"" + User.Identity.Name;
                        if (string.IsNullOrEmpty(FullUserInfo))
                        {
                            FullUserInfo = @"" + WindowsIdentity.GetCurrent().Name.ToString();
                        }
                        //ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "", "alert('" + FullUserInfo + "');", true);
                        string[] DomainAndUser = FullUserInfo.Split('\\');
                        //ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "", "alert('" + DomainAndUser[0] + "-" + DomainAndUser[1] + "');", true);
                        if (DomainAndUser[0].Length > 0)
                        {
                            Set_CheckLogon(false);
                            string WinDomainName = DomainAndUser[0];
                            string WinUserName = DomainAndUser[1];
                            //string P3Domain = string.Empty;
                            bool IsDomain = false;
                            if (ConfigurationManager.AppSettings["DomainName"] != null)
                            {

                                string[] domainList = ConfigurationManager.AppSettings["DomainName"].Split(',');
                                foreach (var d in domainList)
                                {
                                    if (WinDomainName.ToUpper() == d.ToUpper())
                                    {
                                        IsDomain = true;
                                    }
                                }
                            }

                            if (IsDomain && P3Security.IsWinP3User(WinUserName))
                            {
                                Do_WinP3Logon(WinUserName);
                            }
                            else
                            {
                                //ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "", "alert('Windows user information does not match Paradigm');", true);
                                Set_CheckLogon(false);
                            }
                        }
                        else
                        {
                            Set_CheckLogon(false);
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "", "alert('Unable to retrieve Windows User information');", true);
                        }
                    }
                    else
                    {
                        // Set initial button properties.
                        if (User.Identity.IsAuthenticated)
                        {
                            Set_CheckLogon(true);
                        }
                        else
                        {
                            Set_CheckLogon(false);
                        }
                    }
                }
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "Default.aspx";
        }

        protected override void InitializeCulture()
        {
            GlobalizationSection configSection = (GlobalizationSection)ConfigurationManager.GetSection("system.web/globalization");

            string language = configSection.Culture;

            //Detect User's Language.
            if (Request.UserLanguages != null)
            {
                //Set the Language.
                language = Request.UserLanguages[0];
            }

            //Set the Culture.
            Thread.CurrentThread.CurrentCulture = new CultureInfo(language);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
        }

        protected void GoTo_Folder(int ModuleID, int GroupID)
        {
            string GroupName = P3General.Get_GroupName(ModuleID, GroupID);
            if (!string.IsNullOrEmpty(GroupName))
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

                pnlDirectLink.Visible = false;
                pnlTreeView.Visible = true;
                pnlHome.Visible = false;
                pnlList.Visible = true;
                pnlLogon.Visible = false;
                pnlChangePW.Visible = false;

                string rootImageUrl;

                switch (ModuleID)
                {
                    case 3:
                        lblModuleLabel.Text = "Documents";
                        rootImageUrl = "~/images/documentroot.png";
                        break;
                    case 4:
                        lblModuleLabel.Text = "Records";
                        rootImageUrl = "~/images/recordroot.png";
                        break;
                    case 6:
                        lblModuleLabel.Text = "Improvements";
                        rootImageUrl = "~/images/improvementroot.png";
                        break;
                    case 12:
                        lblModuleLabel.Text = "Training";
                        rootImageUrl = "~/images/trainingroot.png";
                        break;
                    default:
                        lblModuleLabel.Text = "Documents";
                        rootImageUrl = "~/images/documentroot.png";
                        break;
                }
                p3Tree.Nodes.Clear();
                p3Tree.RootNodeStyle.ImageUrl = rootImageUrl;
                PopulateRootLevel(ModuleID, UserID, GroupID.ToString());
            }
            else
            {
                // Select Home Tab on menu and set display properties.
                mnuModules.Items[0].Selected = true;
                pnlDirectLink.Visible = true;
                pnlTreeView.Visible = false;
                pnlHome.Visible = true;
                pnlList.Visible = false;
                pnlLogon.Visible = false;
                pnlChangePW.Visible = false;
            }

        }

        #region Menu Functions & Subroutines

        private async Task PopulateDLinksAsync()
        {
            string SiteID = ConfigurationManager.AppSettings["SiteID"];
            DataTable dt = await P3General.Get_DirectLinksAsync(SiteID);
            DataView dv = dt.DefaultView;
            dv.Sort = "Name asc";
            DataTable SortedDt = dv.ToTable();

            foreach (DataRow dr in SortedDt.Rows)
            {
                string GroupName = "  " + dr["Name"].ToString();
                string GroupID = dr["GroupID"].ToString();
                string ModuleID = dr["ModuleID"].ToString();
                string GroupValue = ModuleID + "|" + GroupID;

                MenuItem item = new MenuItem()
                {
                    Text = GroupName,
                    Value = GroupValue,
                    ImageUrl = "~/images/folder.png"
                };
                Menu1.Items.Add(item);
            }
        }

        protected void menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            // set toolbar button properties.
            DisableButtons();
            Session["IsGroup"] = 1;
            pnlProperties.Visible = true;

            // Get ParentGroupID, ModId, and default user details from menu item value.
            string valueString = e.Item.Value.ToString();
            string[] arrLink = valueString.Split('|');
            string parentGroupID = arrLink[1].ToString();
            int moduleID = Convert.ToInt32(arrLink[0]);
            Session["ModuleID"] = moduleID;
            int userID = 0;
            string RootImageUrl = "~/images/documentroot.png";

            // If user is logged on, retrieve user data.
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                //Get user information from http cookie.
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                userID = Convert.ToInt32(UserValues[0]);
            }

            // Set display properties.
            pnlDirectLink.Visible = false;
            pnlTreeView.Visible = true;
            pnlHome.Visible = false;
            pnlList.Visible = true;
            pnlLogon.Visible = false;
            pnlChangePW.Visible = false;
            switch (moduleID)
            {
                case 4:
                    lblModuleLabel.Text = "Records";
                    RootImageUrl = "~/images/recordroot.png";
                    break;
                case 6:
                    lblModuleLabel.Text = "Improvements";
                    RootImageUrl = "~/images/improvementroot.png";
                    break;
                case 12:
                    lblModuleLabel.Text = "Training";
                    RootImageUrl = "~/images/trainingroot.png";
                    break;
                case 14:
                    lblModuleLabel.Text = "Action Items";
                    RootImageUrl = "~/images/actionitem.png";
                    break;
                default:
                    lblModuleLabel.Text = "Documents";
                    break;
            }
            PopulateRootLevel(moduleID, userID, parentGroupID);
            p3Tree.Nodes[0].ImageUrl = RootImageUrl;
            p3Tree.Nodes[0].Selected = true;
            p3Tree.Nodes[0].Expand();
            mnuModules.Items[0].Selected = true;

        }

        protected void mnuModules_MenuItemClick(object sender, EventArgs e)
        {
            Session["SelUserID"] = null;
            //throw new Exception("This is a test.");
            // Clear all grid views
            gvUsersList.DataSource = null;
            gvUsersList.DataBind();
            gvItemList.DataSource = null;
            gvItemList.DataBind();
            gvRecordList.DataSource = null;
            gvRecordList.DataBind();
            gvAIList.DataSource = null;
            gvAIList.DataBind();

            // Place ModuleID into Session State.
            Session["ModuleID"] = mnuModules.SelectedValue;

            // Disable toolbar buttons
            DisableButtons();

            // Get ModuleID from Session.
            int moduleID = Convert.ToInt32(Session.Contents["ModuleID"]);
            int userID = 0;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                userID = Convert.ToInt32(UserValues[0]);
            }

            string parentGroupID = string.Empty;
            string rootImageURL = string.Empty;
            switch (moduleID)
            {
                case 0:
                    bool IsSelected = false;
                    foreach (MenuItem mi in Menu1.Items)
                    {
                        if (mi.Selected)
                        {
                            IsSelected = true;
                        }
                    }
                    if (IsSelected)
                    {
                        Menu1.SelectedItem.Selected = false;
                    }
                    rootImageURL = "~/images/root.png";
                    pnlDirectLink.Visible = true;
                    pnlTreeView.Visible = false;
                    pnlHome.Visible = true;
                    pnlList.Visible = false;
                    pnlLogon.Visible = false;
                    txtUserName.Text = string.Empty;
                    txtPassword.Text = string.Empty;
                    pnlChangePW.Visible = false;
                    lblModuleLabel.Text = string.Empty;
                    if (userID == 0)
                    {
                        ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "test", "resetHome()", true);
                    }
                    break;
                case 1:
                    parentGroupID = "1";
                    rootImageURL = "~/images/users_sm.png";
                    pnlDirectLink.Visible = false;
                    pnlTreeView.Visible = true;
                    pnlHome.Visible = false;
                    pnlList.Visible = true;
                    pnlLogon.Visible = false;
                    pnlChangePW.Visible = false;
                    lblModuleLabel.Text = "Users";

                    // Report
                    pnlReport.Visible = false;
                    pnlProgress.Visible = false;
                    break;
                case 3:
                    parentGroupID = ConfigurationManager.AppSettings["DefDocGroupID"];
                    rootImageURL = "~/images/documentroot.png";
                    pnlDirectLink.Visible = false;
                    pnlTreeView.Visible = true;
                    pnlHome.Visible = false;
                    pnlList.Visible = true;
                    pnlLogon.Visible = false;
                    pnlChangePW.Visible = false;
                    lblModuleLabel.Text = "Documents";

                    // Report
                    pnlReport.Visible = true;
                    pnlProgress.Visible = false;
                    break;
                case 4:
                    parentGroupID = ConfigurationManager.AppSettings["DefRecGroupID"];
                    rootImageURL = "~/images/recordroot.png";
                    pnlDirectLink.Visible = false;
                    pnlTreeView.Visible = true;
                    pnlHome.Visible = false;
                    pnlList.Visible = true;
                    pnlLogon.Visible = false;
                    pnlChangePW.Visible = false;
                    lblModuleLabel.Text = "Records";

                    // Report
                    pnlReport.Visible = true;
                    pnlProgress.Visible = false;
                    break;
                case 6:
                    parentGroupID = ConfigurationManager.AppSettings["DefImpGroupID"];
                    rootImageURL = "~/images/improvementroot.png";
                    pnlDirectLink.Visible = false;
                    pnlTreeView.Visible = true;
                    pnlHome.Visible = false;
                    pnlList.Visible = true;
                    pnlLogon.Visible = false;
                    pnlChangePW.Visible = false;
                    lblModuleLabel.Text = "Improvements";
                    // Report
                    pnlReport.Visible = true;
                    pnlProgress.Visible = false;
                    break;
                case 12:
                    parentGroupID = ConfigurationManager.AppSettings["DefTrainGroupID"];
                    rootImageURL = "~/images/trainingroot.png";
                    pnlDirectLink.Visible = false;
                    pnlTreeView.Visible = true;
                    pnlHome.Visible = false;
                    pnlList.Visible = true;
                    pnlLogon.Visible = false;
                    pnlChangePW.Visible = false;
                    lblModuleLabel.Text = "Training";

                    // Report
                    pnlReport.Visible = true;
                    pnlProgress.Visible = false;
                    break;
                case 14:
                    parentGroupID = ConfigurationManager.AppSettings["DefAIGroupID"];
                    rootImageURL = "~/images/actionitemroot.png";
                    pnlDirectLink.Visible = false;
                    pnlTreeView.Visible = true;
                    pnlHome.Visible = false;
                    pnlList.Visible = true;
                    pnlLogon.Visible = false;
                    pnlChangePW.Visible = false;
                    lblModuleLabel.Text = "Action Items";

                    // Report
                    pnlReport.Visible = false;
                    pnlProgress.Visible = false;
                    break;
            }

            if (moduleID != 0)
            {
                p3Tree.RootNodeStyle.ImageUrl = rootImageURL;
                PopulateRootLevel(moduleID, userID, parentGroupID.ToString());
                p3Tree.Nodes[0].Expand();
            }
        }

        protected void mnuReports_MenuItemClick(object sender, MenuEventArgs e)
        {
            try
            {
                string ModuleID = Session.Contents["ModuleID"].ToString();
                string GroupID = ConfigurationManager.AppSettings["DefDocGroupID"];
                if (p3Tree.SelectedValue != string.Empty)
                {
                    GroupID = p3Tree.SelectedValue;
                }
                string ReportID = e.Item.Value;

                mnuReports.Items.Clear();
                rptDropDown.Visible = false;

                string strVar = ModuleID + "," + GroupID + "," + ReportID;
                ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "report", "openReportWindow(" + strVar + ")", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "report", "alert(" + ex.Message + ")", true);
            }

        }

        protected void mnuAddDoc_MenuItemClick(object sender, MenuEventArgs e)
        {
            string ParentGroupID = p3Tree.SelectedValue;
            string AddOption = e.Item.Value;
            string Status = string.Empty;
            int ModuleID = Convert.ToInt32(Session["ModuleID"]);

            switch (ModuleID)
            {
                case 1:
                    Session["SelUserID"] = 0;
                    ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "AddDocumentOrGroup", "openAddDocWindow(1," + ParentGroupID + "," + AddOption + "," + Status + ");", true);
                    break;
                case 3:
                    switch (AddOption)
                    {
                        case "3003":
                            Status = "2";
                            break;
                        case "3003_9":
                            Status = "9";
                            break;
                        case "3003_4":
                            Status = "4";
                            break;
                        case "3003_5":
                            Status = "5";
                            break;
                        default:
                            Status = AddOption;
                            break;
                    }
                    ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "AddDocumentOrGroup", "openAddDocWindow(" + ModuleID.ToString() + "," + ParentGroupID + "," + AddOption + "," + Status + ");", true);
                    break;
                case 4:
                case 6:
                case 12:
                    switch (AddOption)
                    {
                        case "4004":
                        case "6004":
                        case "12004":
                            ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "AddGroup", "openAddDocWindow(" + ModuleID.ToString() + "," + ParentGroupID + "," + AddOption + "," + Status + ");", true);
                            break;
                        default:
                            int ObjTypeID = P3General.Get_ObjTypeID(ModuleID, Convert.ToInt32(ParentGroupID));
                            ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "AddRecord", "addRecord(" + ModuleID.ToString() + ",0," + ObjTypeID.ToString() + "," + ParentGroupID + ");", true);
                            break;
                    }
                    break;
            }

            pnlAddDropDown.Visible = false;
        }

        protected void mnuRename_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);

                int ModuleID = Convert.ToInt32(mnuModules.SelectedValue);
                int? OrigID;
                int value = Convert.ToInt32(mnuRename.SelectedValue);
                if (value == 0)
                {
                    GridView gv = new GridView();
                    switch (ModuleID)
                    {
                        case 1:
                            gv = gvUsersList;
                            break;
                        case 4:
                        case 6:
                        case 12:
                            gv = gvRecordList;
                            break;
                        case 14:
                            gv = gvAIList;
                            break;
                        default:
                            gv = gvItemList;
                            break;
                    }
                    if (gv.SelectedIndex != -1)
                    {
                        OrigID = Convert.ToInt32(gv.DataKeys[gv.SelectedIndex].Values["OrigID"]);
                        if (ModuleID == 1)
                        {
                            OrigID = Convert.ToInt32(gv.DataKeys[gv.SelectedIndex].Values["UserID"]);
                        }
                        ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "openRename", "openRenameWindow(" + ModuleID + "," + OrigID + "," + UserID + ",'false');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "noItem", "alert('You must select an item to rename.');", true);
                    }
                }
                else
                {
                    OrigID = Convert.ToInt32(p3Tree.SelectedValue);
                    ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "openRename", "openRenameWindow(" + ModuleID + "," + OrigID + "," + UserID + ",'true');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "noLogin", "alert('Your session has timed out. Please login and try again');", true);
            }
            RenameDropdown.Visible = false;
        }

        protected void mnuMove_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                int ModuleID = Convert.ToInt32(mnuModules.SelectedValue);
                string SourcePath = Server.UrlEncode(p3Tree.SelectedNode.ValuePath);

                int? OrigID = null;
                int value = Convert.ToInt32(e.Item.Value);

                if (value == 0)
                {
                    GridView gv = new GridView();
                    switch (ModuleID)
                    {
                        case 1:
                            gv = gvUsersList;
                            break;
                        case 4:
                        case 6:
                        case 12:
                            gv = gvRecordList;
                            break;
                        case 14:
                            gv = gvAIList;
                            break;
                        default:
                            gv = gvItemList;
                            break;
                    }
                    if (gv.SelectedIndex != -1)
                    {
                        OrigID = Convert.ToInt32(gv.DataKeys[gv.SelectedIndex].Values["OrigID"]);
                        if (ModuleID == 1)
                        {
                            OrigID = Convert.ToInt32(gv.DataKeys[gv.SelectedIndex].Values["UserID"]);
                        }
                        ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "openMove", "openMoveWindow(" + ModuleID + "," + OrigID + "," + UserID + ",'" + SourcePath + "','false');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "noItem", "alert('You must select an item to rename.');", true);
                    }
                }
                else
                {
                    OrigID = Convert.ToInt32(p3Tree.SelectedValue);
                    ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "openRename", "openMoveWindow(" + ModuleID + "," + OrigID + "," + UserID + ",'" + SourcePath + "','true');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "noLogin", "alert('Your session has timed out. Please login and try again');", true);
            }
            MoveDropdown.Visible = false;
        }

        protected void mnuDelete_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                int ModuleID = Convert.ToInt32(mnuModules.SelectedValue);

                int? OrigID = null;
                int value = Convert.ToInt32(mnuDelete.SelectedValue);

                if (value == 0)
                {
                    GridView gv = new GridView();
                    switch (ModuleID)
                    {
                        case 1:
                            gv = gvUsersList;
                            break;
                        case 4:
                        case 6:
                        case 12:
                            gv = gvRecordList;
                            break;
                        case 14:
                            gv = gvAIList;
                            break;
                        default:
                            gv = gvItemList;
                            break;
                    }
                    if (gv.SelectedIndex != -1)
                    {
                        OrigID = Convert.ToInt32(gv.DataKeys[gv.SelectedIndex].Values["OrigID"]);
                        if (ModuleID == 1)
                        {
                            OrigID = Convert.ToInt32(gv.DataKeys[gv.SelectedIndex].Values["UserID"]);
                        }
                        ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "openRename", "openDeleteWindow(" + ModuleID.ToString() + "," + OrigID.ToString() + "," + UserID.ToString() + ",'false');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "noItem", "alert('You must select an item to rename.');", true);
                    }
                }
                else
                {
                    OrigID = Convert.ToInt32(p3Tree.SelectedValue);
                    ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "openRename", "openDeleteWindow(" + ModuleID + "," + OrigID + "," + UserID + ",'true');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "noLogin", "alert('Your session has timed out. Please login and try again');", true);
            }
            DeleteDropdown.Visible = false;
        }

        protected async void ContextMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            Menu mnu = (Menu)sender;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                // Get user status information from authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);

                int ModuleID = Convert.ToInt32(Session["ModuleID"]);
                if (mnu.ID == "mnuTVContext")
                {
                    int GroupID = Convert.ToInt32(hdnNewSelectedNodeID.Value);
                    string valPath = hdnNewSelectedNodePath.Value.Replace(@"\\", @"/");
                    switch (mnu.SelectedValue)
                    {
                        case "properties":
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "opengrouproperties", "openProperties(" + GroupID + "," + ModuleID + ",1);", true);
                            break;
                        case "move":
                            string SourcePath = Server.UrlEncode(p3Tree.SelectedNode.ValuePath);
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "movegroup", "openMoveWindow(" + ModuleID + "," + GroupID + "," + UserID + ",'" + SourcePath + "',true);", true);
                            break;
                        case "copy":
                            string CopyPath = Server.UrlEncode(p3Tree.SelectedNode.ValuePath);
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "copygroup", "openCopyWindow(" + ModuleID + "," + GroupID + "," + UserID + ",'" + CopyPath + "',true);", true);
                            break;
                        case "evidence":
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "evidencegroup", "openEvidenceWindow(" + ModuleID + "," + GroupID + "," + UserID + "," + ViewState["IsEvidenceCheck"].ToString() + ",true);", true);
                            break;
                        case "delete":
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "deletegroup", "openDeleteWindow(" + ModuleID + "," + GroupID + "," + UserID + ",true);", true);
                            break;
                        case "rename":
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "renamegroup", "openRenameWindow(" + ModuleID + "," + GroupID + "," + UserID + ",true);", true);
                            break;
                        case "setrepublish":
                            try
                            {
                                await P3General.Set_RepublishAsync(GroupID, UserID, true);
                                ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewStatus", "alert('Successfully set re-publish for group and all sub-groups');", true);
                            }
                            catch (Exception ex)
                            {
                                ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewStatus", "alert('" + ex.Message + "');", true);
                            }

                            break;
                    }
                    TreeNode tn = p3Tree.FindNode(valPath);
                    tn.Selected = true;
                }
                else
                {
                    int NewID = Convert.ToInt32(hdnContextID.Value);
                    int ItemID = 0;
                    int OrigID = 0;
                    int index = 0;
                    ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "alert", "console.log(" + NewID.ToString() + ");", true);
                    switch (ModuleID)
                    {
                        case 1:
                            foreach (GridViewRow gvr in gvUsersList.Rows)
                            {
                                ItemID = Convert.ToInt32(gvUsersList.DataKeys[gvr.RowIndex].Values["UserID"]);
                                if (NewID == ItemID)
                                {
                                    gvUsersList.SelectedIndex = gvr.RowIndex;
                                    index = gvr.RowIndex;
                                }
                            }
                            break;
                        case 4:
                        case 6:
                        case 12:
                            foreach (GridViewRow gvr in gvRecordList.Rows)
                            {
                                ItemID = Convert.ToInt32(gvRecordList.DataKeys[gvr.RowIndex].Values["ItemID"]);
                                if (NewID == ItemID)
                                {
                                    gvRecordList.SelectedIndex = gvr.RowIndex;
                                    index = gvr.RowIndex;
                                    OrigID = Convert.ToInt32(gvRecordList.DataKeys[gvr.RowIndex].Values["OrigID"]);
                                }
                            }
                            break;
                        case 14:
                            foreach (GridViewRow gvr in gvAIList.Rows)
                            {
                                ItemID = Convert.ToInt32(gvAIList.DataKeys[gvr.RowIndex].Values["AIID"]);
                                if (NewID == ItemID)
                                {
                                    gvAIList.SelectedIndex = gvr.RowIndex;
                                    index = gvr.RowIndex;
                                }
                            }
                            break;
                        default:
                            foreach (GridViewRow gvr in gvItemList.Rows)
                            {
                                ItemID = Convert.ToInt32(gvItemList.DataKeys[gvr.RowIndex].Values["ItemID"]);
                                if (NewID == ItemID)
                                {
                                    OrigID = Convert.ToInt32(gvItemList.DataKeys[gvr.RowIndex].Values["OrigID"]);
                                    gvItemList.SelectedIndex = gvr.RowIndex;
                                    index = gvr.RowIndex;
                                }
                            }
                            break;
                    }

                    switch (mnu.SelectedValue)
                    {
                        case "view":
                            int ItemStatus = 0;
                            switch (ModuleID)
                            {
                                case 1:
                                    int selUserID = Convert.ToInt32(gvUsersList.DataKeys[index].Values["UserID"]);
                                    Session["SelUserID"] = selUserID;
                                    ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "ViewUser", "openProperties(0, 1, 0);", true);
                                    break;
                                case 4:
                                case 6:
                                case 12:
                                    ItemID = Convert.ToInt32(gvRecordList.DataKeys[index].Values["ItemID"]);
                                    int RecordParentGroupID = Convert.ToInt32(p3Tree.SelectedNode.Value);
                                    int ObjTypeID = P3General.Get_ObjTypeID(ModuleID, RecordParentGroupID);
                                    ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewRecord", "openRecordWindow(" + ModuleID + "," + ItemID + "," + ObjTypeID + "," + RecordParentGroupID + ",0);", true);
                                    break;
                                default:
                                    string FileStatus = gvItemList.SelectedRow.Cells[3].Text;
                                    bool IsItemID = false;
                                    switch (FileStatus)
                                    {
                                        case "Draf": // Draft
                                        case "Open": // Open
                                        case "Coll": // Collaborate
                                        case "Revi": // Review
                                        case "Read": // Ready
                                        case "Pend": // Pending
                                            IsItemID = true;
                                            break;
                                        case "Curr": // Current
                                        case "Comp": // Complete
                                        case "Evid": // Evidence
                                            IsItemID = false;
                                            break;
                                    }
                                    string pubPath = ConfigurationManager.AppSettings["PublishPath"];
                                    ItemStatus = Convert.ToInt32(gvItemList.DataKeys[index].Values["Status"]);
                                    string FileExtension = gvItemList.DataKeys[index].Values["FileExtension"].ToString();
                                    int TypeOfPublish = Convert.ToInt32(gvItemList.DataKeys[index].Values["TypeOfPublish"]);
                                    ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewDocument", "openDocWindow(" + ItemID + "," + OrigID + "," + ItemStatus + ",'" + IsItemID.ToString() + "'," + pubPath + ",'" + FileExtension + "'," + TypeOfPublish + ")", true);
                                    break;
                            }

                            break;
                        case "properties":
                            if (ModuleID == 1)
                            {
                                OrigID = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                            }
                            Session["SelUserID"] = OrigID;
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "openitemproperties", "openProperties(" + ItemID + "," + ModuleID + "," + 0 + ");", true);
                            break;
                        case "move":
                            string SourcePath = Server.UrlEncode(p3Tree.SelectedNode.ValuePath);
                            if (ModuleID == 1)
                            {
                                OrigID = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                            }
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "moveitem", "openMoveWindow(" + ModuleID + "," + OrigID + "," + UserID + ",'" + SourcePath + "',false);", true);
                            break;
                        case "copy":
                            string copyPath = Server.UrlEncode(p3Tree.SelectedNode.ValuePath);
                            if (ModuleID == 1)
                            {
                                OrigID = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                            }
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "copyitem", "openCopyWindow(" + ModuleID + "," + OrigID + "," + UserID + ",'" + copyPath + "',false);", true);
                            break;
                        case "evidence":
                            if (ModuleID == 1)
                            {
                                OrigID = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                            }
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "evidencegroup", "openEvidenceWindow(" + ModuleID + "," + OrigID + "," + UserID + "," + 0 + ",true);", true);
                            break;
                        case "item":
                            if (ModuleID == 1)
                            {
                                OrigID = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                            }
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "evidencegroup", "openEvidenceWindow(" + ModuleID + "," + OrigID + "," + UserID + "," + 1 + ",true);", true);
                            break;
                        case "delete":
                            if (ModuleID == 1)
                            {
                                OrigID = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                            }
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "deleteitem", "openDeleteWindow(" + ModuleID + "," + OrigID + "," + UserID + ",false);", true);
                            break;
                        case "rename":
                            if (ModuleID == 1)
                            {
                                OrigID = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                            }
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "renameitem", "openRenameWindow(" + ModuleID + "," + OrigID + "," + UserID + ",false);", true);
                            break;
                        case "status":
                            ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewStatus", "openStatusWindow(" + ModuleID + "," + ItemID + "," + OrigID + ");", true);
                            break;
                        case "export":
                            ItemStatus = Convert.ToInt32(gvItemList.DataKeys[index].Values["Status"]);
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "exportitem", "openExportWindow(" + ModuleID + "," + OrigID + "," + UserID + "," + ItemStatus + ",true);", true);
                            break;
                        case "createactionitem":
                            if (ModuleID == 3)
                            {
                                ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "actionitem", "openCreateAIWindow(" + ModuleID + "," + OrigID + "," + UserID + ",true);", true);
                            }
                            break;
                        case "setrepublish":
                            try
                            {
                                await P3General.Set_RepublishAsync(OrigID, UserID, false);
                                ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewStatus", "alert('Item successfully set to re-publish');", true);
                            }
                            catch (Exception ex)
                            {
                                ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewStatus", "alert('" + ex.Message + "');", true);
                            }

                            break;
                    }
                }
            }
        }

        #endregion

        #region Button Click Events & Subroutines

        protected async void ImageButton_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string arg = btn.CommandArgument;
            AuthenticationSection authSection = (AuthenticationSection)ConfigurationManager.GetSection("system.web/authentication");
            string authType = authSection.Mode.ToString();
            string winDomainName = Environment.UserDomainName;
            string winUserName = Environment.UserName;

            switch (arg)
            {
                case "gotoLogon":
                    if (authType == "Windows")
                    {
                        string p3Domain = ConfigurationManager.AppSettings["DomainName"];
                        bool isP3User = P3Security.IsWinP3User(winUserName);
                        if (winDomainName == p3Domain && isP3User != false)
                        {
                            Do_WinP3Logon(winUserName);
                        }
                        else
                        {
                            pnlDirectLink.Visible = true;
                            pnlTreeView.Visible = false;
                            pnlHome.Visible = false;
                            pnlList.Visible = false;
                            pnlLogon.Visible = true;
                            pnlChangePW.Visible = false;
                            txtUserName.Focus();
                        }
                    }
                    else
                    {
                        pnlDirectLink.Visible = true;
                        pnlTreeView.Visible = false;
                        pnlHome.Visible = false;
                        pnlList.Visible = false;
                        pnlLogon.Visible = true;
                        pnlChangePW.Visible = false;
                        txtUserName.Focus();
                    }
                    break;
                case "doLogout":
                    // End session
                    DisableButtons();
                    P3Security.Do_Logout();
                    Set_CheckLogon(false);
                    ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "test", "window.history.pushState({}, document.title, '' + 'Default.aspx');parent.document.location.reload();", true);
                    break;
                case "AddItem":
                    RenameDropdown.Visible = false;
                    MoveDropdown.Visible = false;
                    DeleteDropdown.Visible = false;
                    rptDropDown.Visible = false;
                    mnuAddDoc.Items.Clear();
                    int AddModuleID = Convert.ToInt32(mnuModules.SelectedValue);
                    int AddParentGroupID = Convert.ToInt32(p3Tree.SelectedValue);
                    //int AddObjTypeID = P3General.Get_ObjTypeID(AddModuleID, AddParentGroupID);
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        //Retrieve http authentication cookie.
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                        //Get user information from http cookie.
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int UserID = Convert.ToInt32(UserValues[0]);

                        if (!pnlAddDropDown.Visible)
                        {
                            if (AddModuleID == 1)
                            {
                                mnuAddDoc.Items.Add(new MenuItem("Add New User", "1002"));
                                mnuAddDoc.Items.Add(new MenuItem("Add New Entity/Folder", "1004"));
                            }
                            else
                            {
                                DataTable dt = await P3General.GetAddPermissionListAsync(AddModuleID, AddParentGroupID, UserID);
                                if (dt.Rows.Count > 0)
                                {
                                    foreach (DataRow dr in dt.Rows)
                                    {
                                        int LevelID = Convert.ToInt32(dr["LevelID"]);
                                        string LevelCaption = dr["LevelCaption"].ToString();

                                        MenuItem mi = new MenuItem()
                                        {
                                            Text = LevelCaption,
                                            Value = LevelID.ToString()
                                        };

                                        switch (LevelID)
                                        {
                                            case 3002:
                                            case 4002:
                                            case 6002:
                                            case 12002:
                                                if (LevelID == 3002)
                                                {
                                                    mi.Text = "Add Item from Template";
                                                }
                                                mnuAddDoc.Items.Add(mi);
                                                break;
                                            case 3003:
                                                mnuAddDoc.Items.Add(mi);

                                                MenuItem miCurrent = new MenuItem()
                                                {
                                                    Text = "Import as Current",
                                                    Value = LevelID.ToString() + "_9"
                                                };
                                                mnuAddDoc.Items.Add(miCurrent);

                                                MenuItem miReady = new MenuItem()
                                                {
                                                    Text = "Import as Ready",
                                                    Value = LevelID.ToString() + "_4"
                                                };
                                                mnuAddDoc.Items.Add(miReady);

                                                MenuItem miReview = new MenuItem()
                                                {
                                                    Text = "Import as Review",
                                                    Value = LevelID.ToString() + "_5"
                                                };
                                                mnuAddDoc.Items.Add(miReview);
                                                break;
                                            case 3004:
                                            case 4004:
                                            case 6004:
                                            case 12004:
                                                mnuAddDoc.Items.Add(mi);
                                                break;
                                            case 3054:
                                                mnuAddDoc.Items.Add(mi);
                                                break;
                                        }
                                    }
                                }
                                else
                                {
                                    MenuItem noItems = new MenuItem()
                                    {
                                        Text = "No Types Available",
                                        Value = "0"
                                    };
                                    mnuAddDoc.Items.Add(noItems);
                                }
                            }

                            pnlAddDropDown.Visible = true;
                        }
                        else
                        {
                            pnlAddDropDown.Visible = false;
                        }
                    }
                    break;
                case "EditItem":
                    // If user is authenticated, run tasks, else alert to login.
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        string UserID = UserValues[0];
                        string UserFullName = UserValues[1];

                        // Return item details
                        string editOrigID = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["OrigID"].ToString();
                        DataTable dtEditItem = Document.Get_Latest(Convert.ToInt32(editOrigID));
                        string editItemID = dtEditItem.Rows[0]["ItemID"].ToString();
                        string editFileName = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["Name"].ToString();
                        string editFileExtension = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["FileExtension"].ToString();
                        string editFileLabel = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["LabelName"].ToString();
                        string editIDFileName = "D" + editItemID.PadLeft(7, '0') + "." + editFileExtension;
                        string editCopyFileName = editFileName + "." + editFileExtension;
                        string editItemStatus = dtEditItem.Rows[0]["Status"].ToString();

                        // Return CheckoutToServer value from server if exsists. Else false.
                        bool CheckoutToServer = false;
                        if (ConfigurationManager.AppSettings["CheckoutToServer"] != null)
                        {
                            CheckoutToServer = Convert.ToBoolean(ConfigurationManager.AppSettings["CheckoutToServer"]);
                        }

                        // If item is not already checked out
                        if (btnEdit.ImageUrl == "~/images/checkout.png")
                        {
                            // Return Path details
                            string DocsPath = ConfigurationManager.AppSettings["DocumentPath"];
                            string PublicPath = @"" + ConfigurationManager.AppSettings["PublicPath"] + UserID.ToString() + "/";
                            if (!Directory.Exists(Server.MapPath(PublicPath)))
                            {
                                Directory.CreateDirectory(Server.MapPath(PublicPath));
                            }

                            try
                            {
                                // Copy file from DOCS to Public
                                using (FileStream source = File.Open(DocsPath + editIDFileName, FileMode.Open, FileAccess.ReadWrite))
                                {
                                    using (FileStream destination = File.Create(Server.MapPath(PublicPath + editCopyFileName)))
                                    {
                                        await source.CopyToAsync(destination);
                                        Session["IsCheckedOut"] = true;
                                        await Document.Edit_Document_HistoryAsync(3, Convert.ToInt32(editOrigID), Path.GetFileNameWithoutExtension(editCopyFileName), editFileLabel, "Item has been checked out.", UserFullName, string.Empty);
                                        await Document.Update_CheckOutStatusAsync(Convert.ToInt32(editItemID), UserFullName, 1);

                                    }

                                    // If CheckoutToServer to things, else download checked out file.
                                    if (!CheckoutToServer)
                                    {
                                        PublicPath = PublicPath.Replace("~/", "") + editCopyFileName;
                                        ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "downloadfile", "checkoutFile('" + PublicPath + "','" + editCopyFileName + "');", true);
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "downloadfile", "checkoutToServer('" + PublicPath + "');", true);
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                throw ex;
                            }
                        }
                        else
                        {
                            string strEditDocVar = editOrigID + "," + editItemStatus + ",'" + CheckoutToServer.ToString() + "'";
                            ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "EditDocument", "openCheckinWindow(" + strEditDocVar + ");", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpToolbar, GetType(), "nologin", "alert('Your session has timed out. Please log in and try again.');", true);
                    }
                    break;
                case "ViewItem":
                    int ModuleID = Convert.ToInt32(Session.Contents["ModuleID"]);
                    switch (ModuleID)
                    {
                        case 0:
                        case 3:
                            if (gvItemList.SelectedIndex != -1)
                            {
                                string TypeOfPublish = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["TypeOfPublish"].ToString();
                                string FileExtension = gvItemList.SelectedRow.Cells[10].Text;
                                string ViewItemID = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["ItemID"].ToString();
                                string ViewOrigID = gvItemList.SelectedRow.Cells[7].Text;
                                string ItemStatus = gvItemList.SelectedRow.Cells[3].Text;
                                bool IsItemID = false;
                                switch (ItemStatus)
                                {
                                    case "Draf": // Draft
                                    case "Open": // Open
                                    case "Coll": // Collaborate
                                    case "Revi": // Review
                                    case "Read": // Ready
                                    case "Pend": // Pending
                                        IsItemID = true;
                                        break;
                                    case "Curr": // Current
                                    case "Comp": // Complete
                                    case "Evid": // Evidence
                                        IsItemID = false;
                                        break;
                                }
                                int DocStatus = Convert.ToInt32(gvItemList.DataKeys[gvItemList.SelectedIndex].Values["Status"]);
                                string pubPath = ConfigurationManager.AppSettings["PublishPath"];
                                string strvar = ViewItemID + "," + ViewOrigID + "," + DocStatus + ",'" + IsItemID.ToString() + "'," + pubPath + ",'" + FileExtension + "'," + TypeOfPublish;
                                ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewDocument", "openDocWindow(" + strvar + ")", true);
                            }
                            break;
                        case 1:
                            int selUserID = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                            Session["SelUserID"] = selUserID;
                            ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "ViewUser", "openProperties(0, 1, 0);", true);
                            break;
                        case 4:
                        case 6:
                        case 12:
                            string RecordModuleID = ModuleID.ToString();
                            string RecordItemID = gvRecordList.DataKeys[gvRecordList.SelectedRow.RowIndex].Values["ItemID"].ToString();
                            string RecordParentGroupID = p3Tree.SelectedNode.Value;
                            string RecordObjTypeID = P3General.Get_ObjTypeID(Convert.ToInt32(RecordModuleID), Convert.ToInt32(RecordParentGroupID)).ToString();
                            string strViewRecordVar = RecordModuleID + "," + RecordItemID + "," + RecordObjTypeID + "," + RecordParentGroupID + ",0";
                            ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewRecord", "openRecordWindow(" + strViewRecordVar + ")", true);
                            break;
                        case 14:
                            int index = gvAIList.SelectedRow.RowIndex;
                            string strAIID = gvAIList.DataKeys[index].Values["AIID"].ToString();
                            //string ShowModuleID = gvAIList.DataKeys[index].Values["ShowModuleID"].ToString();//"0";
                            //string strViewItemVar = strAIID + "," + ShowModuleID + ",0";
                            ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewAI", "openAIWindow(" + strAIID + ")", true);
                            break;
                    }
                    break;
                case "Rename":
                    pnlAddDropDown.Visible = false;
                    MoveDropdown.Visible = false;
                    DeleteDropdown.Visible = false;
                    rptDropDown.Visible = false;
                    if (!RenameDropdown.Visible)
                    {
                        RenameDropdown.Visible = true;
                    }
                    else
                    {
                        RenameDropdown.Visible = false;
                    }
                    break;
                case "Move":
                    pnlAddDropDown.Visible = false;
                    RenameDropdown.Visible = false;
                    DeleteDropdown.Visible = false;
                    rptDropDown.Visible = false;
                    if (!MoveDropdown.Visible)
                    {
                        MoveDropdown.Visible = true;
                    }
                    else
                    {
                        MoveDropdown.Visible = false;
                    }
                    break;
                case "Delete":
                    pnlAddDropDown.Visible = false;
                    RenameDropdown.Visible = false;
                    MoveDropdown.Visible = false;
                    rptDropDown.Visible = false;
                    if (!DeleteDropdown.Visible)
                    {
                        DeleteDropdown.Visible = true;
                    }
                    else
                    {
                        DeleteDropdown.Visible = false;
                    }
                    break;
                case "Properties":
                    string PropertiesItemID = p3Tree.SelectedValue;
                    string PropertiesModuleID = mnuModules.SelectedValue;
                    int IsGroup = 1;
                    if (Session.Contents["IsGroup"] != null)
                    {
                        IsGroup = Convert.ToInt32(Session.Contents["IsGroup"]);
                    }
                    if (PropertiesModuleID == "0")
                    {
                        string[] dlID = Menu1.SelectedValue.Split('|');
                        PropertiesModuleID = dlID[0];
                    }
                    switch (PropertiesModuleID)
                    {
                        case "1":
                            if (IsGroup != 1)
                            {
                                PropertiesItemID = "0";
                                Session["SelUserID"] = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                            }
                            break;
                        case "3":
                            if (IsGroup != 1)
                            {
                                PropertiesItemID = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["ItemID"].ToString();
                            }
                            break;
                        case "4":
                        case "6":
                        case "12":
                            if (IsGroup != 1)
                            {
                                PropertiesItemID = gvRecordList.DataKeys[gvRecordList.SelectedIndex].Values["ItemID"].ToString();
                            }
                            break;
                    }
                    string strPropertiesVar = PropertiesItemID + "," + PropertiesModuleID + "," + IsGroup.ToString();
                    ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewProperties", "openProperties(" + strPropertiesVar + ")", true);
                    break;
                case "Status":
                    string StatusModuleID = Session["ModuleID"].ToString();
                    string StatusItemID = "0";
                    string StatusOrigID = "0";
                    switch (StatusModuleID)
                    {
                        case "0":
                        case "3":
                            StatusItemID = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["ItemID"].ToString();
                            StatusOrigID = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["OrigID"].ToString();
                            Session["SelectedIndex"] = gvItemList.SelectedIndex;
                            break;
                        case "4":
                        case "6":
                        case "12":
                            StatusItemID = gvRecordList.DataKeys[gvRecordList.SelectedIndex].Values["ItemID"].ToString();
                            StatusOrigID = gvRecordList.DataKeys[gvRecordList.SelectedIndex].Values["OrigID"].ToString();
                            Session["SelectedIndex"] = gvRecordList.SelectedIndex;
                            break;
                    }

                    string strStatusVar = StatusModuleID + "," + StatusItemID + "," + StatusOrigID;
                    ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ViewStatus", "openStatusWindow(" + strStatusVar + ");", true);
                    break;
                case "RelatedAI":
                    int RelAIModuleID = Convert.ToInt32(mnuModules.SelectedValue);
                    int OrigID = 0;
                    //GridView gv = new GridView();
                    switch (RelAIModuleID)
                    {
                        case 0:
                        case 3:
                            if (RelAIModuleID == 0)
                            {
                                RelAIModuleID = 3;
                            }
                            OrigID = Convert.ToInt32(gvItemList.SelectedRow.Cells[7].Text);
                            break;
                        case 4:
                        case 6:
                        case 12:
                            OrigID = Convert.ToInt32(gvRecordList.SelectedRow.Cells[6].Text);
                            break;
                    }
                    string strRelatedAIVar = OrigID.ToString() + "," + RelAIModuleID.ToString();
                    ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "RelatedAI", "openRelatedAI(" + strRelatedAIVar + ")", true);
                    break;
                case "OtherUserAI":
                    ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "OtherUserAI", "openSelect('OtherUser')", true);
                    break;
                case "ParaLink":
                    string PLOrigID = "0";
                    string PLModuleID = mnuModules.SelectedValue;
                    if (PLModuleID == "0")
                    {
                        string[] plID = Menu1.SelectedValue.Split('|');
                        PLModuleID = plID[0];
                    }
                    switch (PLModuleID)
                    {
                        case "3":
                            PLOrigID = gvItemList.SelectedRow.Cells[7].Text;
                            break;
                        case "4":
                        case "6":
                        case "12":
                            PLOrigID = gvRecordList.SelectedRow.Cells[6].Text;
                            break;
                    }
                    string strParaLinkVar = PLOrigID.ToString() + "," + PLModuleID.ToString();
                    ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "ParaLink", "openParaLink(" + strParaLinkVar + ")", true);
                    break;
                case "Search":
                    string searchModuleID = mnuModules.SelectedValue;
                    string SiteID = ConfigurationManager.AppSettings["SiteID"];
                    if (searchModuleID == "0")
                    {
                        searchModuleID = "3";
                    }
                    string searchParentGroupID = "0";
                    TreeNode tn = p3Tree.SelectedNode;
                    if (tn == null)
                    {
                        switch (searchModuleID)
                        {
                            case "0":
                                searchModuleID = "3";
                                searchParentGroupID = ConfigurationManager.AppSettings["DefDocGroupID"];
                                break;
                            case "3":
                                searchParentGroupID = ConfigurationManager.AppSettings["DefDocGroupID"];
                                break;
                            case "4":
                                searchParentGroupID = ConfigurationManager.AppSettings["DefRecGroupID"];
                                break;
                            case "6":
                                searchParentGroupID = ConfigurationManager.AppSettings["DefImpGroupID"];
                                break;
                            case "12":
                                searchParentGroupID = ConfigurationManager.AppSettings["DefTrainGroupID"];
                                break;
                            case "14":
                                searchParentGroupID = ConfigurationManager.AppSettings["DefAIGroupID"];
                                break;
                        }
                    }
                    else
                    {
                        searchParentGroupID = p3Tree.SelectedValue;
                    }
                    string strSearchVar = searchModuleID + "," + searchParentGroupID;
                    ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "Search", "openSearchWindow(" + strSearchVar + ")", true);
                    break;
                case "Report":
                    pnlAddDropDown.Visible = false;
                    RenameDropdown.Visible = false;
                    MoveDropdown.Visible = false;
                    DeleteDropdown.Visible = false;
                    int rptModuleID = Convert.ToInt32(Session.Contents["ModuleID"]);

                    if (!rptDropDown.Visible)
                    {
                        await Get_SavedReportsAsync(rptModuleID);
                        rptDropDown.Visible = true;
                    }
                    else
                    {
                        mnuReports.Items.Clear();
                        rptDropDown.Visible = false;
                    }
                    break;
            }
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            string pGroupID = p3Tree.SelectedValue;
            ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "Report", "openDocumentReport(" + pGroupID + ")", true);
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            //int userID = 0;

            switch (arg)
            {
                case "doLogon":
                    string UserName = txtUserName.Text;
                    string Password = txtPassword.Text;
                    DoLogon(UserName, Password);
                    break;
                case "cancelLogon":
                    pnlDirectLink.Visible = true;
                    pnlTreeView.Visible = false;
                    pnlHome.Visible = true;
                    pnlList.Visible = false;
                    pnlLogon.Visible = false;
                    pnlChangePW.Visible = false;
                    mnuModules.Items[0].Selected = true;
                    Set_CheckLogon(false);
                    txtUserName.Text = string.Empty;
                    break;
                case "changePassword":
                    string cpUserName = txtUserName.Text;
                    string NewPW = txtNewPassword.Text;
                    string ConfirmNewPW = txtConfirmPassword.Text;
                    string OptionSet = P3Security.Get_UserOptionSet(cpUserName);
                    DataTable dtFDA = P3Security.Get_FDAStatus();
                    bool IsFDA = Convert.ToBoolean(dtFDA.Rows[1]["Value1"]);
                    int NumPW = Convert.ToInt32(dtFDA.Rows[0]["Value1"]);
                    if (NewPW.Length > 0 && ConfirmNewPW.Length > 0)
                    {
                        if (NewPW.Equals(ConfirmNewPW))
                        {
                            if (NewPW.Length >= 6)
                            {
                                ChangePassword(cpUserName, NewPW, NumPW, OptionSet, IsFDA);
                            }
                            else
                            {
                                lblChangePW.Text = "Your new password must be at least 6 characters long.";
                            }
                        }
                        else
                        {
                            lblChangePW.Text = "Your new passwords do not match!";
                        }
                    }
                    else
                    {
                        lblChangePW.Text = "You must enter a new password and confirm it to proceed.";
                    }
                    break;
                case "Admin":
                    //Response.Redirect("~/admin/Default.aspx");
                    Server.Transfer("~/admin/Default.aspx");
                    break;
            }
        }

        protected void BtnRefreshAI_Click(object sender, EventArgs e)
        {
            string ParentGroupID = p3Tree.SelectedNode.Value;
            int UserID = 0;
            int selIndex = gvAIList.SelectedIndex;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
            }
            DataTable dt = P3General.Get_ItemList(14, UserID, ParentGroupID);
            HttpCookie sortCookie = Request.Cookies["P3WebSort"];
            string sortExp = "SendDate DESC";
            if (sortCookie != null && !string.IsNullOrEmpty(sortCookie.Values["aiSort"]))
            {
                sortExp = sortCookie.Values["aiSort"];
            }
            dt.DefaultView.Sort = sortExp;
            gvAIList.DataSource = dt;
            gvAIList.DataBind();
            if (selIndex >= gvAIList.Rows.Count)
            {
                gvAIList.SelectedIndex = -1;
            }
            else
            {
                gvAIList.SelectedIndex = selIndex;
            }
        }

        protected async void BtnRefresh_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            int UserID = 0;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
            }

            DataTable dt = new DataTable();
            HttpCookie sortCookie = Request.Cookies["P3WebSort"];
            string sortExp = "Name ASC";
            switch (arg)
            {
                case "RefreshUser":
                    int UsrParentGroupID = Convert.ToInt32(p3Tree.SelectedValue);
                    int UsrSelIndex = gvUsersList.SelectedIndex;
                    dt = await P3General.Get_ItemListAsync(1, UserID, UsrParentGroupID.ToString());
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["userSort"];
                    }
                    dt.DefaultView.Sort = sortExp;
                    gvUsersList.DataSource = dt;
                    gvUsersList.DataBind();
                    if (UsrSelIndex >= gvUsersList.Rows.Count)
                    {
                        gvUsersList.SelectedIndex = -1;
                    }
                    else
                    {
                        gvUsersList.SelectedIndex = UsrSelIndex;
                    }
                    DisableButtons();
                    break;
                case "RefreshRec":
                    int RecModuleID = Convert.ToInt32(Session.Contents["ModuleID"]);
                    int RecParentGroupID = Convert.ToInt32(p3Tree.SelectedNode.Value);
                    int recSelIndex = gvRecordList.SelectedIndex;
                    dt = P3General.Get_ItemList(RecModuleID, UserID, RecParentGroupID.ToString());
                    if (sortCookie != null)
                    {
                        switch (RecModuleID)
                        {
                            case 4:
                                sortExp = sortCookie.Values["recSort"];
                                break;
                            case 6:
                                sortExp = sortCookie.Values["impSort"];
                                break;
                            case 12:
                                sortExp = sortCookie.Values["trainSort"];
                                break;
                        }
                    }
                    dt.DefaultView.Sort = sortExp;
                    gvRecordList.DataSource = dt;
                    gvRecordList.DataBind();
                    if (recSelIndex >= gvRecordList.Rows.Count)
                    {
                        gvRecordList.SelectedIndex = -1;
                    }
                    else
                    {
                        gvRecordList.SelectedIndex = recSelIndex;
                    }
                    DisableButtons();
                    break;
                case "RefreshDoc":
                    int DocParentGroupID = Convert.ToInt32(p3Tree.SelectedNode.Value);
                    int docSelIndex = gvItemList.SelectedIndex;
                    dt = P3General.Get_ItemList(3, UserID, DocParentGroupID.ToString());
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["docSort"];
                    }
                    dt.DefaultView.Sort = sortExp;
                    gvItemList.DataSource = dt;
                    gvItemList.DataBind();
                    if (docSelIndex >= gvItemList.Rows.Count)
                    {
                        gvItemList.SelectedIndex = -1;
                        DisableButtons();
                    }
                    else
                    {
                        gvItemList.SelectedIndex = docSelIndex;
                        await UpdateToolbarAsync();
                    }
                    break;
                case "RefreshTree":
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        UserID = Convert.ToInt32(UserValues[0]);

                        int ModuleID = Convert.ToInt32(mnuModules.SelectedValue);
                        string nodePath = p3Tree.SelectedNode.ValuePath;
                        p3Tree.SelectedNode.Parent.Selected = true;
                        p3Tree.SelectedNode.ChildNodes.Clear();
                        p3Tree.SelectedNode.Collapse();
                        int ParentGroupID = Convert.ToInt32(p3Tree.SelectedValue);
                        DataTable dtGroups = await P3General.Get_DisplayGroupsAsync(ModuleID, ParentGroupID, UserID);
                        PopulateNodes(dtGroups, p3Tree.SelectedNode.ChildNodes, ParentGroupID);
                        p3Tree.SelectedNode.Expand();

                        TreeNode tn = p3Tree.FindNode(nodePath);
                        if (tn != null)
                        {
                            tn.Selected = true;
                            tn.Expand();
                        }
                    }
                    break;
                case "RefreshTreeDelete":
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        UserID = Convert.ToInt32(UserValues[0]);

                        int ModuleID = Convert.ToInt32(mnuModules.SelectedValue);
                        p3Tree.SelectedNode.Parent.Selected = true;
                        p3Tree.SelectedNode.ChildNodes.Clear();
                        p3Tree.SelectedNode.Collapse();
                        int ParentGroupID = Convert.ToInt32(p3Tree.SelectedValue);
                        DataTable dtGroups = await P3General.Get_DisplayGroupsAsync(ModuleID, ParentGroupID, UserID);
                        PopulateNodes(dtGroups, p3Tree.SelectedNode.ChildNodes, ParentGroupID);
                        p3Tree.SelectedNode.Expand();
                    }
                    break;
                case "RefreshTreeMove":
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        UserID = Convert.ToInt32(UserValues[0]);

                        int ModuleID = Convert.ToInt32(mnuModules.SelectedValue);

                        p3Tree.Nodes[0].Selected = true;
                        p3Tree.SelectedNode.ChildNodes.Clear();
                        int ParentGroupID = Convert.ToInt32(p3Tree.Nodes[0].Value);
                        DataTable dtGroups = await P3General.Get_DisplayGroupsAsync(ModuleID, ParentGroupID, UserID);
                        PopulateNodes(dtGroups, p3Tree.Nodes[0].ChildNodes, ParentGroupID);
                        p3Tree.SelectedNode.Expand();
                    }
                    break;
            }
        }

        protected async void BtnGoThere_Click(object sender, EventArgs e)
        {
            //  Gather variables
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

            int ModuleID = Convert.ToInt32(Session["ModuleID"]);
            int ParentGroupID = Convert.ToInt32(Session["GTGroupID"]);
            int ItemID = Convert.ToInt32(Session.Contents["GTItemID"]);
            string RootImageUrl = string.Empty;

            // Set up display variables
            p3Tree.Nodes.Clear();
            if (User.Identity.IsAuthenticated)
            {
                switch (ModuleID)
                {
                    case 3:
                        mnuModules.Items[1].Selected = true;
                        RootImageUrl = "~/images/documentroot.png";
                        break;
                    case 4:
                        mnuModules.Items[2].Selected = true;
                        RootImageUrl = "~/images/recordroot.png";
                        break;
                    case 6:
                        mnuModules.Items[3].Selected = true;
                        RootImageUrl = "~/images/improvementroot.png";
                        break;
                    case 12:
                        mnuModules.Items[4].Selected = true;
                        RootImageUrl = "~/images/trainingroot.png";
                        break;
                }
            }
            else
            {
                mnuModules.Items[0].Selected = true;
                RootImageUrl = "~/images/documentroot.png";
            }
            pnlDirectLink.Visible = false;
            pnlTreeView.Visible = true;
            pnlHome.Visible = false;
            pnlList.Visible = true;
            pnlLogon.Visible = false;

            // Populate p3Tree
            //ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "", "alert('" + ModuleID.ToString() + "," + UserID.ToString() + "," + ParentGroupID.ToString() + "');", true);
            PopulateRootLevel(ModuleID, UserID, ParentGroupID.ToString());
            p3Tree.Nodes[0].ImageUrl = RootImageUrl;
            p3Tree.Nodes[0].Selected = true;
            p3Tree.Nodes[0].Expand();

            // Select current Node and show items.
            //ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "alrt", "alert('GroupID = " + ParentGroupID.ToString() + ", OrigID = " + ItemID.ToString() + "')", true);
            if (p3Tree.SelectedNode != null)
            {
                DataTable dtItems = await P3General.Get_ItemListAsync(ModuleID, UserID, ParentGroupID.ToString());
                HttpCookie sortCookie = Response.Cookies["P3WebSort"];
                string sortExp = "Name ASC";
                GridView gv = new GridView();
                switch (ModuleID)
                {
                    case 3:
                        if (sortCookie != null)
                        {
                            sortExp = sortCookie.Values["docSort"];
                        }
                        dtItems.DefaultView.Sort = sortExp;
                        gv = gvItemList;
                        gvRecordList.DataSource = null;
                        gvRecordList.DataBind();
                        gvAIList.DataSource = null;
                        gvAIList.DataBind();
                        gv.DataSource = dtItems;
                        gv.DataBind();
                        break;
                    case 4:
                    case 6:
                    case 12:
                        if (sortCookie != null)
                        {
                            switch (ModuleID)
                            {
                                case 4:
                                    sortExp = sortCookie.Values["recSort"];
                                    break;
                                case 6:
                                    sortExp = sortCookie.Values["impSort"];
                                    break;
                                case 12:
                                    sortExp = sortCookie.Values["trainSort"];
                                    break;
                            }
                        }
                        dtItems.DefaultView.Sort = sortExp;
                        gv = gvRecordList;
                        gvItemList.DataSource = null;
                        gvItemList.DataBind();
                        gvAIList.DataSource = null;
                        gvAIList.DataBind();
                        gvRecordList.DataSource = dtItems;
                        gvRecordList.DataBind();
                        break;
                }

                //  Select Go There Item.
                foreach (GridViewRow gvr in gv.Rows)
                {
                    int gvrOrigID = Convert.ToInt32(gv.DataKeys[gvr.RowIndex].Values["OrigID"]);
                    if (gvrOrigID == ItemID)
                    {
                        gv.Rows[gvr.RowIndex].RowState = DataControlRowState.Selected;
                        gv.Rows[gvr.RowIndex].Cells[3].ForeColor = System.Drawing.Color.White;
                        if (ModuleID == 3)
                        {
                            gv.Rows[gvr.RowIndex].Cells[6].ForeColor = System.Drawing.Color.White;
                        }
                    }
                }

                gv.Dispose();
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "noaccess", "alert('You do not have rights to perform this action. " +
                    "Ask your System Administrator for details. HINT: Check the folder properties and security settings');window.location.href='Default.aspx';", true);
            }

        }

        protected async void btnAddTreeNode_Click(object sender, EventArgs e)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                string UserFullName = UserValues[1];

                int ModuleID = Convert.ToInt32(Session["ModuleID"]);
                int ParentGroupID = Convert.ToInt32(p3Tree.SelectedValue);
                string NewGroupName = Session["NewGroupName"].ToString();
                int NewGroupID = await P3General.Add_FolderAsync(ModuleID, ParentGroupID, NewGroupName, UserFullName, UserID);

                DataTable dt = await P3General.Get_DisplayGroupsAsync(ModuleID, ParentGroupID, UserID);
                p3Tree.SelectedNode.ChildNodes.Clear();
                PopulateNodes(dt, p3Tree.SelectedNode.ChildNodes, ParentGroupID);
                p3Tree.SelectedNode.Expand();
                foreach (TreeNode tn in p3Tree.SelectedNode.ChildNodes)
                {
                    if (tn.Text == NewGroupName)
                    {
                        tn.Selected = true;
                        tn.Expand();
                        await UpdateListViewAsync();
                    }
                }
            }
        }

        protected void DownloadFile(string fileName)
        {
            Response.Clear();
            Response.ContentType = @"application\octet-stream";
            //System.IO.FileInfo file = new System.IO.FileInfo(Server.MapPath(fileName));
            FileInfo file = new FileInfo(Server.MapPath(fileName));
            Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
            Response.AddHeader("Content-Length", file.Length.ToString());
            Response.ContentType = "application/octet-stream";
            Response.WriteFile(file.FullName);
            Response.Flush();
        }

        protected void DisableButtons()
        {
            // Add
            pnlAdd.Visible = false;
            // Edit
            pnlEdit.Visible = false;
            // View
            pnlView.Visible = false;
            // Rename
            pnlRename.Visible = false;
            // Move
            pnlMove.Visible = false;
            // Delete
            pnlDelete.Visible = false;
            // Properties
            pnlProperties.Visible = false;
            // Status
            pnlStatus.Visible = false;
            // RelatedAI
            pnlRelatedAI.Visible = false;
            // Para-Link
            pnlParaLink.Visible = false;
            // Report
            pnlReport.Visible = false;
            // Progress
            pnlProgress.Visible = false;
        }

        protected void btnAdministration_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("administration/default.aspx");
        }

        protected void btnCloseDoc_Click(object sender, EventArgs e)
        {
            if (Session["ViewDoc"] != null)
            {
                string viewDocPath = Session.Contents["ViewDoc"].ToString();
                if (File.Exists(Server.MapPath(viewDocPath)))
                {
                    File.Delete(Server.MapPath(viewDocPath));
                }
                Session.Remove("ViewDoc");
            }
        }

        protected async void btnShowGVMenu_Click(object sender, EventArgs e)
        {
            mnuGVContext.Items.Clear();
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                // Get user status information from authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);

                int ModuleID = Convert.ToInt32(Session["ModuleID"]);
                int ItemIndex = Convert.ToInt32(hdnContextID.Value);
                int GroupID = Convert.ToInt32(p3Tree.SelectedValue);
                GridView gv = gvItemList;

                switch (ModuleID)
                {
                    case 1:
                        gv = gvUsersList;
                        break;
                    case 4:
                    case 6:
                    case 12:
                        gv = gvRecordList;
                        break;
                    case 14:
                        gv = gvAIList;
                        break;
                    default:
                        gv = gvItemList;
                        break;
                }

                gv.SelectedIndex = ItemIndex;
                int ItemID = Convert.ToInt32(gv.DataKeys[ItemIndex].Values["ItemID"]);
                int OrigID = Convert.ToInt32(gv.DataKeys[ItemIndex].Values["OrigID"]);
                await PopulateGridViewMenu(ModuleID, GroupID, OrigID, UserID);
                ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "showGVMenu", "createMenu('gridviewrow', " + ItemID + ");", true);
            }
        }


        #endregion

        #region Authentication

        protected void DoLogon(string UserName, string Password)
        {
            // Verify if P3 User.
            if (UserName.Length == 0)
            {
                lblLogonError.Text = GetLocalResourceObject("lblLogonErrorUsrname").ToString();
            }
            else if (Password.Length == 0)
            {
                lblLogonError.Text = GetLocalResourceObject("lblLogonErrorPasswrd").ToString();
            }
            else
            {
                bool UseFIPS = P3Security.IsFIPS();
                string encPassword = P3Security.Encrypt(Password, UserName.ToUpper(), UseFIPS);
                if (P3Security.IsUserNamePWordValid(UserName, encPassword))
                {
                    string PWStatus = P3Security.Get_PWStatus(UserName);
                    if (PWStatus == "0")
                    {
                        // Authenticate user to Paradigm 3
                        P3Security.Do_Login(UserName, encPassword);

                        // Set logged on display properties.
                        Set_CheckLogon(true);
                        lblLogonError.Text = string.Empty;
                        lblChangePW.Text = string.Empty;
                    }
                    else
                    {
                        pnlDirectLink.Visible = true;
                        pnlTreeView.Visible = false;
                        pnlHome.Visible = false;
                        pnlList.Visible = false;
                        pnlLogon.Visible = false;
                        pnlChangePW.Visible = true;
                        txtNewPassword.Focus();
                        lblLogonError.Text = string.Empty;
                        lblChangePW.Text = "Your password has expired and must be changed to proceed.";
                    }
                }
                else
                {
                    Set_CheckLogon(false);
                    pnlHome.Visible = false;
                    pnlLogon.Visible = true;
                    lblLogonError.Text = GetLocalResourceObject("lblLogonError").ToString();
                    txtPassword.Focus();
                }
            }
        }

        protected void Do_WinP3Logon(string winUserName)
        {
            // Do authentication.
            P3Security.Do_WinLogin(winUserName);
            Set_CheckLogon(true);
        }

        protected void Set_CheckLogon(bool isLoggedon)
        {
            // Set greeting.
            string timeGreet = GetLocalResourceObject("timeGreetEvening").ToString();

            if (DateTime.Now.Hour < 12)
            {
                timeGreet = GetLocalResourceObject("timeGreetMorning").ToString();
            }
            else
            {
                timeGreet = GetLocalResourceObject("timeGreetNoon").ToString();
            }

            if (isLoggedon)
            {
                // Set Logon button display properties.
                btnLogon.Visible = false;
                AuthenticationSection authSection = (AuthenticationSection)ConfigurationManager.GetSection("system.web/authentication");
                bool IsSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                string authType = authSection.Mode.ToString();
                if (authType == "Windows" || IsSSO)
                {
                    btnLogout.Visible = false;
                }
                else
                {
                    btnLogout.Visible = true;
                    btnLogout.ImageUrl = GetLocalResourceObject("Logout").ToString();
                    btnLogout.Attributes.Add("onmouseover", "this.src='" + GetLocalResourceObject("LogoutMo") + "'");
                    btnLogout.Attributes.Add("onmouseout", "this.src='" + GetLocalResourceObject("Logout") + "'");
                }

                // Get user information from authentication cookie.
                int UserID = -1;
                string UserFullName = string.Empty;
                int UserStatus = -1;
                string ModAccess = string.Empty;
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    UserID = Convert.ToInt32(UserValues[0]);
                    UserFullName = UserValues[1];
                    UserStatus = Convert.ToInt32(UserValues[3]);
                    ModAccess = UserValues[4];
                }
                else
                {
                    P3Security.Do_Logout();
                    Set_CheckLogon(false);
                }
                // Set welcome message Get greeting.
                lblLogon.Text = timeGreet + ", " + UserFullName;

                // Set Toobar button properties.
                DisableButtons();

                // Enable module menu items based on user credentials.
                string[] ModuleAccess = ModAccess.Split('_');
                pnlDirectLink.Visible = false;
                pnlTreeView.Visible = true;
                pnlHome.Visible = false;
                pnlList.Visible = true;
                pnlLogon.Visible = false;
                pnlChangePW.Visible = false;

                // Set initial Module height
                int initHeight = 31;
                // Add Home Menu Item
                mnuModules.Items.Clear();
                MenuItem mnuHome = new MenuItem()
                {
                    Text = "Home",
                    Value = "0",
                    ImageUrl = "~/images/home.png",
                };
                mnuModules.Items.Add(mnuHome);

                // Add all permitted Menu Items
                DataTable dt = P3General.Get_Modules();
                string UserModuleName = string.Empty;
                string AIModuleName = string.Empty;
                foreach (DataRow dr in dt.Rows)
                {
                    string imageurl = string.Empty;
                    bool addModule = false;

                    if (UserStatus == 1)
                    {
                        addModule = true;
                        switch (dr["ModuleID"].ToString())
                        {
                            case "1":
                                UserModuleName = dr["Name"].ToString();
                                addModule = false;
                                break;
                            case "3":
                                imageurl = "~/images/document.png";
                                break;
                            case "4":
                                imageurl = "~/images/record.png";
                                break;
                            case "6":
                                imageurl = "~/images/improvement.png";
                                break;
                            case "12":
                                imageurl = "~/images/training.png";
                                break;
                            case "14":
                                AIModuleName = dr["Name"].ToString();
                                addModule = false;
                                break;
                        }
                    }
                    else
                    {

                        switch (dr["ModuleID"].ToString())
                        {
                            case "1":
                                UserModuleName = dr["Name"].ToString();
                                addModule = false;
                                break;
                            case "3":
                                imageurl = "~/images/document.png";

                                if (ModuleAccess.Length > 1)
                                {
                                    if (ModuleAccess[2] == "3|1")
                                    {
                                        addModule = true;
                                    }
                                }

                                break;
                            case "4":
                                if (ModuleAccess.Length > 2)
                                {
                                    if (ModuleAccess[3] == "4|1")
                                    {
                                        addModule = true;
                                    }
                                }
                                imageurl = "~/images/record.png";
                                break;
                            case "6":
                                if (ModuleAccess.Length > 3)
                                {
                                    if (ModuleAccess[4] == "6|1")
                                    {
                                        addModule = true;
                                    }
                                }
                                imageurl = "~/images/improvement.png";
                                break;
                            case "12":
                                if (ModuleAccess.Length > 4)
                                {
                                    if (ModuleAccess[5] == "12|1")
                                    {
                                        addModule = true;
                                    }
                                }
                                imageurl = "~/images/training.png";
                                break;
                            case "14":
                                AIModuleName = dr["Name"].ToString();
                                addModule = false;
                                break;
                        }
                    }

                    if (addModule)
                    {
                        MenuItem mnu = new MenuItem()
                        {
                            Text = dr["Name"].ToString(),
                            Value = dr["ModuleID"].ToString(),
                            ImageUrl = imageurl
                        };
                        mnuModules.Items.Add(mnu);
                        initHeight += 32;
                    }
                }

                // Add Users Menu Item if permitted
                MenuItem mnuUser = new MenuItem()
                {
                    Text = UserModuleName,
                    Value = "1",
                    ImageUrl = "~/images/users.png"
                };

                if (UserStatus == 1 || (UserStatus == 0 && ModuleAccess[1] == "1|1"))
                {
                    mnuModules.Items.Add(mnuUser);
                    initHeight += 32;
                }
                //else if (UserStatus == 0 && ModuleAccess[1] == "1|1")
                //{
                //    mnuModules.Items.Add(mnuUser);
                //    initHeight += 32;
                //}

                // Add Action Item Menu Item
                MenuItem mnuAI = new MenuItem()
                {
                    Text = AIModuleName,
                    Value = "14",
                    ImageUrl = "~/images/actionitem.png",
                };
                mnuModules.Items.Add(mnuAI);
                initHeight += 31;

                ModulePane.InitialSize = initHeight;
                ModulePane.MaxHeight = initHeight + 1;

                // Collect default module and folder information from config.
                int defaultModule = Convert.ToInt32(ConfigurationManager.AppSettings["DefModuleID"]);
                Session["ModuleID"] = defaultModule;
                string defaultFolderID;// = string.Empty;
                string rootImageUrl;// = string.Empty;

                switch (defaultModule)
                {
                    case 3:
                        mnuModules.FindItem("3").Selected = true;
                        lblModuleLabel.Text = "Documents";
                        rootImageUrl = "~/images/documentroot.png";
                        defaultFolderID = ConfigurationManager.AppSettings["DefDocGroupID"];
                        break;
                    case 4:
                        mnuModules.FindItem("4").Selected = true;
                        lblModuleLabel.Text = "Records";
                        rootImageUrl = "~/images/recordroot.png";
                        defaultFolderID = ConfigurationManager.AppSettings["DefRecGroupID"];
                        break;
                    case 6:
                        mnuModules.FindItem("6").Selected = true;
                        lblModuleLabel.Text = "Improvements";
                        rootImageUrl = "~/images/improvementroot.png";
                        defaultFolderID = ConfigurationManager.AppSettings["DefImpGroupID"];
                        break;
                    case 12:
                        mnuModules.FindItem("12").Selected = true;
                        lblModuleLabel.Text = "Training";
                        rootImageUrl = "~/images/triningroot.png";
                        defaultFolderID = ConfigurationManager.AppSettings["DefTrainGroupID"];
                        break;
                    case 14:
                        mnuModules.FindItem("14").Selected = true;
                        lblModuleLabel.Text = "Action Items";
                        rootImageUrl = "~/images/actionitemroot.png";
                        defaultFolderID = ConfigurationManager.AppSettings["DefAIGroupID"];
                        break;
                    default:
                        mnuModules.Items[0].Selected = true;
                        lblModuleLabel.Text = "Documents";
                        rootImageUrl = "~/images/root.png";
                        defaultFolderID = ConfigurationManager.AppSettings["DefDocGroupID"];
                        pnlDirectLink.Visible = true;
                        pnlTreeView.Visible = false;
                        pnlHome.Visible = true;
                        pnlList.Visible = false;
                        break;
                }
                p3Tree.RootNodeStyle.ImageUrl = rootImageUrl;
                if (defaultModule != 0)
                {
                    PopulateRootLevel(defaultModule, UserID, defaultFolderID);
                    p3Tree.Nodes[0].Expand();
                    if (defaultModule == 14)
                    {
                        FindMyNode("2", p3Tree);
                    }
                    else
                    {
                        p3Tree.Nodes[0].Selected = true;
                    }
                }

                // If user is an administrator
                if (UserStatus == 1)
                {
                    pnlOtherUserAI.Visible = true;
                    pnlAdministration.Visible = true;
                }
                pnlSearch.Visible = true;
            }
            else
            {
                // Set display properties.
                btnLogon.Visible = true;
                btnLogout.Visible = false;
                btnLogon.ImageUrl = GetLocalResourceObject("Logon").ToString();
                btnLogon.Attributes.Add("onmouseover", "this.src='" + GetLocalResourceObject("LogonMo") + "'");
                btnLogon.Attributes.Add("onmouseout", "this.src='" + GetLocalResourceObject("Logon") + "'");
                lblLogon.Text = timeGreet + ',' + GetLocalResourceObject("lblLogonStatus").ToString();

                pnlDirectLink.Visible = true;
                pnlTreeView.Visible = false;
                pnlHome.Visible = true;
                pnlList.Visible = false;
                pnlLogon.Visible = false;
                pnlChangePW.Visible = false;

                // Clear TreeView and ListViews
                p3Tree.Nodes.Clear();
                gvItemList.DataSource = null;
                gvItemList.DataBind();
                gvRecordList.DataSource = null;
                gvRecordList.DataBind();
                gvAIList.DataSource = null;
                gvAIList.DataBind();
                txtUserName.Text = string.Empty;

                // Disable modules menu.
                // Add Home Menu Item
                mnuModules.Items.Clear();
                MenuItem mnuHome = new MenuItem()
                {
                    Text = "Home",
                    Value = "0",
                    ImageUrl = "~/images/home.png",
                };
                mnuModules.Items.Add(mnuHome);
                mnuModules.Items[0].Selected = true;

                ModulePane.InitialSize = 31;
                ModulePane.MaxHeight = 31;

                // Hide Search if set
                bool HideSearchOnReadOnly = Convert.ToBoolean(ConfigurationManager.AppSettings["HideSearchOnReadOnly"]);
                if (HideSearchOnReadOnly)
                {
                    pnlSearch.Visible = false;
                }
            }

            if (!string.IsNullOrEmpty(Request.QueryString["ModuleID"]) && !string.IsNullOrEmpty(Request.QueryString["GroupID"]))
            {
                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
                Session["ModuleID"] = ModuleID;
                GoTo_Folder(ModuleID, GroupID);
            }
        }

        protected void ChangePassword(string UserName, string NewPW, int NumPW, string OptionSet, bool IsFDA)
        {
            int UserID = 0;
            //txtUserName.Text = string.Empty;
            bool UseFIPS = P3Security.IsFIPS();
            string encNewPW = P3Security.Encrypt(NewPW, UserName.ToUpper(), UseFIPS);
            if (IsFDA == true)
            {
                // Get old passwords for user.
                int pwIndex = 0;
                DataTable dtOldPass = P3Security.Get_ForbiddenPasswords(UserName, NumPW);
                foreach (DataRow drOldPass in dtOldPass.Rows)
                {
                    txtConfirmPassword.Text = drOldPass[0].ToString();
                    if (encNewPW.Equals(drOldPass["OldPass"]))
                    {
                        pwIndex = pwIndex + 1;
                    }
                }

                if (pwIndex > 0)
                {
                    lblChangePW.Text = "You must choose a password that has not been used in the last 6 months.";
                }
                else
                {
                    // Update password and log on.                    
                    StringBuilder sb = new StringBuilder(OptionSet);
                    sb[2] = '0';
                    string NewOptionSet = sb.ToString();
                    Do_WinP3Logon(UserName);
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        UserID = Convert.ToInt32(UserValues[0]);
                    }
                    P3Security.Do_ChangePassword(UserID, encNewPW, NewOptionSet, 0);
                    lblLogonError.Text = string.Empty;
                    lblChangePW.Text = string.Empty;
                }
            }
            else
            {
                // Update password and log on.
                StringBuilder sb = new StringBuilder(OptionSet);
                sb[2] = '0';
                string NewOptionSet = sb.ToString();
                Do_WinP3Logon(UserName);
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    UserID = Convert.ToInt32(UserValues[0]);
                }
                P3Security.Do_ChangePassword(UserID, encNewPW, NewOptionSet, 0);
                lblLogonError.Text = string.Empty;
                lblChangePW.Text = string.Empty;
            }
        }

        #endregion

        #region TreeView Events & Subroutines

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

        private void PopulateRootLevel(int moduleID, int userID, string rootID)
        {
            p3Tree.Nodes.Clear();
            DataTable dt = P3General.Get_DisplayGroups(moduleID, Convert.ToInt32(rootID), userID);
            DataRow[] root = dt.Select("GroupID=" + rootID);
            if (root.Length > 0)
            {
                TreeNode rootnode = new TreeNode(root[0]["Name"].ToString(), root[0]["GroupID"].ToString());
                p3Tree.Nodes.Add(rootnode);
                PopulateNodes(dt, p3Tree.FindNode(rootID).ChildNodes, Convert.ToInt32(rootID));
            }
            else
            {
                //throw new Exception("There is no root level found");
                ScriptManager.RegisterStartupScript(udpSplitter, GetType(), "noroot", "alert('There is no root level found');", true);
            }

            dt.Dispose();

            if (moduleID == 3)
            {
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    int Status = Convert.ToInt32(UserValues[3]);
                    if (Status == 1)
                    {
                        TreeNode tn = new TreeNode
                        {
                            ImageUrl = "~/images/documentroot.png",
                            Value = "8",
                            Text = "System"
                        };
                        p3Tree.Nodes.Add(tn);
                        DataTable dtSystem = P3General.Get_DisplayGroups(3, 8, userID);
                        PopulateNodes(dtSystem, p3Tree.FindNode("8").ChildNodes, 8);
                    }
                }
            }

            HttpCookie sortCookie = Request.Cookies["P3WebSort"];
            string sortExp = "Name ASC";

            switch (moduleID)
            {
                case 1:
                    p3Tree.Nodes[0].Expand();
                    // Clear unused grid views
                    gvItemList.DataSource = null;
                    gvItemList.DataBind();
                    gvRecordList.DataSource = null;
                    gvRecordList.DataBind();
                    gvAIList.DataSource = null;
                    gvAIList.DataBind();
                    // Fill used grid View
                    DataTable dtUserList = P3General.Get_ItemList(moduleID, userID, rootID);

                    dtUserList.DefaultView.Sort = sortExp;
                    gvUsersList.DataSource = dtUserList;
                    gvUsersList.DataBind();
                    dtUserList.Dispose();
                    break;
                case 4:
                case 6:
                case 12:
                    p3Tree.Nodes[0].Expand();
                    // Clear unused grid views
                    gvUsersList.DataSource = null;
                    gvUsersList.DataBind();
                    gvItemList.DataSource = null;
                    gvItemList.DataBind();
                    gvAIList.DataSource = null;
                    gvAIList.DataBind();
                    // Fill used grid View
                    DataTable dtRecordList = P3General.Get_ItemList(moduleID, userID, rootID);

                    switch (moduleID)
                    {
                        case 4:
                            if (sortCookie != null)
                            {
                                sortExp = sortCookie.Values["recSort"];
                            }
                            break;
                        case 6:
                            if (sortCookie != null)
                            {
                                sortExp = sortCookie.Values["impSort"];
                            }
                            break;
                        case 12:
                            if (sortCookie != null)
                            {
                                sortExp = sortCookie.Values["trainSort"];
                            }
                            break;
                    }
                    dtRecordList.DefaultView.Sort = sortExp;
                    gvRecordList.DataSource = dtRecordList;
                    gvRecordList.DataBind();
                    dtRecordList.Dispose();
                    break;
                case 14:
                    p3Tree.Nodes[0].Expand();
                    p3Tree.Nodes[0].ChildNodes[0].Selected = true;
                    // Clear unused grid views
                    gvUsersList.DataSource = null;
                    gvUsersList.DataBind();
                    gvRecordList.DataSource = null;
                    gvRecordList.DataBind();
                    gvItemList.DataSource = null;
                    gvItemList.DataBind();
                    // Fill used grid View
                    DataTable dtAIList = P3General.Get_ItemList(moduleID, userID, p3Tree.SelectedValue);
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["aiSort"];
                    }
                    else
                    {
                        sortExp = "SendDate DESC";
                    }
                    dtAIList.DefaultView.Sort = sortExp;
                    gvAIList.DataSource = dtAIList;
                    gvAIList.DataBind();
                    dtAIList.Dispose();

                    Session["AIIDs"] = null;
                    int totalAI = gvAIList.Rows.Count;
                    List<string> AIList = new List<string>();
                    for (int i = 0; i < totalAI; i++)
                    {
                        AIList.Add(gvAIList.DataKeys[i].Values["AIID"].ToString());
                    }
                    Session["AIIDs"] = AIList;
                    break;
                default:
                    p3Tree.Nodes[0].Expand();
                    // Clear unused grid views
                    gvRecordList.DataSource = null;
                    gvRecordList.DataBind();
                    gvAIList.DataSource = null;
                    gvAIList.DataBind();
                    // Fill used grid View
                    DataTable dtItemList = P3General.Get_ItemList(moduleID, userID, rootID);
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["docSort"];
                    }
                    dtItemList.DefaultView.Sort = sortExp;
                    gvItemList.DataSource = dtItemList;
                    gvItemList.DataBind();
                    dtItemList.Dispose();
                    break;
            }
        }

        private void PopulateNodes(DataTable dt, TreeNodeCollection nodes, int ParentID)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (!dr["GroupID"].Equals(ParentID))
                {
                    string icon = "~/images/folder.png";
                    int ModuleID = 0;
                    if (Session["ModuleID"] != null)
                    {
                        ModuleID = Convert.ToInt32(Session["ModuleID"]);
                    }
                    if (ModuleID == 1)
                    {
                        icon = "~/images/users2.png";
                        if (dr["ObjTypeID"].Equals(6))
                        {
                            icon = "~/images/entity.png";
                        }
                    }
                    TreeNode tn = new TreeNode
                    {
                        Text = dr["Name"].ToString(),
                        Value = dr["GroupID"].ToString(),
                        ImageUrl = icon
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

        protected async void P3Tree_SelectedNodeChanged(object sender, EventArgs e)
        {
            mnuTVContext.Items.Clear();
            mnuGVContext.Items.Clear();
            await UpdateListViewAsync();
            mnuTVContext.Items.Add(new MenuItem("Properties", "properties"));
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

        #endregion

        #region GridView Events & Subroutines

        protected void Gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridView gv = (GridView)sender;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                switch (gv.ID)
                {
                    case "gvItemList":
                        gvItemList.SelectedIndex = -1;
                        string fileExtension = gvItemList.DataKeys[e.Row.RowIndex].Values["FileExtension"].ToString();
                        bool IsEvidence = Convert.ToBoolean(gvItemList.DataKeys[e.Row.RowIndex].Values["IsEvidence"]);
                        Image ItemIcon = (Image)e.Row.Cells[0].FindControl("ItemIcon");
                        if (IsEvidence)
                        {
                            ItemIcon.ImageUrl = "images/evd.png";
                        }
                        else
                        {
                            switch (fileExtension.ToUpper())
                            {
                                case "DOC":
                                case "DOCX":
                                case "DOCM":
                                case "RTF":
                                    ItemIcon.ImageUrl = "images/doc.png";
                                    break;
                                case "XLS":
                                case "XLSX":
                                case "XLSM":
                                    ItemIcon.ImageUrl = "images/xls.png";
                                    break;
                                case "HTM":
                                case "HTML":
                                case "MHT":
                                case "MHTM":
                                    ItemIcon.ImageUrl = "images/html.png";
                                    break;
                                case "PPT":
                                case "PPTX":
                                    ItemIcon.ImageUrl = "images/ppt.png";
                                    break;
                                case "DWG":
                                    ItemIcon.ImageUrl = "images/dwg.png";
                                    break;
                                case "PDF":
                                    ItemIcon.ImageUrl = "images/pdf.png";
                                    break;
                                default:
                                    ItemIcon.ImageUrl = "images/item.png";
                                    break;
                            }
                        }

                        // Hide row if ID = 0
                        string DocItemID = gvItemList.DataKeys[e.Row.RowIndex].Values["ItemID"].ToString();
                        string DocOrigID = gvItemList.DataKeys[e.Row.RowIndex].Values["OrigID"].ToString();

                        // Set "Status" column value and color
                        string strVersion = e.Row.Cells[3].Text.Substring(0, 4);

                        bool isLoggedon = false;
                        if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                        {
                            isLoggedon = true;
                        }

                        bool IsItemID = false;
                        switch (strVersion)
                        {
                            case "Draf": // Draft
                            case "Open": // Open
                                if (isLoggedon)
                                {
                                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Red;
                                }
                                else
                                {
                                    e.Row.Visible = false;
                                }
                                IsItemID = true;
                                break;
                            case "Coll": // Collaborate
                                if (isLoggedon)
                                {
                                    e.Row.Cells[3].ForeColor = System.Drawing.Color.DarkRed;
                                }
                                else
                                {
                                    e.Row.Visible = false;
                                }
                                IsItemID = true;
                                break;
                            case "Revi": // Review
                                if (isLoggedon)
                                {
                                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Blue;
                                }
                                else
                                {
                                    e.Row.Visible = false;
                                }
                                IsItemID = true;
                                break;
                            case "Read": // Ready
                                if (isLoggedon)
                                {
                                    e.Row.Cells[3].ForeColor = System.Drawing.Color.DarkViolet;
                                }
                                else
                                {
                                    e.Row.Visible = false;
                                }
                                IsItemID = true;
                                break;
                            case "Pend": // Pending
                                if (isLoggedon)
                                {
                                    e.Row.Cells[3].ForeColor = System.Drawing.Color.DarkGoldenrod;
                                }
                                else
                                {
                                    e.Row.Visible = false;
                                }
                                IsItemID = true;
                                break;
                            case "Obso": // Obsolete
                                e.Row.Visible = false;
                                break;
                            case "Curr": // Current
                            case "Comp": // Complete
                                e.Row.Cells[3].ForeColor = System.Drawing.Color.Black;
                                IsItemID = false;
                                break;
                            case "Evid": // Evidence
                                e.Row.Cells[3].ForeColor = System.Drawing.Color.Green;
                                IsItemID = false;
                                break;
                        }

                        // Set "Processing" column value and color:
                        string strProcessing = e.Row.Cells[6].Text.Substring(0, 4);
                        switch (strProcessing)
                        {
                            case "Draf": // Draft
                            case "Open": // Open
                                e.Row.Cells[6].ForeColor = System.Drawing.Color.Red;
                                break;
                            case "Coll": // Collaborate
                                e.Row.Cells[6].ForeColor = System.Drawing.Color.DarkRed;
                                break;
                            case "Revi": // Review
                                e.Row.Cells[6].ForeColor = System.Drawing.Color.Blue;
                                break;
                            case "Read": // Ready
                                e.Row.Cells[6].ForeColor = System.Drawing.Color.DarkViolet;
                                break;
                            case "Pend": // Pending
                                e.Row.Cells[6].ForeColor = System.Drawing.Color.DarkGoldenrod;
                                break;
                        }

                        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvItemList, "Select$" + e.Row.RowIndex);
                        //e.Row.Attributes["oncontextmenu"] = Page.ClientScript.GetPostBackClientHyperlink(gvItemList, "Select$" + e.Row.RowIndex);
                        int PublishFormat = Convert.ToInt32(gvItemList.DataKeys[e.Row.RowIndex].Values["TypeOfPublish"]);
                        string pubPath = ConfigurationManager.AppSettings["PublishPath"];
                        int DocStatus = Convert.ToInt32(gvItemList.DataKeys[e.Row.RowIndex].Values["Status"]);
                        e.Row.Attributes.Add("ondblclick", "openDocWindow(" + DocItemID + "," + DocOrigID + "," + DocStatus + ",'" + IsItemID + "','" + pubPath + "','" + fileExtension + "'," + PublishFormat + ")");
                        e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                        e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                        e.Row.ToolTip = e.Row.Cells[1].Text;
                        break;
                    case "gvRecordList":
                        gvRecordList.SelectedIndex = -1;
                        Image RecordIcon = (Image)e.Row.Cells[0].FindControl("ItemIcon");
                        int ModuleID = Convert.ToInt32(Session.Contents["ModuleID"]);

                        // Set record type image
                        switch (ModuleID)
                        {
                            case 4:
                                RecordIcon.ImageUrl = "images/record.png";
                                break;
                            case 6:
                                RecordIcon.ImageUrl = "images/improvement.png";
                                break;
                            case 12:
                                RecordIcon.ImageUrl = "images/training.png";
                                break;
                        }

                        // Set color for "Status" field
                        if (!gvRecordList.DataKeys[e.Row.RowIndex].Values["Status"].Equals(null))
                        {
                            string version = e.Row.Cells[3].Text;
                            string status = gvRecordList.DataKeys[e.Row.RowIndex].Values["Status"].ToString();
                            if (status.Contains("Complete"))
                            {
                                e.Row.Cells[3].ForeColor = System.Drawing.Color.Black;
                            }
                            else
                            {
                                e.Row.Cells[3].ForeColor = System.Drawing.Color.Red;
                            }
                        }

                        string RecordItemID = gvRecordList.DataKeys[e.Row.RowIndex].Values["ItemID"].ToString();
                        string RecordObjTypeID = gvRecordList.DataKeys[e.Row.RowIndex].Values["ObjTypeID"].ToString();
                        string RecordParentGroupID = gvRecordList.DataKeys[e.Row.RowIndex].Values["ParentGroupID"].ToString();
                        string strViewRecordVar = ModuleID.ToString() + "," + RecordItemID + "," + RecordObjTypeID + "," + RecordParentGroupID + ",0";

                        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvRecordList, "Select$" + e.Row.RowIndex);
                        e.Row.Attributes.Add("ondblclick", "openRecordWindow(" + strViewRecordVar + ");");
                        e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                        e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                        break;
                    case "gvAIList":
                        gvAIList.SelectedIndex = -1;
                        // Set Action Item image
                        Image AIIcon = (Image)e.Row.Cells[0].FindControl("ItemIcon");
                        AIIcon.ImageUrl = "images/actionitem.png";

                        // Set row/cell color based on notified status.
                        int NotifiedStatus = -1;
                        if (!gvAIList.DataKeys[e.Row.RowIndex].Value.Equals(DBNull.Value))
                        {
                            NotifiedStatus = Convert.ToInt32(gvAIList.DataKeys[e.Row.RowIndex].Value);
                            switch (NotifiedStatus)
                            {
                                case 0:
                                case -1:
                                    e.Row.ForeColor = System.Drawing.Color.Black;
                                    e.Row.Font.Bold = false;
                                    break;
                                case 1:
                                    e.Row.ForeColor = System.Drawing.Color.Black;
                                    e.Row.Font.Bold = true;
                                    break;
                                case 2:
                                    e.Row.ForeColor = System.Drawing.Color.Black;
                                    e.Row.Cells[8].ForeColor = System.Drawing.Color.Red;
                                    e.Row.Font.Bold = true;
                                    break;
                            }

                            DateTime DateDue = Convert.ToDateTime(e.Row.Cells[5].Text);
                            string strCompleted = e.Row.Cells[10].Text;
                            if (DateDue < DateTime.Now && strCompleted == string.Empty)
                            {
                                e.Row.Cells[4].ForeColor = System.Drawing.Color.Red;
                            }
                        }

                        if (e.Row.Cells[9].Text == "Urgent")
                        {
                            e.Row.Cells[9].ForeColor = System.Drawing.Color.Red;
                            e.Row.Cells[9].Font.Bold = true;
                        }

                        string AIID = gv.DataKeys[e.Row.RowIndex].Values["AIID"].ToString();
                        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);
                        e.Row.Attributes.Add("ondblclick", "openAIWindow(" + AIID + ");");
                        e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                        e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                        break;
                    case "gvUsersList":
                        gvUsersList.SelectedIndex = -1;
                        // Set User image
                        Image UserIcon = (Image)e.Row.Cells[0].FindControl("ItemIcon");
                        UserIcon.ImageUrl = "images/user.png";
                        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);
                        e.Row.Attributes.Add("ondblclick", "openProperties(0,1,0);");
                        e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                        e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                        break;
                }
            }
        }

        protected async void Gv_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SelUserID"] = null;
            mnuGVContext.Items.Clear();
            int ModuleID = Convert.ToInt32(Session.Contents["ModuleID"]);
            Session["IsGroup"] = 0;
            Session["IsEvidenceCheck"] = "False";
            GridView gv = (GridView)sender;
            if (gv.SelectedIndex > -1)
            {
                mnuGVContext.Items.Add(new MenuItem("View", "view"));
                pnlView.Visible = true;

                if (ModuleID != 14)
                {
                    for (int i = 0; i < gv.Rows.Count; i++)
                    {
                        GridViewRow row = gv.Rows[i];
                        if ((row.RowState & DataControlRowState.Alternate) > 0 && (row.RowState & DataControlRowState.Selected) > 0 || (row.RowState == DataControlRowState.Selected))
                        {
                            row.Cells[3].ForeColor = System.Drawing.Color.White;
                            if (ModuleID == 3)
                            {
                                row.Cells[6].ForeColor = System.Drawing.Color.White;
                            }
                        }
                        else
                        {
                            string itemStatus = row.Cells[3].Text.Substring(0, 4);
                            switch (itemStatus)
                            {
                                case "Draf": // Draft
                                case "Open":
                                    row.Cells[3].ForeColor = System.Drawing.Color.Red;
                                    break;
                                case "Coll": // Collaborate
                                    row.Cells[3].ForeColor = System.Drawing.Color.DarkRed;
                                    break;
                                case "Revi": // Review
                                    row.Cells[3].ForeColor = System.Drawing.Color.Blue;
                                    break;
                                case "Read": // Ready
                                    row.Cells[3].ForeColor = System.Drawing.Color.DarkViolet;
                                    break;
                                case "Pend": // Pending
                                    row.Cells[3].ForeColor = System.Drawing.Color.DarkGoldenrod;
                                    break;
                                case "Evid": // Evidence
                                    row.Cells[3].ForeColor = System.Drawing.Color.Green;
                                    break;
                                default: // Current                                    
                                    row.Cells[3].ForeColor = System.Drawing.Color.Black;
                                    break;
                            }
                            if (ModuleID == 3)
                            {
                                string processingStatus = row.Cells[6].Text.Substring(0, 4);
                                switch (processingStatus)
                                {
                                    case "Draf": // Draft
                                    case "Open": // Open
                                        row.Cells[6].ForeColor = System.Drawing.Color.Red;
                                        break;
                                    case "Coll": // Collaborate
                                        row.Cells[6].ForeColor = System.Drawing.Color.DarkRed;
                                        break;
                                    case "Revi": // Review
                                        row.Cells[6].ForeColor = System.Drawing.Color.Blue;
                                        break;
                                    case "Read": // Ready
                                        row.Cells[6].ForeColor = System.Drawing.Color.DarkViolet;
                                        break;
                                    case "Pend": // Pending
                                        row.Cells[6].ForeColor = System.Drawing.Color.DarkGoldenrod;
                                        break;
                                    default: // Current                                    
                                        row.Cells[6].ForeColor = System.Drawing.Color.Black;
                                        break;
                                }
                            }
                        }
                    }
                }
                switch (ModuleID)
                {
                    case 1:
                        int SelUserID = Convert.ToInt32(gvUsersList.DataKeys[gvUsersList.SelectedIndex].Values["UserID"]);
                        Session["SelUserID"] = SelUserID;
                        break;
                    case 0:
                    case 3:
                        if (gvItemList.SelectedIndex > -1)
                        {
                            int index = gvItemList.SelectedIndex;
                            int docOrigID = Convert.ToInt32(gvItemList.Rows[index].Cells[7].Text);
                            bool IsEvidence = Convert.ToBoolean(gvItemList.DataKeys[index].Values["IsEvidence"]);

                            // set IsEvidence value in session to check items.
                            Session["IsEvidenceCheck"] = IsEvidence.ToString();
                            bool IsCheckedOut = false;
                            if (!gvItemList.DataKeys[index].Values["IsCheckedOut"].Equals(DBNull.Value))
                            {
                                IsCheckedOut = Convert.ToBoolean(gvItemList.DataKeys[index].Values["IsCheckedOut"]);
                            }
                            pnlProperties.Visible = true;
                            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                            {
                                // Get user status information from authentication cookie.
                                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                                string UserData = authTicket.UserData;
                                string[] UserValues = UserData.Split(',');
                                int UserID = Convert.ToInt32(UserValues[0]);
                                int UserStatus = Convert.ToInt32(UserValues[3]);

                                // Get processing status value
                                string Processing = gvItemList.Rows[index].Cells[6].Text;
                                string Status = gvItemList.Rows[index].Cells[3].Text;

                                // Show/hide "Status" and "Edit" buttons
                                //bool RestrictedCanEdit = false;
                                bool HasEditPermission = await P3General.HasEditPermissionAsync(3, docOrigID, UserID);
                                bool HasStatusPermission = await P3General.HasStatusPermissionAsync(3, docOrigID, UserID);
                                if (IsEvidence)
                                {
                                    pnlEdit.Visible = false;
                                    pnlStatus.Visible = false;
                                }
                                else
                                {
                                    switch (UserStatus)
                                    {
                                        case 1: // Administrator
                                            if (HasEditPermission)
                                            {
                                                if (Processing.Contains("Draft") || Processing.Contains("Collaborate") || Status.Contains("Draft") || Status.Contains("Collaborate"))
                                                {
                                                    if (IsCheckedOut)
                                                    {
                                                        btnEdit.ImageUrl = "~/images/checkin.png";
                                                        lblEdit.Text = "Check In";
                                                    }
                                                    else
                                                    {
                                                        btnEdit.ImageUrl = "~/images/checkout.png";
                                                        lblEdit.Text = "Check Out";
                                                    }
                                                    pnlEdit.Visible = true;
                                                }
                                                else
                                                {
                                                    pnlEdit.Visible = false;
                                                }
                                            }
                                            else
                                            {
                                                pnlEdit.Visible = false;
                                            }

                                            if (HasStatusPermission)
                                            {
                                                pnlStatus.Visible = true;
                                            }
                                            else
                                            {
                                                pnlStatus.Visible = false;
                                            }
                                            break;
                                        case 0: // Normal User
                                            if (HasStatusPermission)
                                            {
                                                pnlStatus.Visible = true;
                                            }
                                            else
                                            {
                                                pnlStatus.Visible = false;
                                            }

                                            if (HasEditPermission)
                                            {
                                                if (Processing.Contains("Draft") || Processing.Contains("Collaborate") || Status.Contains("Draft") || Status.Contains("Collaborate"))
                                                {
                                                    if (IsCheckedOut)
                                                    {
                                                        btnEdit.ImageUrl = "~/images/checkin.png";
                                                        lblEdit.Text = "Check In";
                                                    }
                                                    else
                                                    {
                                                        btnEdit.ImageUrl = "~/images/checkout.png";
                                                        lblEdit.Text = "Check Out";
                                                    }
                                                    pnlEdit.Visible = true;
                                                }
                                                else
                                                {
                                                    pnlEdit.Visible = false;
                                                }
                                            }
                                            else
                                            {
                                                pnlEdit.Visible = false;
                                            }
                                            break;
                                        case -1: // Restricted User
                                            string RDocUser = ConfigurationManager.AppSettings["RestrictedUser"];
                                            if (RDocUser == "Edit")
                                            {
                                                if (HasStatusPermission)
                                                {
                                                    pnlStatus.Visible = true;
                                                }
                                                else
                                                {
                                                    pnlStatus.Visible = false;
                                                }

                                                if (HasEditPermission)
                                                {
                                                    if (Processing.Contains("Draft") || Processing.Contains("Collaborate") || Status.Contains("Draft") || Status.Contains("Collaborate"))
                                                    {
                                                        if (IsCheckedOut)
                                                        {
                                                            btnEdit.ImageUrl = "~/images/checkin.png";
                                                            lblEdit.Text = "Check In";
                                                        }
                                                        else
                                                        {
                                                            btnEdit.ImageUrl = "~/images/checkout.png";
                                                            lblEdit.Text = "Check Out";
                                                        }
                                                        pnlEdit.Visible = true;
                                                    }
                                                    else
                                                    {
                                                        pnlEdit.Visible = false;
                                                    }
                                                }
                                                else
                                                {
                                                    pnlEdit.Visible = false;
                                                }
                                            }
                                            break;
                                        default:
                                            break;
                                    }
                                }
                                pnlRelatedAI.Visible = true;
                                pnlParaLink.Visible = true;
                                pnlProgress.Visible = false;
                            }
                        }
                        break;
                    case 4:
                        // set IsEvidence value in session to check items.
                        Session["IsEvidenceCheck"] = "False";
                        break;
                    case 6:
                        // set IsEvidence value in session to check items.
                        Session["IsEvidenceCheck"] = "False";
                        break;
                    case 12:
                        pnlProperties.Visible = true;
                        if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                        {
                            int UserStatus = -10;
                            // Get user status information from authentication cookie.
                            string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                            FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                            string UserData = authTicket.UserData;
                            string[] UserValues = UserData.Split(',');
                            int UserID = Convert.ToInt32(UserValues[0]);
                            UserStatus = Convert.ToInt32(UserValues[3]);

                            int recOrigID = Convert.ToInt32(gvRecordList.Rows[gvRecordList.SelectedIndex].Cells[6].Text);
                            string recStatus = gvRecordList.Rows[gvRecordList.SelectedIndex].Cells[3].Text;
                            bool HasRecEditPermission = await P3General.HasEditPermissionAsync(ModuleID, recOrigID, UserID);
                            bool HasRecStatusPermission = await P3General.HasStatusPermissionAsync(ModuleID, recOrigID, UserID);
                            // Show/hide "Status" button
                            switch (UserStatus)
                            {
                                case 1: // Administrator
                                    pnlStatus.Visible = true;
                                    break;
                                case 0: // Normal User
                                    if (HasRecStatusPermission == true)
                                    {
                                        pnlStatus.Visible = true;
                                    }
                                    break;
                                case -1: // Restricted User
                                    string RRecUser = ConfigurationManager.AppSettings["RestrictedUser"];
                                    if (RRecUser == "Edit")
                                    {
                                        if (HasRecStatusPermission == true)
                                        {
                                            pnlStatus.Visible = true;
                                        }
                                    }
                                    break;
                            }
                            pnlRelatedAI.Visible = true;
                            pnlParaLink.Visible = true;
                            pnlProgress.Visible = false;
                        }
                        break;
                    case 14:
                        pnlReport.Visible = false;
                        pnlProgress.Visible = false;
                        break;
                }
                mnuGVContext.Items.Add(new MenuItem("Properties", "properties"));
            }
        }

        protected void SortGV(object sender, GridViewSortEventArgs e)
        {
            GridView gv = (GridView)sender;
            int ModuleID = Convert.ToInt32(Session["ModuleID"]);
            string ParentGroupID = p3Tree.SelectedValue;
            int UserID = 0;
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
            }
            DataTable dtItems = P3General.Get_ItemList(ModuleID, UserID, ParentGroupID);
            string sortDirection = string.Empty;
            if (Direction == SortDirection.Ascending)
            {
                Direction = SortDirection.Descending;
                sortDirection = " DESC";
            }
            else
            {
                Direction = SortDirection.Ascending;
                sortDirection = " ASC";
            }
            dtItems.DefaultView.Sort = e.SortExpression + sortDirection;
            gv.DataSource = dtItems;
            gv.DataBind();

            // Set Sort Cookie Properties.
            HttpCookie sortCookie = Request.Cookies["P3WebSort"];
            if (sortCookie == null)
            {
                sortCookie = new HttpCookie("P3WebSort");
                sortCookie.Values.Add("usrSort", "Name ASC");
                sortCookie.Values.Add("docSort", "Name ASC");
                sortCookie.Values.Add("recSort", "Name ASC");
                sortCookie.Values.Add("impSort", "Name ASC");
                sortCookie.Values.Add("trainSort", "Name ASC");
                sortCookie.Values.Add("aiSort", "SendDate DESC");
                sortCookie.Expires = DateTime.UtcNow.AddDays(30);
                Response.Cookies.Add(sortCookie);
            }
            else
            {
                switch (ModuleID)
                {
                    case 1:
                        sortCookie.Values["usrSort"] = e.SortExpression + sortDirection;
                        break;
                    case 3:
                        sortCookie.Values["docSort"] = e.SortExpression + sortDirection;
                        break;
                    case 4:
                        sortCookie.Values["recSort"] = e.SortExpression + sortDirection;
                        break;
                    case 6:
                        sortCookie.Values["impSort"] = e.SortExpression + sortDirection;
                        break;
                    case 12:
                        sortCookie.Values["trainSort"] = e.SortExpression + sortDirection;
                        break;
                    case 14:
                        sortCookie.Values["aiSort"] = e.SortExpression + sortDirection;
                        break;
                }

                if (string.IsNullOrEmpty(sortCookie.Values["usrSort"]))
                {
                    sortCookie.Values.Add("usrSort", "Name ASC");
                }
                if (string.IsNullOrEmpty(sortCookie.Values["docSort"]))
                {
                    sortCookie.Values.Add("docSort", "Name ASC");
                }
                if (string.IsNullOrEmpty(sortCookie.Values["recSort"]))
                {
                    sortCookie.Values.Add("recSort", "Name ASC");
                }
                if (string.IsNullOrEmpty(sortCookie.Values["impSort"]))
                {
                    sortCookie.Values.Add("impSort", "Name ASC");
                }
                if (string.IsNullOrEmpty(sortCookie.Values["trainSort"]))
                {
                    sortCookie.Values.Add("trainSort", "Name ASC");
                }
                if (string.IsNullOrEmpty(sortCookie.Values["aiSort"]))
                {
                    sortCookie.Values.Add("aiSort", "SendDate DESC");
                }

                sortCookie.Expires = DateTime.UtcNow.AddDays(30);
                Response.Cookies.Set(sortCookie);
            }
        }

        public SortDirection Direction
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                {
                    ViewState["sortDirection"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["sortDirection"];
            }
            set
            {
                ViewState["sortDirection"] = value;
            }
        }

        #endregion

        #region Report Subroutines

        protected async Task Get_SavedReportsAsync(int ModuleID)
        {
            int UserID = 0;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
            }
            mnuReports.Items.Clear();
            DataTable dt = await Reports.GetSavedReportsAsync(ModuleID, UserID);
            foreach (DataRow dr in dt.Rows)
            {
                string ReportName = dr["SrchAndRprtName"].ToString();
                string ReportID = dr["SrchAndRprtID"].ToString();

                MenuItem itm = new MenuItem()
                {
                    Text = ReportName,
                    Value = ReportID,
                    ImageUrl = "~/images/item.png"
                };

                mnuReports.Items.Add(itm);
            }
            dt.Dispose();
        }

        #endregion

        protected void lnkVersion_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(udpSplitter, udpSplitter.GetType(), "relnotes", "openRelNotes()", true);
            pnlList.Visible = false;
            pnlHome.Visible = true;
            pnlDirectLink.Visible = true;
            pnlTreeView.Visible = false;
            mnuModules.Items[0].Selected = true;
        }

        private async Task UpdateListViewAsync()
        {
            Session["IsGroup"] = 1;
            Session["ParentGroupID"] = p3Tree.SelectedValue;
            p3Tree.SelectedNode.Expand();
            int moduleID = Convert.ToInt32(ConfigurationManager.AppSettings["DefModuleID"]);
            if (Session["ModuleID"] != null)
            {
                moduleID = Convert.ToInt32(Session["ModuleID"]);
            }
            int userID = 0;
            int userStatus = -1;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                // Get user information from authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                userID = Convert.ToInt32(UserValues[0]);
                userStatus = Convert.ToInt32(UserValues[3]);
            }

            int groupID = Convert.ToInt32(p3Tree.SelectedValue);
            gvUsersList.SelectedIndex = -1;
            gvItemList.SelectedIndex = -1;
            gvRecordList.SelectedIndex = -1;
            gvAIList.SelectedIndex = -1;
            DataTable dt = P3General.Get_ItemList(moduleID, userID, groupID.ToString());
            HttpCookie sortCookie = Request.Cookies["P3WebSort"];
            string sortExp;
            // set toolbar button properties and sort expression.
            DisableButtons();
            if (moduleID != 14)
            {
                pnlProperties.Visible = true;
            }

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                // Enable Add Button if user is authenticated
                bool HasAddPermission = await P3General.HasAddPermissionAsync(moduleID, groupID, userID);
                bool HasRenamePermission = await P3General.HasRenamePermissionAsync(moduleID, groupID, userID);
                bool HasMovePermission = await P3General.HasMovePermissionAsync(moduleID, groupID, userID);
                bool HasDeletePermission = await P3General.HasDeletePermissionAsync(moduleID, groupID, userID);
                bool HasSetRepublishPermission = await P3General.HasSetRepublishPermissionAsync(moduleID, groupID, userID);


                if (userStatus == 1)
                {
                    pnlAdd.Visible = true;
                }
                else
                {
                    if (HasAddPermission)
                    {
                        pnlAdd.Visible = true;
                    }
                }

                if (HasRenamePermission)
                {
                    pnlRename.Visible = true;
                    mnuTVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionRename").ToString(), "rename"));
                }

                if (HasMovePermission)
                {
                    pnlMove.Visible = true;
                    mnuTVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionMove").ToString(), "move"));
                }

                if (HasDeletePermission)
                {
                    pnlDelete.Visible = true;
                    mnuTVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionDel").ToString(), "delete"));
                }

                if (moduleID == 3 && HasSetRepublishPermission)
                {
                    mnuTVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionRepub").ToString(), "setrepublish"));
                }

                if (HasMovePermission && moduleID != 1)
                {
                    pnlMove.Visible = true;
                    mnuTVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionCopy").ToString(), "copy"));
                }
            }

            switch (moduleID)
            {
                case 1:
                    // Report
                    pnlReport.Visible = false;
                    pnlProgress.Visible = false;

                    // Sort GridView
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["usrSort"];
                    }
                    else
                    {
                        sortExp = "Name ASC";
                    }
                    dt.DefaultView.Sort = sortExp;

                    // Clear unused grid views
                    gvItemList.DataSource = null;
                    gvItemList.DataBind();
                    gvRecordList.DataSource = null;
                    gvRecordList.DataBind();
                    gvAIList.DataSource = null;
                    gvAIList.DataBind();
                    // Fill used grid View
                    gvUsersList.DataSource = dt;
                    gvUsersList.DataBind();
                    break;
                case 4:
                    // Report
                    pnlReport.Visible = false;
                    pnlProgress.Visible = false;

                    // Sort GridView
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["recSort"];
                    }
                    else
                    {
                        sortExp = "Name ASC";
                    }
                    dt.DefaultView.Sort = sortExp;

                    // Clear unused grid views
                    gvUsersList.DataSource = null;
                    gvUsersList.DataBind();
                    gvItemList.DataSource = null;
                    gvItemList.DataBind();
                    gvAIList.DataSource = null;
                    gvAIList.DataBind();
                    // Fill used grid View
                    gvRecordList.DataSource = dt;
                    gvRecordList.DataBind();
                    break;
                case 6:
                    // Report
                    pnlReport.Visible = false;
                    pnlProgress.Visible = false;

                    // Sort GridView
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["impSort"];
                    }
                    else
                    {
                        sortExp = "Name ASC";
                    }
                    dt.DefaultView.Sort = sortExp;

                    // Clear unused grid views
                    gvUsersList.DataSource = null;
                    gvUsersList.DataBind();
                    gvItemList.DataSource = null;
                    gvItemList.DataBind();
                    gvAIList.DataSource = null;
                    gvAIList.DataBind();
                    // Fill used grid View
                    gvRecordList.DataSource = dt;
                    gvRecordList.DataBind();
                    break;
                case 12:
                    // Report
                    pnlReport.Visible = false;
                    pnlProgress.Visible = false;

                    // Sort GridView
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["trainSort"];
                    }
                    else
                    {
                        sortExp = "Name ASC";
                    }
                    dt.DefaultView.Sort = sortExp;

                    // Clear unused grid views
                    gvUsersList.DataSource = null;
                    gvUsersList.DataBind();
                    gvItemList.DataSource = null;
                    gvItemList.DataBind();
                    gvAIList.DataSource = null;
                    gvAIList.DataBind();
                    // Fill used grid View
                    gvRecordList.DataSource = dt;
                    gvRecordList.DataBind();
                    break;
                case 14:
                    // Disable Add, Rename, and Move Buttons
                    pnlAdd.Visible = false;
                    pnlRename.Visible = false;
                    pnlMove.Visible = false;
                    // Report
                    pnlReport.Visible = false;
                    pnlProgress.Visible = false;

                    // Sort GridView
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["aiSort"];
                    }
                    else
                    {
                        sortExp = "SendDate DESC";
                    }
                    dt.DefaultView.Sort = sortExp;

                    // Clear unused grid views
                    gvUsersList.DataSource = null;
                    gvUsersList.DataBind();
                    gvRecordList.DataSource = null;
                    gvRecordList.DataBind();
                    gvItemList.DataSource = null;
                    gvItemList.DataBind();
                    // Fill used grid View
                    gvAIList.DataSource = dt;
                    gvAIList.DataBind();
                    if (gvAIList.Rows.Count > 0)
                    {
                        gvAIList.SelectedIndex = 0;
                    }

                    Session["AIIDs"] = null;
                    int totalAI = gvAIList.Rows.Count;
                    List<string> AIList = new List<string>();
                    for (int i = 0; i < totalAI; i++)
                    {
                        AIList.Add(gvAIList.DataKeys[i].Values["AIID"].ToString());
                    }
                    Session["AIIDs"] = AIList;

                    // Report
                    pnlReport.Visible = false;
                    pnlProgress.Visible = false;
                    break;
                default:
                    // Sort GridView
                    if (sortCookie != null)
                    {
                        sortExp = sortCookie.Values["docSort"];
                    }
                    else
                    {
                        sortExp = "Name ASC";
                    }
                    dt.DefaultView.Sort = sortExp;

                    // Clear unused grid views
                    gvUsersList.DataSource = null;
                    gvUsersList.DataBind();
                    gvRecordList.DataSource = null;
                    gvRecordList.DataBind();
                    gvAIList.DataSource = null;
                    gvAIList.DataBind();
                    // Fill used grid View
                    gvItemList.DataSource = dt;
                    gvItemList.DataBind();

                    // Report
                    pnlReport.Visible = true;
                    pnlProgress.Visible = false;
                    break;
            }
        }

        private async Task UpdateToolbarAsync()
        {
            if (gvItemList.SelectedIndex > -1)
            {
                int index = gvItemList.SelectedIndex;
                int docOrigID = Convert.ToInt32(gvItemList.Rows[index].Cells[7].Text);
                //int docItemID = Convert.ToInt32(gvItemList.DataKeys[index].Values["ItemID"]);
                bool IsEvidence = Convert.ToBoolean(gvItemList.DataKeys[index].Values["IsEvidence"]);
                bool IsCheckedOut = false;
                if (!gvItemList.DataKeys[index].Values["IsCheckedOut"].Equals(DBNull.Value))
                {
                    IsCheckedOut = Convert.ToBoolean(gvItemList.DataKeys[index].Values["IsCheckedOut"]);
                }
                pnlProperties.Visible = true;
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    // Get user status information from authentication cookie.
                    string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    int UserID = Convert.ToInt32(UserValues[0]);
                    int UserStatus = Convert.ToInt32(UserValues[3]);

                    // Get processing status value
                    string Processing = gvItemList.Rows[index].Cells[6].Text;
                    string Status = gvItemList.Rows[index].Cells[3].Text;

                    // Show/hide "Status", "Edit", "Rename", and "Move" buttons
                    bool HasEditPermission = await P3General.HasEditPermissionAsync(3, docOrigID, UserID);
                    bool HasStatusPermission = await P3General.HasStatusPermissionAsync(3, docOrigID, UserID);
                    if (IsEvidence)
                    {
                        pnlEdit.Visible = false;
                        pnlStatus.Visible = false;
                    }
                    else
                    {
                        switch (UserStatus)
                        {
                            case 1: // Administrator
                                if (HasEditPermission)
                                {
                                    if (Processing.Contains("Draft") || Processing.Contains("Collaborate") || Status.Contains("Draft") || Status.Contains("Collaborate"))
                                    {
                                        if (IsCheckedOut)
                                        {
                                            btnEdit.ImageUrl = "~/images/checkin.png";
                                            lblEdit.Text = "Check In";
                                        }
                                        else
                                        {
                                            btnEdit.ImageUrl = "~/images/checkout.png";
                                            lblEdit.Text = "Check Out";
                                        }
                                        pnlEdit.Visible = true;
                                    }
                                    else
                                    {
                                        pnlEdit.Visible = false;
                                    }
                                }
                                else
                                {
                                    pnlEdit.Visible = false;
                                }

                                // Status?
                                if (HasStatusPermission)
                                {
                                    pnlStatus.Visible = true;
                                }
                                else
                                {
                                    pnlStatus.Visible = false;
                                }
                                break;
                            case 0: // Normal User
                                    // Status?
                                if (HasStatusPermission)
                                {
                                    pnlStatus.Visible = true;
                                }
                                else
                                {
                                    pnlStatus.Visible = false;
                                }

                                // Edit?
                                if (HasEditPermission)
                                {
                                    if (Processing.Contains("Draft") || Processing.Contains("Collaborate") || Status.Contains("Draft") || Status.Contains("Collaborate"))
                                    {
                                        if (IsCheckedOut)
                                        {
                                            btnEdit.ImageUrl = "~/images/checkin.png";
                                            lblEdit.Text = "Check In";
                                        }
                                        else
                                        {
                                            btnEdit.ImageUrl = "~/images/checkout.png";
                                            lblEdit.Text = "Check Out";
                                        }
                                        pnlEdit.Visible = true;
                                    }
                                    else
                                    {
                                        pnlEdit.Visible = false;
                                    }
                                }
                                else
                                {
                                    pnlEdit.Visible = false;
                                }
                                break;
                            case -1: // Restricted User
                                string RDocUser = ConfigurationManager.AppSettings["RestrictedUser"];
                                if (RDocUser == "Edit")
                                {
                                    // Status?
                                    if (HasStatusPermission)
                                    {
                                        pnlStatus.Visible = true;
                                    }
                                    else
                                    {
                                        pnlStatus.Visible = false;
                                    }

                                    // Edit?
                                    if (HasEditPermission)
                                    {
                                        if (Processing.Contains("Draft") || Processing.Contains("Collaborate") || Status.Contains("Draft") || Status.Contains("Collaborate"))
                                        {
                                            if (IsCheckedOut)
                                            {
                                                btnEdit.ImageUrl = "~/images/checkin.png";
                                                lblEdit.Text = "Check In";
                                            }
                                            else
                                            {
                                                btnEdit.ImageUrl = "~/images/checkout.png";
                                                lblEdit.Text = "Check Out";
                                            }
                                            pnlEdit.Visible = true;
                                        }
                                        else
                                        {
                                            pnlEdit.Visible = false;
                                        }
                                    }
                                    else
                                    {
                                        pnlEdit.Visible = false;
                                    }
                                }
                                break;
                            default:
                                break;
                        }
                        pnlRelatedAI.Visible = true;
                        pnlParaLink.Visible = true;
                        pnlProgress.Visible = false;
                    }
                }
            }
        }

        protected async Task PopulateGridViewMenu(int ModuleID, int GroupID, int OrigID, int UserID)
        {
            // Group Level Permissions
            //bool HasAddPermission = await P3General.HasAddPermissionAsync(ModuleID, GroupID, UserID);
            bool HasRenamePermission = await P3General.HasRenamePermissionAsync(ModuleID, GroupID, UserID);
            bool HasMovePermission = await P3General.HasMovePermissionAsync(ModuleID, GroupID, UserID);
            bool HasDeletePermission = await P3General.HasDeletePermissionAsync(ModuleID, GroupID, UserID);
            bool HasSetRepublishPermission = await P3General.HasSetRepublishPermissionAsync(ModuleID, GroupID, UserID);

            // Item Level Permissions
            //bool HasEditPermission = await P3General.HasEditPermissionAsync(ModuleID, OrigID, UserID);
            bool HasStatusPermission = await P3General.HasStatusPermissionAsync(ModuleID, OrigID, UserID);
            bool HasChangetoEvidencePemission = await P3General.HasChangetoEvidencePemission(OrigID, UserID);
            bool HasChangetoItemPemission = await P3General.HasChangetoItemPemission(OrigID, UserID);

            mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionView").ToString(), "view"));
            if (HasRenamePermission)
            {
                mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionRename").ToString(), "rename"));
            }
            if (HasMovePermission)
            {
                mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionMove").ToString(), "move"));
            }

            if (HasMovePermission && ModuleID != 1)
            {
                mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionCopy").ToString(), "copy"));
            }

            if (ModuleID != 1)
            {
                if (HasChangetoEvidencePemission && Session["IsEvidenceCheck"].ToString() == "False")
                {
                    mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionEvid").ToString(), "evidence"));
                }

                if (HasChangetoItemPemission && Session["IsEvidenceCheck"].ToString() == "True")
                {
                    mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionItem").ToString(), "item"));
                }                
            }
            
            if (HasDeletePermission)
            {
                mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionDel").ToString(), "delete"));
            }

            if (HasStatusPermission)
            {
                mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionStatus").ToString(), "status"));
            }

            if (ModuleID == 3 && HasSetRepublishPermission)
            {
                mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionRepub").ToString(), "setrepublish"));
            }

            if (ModuleID == 3 && HasDeletePermission)
            {
                mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionExport").ToString(), "export"));
            }

            if (ModuleID == 3)
            {
                MenuItem aiMenuItem = new MenuItem(GetLocalResourceObject("mnuOptionActionItem").ToString(), "actionitem");
                MenuItem aiSubMenuItem = new MenuItem(GetLocalResourceObject("mnuOptionCreateAI").ToString(), "createactionitem");
                aiMenuItem.ChildItems.Add(aiSubMenuItem);

                mnuGVContext.Items.Add(aiMenuItem);
                

                //mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionActionItem").ToString(), "actionitem"));
                //MenuItem newSubMenuItem = new MenuItem(GetLocalResourceObject("mnuOptionCreateAI").ToString(), "createactionitem");
                //mnuGVContext.FindItem("actionitem").ChildItems.Add(newSubMenuItem);
            }

            mnuGVContext.Items.Add(new MenuItem(GetLocalResourceObject("mnuOptionProp").ToString(), "properties"));
        }
    }
}