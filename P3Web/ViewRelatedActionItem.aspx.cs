using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Web.Security;
using System.Configuration;

namespace Paradigm3
{
    public partial class ViewRelatedActionItem : SqlViewStatePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    ClientScript.RegisterStartupScript(GetType(), "sessionexpired", "alert('Your Paradigm 3 user session has expired. Please restart your browser and try again');window.close();", true);
                }
                int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                string ItemName = RelatedActionItem.Get_ItemName(OrigID, ModuleID);

                Get_Versions(OrigID, ModuleID);
                ddlVersion.SelectedIndex = 0;
                int Version = Convert.ToInt32(ddlVersion.SelectedValue);
                txtConfirm.Text = ItemName;
                Get_Data(OrigID, ModuleID, Version);
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewRelatedActionItem.aspx";
        }

        #region Subroutines

        protected void Get_Versions(int origid, int moduleid)
        {
            ddlVersion.Items.Clear();
            DataTable dt = RelatedActionItem.Get_Versions(origid, moduleid);
            string myStatus = string.Empty;
            ddlVersion.Items.Add(new ListItem("All Versions", "0"));
            foreach (DataRow dr in dt.Rows)
            {
                int strStatus = Convert.ToInt32(dr["Status"]);
                if (moduleid == 3)
                {
                    switch (strStatus)
                    {
                        case 0:
                            myStatus = "Obsolete";
                            break;
                        case 2:
                            myStatus = "Draft";
                            break;
                        case 3:
                            myStatus = "Collaborate";
                            break;
                        case 5:
                            myStatus = "Under Review";
                            break;
                        case 6:
                            myStatus = "Ready for Approval";
                            break;
                        case 7:
                            myStatus = "Pending";
                            break;
                        case 9:
                            myStatus = "Current";
                            break;

                    }
                }
                else
                {
                    switch (strStatus)
                    {
                        case 0:
                            myStatus = "Complete";
                            break;
                        default:
                            myStatus = "Open";
                            break;
                    }
                }
                ddlVersion.Items.Add(new ListItem(myStatus + " (" + dr["Version"].ToString() + ")", dr["ItemID"].ToString()));
            }

        }

        protected void DDLVersion_SelectedIndexChanged(object sender, EventArgs e)
        {

            int ItemID = Convert.ToInt32(ddlVersion.SelectedValue);
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int Version = Convert.ToInt32(ddlVersion.SelectedValue);
            switch (ItemID)
            {
                case 0:
                    Get_Data(OrigID, ModuleID, Version);
                    break;
                default:
                    Get_Data(ItemID, ModuleID, Version);
                    break;
            }
        }

        protected void Get_Data(int OrigID, int ModuleID, int Version)
        {
            Session["AIIDs"] = null;
            gvAIList.DataSource = RelatedActionItem.Get_ActionItems(OrigID, ModuleID, Version);
            gvAIList.DataBind();

            List<string> AIList = new List<string>();
            if (gvAIList.Rows.Count > 0)
			{
                for (int i = 0; i < gvAIList.Rows.Count; i++)
				{
                    string aiid = gvAIList.DataKeys[i].Values["AIID"].ToString();
                    AIList.Add(aiid);
				}
			}
            Session["AIIDs"] = AIList;
        }

        protected void gvAIList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string AIID = gvAIList.DataKeys[e.Row.RowIndex].Values["AIID"].ToString();
                if (e.Row.Cells[1].Text == "2")
                {
                    e.Row.Cells[1].Text = "Open";
                }
                else
                {
                    e.Row.Cells[1].Text = "Complete";
                }

                string ShowModuleID = e.Row.Cells[3].Text;
                switch(ShowModuleID)
                {
                    case "3":
                        e.Row.Cells[3].Text = "Documents";
                        break;
                    case "4":
                        e.Row.Cells[3].Text = "Records";
                        break;
                    case "6":
                        e.Row.Cells[3].Text = "Improvements";
                        break;
                    case "12":
                        e.Row.Cells[3].Text = "Training";
                        break;
                }
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvAIList, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("ondblclick", "openAIWindow(" + AIID + ");");
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
            }
        }

        protected void ImageButton_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "View":
                    int index = gvAIList.SelectedRow.RowIndex;
                    string AIID = gvAIList.DataKeys[index].Values["AIID"].ToString();
                    ScriptManager.RegisterStartupScript(this.udpRelatedAI, this.udpRelatedAI.GetType(), "ViewAI", "openAIWindow(" + AIID + ")", true);
                    break;
                case "Close":
                    ScriptManager.RegisterStartupScript(this.udpRelatedAI, this.udpRelatedAI.GetType(), "ViewAI", "window.close()", true);
                    break;
            }
        }

        #endregion
    }
}