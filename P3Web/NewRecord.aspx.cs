using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Web.Security;
using System.Web;

namespace Paradigm3
{
    public partial class NewRecord : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);

            if (!Page.IsPostBack)
            {
                Init_Record(ObjTypeID, ParentGroupID, ModuleID);
                string GroupOptionSet = await P3General.Get_GroupOptionSetAsync(ModuleID, ParentGroupID);
                if (ModuleID != 12)
                {
                    if (!string.IsNullOrEmpty(GroupOptionSet) && GroupOptionSet.Contains("1_3"))
                    {
                        string NameFormula = await Record.Get_NameFormulaAsync(ModuleID, ParentGroupID);
                        string[] NameFormulaValues = NameFormula.Split('|');
                        string NameF = NameFormulaValues[0];
                        string LabelF = NameFormulaValues[1];
                        if (!string.IsNullOrEmpty(NameF))
                        {
                            txtName.Text = NameF;
                            txtName.ReadOnly = true;
                        }

                        if (!string.IsNullOrEmpty(LabelF))
                        {
                            txtLabel.Text = LabelF;
                            txtLabel.ReadOnly = true;
                        }                       
                    }
                    else
                    {
                        txtName.Focus();
                    }    
                }
                else
                {
                    txtName.Focus();
                }                
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "NewRecord.aspx";
        }

        #region Initialize Form

        protected void Init_Record(int ObjTypeID, int ParentGroupID, int ModuleID)
        {
            ddlFolders.DataSource = Record.Get_SubFolders(ModuleID, ParentGroupID);
            ddlFolders.DataTextField = "Name";
            ddlFolders.DataValueField = "GroupID";
            ddlFolders.DataBind();

            if (ModuleID == 12)
            {
                txtName.Visible = false;
                ddlName.Visible = true;
                ddlName.DataSource = Record.Get_TrainingDefinitions(Convert.ToInt32(Request.QueryString["ParentGroupID"]));
                ddlName.DataTextField = "Caption";
                ddlName.DataValueField = "MyID";
                ddlName.DataBind();
                ddlFolders.Enabled = false;
                lblTrainee.Visible = true;
                lbTrainee.Visible = true;
                btnSubmitTraining.Visible = true;
                btnSubmitRecord.Visible = false;
                //btnSubmitRecord.CommandArgument = "SubmitTraining";
                GetTraineeList();
            }
            else
            {
                txtName.Visible = true;
                ddlName.Visible = false;
                ddlFolders.Enabled = true;
                lblTrainee.Visible = false;
                lbTrainee.Visible = false;
                btnSubmitTraining.Visible = false;
                btnSubmitRecord.Visible = true;
                //btnSubmitRecord.CommandArgument = "SubmitRecord";
            }
        }

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "SubmitRecord":
                    int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                    int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
                    int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);

                    if (ObjTypeID != 0)
                    {
                        if (ddlFolders.SelectedIndex != 0)
                        {
                            ParentGroupID = Convert.ToInt32(ddlFolders.SelectedValue);
                        }

                        DataSet ds = Record.Get_NewRecord_Structure(ModuleID, ParentGroupID, ObjTypeID, 0);
                        string ItemName = txtName.Text;
                        string ItemLabel = txtLabel.Text;

                        //Create Record in Items[x] table
                        int NewItemID = await Record.Create_RecordAsync(ModuleID, ObjTypeID, ParentGroupID, ItemName, ItemLabel, string.Empty, 0);
                        // Create tabs  and due dates for record in ItemObj and DueDate tables
                        Record.Create_Tabs(ModuleID, ObjTypeID, ParentGroupID, NewItemID, ds, 0);                        
                        // Add Field values to RecordsData table
                        Record.Add_FieldValues(ModuleID, NewItemID, ds);

                        if (ModuleID.Equals(6))
                        {
                            Record.Add_TabDueDateSettings(ModuleID, ParentGroupID, NewItemID);
                        }


                        DataTable dtTE = ds.Tables[3];
                        DataTable dtTabs = ds.Tables[0];

                        // If Improvement item, add current user as Responsible for 1st step
                        int FirstObjTypeID = Convert.ToInt32(dtTabs.Rows[0]["ObjTypeID"]);
                        if (ModuleID == 6)
                        {
                            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                            {
                                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                                string UserData = ticket.UserData;
                                string[] UserValues = UserData.Split(',');

                                int UserID = Convert.ToInt32(UserValues[0]);
                                string UserFullName = UserValues[1];
                                Record.Add_StepResponsible(ModuleID, NewItemID, FirstObjTypeID, UserID, UserFullName, "User");
                                //Record.TriggerStepEvent(NewItemID, txtName.Text, ModuleID, FirstObjTypeID, ParentGroupID, UserID, UserFullName, ds);
                            }
                        }

                        ds = Record.Get_NewRecord_Structure(ModuleID, ParentGroupID, ObjTypeID, 0);
                        DataTable dtResp = ds.Tables[1];


                        if (!dtTabs.Rows[0]["PopUpType"].Equals(DBNull.Value) && !dtTabs.Rows[0]["PopUpType"].Equals(0))
                        {
                            string str = "0" + "," + NewItemID.ToString() + "," + FirstObjTypeID.ToString() + "," + "1";
                            ClientScript.RegisterStartupScript(GetType(), "Assignment", "openAssignment(" + str + ");recordRefresh();window.close();", true);
                        }
                        else
                        {
							// If the 'Add New Item' event is set.
							if (dtTE.Rows.Count > 0)
							{
								Record.TriggerEvent(NewItemID, ModuleID, ObjTypeID, ParentGroupID, ds, txtName.Text);
							}

							if (ModuleID == 6 && dtResp.Rows.Count > 0)
                            {
                                foreach (DataRow drResp in dtResp.Rows)
                                {
                                    if (Convert.ToInt32(drResp["ObjTypeID"]) == Convert.ToInt32(dtTabs.Rows[0]["ObjTypeID"]))
                                    {
                                        int ControlType = Convert.ToInt32(drResp["ControlType"]);
                                        switch (ControlType)
                                        {
                                            case 5:
                                                // Role
                                                DataTable dtRole = Record.Get_RolesAssigned(ParentGroupID, Convert.ToInt32(drResp["ControlID"]), ModuleID);
                                                foreach (DataRow RoleRow in dtRole.Rows)
                                                {
                                                    switch (Convert.ToInt32(RoleRow["ControlType"]))
                                                    {
                                                        case 1:
                                                            // User
                                                            Record.TriggerStepEvent(NewItemID, txtName.Text, ModuleID, ObjTypeID, ParentGroupID, Convert.ToInt32(RoleRow["ControlID"]), RoleRow["ControlFullName"].ToString(), ds);
                                                            break;
                                                        case 6:
                                                            // Position Title
                                                            DataTable dtPosTemp = Record.Get_PositionsAssigned(Convert.ToInt32(RoleRow["ControlID"]));
                                                            foreach (DataRow drPosTemp in dtPosTemp.Rows)
                                                            {
                                                                if (Convert.ToInt32(drPosTemp["ControlType"]) == 1)
                                                                {
                                                                    Record.TriggerStepEvent(NewItemID, txtName.Text, ModuleID, ObjTypeID, ParentGroupID, Convert.ToInt32(drPosTemp["ControlID"]), drPosTemp["ControlFullName"].ToString(), ds);
                                                                }
                                                            }
                                                            dtPosTemp.Dispose();
                                                            break;
                                                    }
                                                }
                                                break;
                                            case 6:
                                                // Position Title
                                                DataTable dtPos = Record.Get_PositionsAssigned(Convert.ToInt32(drResp["ControlID"]));
                                                foreach (DataRow drPos2 in dtPos.Rows)
                                                {
                                                    if (Convert.ToInt32(drPos2["ControlType"]) == 1)
                                                    {
                                                        Record.TriggerStepEvent(NewItemID, txtName.Text, ModuleID, ObjTypeID, ParentGroupID, Convert.ToInt32(drPos2["ControlID"]), drPos2["ControlFullName"].ToString(), ds);
                                                    }
                                                }
                                                dtPos.Dispose();
                                                break;
                                            default:
                                                // User Account
                                                Record.TriggerStepEvent(NewItemID, txtName.Text, ModuleID, ObjTypeID, ParentGroupID, Convert.ToInt32(drResp["ControlID"]), drResp["ControlFullName"].ToString(), ds);
                                                break;
                                        }
                                    }
                                }
                            }                            
                            string strVar = ModuleID.ToString() + "," + NewItemID.ToString() + "," + ObjTypeID.ToString() + "," + ParentGroupID.ToString() + ",1";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "openNewRecord", "openRecordWindow(" + strVar + ");recordRefresh();self.close();", true);
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "noid", "alert('The selected folder is not associated with a valid form style. Please select another folder.');", true);
                    }
                    break;
                case "SubmitTraining":
                    int TModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                    int TObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
                    int TParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
                    int DefID = Convert.ToInt32(ddlName.SelectedValue);

                    DataSet Tds = Record.Get_NewRecord_Structure(TModuleID, TObjTypeID, TParentGroupID, DefID);

                    int TDefID = Convert.ToInt32(ddlName.SelectedValue);
                    int NewTItemID = 0;

                    if (lbTrainee.SelectedIndex != -1)
                    {
                        foreach (ListItem li in lbTrainee.Items)
                        {
                            if (li.Selected)
                            {
                                string TItemName = ddlName.SelectedItem.Text;
                                string[] arrName = li.Text.Split(',');
                                string nameVar = arrName[1].Trim() + " " + arrName[0];
                                TItemName = TItemName + "_" + nameVar;
                                string TItemLabel = txtLabel.Text;
                                int TraineeID = Convert.ToInt32(li.Value);
                                Record.Create_Record(TModuleID, TObjTypeID, TParentGroupID, TItemName, TItemLabel, nameVar, TraineeID);
                                NewTItemID = Convert.ToInt32(Session.Contents["NewItemID"]);

                                Record.Create_Tabs(TModuleID, TObjTypeID, TParentGroupID, NewTItemID, Tds, DefID);
                                Record.Add_FieldValues(TModuleID, NewTItemID, Tds);

                                DataTable dtTE = Tds.Tables[3];

                                if (dtTE.Rows.Count > 0)
                                {
                                    foreach (DataRow drEvent in dtTE.Rows)
                                    {
                                        Record.TriggerEvent(NewTItemID, TModuleID, TObjTypeID, TParentGroupID, Tds, txtName.Text);
                                    }
                                }
                            }
                        }
                    }
                    Page.ClientScript.RegisterStartupScript(GetType(), "addRecord", "recordRefresh();self.close();", true);
                    break;
                case "Cancel":
                    ClientScript.RegisterStartupScript(GetType(), "Close", "window.close();", true);
                    break;
            }
        }

        protected void Add_InitiatorAsResponsible()
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                // Get user information from authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
            }
        }

        protected void DDLFolders_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GetTraineeList()
        {
            lbTrainee.DataSource = Record.Get_TraineesForList();
            lbTrainee.DataTextField = "FullName";
            lbTrainee.DataValueField = "UserID";
            lbTrainee.DataBind();
        }

        #endregion


    }
}