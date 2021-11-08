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
using System.Configuration;

namespace Paradigm3
{
    public partial class ViewAssign : SqlViewStatePage
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
                Session.Remove("dtSelected");
                P3Tree.Visible = true;
                P3UTree.Visible = true;
                await Fill_UserGroupTreeAsync();
                await Fill_EntityTreeAsync();
            }            
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "addentity":
                    // Create tables
                    DataTable dtAdd = new DataTable();
                    dtAdd.Columns.Add("NumData");
                    dtAdd.Columns.Add("TextData");
                    dtAdd.Columns.Add("Type");

                    // Check if there are already assigned users and add them to temp table.
                    if (gvSelected.Rows.Count > 0)
                    {
                        foreach (GridViewRow agvr in gvSelected.Rows)
                        {
                            DataRow adr1 = dtAdd.NewRow();
                            string strUserID = agvr.Cells[0].Text;
                            string strUserName = agvr.Cells[1].Text;
                            string strType = agvr.Cells[2].Text;
                            adr1["NumData"] = strUserID;
                            adr1["TextData"] = strUserName;
                            adr1["Type"] = strType;
                            dtAdd.Rows.Add(adr1);
                        }
                        dtAdd.AcceptChanges();
                    }

                    if (P3UTree.SelectedNode != null)
                    {
                        if (P3UTree.SelectedNode.ImageUrl == "~/images/user.png")
                        {
                            DataRow adru = dtAdd.NewRow();
                            int UID = Convert.ToInt32(P3UTree.SelectedValue);// - 1000;
                            adru["NumData"] = UID.ToString();
                            adru["TextData"] = P3UTree.SelectedNode.Text;
                            adru["Type"] = "User";
                            dtAdd.Rows.Add(adru);
                            dtAdd.AcceptChanges();
                        }
                        
                    }

                    if (P3Tree.SelectedNode != null)
                    {
                        DataRow adre = dtAdd.NewRow();
                        adre["NumData"] = P3Tree.SelectedValue;
                        adre["TextData"] = P3Tree.SelectedNode.Text;
                        adre["Type"] = "Entity";
                        dtAdd.Rows.Add(adre);
                        dtAdd.AcceptChanges();
                    }

                    // Remove duplicate entries from datatable and bind gridview.
                    DataView dv = new DataView(dtAdd);
                    DataTable dt2 = dv.ToTable("dt2", true);
                    gvSelected.DataSource = dt2;
                    gvSelected.DataBind();
                    break;
                case "removeentity":
                    DataTable dtRemove = new DataTable();
                    dtRemove.Columns.Add("NumData");
                    dtRemove.Columns.Add("TextData");
                    dtRemove.Columns.Add("Type");

                    if (gvSelected.Rows.Count > 0)
                    {
                        string strNumData = null;
                        string strTextData = null;
                        string strTypeData = null;

                        int TotalRows = (gvSelected.Rows.Count - 1);
                        foreach (GridViewRow rgvr in gvSelected.Rows)
                        {
                            strNumData = rgvr.Cells[0].Text;
                            strTextData = rgvr.Cells[1].Text;
                            strTypeData = rgvr.Cells[2].Text;
                            if (rgvr.RowState == DataControlRowState.Normal)
                            {
                                DataRow rdr1 = dtRemove.NewRow();
                                rdr1["NumData"] = strNumData;
                                rdr1["TextData"] = strTextData;
                                rdr1["Type"] = strTypeData;
                                dtRemove.Rows.Add(rdr1);
                            }
                        }
                        dtRemove.AcceptChanges();
                        gvSelected.DataSource = dtRemove;
                        gvSelected.DataBind();
                        gvSelected.SelectedIndex = -1;
                    }
                    break;
                case "submit":
                    if (gvSelected.Rows.Count > 0)
                    {
                        DataTable dtSelected = new DataTable();
                        dtSelected.Columns.Add("ControlID", typeof(int));
                        dtSelected.Columns.Add("ControlFullName", typeof(string));
                        dtSelected.Columns.Add("ControlType", typeof(int));
                        foreach (GridViewRow sgvr in gvSelected.Rows)
                        {
                            DataRow drSelected = dtSelected.NewRow();
                            drSelected["ControlID"] = sgvr.Cells[0].Text;                            
                            
                            if (sgvr.Cells[2].Text == "User")
                            {
                                drSelected["ControlType"] = 1;
                            }
                            else
                            {
                                drSelected["ControlType"] = 6;
                            }
                            string FullName = sgvr.Cells[1].Text;                           
                            drSelected["ControlFullName"] = FullName;
                            dtSelected.Rows.Add(drSelected);
                            dtSelected.AcceptChanges();
                        }                        
                        Session["dtSelected"] = dtSelected;
                        dtSelected.Dispose();
                        string FieldID = Request.QueryString["FieldID"].ToString();
                        switch (FieldID)
                        {
                            case "gvResponsible":
                                ClientScript.RegisterStartupScript(GetType(), "close", "responsibleRefresh();window.close();", true);
                                break;
                            case "gvEscalate":
                                ClientScript.RegisterStartupScript(GetType(), "close", "escalateRefresh();window.close();", true);
                                break;
                            case "Roles":
                                ClientScript.RegisterStartupScript(GetType(), "close", "roleRefresh();window.close();", true);
                                break;
                            case "OtherUser":
                                ClientScript.RegisterStartupScript(GetType(), "close", "openOtherUserAI();window.close();", true);
                                break;                                
                            default:
                                Session["UserFieldID"] = FieldID;
                                ClientScript.RegisterStartupScript(GetType(), "close", "userRefresh();window.close();", true);
                                break;
                        }
                    }
                    else
                    {
                        string msg = "You must select at least one user/entity";
                        ClientScript.RegisterStartupScript(GetType(), "close", "alert('" + msg + "');", true);
                    }
                    break;
                case "cancel":
                    ClientScript.RegisterStartupScript(GetType(), "close", "window.close();", true);
                    break;
            }
        }

        #region ListView Methods

        protected void Fill_Users()
        {
            DataTable dt = ActionItem.Get_ListUsers();
            foreach (DataRow dr in dt.Rows)
            {
                lbSelect.Items.Add(new ListItem(dr["LastName"].ToString() + ", " + dr["FirstName"].ToString(), dr["UserID"].ToString()));
            }
        }

        #endregion

        #region TreeView Methods

        protected async Task Fill_EntityTreeAsync()
        {
            int UserID = 0;
            //  Get user information from authentication cookie.
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int userID = Convert.ToInt32(UserValues[0]);
            }

            //  Get Root Organization Name and populate root level of tree.
            await PopulateRootLevelAsync(P3Tree, 1, UserID, "4");

        }

        protected async Task Fill_UserGroupTreeAsync()
        {
            int UserID = 0;
            //  Get user information from authentication cookie.
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
            }

            //  Get Root Organization Name and populate root level of tree.
            await PopulateRootLevelAsync(P3UTree, 1, UserID, "3");
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
                UserID = Convert.ToInt32(UserValues[0]);
            }
            PopulateSubLevel(moduleID, Convert.ToInt32(e.Node.Value), e.Node, UserID);
        }

        protected void P3UTree_TreeNodePopulate(object sender, TreeNodeEventArgs e)
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
                UserID = Convert.ToInt32(UserValues[0]);
            }
            PopulateSubLevel2(moduleID, Convert.ToInt32(e.Node.Value), e.Node, UserID);
        }

        private async Task PopulateRootLevelAsync(TreeView tv, int moduleID, int userID, string rootID)
        {
            tv.Nodes.Clear();
            DataTable dt = await P3General.Get_DisplayGroupsAsync(moduleID, Convert.ToInt32(rootID), userID);
            DataRow[] root = dt.Select("GroupID = " + rootID);
            if (root.Length > 0)
            {
                TreeNode rootnode = new TreeNode(root[0]["Name"].ToString(), root[0]["GroupID"].ToString());
                tv.Nodes.Add(rootnode);
                if (tv.ID == "P3UTree")
                {
                    PopulateNodes2(dt, tv.FindNode(rootID).ChildNodes, Convert.ToInt32(rootID));
                }
                else
                {
                    PopulateNodes(dt, tv.FindNode(rootID).ChildNodes, Convert.ToInt32(rootID));
                }
            }
            else
            {
                throw new Exception("There is no root level found");
            }

            dt.Dispose();
        }

        private void PopulateNodes(DataTable dt, TreeNodeCollection nodes, int ParentID)
        {
            //foreach (DataRow dr in dt.Rows)
            //{
            //    if (!dr["GroupID"].Equals(ParentID))
            //    {
            //        TreeNode tn = new TreeNode
            //        {
            //            Text = dr["Name"].ToString(),
            //            Value = dr["GroupID"].ToString()
            //        };
            //        nodes.Add(tn);
            //        tn.PopulateOnDemand = (Convert.ToInt32(dr["childnodecount"]) > 0);
            //    }
            //}
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

        private void PopulateNodes2(DataTable dt, TreeNodeCollection nodes, int ParentID)
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
                    if (Convert.ToInt32(dr["ControlType"]) == 10)
                    {
                        tn.ImageUrl = "~/images/user.png";
                        tn.PopulateOnDemand = false;
                    }
                    else
                    {
                        tn.PopulateOnDemand = true;
                    }
                    nodes.Add(tn);
                    
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

        private void PopulateSubLevel2(int ModuleID, int ParentGroupID, TreeNode parentNode, int userID)
        {
            // Populate TreeView sublevels based upon which menu item in TabContainer1 is selected.
            DataTable dt = P3General.Get_DisplayGroups(ModuleID, ParentGroupID, userID);
            PopulateNodes2(dt, parentNode.ChildNodes, ParentGroupID);
            dt.Dispose();
        }

        protected async void P3UTree_SelectedNodeChanged(object sender, EventArgs e)
        {
			P3UTree.SelectedNode.Expand();
            await GetUsersForNode(Convert.ToInt32(P3UTree.SelectedValue));
            if (P3Tree.SelectedNode != null)
			{
				P3Tree.SelectedNode.Selected = false;
			}


		}

		protected void P3Tree_SelectedNodeChanged(object sender, EventArgs e)
        {
            P3Tree.SelectedNode.Expand();
            if (P3UTree.SelectedNode != null)
            {
                P3UTree.SelectedNode.Selected = false;
            }
            
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

        private async Task GetUsersForNode(int NodeId)
        {
            DataTable dt = await P3General.Get_Users_For_SelectedNode(NodeId);
            TreeNode parent = P3UTree.SelectedNode;
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

                    bool NodeExists = false;
                    foreach (TreeNode n in parent.ChildNodes)
					{
                        if (n.Value == tn.Value)
						{
                            NodeExists = true;
						}
					}
                    if (!NodeExists)
					{
                        parent.ChildNodes.Add(tn);
                    }                    
                }
            }
        }

        #endregion

        #region GridView Methods

        protected void GVSelected_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvSelected, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
            }
        }

        #endregion

    }
}