using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using Paradigm3.datalayer;

namespace P3Web
{
    public partial class ViewCreateActionItem : SqlViewStatePage
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

                    int ItemID = Convert.ToInt32(Request.QueryString["OrigID"]);
                    int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                    int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
                    int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                    // Initialise all other Properties details
                    await Initialize_PropertiesAsync(OrigID, ItemID, ModuleID, IsGroup);


                }
            }

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewCreateAI.aspx";
        }

        private async Task Initialize_PropertiesAsync(int OrigID, int ItemID, int ModuleID, int IsGroup)
        {
            // General Tab
            DataTable dt = await Paradigm3.datalayer.Properties.Get_PropertiesAsync(ItemID, ModuleID, IsGroup);
            DataTable dtAICategories = await ActionItem.Get_ItemCategoriesAsync();

            ViewState["AICategories"] = dtAICategories;
            rptCategories.DataSource = dtAICategories;
            rptCategories.DataBind();

            ViewState["Properties"] = dt;
            int ID = 0;

            if (dt.Rows.Count > 0)
            {
                if (IsGroup == 1)
                {
                    ID = Convert.ToInt32(dt.Rows[0]["GroupID"]);

                }
                else
                {
                    if (ModuleID == 1)
                    {
                        ID = Convert.ToInt32(dt.Rows[0]["UserID"]);
                        txtItemCaption.Text = dt.Rows[0]["FullName"].ToString();
                    }
                    else
                    {
                        ID = Convert.ToInt32(dt.Rows[0]["OrigID"]);
                        txtItemCaption.Text = dt.Rows[0]["Name"].ToString();
                    }
                }

            }
            dt.Dispose();
        }


        protected async void Button_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            switch (arg)
            {
                case "AddRoleMembers":
                    ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "addRoles", "openSelect('Roles')", true);
                    break;
                case "RemoveRoleMember":
                    if (gvRoleMembers.SelectedIndex != -1)
                    {

                        //int ID = Convert.ToInt32(gvRoleMembers.DataKeys[gvRoleMembers.SelectedIndex].Values["ID"]);
                        int ID = 0;
                        string RoleControlFullName = gvRoleMembers.Rows[gvRoleMembers.SelectedIndex].Cells[0].Text;

                        await ActionItem.Remove_AIUserMemberAsync(ID, ModuleID, OrigID, IsGroup, RoleControlFullName);

                        DataTable dtRemove = new DataTable();
                        dtRemove.Columns.Add("ControlID");
                        dtRemove.Columns.Add("ControlFullName");
                        dtRemove.Columns.Add("ControlType");

                        if (gvRoleMembers.Rows.Count > 0)
                        {
                            string strNumData = null;
                            string strTextData = null;
                            string strTypeData = null;


                            foreach (GridViewRow rgvr in gvRoleMembers.Rows)
                            {
                                strNumData = gvRoleMembers.DataKeys[rgvr.RowIndex].Values[0].ToString(); ;
                                strTextData = rgvr.Cells[0].Text;
                                strTypeData = rgvr.Cells[1].Text;
                                if (strTextData != RoleControlFullName)
                                {
                                    DataRow rdr1 = dtRemove.NewRow();
                                    rdr1["ControlID"] = strNumData;
                                    rdr1["ControlFullName"] = strTextData;
                                    rdr1["ControlType"] = strTypeData;
                                    dtRemove.Rows.Add(rdr1);
                                }
                            }
                            dtRemove.AcceptChanges();
                            gvRoleMembers.DataSource = dtRemove;
                            gvRoleMembers.DataBind();
                            gvRoleMembers.SelectedIndex = -1;
                        }
                        break;

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


                            DataTable dtRoles = (DataTable)Session.Contents["dtSelected"];


                            DataTable uniqueRows = dtRoles.DefaultView.ToTable("ControlFullName", true);

                            foreach (DataRow dr in uniqueRows.Rows)
                            {

                                int RoleControlID = Convert.ToInt32(dr["ControlID"]);
                                string RoleControlFullName = dr["ControlFullName"].ToString();
                                int RoleControlType = Convert.ToInt32(dr["ControlType"]);
                                await ActionItem.Add_UserMemberAsync(ModuleID, OrigID, IsGroup, RoleControlID, RoleControlFullName, RoleControlType, UserID, UserFullName);
                            }
                            await Get_SendAIMembersAsync(ModuleID, OrigID, IsGroup);
                        }
                    }
                    break;
                case "Close":
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int UserID = Convert.ToInt32(UserValues[0]);

                        await ActionItem.Delete_AllActionItemUserAsync(UserID, OrigID, IsGroup);
                        ScriptManager.RegisterStartupScript(udpActionItem, udpActionItem.GetType(), "closeAI", "closeP3Window();", true);
                    }
                    break;
                case "Submit":
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int UserStatus = Convert.ToInt32(UserValues[3]);
                        int UserID = Convert.ToInt32(UserValues[0]);
                        string UserFullName = UserValues[1];

                        string name = txtItemCaption.Text;
                        string days = txtDays.Text;
                        string details = "Related Name: " + txtItemCaption.Text + " ID: " + OrigID + " Sender Name: " + UserFullName + " Time sent: " + DateTime.Now + "--------------------" + txtDetails.Text;
                        string priority = ddlPriority.SelectedValue;

                        int parentGroupID = 2;

                        int showID = OrigID;
                        int showModuleID = ModuleID;
                        int showAction = 0;
                        if (cbRelatedAIAutoComplete.Checked)
                        {
                            showAction = 1;
                        }
                        if (cbAIAutoComplete.Checked)
                        {
                            showAction = 2;
                        }
                        if (cbRequirePwdforAI.Checked)
                        {
                            showAction = 3;
                        }

                        DateTime currentDate = DateTime.Now;
                        DateTime dueDate = DateTime.Now.AddDays(Convert.ToInt32(days));
                        DateTime escalateDate = DateTime.Parse("1899-12-30 00:00:00");

                        if (gvRoleMembers.Rows.Count > 0)

                        {
                            int AIID;

                            //  DataTable dtRoles = (DataTable)Session.Contents["dtSelected"];
                            foreach (GridViewRow dr in gvRoleMembers.Rows)
                            {
                                DataTable dtUsers = new DataTable();

                                if (dr.Cells[1].Text == "Entity")
                                {
                                    string groupID = gvRoleMembers.DataKeys[dr.RowIndex].Values[0].ToString();

                                    dtUsers = await ActionItem.Get_AllUsersFromEntity(ModuleID, Convert.ToInt32(groupID));


                                    foreach (DataRow r in dtUsers.Rows)
                                    {
                                        string AIrecipientID = r["controlid"].ToString();
                                        string AIrecipientName = r["controlfullname"].ToString();
                                        AIID = await ActionItem.Send_ActionItem(parentGroupID, name, details, ModuleID, Convert.ToInt32(AIrecipientID), AIrecipientName, UserFullName, UserID, currentDate, dueDate, Convert.ToInt32(priority), 1, showID, showModuleID, showAction, escalateDate, IsGroup);
                                        foreach (RepeaterItem item in rptCategories.Items)
                                        {
                                            HiddenField hdnCatID = (HiddenField)item.FindControl("hdnCatID");
                                            CheckBox chkCategory = (CheckBox)item.FindControl("chkCategory");
                                            int CatID = Convert.ToInt32(hdnCatID.Value);
                                            if (chkCategory.Checked == true)
                                            {
                                                await ActionItem.AddCategories_ActionItemAsync(AIID, CatID);
                                            }
                                        }
                                    }




                                    //await ActionItem.Delete_AllActionItemUserAsync(UserID, OrigID, IsGroup);

                                }


                                else if (dr.Cells[1].Text == "User")
                                {
                                    string AIrecipientID = gvRoleMembers.DataKeys[dr.RowIndex].Values[0].ToString();
                                    string AIrecipientName = dr.Cells[0].Text;

                                    AIID = await ActionItem.Send_ActionItem(parentGroupID, name, details, ModuleID, Convert.ToInt32(AIrecipientID), AIrecipientName, UserFullName, UserID, currentDate, dueDate, Convert.ToInt32(priority), 1, showID, showModuleID, showAction, escalateDate, IsGroup);

                                    foreach (RepeaterItem item in rptCategories.Items)
                                    {
                                        HiddenField hdnCatID = (HiddenField)item.FindControl("hdnCatID");
                                        CheckBox chkCategory = (CheckBox)item.FindControl("chkCategory");
                                        int CatID = Convert.ToInt32(hdnCatID.Value);
                                        if (chkCategory.Checked == true)
                                        {
                                            await ActionItem.AddCategories_ActionItemAsync(AIID, CatID);
                                        }
                                    }
                                }
                            }

                            await ActionItem.Delete_AllActionItemUserAsync(UserID, OrigID, IsGroup);
                            ScriptManager.RegisterStartupScript(udpActionItem, udpActionItem.GetType(), "myScript", "aiRefresh();alert('Action Item successfully sent');window.close();", true);

                        }

                        else
                        {
                            ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "myScript", "alert('You must select at least one recipient')", true);
                        }
                    }

                    else
                    {
                        ScriptManager.RegisterStartupScript(udpActionItem, GetType(), "AIAbort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
                    }
                    break;
                    //case "AddHistoryMemo":
                    //    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    //    {
                    //        AddHistoryNotesModalPopup.Show();
                    //        txtAddNotes.Text = string.Empty;
                    //    }

                    //    break;
                    //case "SaveHistoryMemoDetails":
                    //    if (txtAddNotes.Text != "")
                    //    {
                    //        string NewHistoryMemo = txtAddNotes.Text;
                    //        await Add_HistoryAsync(ModuleID, OrigID, NewHistoryMemo);
                    //        ScriptManager.RegisterStartupScript(udpProperties, GetType(), "close", "parent.location.reload();", true);
                    //    }
                    //    break;
            }
        }

        protected void gvRoleMembers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvRoleMembers, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");

                if (e.Row.Cells[1].Text == "1")
                {

                    e.Row.Cells[1].Text = "User";
                }
                else if (e.Row.Cells[1].Text == "6")
                {
                    e.Row.Cells[1].Text = "Entity";
                }
            }
        }

        protected void rptCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataTable dtItemCategories = (DataTable)ViewState["AICategories"];
                CheckBox cbCategory = (CheckBox)e.Item.FindControl("chkCategory");
                HiddenField hdnCatID = (HiddenField)e.Item.FindControl("hdnCatID");
                foreach (DataRow dr in dtItemCategories.Rows)
                {
                    if (dr["CatID"].ToString() == hdnCatID.Value)
                    {
                        //   cbCategory.Checked = true;
                    }
                }
            }
        }
        protected async Task Get_SendAIMembersAsync(int ModuleID, int ID, int IsGroup)
        {
            DataTable dt = await ActionItem.Get_SendAIUsersAsync(ModuleID, ID, IsGroup);
            DataTable AIRecepients = new DataTable();

            AIRecepients.Columns.Add("ControlID");
            AIRecepients.Columns.Add("ControlFullName");
            AIRecepients.Columns.Add("ControlType");

            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    DataRow dr = dt.Rows[i];

                    DataRow adrw = AIRecepients.NewRow();
                    string strUserID = dr["ControlID"].ToString();
                    string strUserName = dr["ControlFullName"].ToString();
                    string strType;
                    if (dr["ControlType"].ToString() == "1")
                    {

                        strType = "User";
                    }

                    else
                    {

                        strType = "Entity";
                    }
                    adrw["ControlID"] = strUserID;
                    adrw["ControlFullName"] = strUserName;
                    adrw["ControlType"] = strType;
                    AIRecepients.Rows.Add(adrw);
                }

                AIRecepients.AcceptChanges();
            }

            if (gvRoleMembers.Rows.Count > 0)
            {
                foreach (GridViewRow agvr in gvRoleMembers.Rows)
                {
                    DataRow adrw = AIRecepients.NewRow();
                    string strUserID = gvRoleMembers.DataKeys[agvr.RowIndex].Values[0].ToString();
                    string strUserName = agvr.Cells[0].Text;
                    string strType = agvr.Cells[1].Text;
                    adrw["ControlID"] = strUserID;
                    adrw["ControlFullName"] = strUserName;
                    adrw["ControlType"] = strType;
                    AIRecepients.Rows.Add(adrw);

                }


                AIRecepients.AcceptChanges();

                DataView dv = new DataView(AIRecepients);
                DataTable dt2 = dv.ToTable("dt2", true);


                gvRoleMembers.DataSource = dt2;
                gvRoleMembers.DataBind();
                dt2.Dispose();
                dt.Dispose();
            }
            else
            {


                DataView dv = new DataView(dt)
                {
                    Sort = "ControlFullName"
                };

                gvRoleMembers.DataSource = dv;
                gvRoleMembers.DataBind();
                dv.Dispose();
                dt.Dispose();
            }
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = (DataTable)Session.Contents["dtSelected"];
            dt.Rows[index].Delete();
            Session["dtSelected"] = dt;
            gvRoleMembers.DataSource = dt;
            gvRoleMembers.DataBind();
        }
    }
}