using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Paradigm3.datalayer;
using System.Data;
using System.Web.Security;
using System.Threading.Tasks;

namespace Paradigm3
{
    public partial class ViewSearch : SqlViewStatePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ModuleID = int.Parse(Request.QueryString["ModuleID"]);
            int ParentGroupID = int.Parse(Request.QueryString["ParentGroupID"]);
            if (!IsPostBack)
            {
                Init_Search(ModuleID, ParentGroupID);
                Display_SearchField("Name");
                txtSearch.Focus();
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewSearch.aspx";
        }

        #region Initialization Methods

        protected void Init_Search(int ModuleID, int ParentGroupID)
        {
            int UserID = 0;
            int UserStatus = -1;
            bool IsAuthenticated = false;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
                UserStatus = Convert.ToInt32(UserValues[3]);
                IsAuthenticated = true;
            }
            if (IsAuthenticated)
			{
                BrowsePopUp.Enabled = true;
			}
            else
			{
                BrowsePopUp.Enabled = false;
			}
            Populate_Modules(IsAuthenticated);
            Populate_FieldSelect(ModuleID);
            string DefaultField = ConfigurationManager.AppSettings["DefaultSearchType"];
            foreach (ListItem li in DDLField.Items)
			{
                if (li.Value == DefaultField)
				{
                    li.Selected = true;
				}
			}
            Populate_GroupName(ModuleID, ParentGroupID);
            if (UserID != 0)
			{
                PopulateRootLevel(ModuleID, UserID, ParentGroupID);
            }            
            txtSearch.Text = string.Empty;
            txtSearch.Focus();
            txtStartDate.Text = DateTime.Today.ToShortDateString();
            txtEndDate.Text = DateTime.Today.ToShortDateString();
            Process_Roles(ModuleID);
            Process_Categories(ModuleID);
            if (ModuleID != 3 && ModuleID != 14)
            {
                Populate_Styles(ModuleID);
            }

            DDLModule.ClearSelection();
            switch (ModuleID)
            {
                case 3:
                    DDLModule.Items[0].Selected = true;
                    btnBrowse.Enabled = true;
                    btnSearch.Enabled = true;
                    btnShowMe.Enabled = true;
                    break;
                case 4:
                    DDLModule.Items[1].Selected = true;
                    btnBrowse.Enabled = true;
                    btnSearch.Enabled = true;
                    btnShowMe.Enabled = true;
                    break;
                case 6:
                    DDLModule.Items[2].Selected = true;
                    btnBrowse.Enabled = true;
                    btnSearch.Enabled = true;
                    btnShowMe.Enabled = true;
                    break;
                case 12:
                    DDLModule.Items[3].Selected = true;
                    btnBrowse.Enabled = true;
                    btnSearch.Enabled = true;
                    btnShowMe.Enabled = true;
                    break;
                case 14:
                    DDLModule.Items[4].Selected = true;
                    txtFolder.Text = string.Empty;
                    btnBrowse.Enabled = false;
                    if (UserID == 0)
                    {
                        btnSearch.Enabled = false;
                    }
                    else
                    {
                        btnSearch.Enabled = true;
                    }
                    btnShowMe.Enabled = false;
                    break;
            }
        }

        protected void Populate_Modules(bool IsAuthenticated)
        {
            DDLModule.Items.Clear();
            if (IsAuthenticated)
            {
                DDLModule.Items.Add(new ListItem("Documents", "3"));
                DDLModule.Items.Add(new ListItem("Records", "4"));
                DDLModule.Items.Add(new ListItem("Improvements", "6"));
                DDLModule.Items.Add(new ListItem("Training", "12"));
                DDLModule.Items.Add(new ListItem("Action Items", "14"));
            }
            else
            {
                DDLModule.Items.Add(new ListItem("Documents", "3"));
                DDLModule.Items.Add(new ListItem("Records", "4"));
                DDLModule.Items.Add(new ListItem("Improvements", "6"));
                DDLModule.Items.Add(new ListItem("Training", "12"));
            }
        }

        protected void Populate_FieldSelect(int ModuleID)
        {
            DDLField.Items.Clear();
            switch (ModuleID)
            {
                case 0:
                case 3:
                    bool UseSimpleSearch = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSimpleDocSearch"]);
                    // Populate ddlField with applicable values
                    if (UseSimpleSearch)
                    {
                        DDLField.Items.Add(new ListItem("Document Name", "Name"));
                        DDLField.Items.Add(new ListItem("Document Label", "LabelName"));
                        DDLField.Items.Add(new ListItem("Document Original ID", "OrigID"));
                        DDLField.Items.Add(new ListItem("Document Containing Text", "DocText"));

                        TabRoles.Visible = false;
                        TabCategory.Visible = false;
                        TabStyle.Visible = false;
                        TabContainer1.ActiveTabIndex = 0;
                    }
                    else
                    {
                        DDLField.Items.Add(new ListItem("Document Name", "Name"));
                        DDLField.Items.Add(new ListItem("Document Label", "LabelName"));
                        DDLField.Items.Add(new ListItem("Document ID", "ItemID"));
                        DDLField.Items.Add(new ListItem("Document Original ID", "OrigID"));
                        DDLField.Items.Add(new ListItem("Last Modified Date", "LastModified"));
                        DDLField.Items.Add(new ListItem("Converted Date", "VersionDate"));
                        DDLField.Items.Add(new ListItem("Status", "Status"));
                        DDLField.Items.Add(new ListItem("Item Notes", "Notes"));
                        DDLField.Items.Add(new ListItem("History", "MemoData"));
                        DDLField.Items.Add(new ListItem("Document Containing Text", "DocText"));

                        TabRoles.Visible = true;
                        TabCategory.Visible = true;
                        TabStyle.Visible = false;

                        int DefaultTab = Convert.ToInt32(ConfigurationManager.AppSettings["DefaultSearchTab"]);
                        if (DefaultTab < TabContainer1.Tabs.Count)
                        {
                            TabContainer1.ActiveTabIndex = DefaultTab;
                        }
                        else
                        {
                            TabContainer1.ActiveTabIndex = 0;
                        }
                    }
                    break;
                case 4:
                case 6:
                case 12:
                    DDLField.Items.Add(new ListItem("Item Name", "Name"));
                    DDLField.Items.Add(new ListItem("Item Label", "LabelName"));
                    DDLField.Items.Add(new ListItem("Item ID", "ItemID"));
                    DDLField.Items.Add(new ListItem("Item Original ID", "OrigID"));
                    DDLField.Items.Add(new ListItem("Last Modified Date", "LastModified"));
                    DDLField.Items.Add(new ListItem("Converted Date", "VersionDate"));
                    DDLField.Items.Add(new ListItem("Status", "Status"));
                    DDLField.Items.Add(new ListItem("Item Notes", "Notes"));
                    DDLField.Items.Add(new ListItem("History", "History"));

                    TabRoles.Visible = true;
                    TabCategory.Visible = true;
                    TabStyle.Visible = true;
                    break;
                case 14:
                    DDLField.Items.Add(new ListItem("Title", "Name"));
                    DDLField.Items.Add(new ListItem("Status", "Status"));
                    DDLField.Items.Add(new ListItem("Due Date", "DueDate"));
                    DDLField.Items.Add(new ListItem("Details", "Details"));
                    DDLField.Items.Add(new ListItem("Sent Date", "SentDate"));
                    DDLField.Items.Add(new ListItem("Recipient", "Recipient"));

                    TabRoles.Visible = false;
                    TabCategory.Visible = true;
                    TabStyle.Visible = false;
                    break;
            }
        }

        protected void Populate_GroupName(int ModuleID, int ParentGroupID)
        {
            txtFolder.Text = P3General.Get_GroupName(ModuleID, ParentGroupID);
        }

        protected void Populate_DDLSearch(int ModuleID)
        {
            DDLSearch.Items.Clear();
            if (DDLField.SelectedValue == "Status")
            {
                switch (ModuleID)
                {
                    case 3:
                        DDLSearch.Items.Add(new ListItem("Current", "1"));
                        DDLSearch.Items.Add(new ListItem("Pending", "2"));
                        DDLSearch.Items.Add(new ListItem("Ready", "3"));
                        DDLSearch.Items.Add(new ListItem("Review", "4"));
                        DDLSearch.Items.Add(new ListItem("Collaborate", "5"));
                        DDLSearch.Items.Add(new ListItem("Draft", "6"));
                        DDLSearch.Items.Add(new ListItem("Open", "7"));
                        DDLSearch.Items.Add(new ListItem("Obsolete", "8"));
                        DDLSearch.Items.Add(new ListItem("Complete", "9"));
                        break;
                    case 4:
                    case 6:
                    case 12:
                    case 14:
                        DDLSearch.Items.Add(new ListItem("Open", "2"));
                        DDLSearch.Items.Add(new ListItem("Complete", "3"));
                        break;
                }
            }
        }

        protected void Display_SearchField(string Field)
        {
            switch (Field)
            {
                case "Name":
                case "LabelName":
                case "ItemID":
                case "OrigID":
                case "Notes":
                case "MemoData":
                case "DocText":
                case "Details":
                    txtSearch.Visible = true;
                    DDLSearch.Visible = false;
                    txtStartDate.Visible = false;
                    lblTo.Visible = false;
                    txtEndDate.Visible = false;
                    lblConvertedBy.Visible = false;
                    DDLConvertedBy.Visible = false;
                    break;
                case "LastModified":
                case "VersionDate":
                case "DueDate":
                case "SentDate":
                    txtSearch.Visible = false;
                    DDLSearch.Visible = false;
                    txtStartDate.Visible = true;
                    lblTo.Visible = true;
                    txtEndDate.Visible = true;
                    lblConvertedBy.Visible = false;
                    DDLConvertedBy.Visible = false;
                    break;
                case "Status":
                case "Recipient":
                    txtSearch.Visible = false;
                    DDLSearch.Visible = true;
                    Populate_DDLSearch(Convert.ToInt32(DDLModule.SelectedValue));
                    txtStartDate.Visible = false;
                    lblTo.Visible = false;
                    txtEndDate.Visible = false;
                    if (DDLModule.SelectedValue == "14")
                    {
                        lblConvertedBy.Visible = false;
                        DDLConvertedBy.Visible = false;
                    }
                    else
                    {
                        lblConvertedBy.Visible = true;
                        DDLConvertedBy.Visible = true;
                    }
                    int ConvertedModuleID = Convert.ToInt32(DDLModule.SelectedValue);
                    DataSet ds = SearchData.Get_SearchVar(ConvertedModuleID);
                    DataTable dtConvertedBy = ds.Tables["Get_ConvertedBy"];
                    DDLConvertedBy.Items.Clear();
                    DDLConvertedBy.Items.Add(new ListItem("All", "0"));
                    foreach (DataRow dr in dtConvertedBy.Rows)
                    {
                        if (dr["LastName"].ToString() != "" || dr["LastName"] != DBNull.Value)
                        {
                            DDLConvertedBy.Items.Add(new ListItem(dr["LastName"].ToString() + ", " + dr["FirstName"].ToString(), dr["VersionedByID"].ToString()));
                        }
                    }
                    DDLConvertedBy.Items.FindByValue("0").Selected = true;
                    break;
            }
        }

        protected void Process_Roles(int ModuleID)
        {
            // Process Roles
            DataTable dtRoles = SearchData.Get_SearchVar(ModuleID).Tables[3];
            DDLRoles.Items.Clear();
            DDLRoles.DataSource = dtRoles;
            DDLRoles.DataTextField = "CatCaption";
            DDLRoles.DataValueField = "CatID";
            DDLRoles.DataBind();
            if (DDLRoles.Items.Count > 0)
            {
                DDLRoles.Items[0].Selected = true;
                DataTable dtRoleAssigned = SearchData.Get_RolesAssigned(ModuleID, Convert.ToInt32(DDLRoles.SelectedValue));
                foreach (DataRow drra in dtRoleAssigned.Rows)
                {
                    DDLRoleAssigned.Items.Add(new ListItem(drra["ControlFullName"].ToString(), drra["ControlID"].ToString()));
                }
            }
        }

        protected void Process_Categories(int ModuleID)
        {
            DataTable dtCategories = SearchData.Get_SearchVar(ModuleID).Tables[4];
            cblCategory.Items.Clear();
            foreach (DataRow dr in dtCategories.Rows)
            {
                cblCategory.Items.Add(new ListItem(dr["CatCaption"].ToString(), dr["CatID"].ToString()));
            }
        }

        protected void Populate_Styles(int ModuleID)
        {
            ddlStyles.Items.Clear();
            ddlStyles.Items.Add(new ListItem("-- Select -- ", "0"));
            DataTable dt = SearchData.Get_Styles(ModuleID);
            ddlStyles.DataSource = dt;
            ddlStyles.DataTextField = "Caption";
            ddlStyles.DataValueField = "ObjTypeID";
            ddlStyles.DataBind();
            ddlStyles.Enabled = true;
            dt.Dispose();

            ddlObjField.Visible = false;
            ddlModify.Visible = false;
            ddlMod.Visible = false;
            txtDateStart.Visible = false;
            txtNumStart.Visible = false;
            lblModTo.Visible = false;
            txtDateEnd.Visible = false;
            txtNumEnd.Visible = false;
        }

        protected void Populate_Fields(int ModuleID, int ObjTypeID)
        {
            ddlObjField.Items.Clear();
            ddlObjField.Items.Add(new ListItem("-- Select -- ", "0"));
            DataTable dt = SearchData.Get_ObjFields(ModuleID, ObjTypeID);
            ddlObjField.DataSource = dt;
            ddlObjField.DataTextField = "FieldName";
            ddlObjField.DataValueField = "FieldID";
            ddlObjField.DataBind();
            ddlObjField.Enabled = true;
            ddlObjField.Visible = true;
        }

        #endregion

        #region General Methods

        protected async void Button_Click(object sender, EventArgs e)
        {
            int ModuleID = Convert.ToInt32(DDLModule.SelectedValue);
            int ParentGroupID = 1;
            if (tvBrowse.Nodes.Count > 0)
			{
                ParentGroupID = Convert.ToInt32(tvBrowse.SelectedValue);
            }

            bool isSubGroup = chkSubGroup.Checked;
            bool isWithdrawn = chkWithdrawn.Checked;

            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "Search":
                    int UserID = 0;
                    int UserStatus = -1;
                    string SiteID = ConfigurationManager.AppSettings["SiteID"];
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        UserID = Convert.ToInt32(UserValues[0]);
                        UserStatus = Convert.ToInt32(UserValues[3]);
                    }
					DataTable dt = await ExecuteSearchAsync(ModuleID, ParentGroupID, isSubGroup, isWithdrawn, UserID, UserStatus, SiteID);
					
					// Populate and sort GridView
					HttpCookie sortCookie = Request.Cookies["P3WebSort"];
					string sortExp;
					switch (ModuleID)
					{
						case 14:
							gvAISearchResults.DataSource = dt;
							gvAISearchResults.DataBind();
							lblResultCount.Text = gvAISearchResults.Rows.Count.ToString() + " results found";
							break;
						default:                            
							switch (ModuleID)
							{
								case 3:
                                case 0:
                                    if (dt.Rows.Count > 0)
                                    {
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
                                    }
									
                                    gvSearchResults.DataKeyNames = new string[] { "ItemID", "OrigID", "ParentGroupID", "Version", "ObjTypeID", "Status", "FileExtension", "TypeOfPublish" };
                                    break;
								case 4:
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
                                    gvSearchResults.DataKeyNames = new string[] { "ItemID", "OrigID", "ParentGroupID", "ObjTypeID", "Version", "Status" };
                                    break;
								case 6:
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
                                    gvSearchResults.DataKeyNames = new string[] { "ItemID", "OrigID", "ParentGroupID", "ObjTypeID", "Version", "Status" };
                                    break;
								case 12:
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
                                    gvSearchResults.DataKeyNames = new string[] { "ItemID", "OrigID", "ParentGroupID", "ObjTypeID", "Version", "Status" };
                                    break;
							}
							gvSearchResults.DataSource = dt;
                            gvSearchResults.DataBind();
							lblResultCount.Text = gvSearchResults.Rows.Count.ToString() + " results found";
							break;
					}

					if (lblResultCount.Text == "0 results found" || lblResultCount.Text == string.Empty)
					{
						btnShowMe.Enabled = false;
						btnShowMe.Visible = false;
						btnGo.Enabled = false;
						btnGo.Visible = false;
						btnClear.Enabled = true;
						btnClear.Visible = true;
						ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "noresult", "alert('There are no items that match your search')", true);
					}
					else
					{
						btnShowMe.Enabled = true;
						btnShowMe.Visible = true;
						btnGo.Enabled = true;
						btnGo.Visible = true;
						btnClear.Enabled = true;
						btnClear.Visible = true;
						ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "enlarge", "enlargeSearchWindow();", true);
					}
					break;
                case "Clear":
                    gvSearchResults.DataSource = null;
                    gvSearchResults.DataBind();
                    gvAISearchResults.DataSource = null;
                    gvAISearchResults.DataBind();
                    lblResultCount.Text = string.Empty;
                    int InitModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                    int InitParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
                    btnShowMe.Enabled = false;
                    btnShowMe.Visible = false;
                    btnGo.Enabled = false;
                    btnGo.Visible = false;
                    btnClear.Enabled = false;
                    btnClear.Visible = false;
                    Init_Search(InitModuleID, InitParentGroupID);
                    ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "reduce", "reduceSearchWindow();", true);
                    break;
                case "ShowMe":                    
                    string strShowMe = string.Empty;
                    switch (ModuleID)
                    {
                        case 3:
                            if (gvSearchResults.SelectedIndex < 0)
                            {
                                ScriptManager.RegisterStartupScript(udpSearch, GetType(), "must select", "alert('You must select a result item to see it.')", true);
                            }
                            else
                            {
                                string pubPath = ConfigurationManager.AppSettings["PublishPath"];
                                string ShowItemID = gvSearchResults.DataKeys[gvSearchResults.SelectedIndex].Values["ItemID"].ToString();
                                string ShowOrigID = gvSearchResults.SelectedRow.Cells[4].Text;//gvSearchResults.DataKeys[gvSearchResults.SelectedIndex].Values["OrigID"].ToString();
                                string ShowStatus = gvSearchResults.DataKeys[gvSearchResults.SelectedIndex].Values["Status"].ToString();
                                string ShowIsItemID = "false";
                                string ShowFileExtension = gvSearchResults.DataKeys[gvSearchResults.SelectedIndex].Values["FileExtension"].ToString();
                                string ShowTypeOfPublish = gvSearchResults.DataKeys[gvSearchResults.SelectedIndex].Values["TypeOfPublish"].ToString();
                                strShowMe = ShowItemID + "," + ShowOrigID + "," + ShowStatus + ",'" + ShowIsItemID + "'," + pubPath + ",'" + ShowFileExtension + "'," + ShowTypeOfPublish;
                                //strShowMe = gvSearchResults.SelectedRow.Cells[3].Text + ",1";
                                ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "openDoc", "openDocWindow(" + strShowMe + ");", true);
                            }                            
                            break;
                        case 4:
                        case 6:
                        case 12:
                            if (gvSearchResults.SelectedIndex < 0)
                            {
                                ScriptManager.RegisterStartupScript(udpSearch, GetType(), "must select", "alert('You must select a result item to see it.')", true);
                            }
                            else
                            {
                                string ItemID = gvSearchResults.SelectedRow.Cells[3].Text;
                                string ObjTypeID = gvSearchResults.DataKeys[gvSearchResults.SelectedRow.RowIndex].Values["ObjTypeID"].ToString();
                                strShowMe = ModuleID.ToString() + "," + ItemID + "," + ObjTypeID + "," + ParentGroupID.ToString() + ",0";
                                ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "openDoc", "openRecordWindow(" + strShowMe + ");", true);
                            }                            
                            break;
                        case 14:
                            if (gvAISearchResults.SelectedIndex < 0)
                            {
                                ScriptManager.RegisterStartupScript(udpSearch, GetType(), "must select", "alert('You must select a result item to see it.')", true);
                            }
                            else
                            {
                                string AIID = gvAISearchResults.SelectedRow.Cells[9].Text;
                                strShowMe = AIID + "," + ModuleID.ToString() + ",0";
                                ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "openAI", "openAIWindow(" + strShowMe + ");", true);
                            }                            
                            break;
                    }
                    break;
                case "GoThere":
                    if (gvSearchResults.SelectedIndex < 0)
                    {
                        ScriptManager.RegisterStartupScript(udpSearch, GetType(), "must select", "alert('You must select a result item to go to it.')", true);
                    }
                    else
                    {
                        Session["ModuleID"] = ModuleID.ToString();
                        Session["GTGroupID"] = gvSearchResults.DataKeys[gvSearchResults.SelectedRow.RowIndex].Values["ParentGroupID"];
                        Session["GTItemID"] = gvSearchResults.DataKeys[gvSearchResults.SelectedRow.RowIndex].Values["OrigID"]; //gvSearchResults.SelectedRow.Cells[3].Text;
                        Session["GTIsItemID"] = "0";
                        ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "goThere", "clickGoThere();window.close();", true);
                    }                    
                    break;
                case "Browse":
                    txtFolder.Text = tvBrowse.SelectedNode.Text;
                    break;
                case "Cancel":
                    ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "close", "closeP3Window();", true);
                    break;
            }
        }

        protected void DDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList DDL = (DropDownList)sender;
            switch (DDL.ID)
            {
                case "DDLModule":
                    int ModuleID = Convert.ToInt32(DDL.SelectedValue);
                    int ParentGroupID = 1;
                    switch (ModuleID)
                    {
                        case 3:
                            ParentGroupID = Convert.ToInt32(ConfigurationManager.AppSettings["DefDocGroupID"]);
                            btnShowMe.Enabled = true;
                            break;
                        case 4:
                            ParentGroupID = Convert.ToInt32(ConfigurationManager.AppSettings["DefRecGroupID"]);
                            btnShowMe.Enabled = true;
                            break;
                        case 6:
                            ParentGroupID = Convert.ToInt32(ConfigurationManager.AppSettings["DefImpGroupID"]);
                            btnShowMe.Enabled = true;
                            break;
                        case 12:
                            ParentGroupID = Convert.ToInt32(ConfigurationManager.AppSettings["DefTrainGroupID"]);
                            btnShowMe.Enabled = true;
                            break;
                        case 14:
                            ParentGroupID = 1;
                            btnShowMe.Enabled = false;
                            break;
                    }
                    // Populate all dropdowns with module specific values.
                    Init_Search(ModuleID, ParentGroupID);
                    Display_SearchField("Name");
                    if (ModuleID != 3 && ModuleID != 14)
                    {
                        Populate_Styles(ModuleID);
                    }
                    break;
                case "DDLField":
                    Display_SearchField(DDL.SelectedValue);
                    break;
                case "ddlStyles":
                    int moduleID = Convert.ToInt32(DDLModule.SelectedValue);
                    int ObjTypeID = Convert.ToInt32(ddlStyles.SelectedValue);
                    Populate_Fields(moduleID, ObjTypeID);
                    break;
                case "ddlObjField":
                    ddlModify.Items.Clear();
                    ddlMod.Items.Clear();

                    int FieldID = Convert.ToInt32(ddlObjField.SelectedValue);
                    int FieldType = SearchData.Get_FieldType(FieldID);
                    switch (FieldType)
                    {
                        default:                            
                            ddlModify.Items.Add(new ListItem("Equals", "1"));
                            ddlModify.Items.Add(new ListItem("Contains", "2"));
                            ddlModify.Visible = true;
                            ddlMod.Visible = false;
                            txtSearchString.Visible = true;
                            txtDateStart.Visible = false;
                            lblModTo.Visible = false;
                            txtDateEnd.Visible = false;
                            txtNumStart.Visible = false;
                            txtNumEnd.Visible = false;
                            break;
                        case 2:
                            ddlModify.Items.Add(new ListItem("Is Checked", "3"));
                            ddlModify.Items.Add(new ListItem("Is Not Checked", "31"));
                            ddlModify.Visible = true;
                            ddlMod.Visible = false;
                            txtSearchString.Visible = false;
                            txtDateStart.Visible = false;
                            lblModTo.Visible = false;
                            txtDateEnd.Visible = false;
                            txtNumStart.Visible = false;
                            txtNumEnd.Visible = false;
                            break;
                        case 4:
                        case 16:
                            ddlMod.Items.Add(new ListItem("Equals", "1"));
                            ddlMod.Items.Add(new ListItem("Between", "4"));
                            ddlMod.Items.Add(new ListItem(">", "5"));
                            ddlMod.Items.Add(new ListItem(">=", "6"));
                            ddlMod.Items.Add(new ListItem("<", "7"));
                            ddlMod.Items.Add(new ListItem("<=", "8"));
                            ddlMod.Items[0].Selected = true;
                            ddlModify.Visible = false;
                            ddlMod.Visible = true;
                            txtSearchString.Visible = false;
                            txtDateStart.Visible = true;
                            lblModTo.Visible = false;
                            txtDateEnd.Visible = false;
                            txtNumStart.Visible = false;
                            txtNumEnd.Visible = false;
                            break;
                        case 8:
                            ddlMod.Items.Add(new ListItem("Equals", "1"));
                            ddlMod.Items.Add(new ListItem("Between", "4"));
                            ddlMod.Items.Add(new ListItem(">", "5"));
                            ddlMod.Items.Add(new ListItem(">=", "6"));
                            ddlMod.Items.Add(new ListItem("<", "7"));
                            ddlMod.Items.Add(new ListItem("<=", "8"));
                            ddlMod.Items[0].Selected = true;
                            ddlModify.Visible = false;
                            ddlMod.Visible = true;
                            txtSearchString.Visible = false;
                            txtDateStart.Visible = false;
                            lblModTo.Visible = false;
                            txtDateEnd.Visible = false;
                            txtNumStart.Visible = true;
                            txtNumEnd.Visible = false;
                            break;
                    }
                    break;
                case "ddlMod":
                    if (ddlMod.SelectedValue == "4")
                    {
                        int selFieldID = Convert.ToInt32(ddlObjField.SelectedValue);
                        int selFieldType = SearchData.Get_FieldType(selFieldID);
                        switch (selFieldType)
                        {
                            case 8:
                                lblModTo.Visible = true;
                                txtDateEnd.Visible = false;
                                txtNumEnd.Visible = true;
                                break;
                            default:
                                lblModTo.Visible = true;
                                txtDateEnd.Visible = true;
                                txtNumEnd.Visible = false;
                                break;
                        }
                        
                    }
                    else
                    {
                        lblModTo.Visible = false;
                        txtDateEnd.Visible = false;
                        txtNumEnd.Visible = false;
                    }
                    break;
            }
        }

        #endregion

        #region GridView

        protected void GV_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Image ItemIcon = (Image)e.Row.Cells[0].FindControl("ItemIcon");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView GV = (GridView)sender;
                switch (GV.ID)
                {
                    case "gvSearchResults":
                        int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                        if (DDLModule.SelectedIndex > -1)
                        {
                            ModuleID = Convert.ToInt32(DDLModule.SelectedValue);
                        }
                        string strView = string.Empty;
                        string ItemID = string.Empty;
                        string ObjTypeID = GV.DataKeys[e.Row.RowIndex].Values["ObjTypeID"].ToString();
                        string ParentGroupID = GV.DataKeys[e.Row.RowIndex].Values["ParentGroupID"].ToString();
                        switch (ModuleID)
                        {
                            case 3:                                
                                string fileExtension = gvSearchResults.DataKeys[e.Row.RowIndex].Values["FileExtension"].ToString();
                                switch (fileExtension)
                                {
                                    case "doc":
                                    case "docx":
                                    case "DOC":
                                    case "DOCX":
                                        ItemIcon.ImageUrl = "images/doc.png";
                                        break;
                                    case "xls":
                                    case "xlsx":
                                    case "XLS":
                                    case "XLSX":
                                        ItemIcon.ImageUrl = "images/xls.png";
                                        break;
                                    case "htm":
                                    case "html":
                                    case "HTM":
                                    case "HTML":
                                        ItemIcon.ImageUrl = "images/html.png";
                                        break;
                                    case "ppt":
                                    case "pptx":
                                    case "PPT":
                                    case "PPTX":
                                        ItemIcon.ImageUrl = "images/ppt.png";
                                        break;
                                    case "dwg":
                                    case "DWG":
                                        ItemIcon.ImageUrl = "images/dwg.png";
                                        break;
                                    case "pdf":
                                    case "PDF":
                                        ItemIcon.ImageUrl = "images/pdf.png";
                                        break;
                                    default:
                                        ItemIcon.ImageUrl = "images/item.png";
                                        break;
                                }
                                string pubPath = ConfigurationManager.AppSettings["PublishPath"];
                                string ShowItemID = gvSearchResults.DataKeys[e.Row.RowIndex].Values["ItemID"].ToString();
                                string ShowOrigID = gvSearchResults.DataKeys[e.Row.RowIndex].Values["OrigID"].ToString();
                                string ShowItemStatus = gvSearchResults.DataKeys[e.Row.RowIndex].Values["Status"].ToString();
                                string ShowIsItemID = "false";
                                string ShowFileExtension = gvSearchResults.DataKeys[e.Row.RowIndex].Values["FileExtension"].ToString();
                                string ShowTypeOfPublish = gvSearchResults.DataKeys[e.Row.RowIndex].Values["TypeOfPublish"].ToString();
                                strView = ShowItemID + "," + ShowOrigID + "," + ShowItemStatus + ",'" + ShowIsItemID + "'," + pubPath + ",'" + ShowFileExtension + "'," + ShowTypeOfPublish;
                                e.Row.Attributes.Add("ondblclick", "openDocWindow(" + strView + ");");
                                break;
                            case 4:
                                ItemIcon.ImageUrl = "~/images/record.png";
                                ItemID = gvSearchResults.DataKeys[e.Row.RowIndex].Values["ItemID"].ToString();
                                strView = "4," + ItemID + "," + ObjTypeID + "," + ParentGroupID + ",0";
                                e.Row.Attributes.Add("ondblclick", "openRecordWindow(" + strView + ");");
                                break;
                            case 6:
                                ItemIcon.ImageUrl = "~/images/improvement.png";
                                ItemID = gvSearchResults.DataKeys[e.Row.RowIndex].Values["ItemID"].ToString();
                                strView = "6," + ItemID + "," + ObjTypeID + "," + ParentGroupID + ",0";
                                e.Row.Attributes.Add("ondblclick", "openRecordWindow(" + strView + ");");
                                break;
                            case 12:
                                ItemIcon.ImageUrl = "~/images/training.png";
                                ItemID = gvSearchResults.DataKeys[e.Row.RowIndex].Values["ItemID"].ToString();
                                strView = "12," + ItemID + "," + ObjTypeID + "," + ParentGroupID + ",0";
                                e.Row.Attributes.Add("ondblclick", "openRecordWindow(" + strView + ");");
                                break;
                        }
                        e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                        e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                        e.Row.Attributes["onclick"] = "saveSearchScrollPos();" + Page.ClientScript.GetPostBackClientHyperlink(GV, "Select$" + e.Row.RowIndex);
                        e.Row.ToolTip = e.Row.Cells[1].Text;
                        break;
                    case "gvAISearchResults":
                        ItemIcon.ImageUrl = "~/images/actionitem.png";
                        string ShowStatus = e.Row.Cells[2].Text;
                        if (ShowStatus == "2")
                        {
                            e.Row.Cells[2].Text = "Open";
                        }
                        else
                        {
                            e.Row.Cells[2].Text = "Complete";
                        }

                        string ShowPriority = e.Row.Cells[4].Text;
                        switch (ShowPriority)
                        {
                            case "0":
                                e.Row.Cells[4].Text = "Low";
                                break;
                            case "2":
                                e.Row.Cells[4].Text = "Urgent";
                                break;
                            default:
                                e.Row.Cells[4].Text = "Normal";
                                break;
                        }

                        string ShowModule = e.Row.Cells[5].Text;
                        switch (ShowModule)
                        {
                            case "1":
                                e.Row.Cells[5].Text = "Users";
                                break;
                            case "3":
                                e.Row.Cells[5].Text = "Documents";
                                break;
                            case "4":
                                e.Row.Cells[5].Text = "Records";
                                break;
                            case "6":
                                e.Row.Cells[5].Text = "Improvements";
                                break;
                            case "12":
                                e.Row.Cells[5].Text = "Training";
                                break;
                        }
                        e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                        e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                        e.Row.Attributes["onclick"] = "saveSearchScrollPos();" + Page.ClientScript.GetPostBackClientHyperlink(gvAISearchResults, "Select$" + e.Row.RowIndex);
                        string AIID = gvAISearchResults.DataKeys[e.Row.RowIndex].Values["AIID"].ToString();
                        string ShowModuleID = gvAISearchResults.DataKeys[e.Row.RowIndex].Values["ShowModuleID"].ToString();
                        strView = AIID + "," + ShowModuleID + ",0";
                        e.Row.Attributes.Add("ondblclick", "openAIWindow(" + strView + ");");
                        e.Row.ToolTip = e.Row.Cells[3].Text;
                        break;
                }
                
            }
        }

		protected async void Sort_GV(object sender, GridViewSortEventArgs e)
		{
			GridView gv = (GridView)sender;
			int ModuleID = Convert.ToInt32(DDLModule.SelectedValue);
			int ParentGroupID = Convert.ToInt32(tvBrowse.SelectedValue);
			bool isSubGroup = chkSubGroup.Checked;
			bool isWithdrawn = chkWithdrawn.Checked;
			int SelectedTab = TabContainer1.ActiveTabIndex;
			int UserID = 0;
			int UserStatus = -1;
            string SiteID = ConfigurationManager.AppSettings["SiteID"];
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				string UserData = authTicket.UserData;
				string[] UserValues = UserData.Split(',');
				UserID = Convert.ToInt32(UserValues[0]);
				UserStatus = Convert.ToInt32(UserValues[3]);
			}

			DataTable dt = await ExecuteSearchAsync(ModuleID, ParentGroupID, isSubGroup, isWithdrawn, UserID, UserStatus, SiteID);
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
			dt.DefaultView.Sort = e.SortExpression + sortDirection;
			gv.DataSource = dt;
			gv.DataBind();

			// Set Sort Cookie Properties.
			HttpCookie sortCookie = Request.Cookies["P3WebSort"];
			if (sortCookie == null)
			{
				sortCookie = new HttpCookie("P3WebSort");
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

			//lblResultCount.Text = gvSearchResults.Rows.Count.ToString() + " results found";

			//if (lblResultCount.Text == "0 results found" || string.IsNullOrEmpty(lblResultCount.Text))
			//{
			//	btnShowMe.Enabled = false;
			//	btnShowMe.Visible = false;
			//	btnGo.Enabled = false;
			//	btnGo.Visible = false;
			//	btnClear.Enabled = true;
			//	btnClear.Visible = true;
			//	ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "noresult", "alert('There are no items that match your search')", true);
			//}
			//else
			//{
			//	btnShowMe.Enabled = true;
			//	btnShowMe.Visible = true;
			//	btnGo.Enabled = true;
			//	btnGo.Visible = true;
			//	btnClear.Enabled = true;
			//	btnClear.Visible = true;
			//	ScriptManager.RegisterStartupScript(udpSearch, udpSearch.GetType(), "enlarge", "enlargeSearchWindow();", true);
			//}
		}

		private SortDirection Direction
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

		#region TreeView

		protected void TVBrowse_TreeNodePopulate(object sender, TreeNodeEventArgs e)
        {
            int moduleID = Convert.ToInt32(DDLModule.SelectedValue);
            int userID = 0;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                userID = Convert.ToInt32(UserValues[0]);
            }
            PopulateSubLevel(moduleID, Convert.ToInt32(e.Node.Value), e.Node, userID);
        }

        private void PopulateRootLevel(int ModuleID, int UserID, int RootID)
        {
            tvBrowse.Nodes.Clear();
            DataTable dt = P3General.Get_DisplayGroups(ModuleID, Convert.ToInt32(RootID), UserID);
            DataRow[] root = dt.Select("GroupID = " + RootID);
            if (root.Length > 0)
            {
                TreeNode rootnode = new TreeNode(root[0]["Name"].ToString(), root[0]["GroupID"].ToString());
                tvBrowse.Nodes.Add(rootnode);
            }
            PopulateNodes(dt, tvBrowse.FindNode(RootID.ToString()).ChildNodes, RootID);
            tvBrowse.Nodes[0].Selected = true;
            tvBrowse.Nodes[0].Expand();
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
        }

        private void PopulateSubLevel(int ModuleID, int ParentGroupID, TreeNode ParentNode, int UserID)
        {
            // Populate TreeView sublevels based upon which menu item in TabContainer1 is selected.
            DataTable dt = P3General.Get_DisplayGroups(ModuleID, ParentGroupID, UserID);
            PopulateNodes(dt, ParentNode.ChildNodes, ParentGroupID);
            dt.Dispose();
        }

        protected void TVBrowse_SelectedNodeChanged(object sender, EventArgs e)
        {
            tvBrowse.SelectedNode.Expand();
        }

        #endregion

        #region Search Methods		

        protected void Do_ItemSearchByStyle(int ModuleID, int FieldID, int FieldType, int Modifier, string SearchString, int NumStart, int NumEnd, DateTime DateStart, DateTime DateEnd)
        {
            gvSearchResults.DataKeyNames = new string[] { "ItemID", "ParentGroupID", "ObjTypeID", "Status" };
            DataTable dt = SearchData.Get_StyleSearchResults(ModuleID, FieldID, FieldType, Modifier, SearchString, NumStart, NumEnd, DateStart, DateEnd);
            gvAISearchResults.DataSource = null;
            gvAISearchResults.DataBind();
            gvSearchResults.DataSource = dt;
            gvSearchResults.DataBind();

            int SearchItemCount = 0;
            if (dt.Rows.Count > 0)
            {
                SearchItemCount = dt.Rows.Count;
            }
            lblResultCount.Text = SearchItemCount.ToString() + " results found";
            dt.Dispose();
        }

        private DataTable RemoveDuplicatesRecords(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                var UniqueRows = dt.AsEnumerable().Distinct(DataRowComparer.Default);
                DataTable dt2 = UniqueRows.CopyToDataTable();
                return dt2;
            }
            else
            {
                return dt;
            }
        }

		#endregion

		#region Async Search Methods

		private async Task<DataTable> ExecuteSearchAsync(int ModuleID, int ParentGroupID, bool isSubGroup, bool isWithdrawn, int UserID, int UserStatus, string SiteID)
		{
			DataTable dt = new DataTable();
			int SelectedTab = TabContainer1.ActiveTabIndex;
			switch (SelectedTab)
			{
				case 0: // Search by field
					string strField = DDLField.SelectedValue;
					string strSearch = txtSearch.Text;
					if (DDLSearch.Visible == true)
					{
						strSearch = DDLSearch.SelectedValue;
					}
					string strConvertedBy = DDLConvertedBy.SelectedValue;
					DateTime sDate = Convert.ToDateTime(txtStartDate.Text);
					DateTime eDate = Convert.ToDateTime(txtEndDate.Text);
					bool isGroupOrigID = CHKGroupOrigID.Checked;
					if (DDLField.SelectedValue == "DocText")
					{
						dt = await Do_ItemSearchByTextAsync(ParentGroupID, strSearch, isSubGroup, isWithdrawn, UserID, SiteID);
					}
					else
					{
						dt = await Do_ItemSearchAsync(ModuleID, ParentGroupID, strField, strSearch, strConvertedBy, sDate, eDate, isGroupOrigID, isSubGroup, isWithdrawn, UserID, UserStatus, SiteID);
					}
					break;
				case 1: // Search by role
					int RoleID = Convert.ToInt32(DDLRoles.SelectedValue);
					int AssignedID = Convert.ToInt32(DDLRoleAssigned.SelectedValue);
					dt = await Do_ItemSearchByRoleAsync(ModuleID, ParentGroupID, AssignedID, RoleID, isSubGroup, isWithdrawn, UserID, SiteID);
					break;
				case 2: // Search by category
					DataTable dtFinal = new DataTable();
					int CatID = 0;
					string strTest = string.Empty;
					foreach (ListItem li in cblCategory.Items)
					{
						if (li.Selected)
						{
							CatID = Convert.ToInt32(li.Value);
							strTest = strTest + CatID.ToString() + ",";
						}
					}
					List<int> CatIDs = strTest.TrimEnd(',').Split(',').Select(int.Parse).ToList();
					dt = await Do_ItemSearchByCategoryAsync(ModuleID, ParentGroupID, CatIDs, isSubGroup, isWithdrawn, UserID, SiteID);
					break;
				case 3: // Search by record field
					int FieldID = Convert.ToInt32(ddlObjField.SelectedValue);
					int FieldType = await SearchData.Get_FieldTypeAsync(FieldID);
					int Modifier = -1;
					string SearchString = txtSearchString.Text;
					int NumStart = 0;
					int NumEnd = 0;
					DateTime DateStart = DateTime.Today;
					DateTime DateEnd = DateTime.Today;
					if (ddlMod.Visible)
					{
						Modifier = Convert.ToInt32(ddlMod.SelectedValue);
						if (txtNumStart.Text != string.Empty && txtNumStart.Text != null)
						{
							NumStart = Convert.ToInt32(txtNumStart.Text);
						}
						if (txtNumEnd.Text != string.Empty && txtNumEnd.Text != null)
						{
							NumEnd = Convert.ToInt32(txtNumEnd.Text);
						}
						if (txtDateStart.Text != string.Empty && txtDateStart != null)
						{
							DateStart = Convert.ToDateTime(txtDateStart.Text);
						}
						if (txtDateEnd.Text != string.Empty && txtDateEnd.Text != null)
						{
							DateEnd = Convert.ToDateTime(txtDateEnd.Text);
						}
					}
					else
					{
						Modifier = Convert.ToInt32(ddlModify.SelectedValue);
					}
					dt = await Do_ItemSearchByStyleAsync(ModuleID, FieldID, FieldType, Modifier, SearchString, NumStart, NumEnd, DateStart, DateEnd, SiteID);
					break;
			}
			return dt;
		}

		protected async Task<DataTable> Do_ItemSearchAsync(int ModuleID, int ParentGroupID, string strField, string strSearch, string strConvertedBy, DateTime sDate, DateTime eDate, bool isGroupOrigID, bool isSubGroup, bool isWithdrawn, int UserID, int UserStatus, string SiteID)
        {
            if (ModuleID == 3)
            {
                gvSearchResults.DataKeyNames = new string[] { "ItemID", "ParentGroupID", "ObjTypeID", "Status", "FileExtension" };
            }
            else
            {
                gvSearchResults.DataKeyNames = new string[] { "ItemID", "ParentGroupID", "ObjTypeID", "Status" };
            }

			DataTable dt = await SearchData.Get_SearchResultsAsync(ModuleID, ParentGroupID, strField, strSearch, strConvertedBy, sDate, eDate, isGroupOrigID, isSubGroup, isWithdrawn, UserID, UserStatus, SiteID);
			return dt;
        }

        protected async Task<DataTable> Do_ItemSearchByRoleAsync(int ModuleID, int ParentGroupID, int AssignedID, int RoleID, bool isSubGroup, bool isWithdrawn, int UserID, string SiteID)
        {
            if (ModuleID == 3)
            {
                gvSearchResults.DataKeyNames = new string[] { "ItemID", "ParentGroupID", "ObjTypeID", "Status", "FileExtension" };
            }
            else
            {
                gvSearchResults.DataKeyNames = new string[] { "ItemID", "ParentGroupID", "ObjTypeID", "Status" };
            }

            DataTable dt = await SearchData.Get_RoleSearchResultsAsync(ModuleID, ParentGroupID, AssignedID, RoleID, isSubGroup, isWithdrawn, UserID, SiteID);
			//gvSearchResults.DataSource = dt;
			//gvSearchResults.DataBind();
			//lblResultCount.Text = dt.Rows.Count.ToString() + " results found";
			//dt.Dispose();
			return dt;
        }

        protected async Task<DataTable> Do_ItemSearchByCategoryAsync(int ModuleID, int ParentGroupID, List<int> CatIDs, bool isSubGroup, bool isWithdrawn, int UserID, string SiteID)
        {
            if (ModuleID == 3)
            {
                gvSearchResults.DataKeyNames = new string[] { "ItemID", "ParentGroupID", "ObjTypeID", "Status", "FileExtension" };
            }
            else
            {
                gvSearchResults.DataKeyNames = new string[] { "ItemID", "ParentGroupID", "ObjTypeID", "Status" };
            }

            DataTable dt1 = new DataTable();
            foreach(int cat in CatIDs)
            {
                DataTable dtPre = await SearchData.Get_CategorySearchResultsAsync(ModuleID, ParentGroupID, cat, isSubGroup, isWithdrawn, UserID, SiteID);
                dt1.Merge(dtPre);
                dtPre.Dispose();
            }
            DataTable dt = RemoveDuplicatesRecords(dt1);
            dt.DefaultView.Sort = "Name ASC";

			//if (ModuleID == 14)
			//{
			//    gvAISearchResults.DataSource = dt;
			//    gvAISearchResults.DataBind();
			//    gvSearchResults.DataSource = null;
			//    gvSearchResults.DataBind();
			//}
			//else
			//{
			//    gvSearchResults.DataSource = dt;
			//    gvSearchResults.DataBind();
			//    gvAISearchResults.DataSource = null;
			//    gvAISearchResults.DataBind();
			//}

			//lblResultCount.Text = dt.Rows.Count.ToString() + " results found";
			//dt.Dispose();
			return dt;
        }

        protected async Task<DataTable> Do_ItemSearchByStyleAsync(int ModuleID, int FieldID, int FieldType, int Modifier, string SearchString, int NumStart, int NumEnd, DateTime DateStart, DateTime DateEnd, string SiteID)
        {
            gvSearchResults.DataKeyNames = new string[] { "ItemID", "ParentGroupID", "ObjTypeID", "Status" };
            DataTable dt = await SearchData.Get_StyleSearchResultsAsync(ModuleID, FieldID, FieldType, Modifier, SearchString, NumStart, NumEnd, DateStart, DateEnd, SiteID);
			return dt;
        }

        protected async Task<DataTable> Do_ItemSearchByTextAsync(int ParentGroupID, string strSearch, bool isSubGroup, bool isWithdrawn, int UserID, string SiteID)
        {
            DataTable dt = new DataTable();
            DataTable dtDoc = await SearchData.Get_IndexSearchResultsAsync(strSearch, ParentGroupID, isSubGroup, isWithdrawn, UserID, SiteID);

            if (dtDoc.Rows.Count > 0)
            {
                DataView dvDoc = new DataView(dtDoc)
                {
                    Sort = "Name ASC"
                };
                if (isSubGroup != true)
                {
                    dvDoc.RowFilter = "ParentGroupID = " + ParentGroupID;
                }
                dt = dvDoc.ToTable();
                dt = RemoveDuplicatesRecords(dt);

                //gvSearchResults.DataSource = dt;
                //gvSearchResults.DataBind();
                //gvAISearchResults.DataSource = null;
                //gvAISearchResults.DataBind();

                //lblResultCount.Text = dt.Rows.Count.ToString() + " results found";
                //dt.Dispose();
            }
			return dt;
        }

        #endregion
    }
}