using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using Paradigm3.datalayer;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

namespace Paradigm3
{
	public partial class ViewParaLinkAdd : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			if (!IsPostBack)
			{
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    Response.Redirect("Default.aspx", false);
                }
                else
				{
                    await GetModules();
                    await Fill_Tree(ModuleID);
				}
                
			}
		}

		protected async Task GetModules()
		{
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                string[] ModuleAccess = UserValues[4].Split('_');

                DataTable dt = await Task.FromResult(P3General.Get_Modules());

                foreach (DataRow dr in dt.Rows)
				{
                    int drModuleID = Convert.ToInt32(dr["ModuleID"]);
                    if (drModuleID > 1 && drModuleID < 14)
					{
                        DDLModule.Items.Add(new ListItem(dr["Name"].ToString(),drModuleID.ToString()));
					}
				}

                //DDLModule.DataSource = dt;
                //DDLModule.DataTextField = "Name";
                //DDLModule.DataValueField = "ModuleID";
                //DDLModule.DataBind();

                int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                foreach (ListItem li in DDLModule.Items)
                {
                    if (li.Value == ModuleID.ToString())
                    {
                        li.Selected = true;
                    }
                }
            }
		}

        #region TreeView

        protected async Task Fill_Tree(int ModuleID)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                // Get user information from authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int userID = Convert.ToInt32(UserValues[0]);
                int userStatus = Convert.ToInt32(UserValues[3]);


                await PopulateRootLevelAsync(ModuleID, userID, 1.ToString());
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "no login", "alert('Your authentication has timed out.  Please log back in.');window.close()", true);
            }
        }

        private async Task PopulateRootLevelAsync(int moduleID, int userID, string rootID)
        {
            plTree.Nodes.Clear();
            DataTable dt = await P3General.Get_DisplayGroupsAsync(moduleID, Convert.ToInt32(rootID), userID);
            DataRow[] root = dt.Select("GroupID = " + rootID);
            if (root.Length > 0)
            {
                TreeNode rootnode = new TreeNode(root[0]["Name"].ToString(), root[0]["GroupID"].ToString());
                switch (moduleID)
                {
                    case 3:
                        rootnode.ImageUrl = "~/images/documentroot.png";
                        break;
                    case 4:
                        rootnode.ImageUrl = "~/images/recordroot.png";
                        break;
                    case 6:
                        rootnode.ImageUrl = "~/images/improvementroot.png";
                        break;
                    case 12:
                        rootnode.ImageUrl = "~/images/trainingroot.png";
                        break;
                }
                plTree.Nodes.Add(rootnode);
                PopulateNodes(dt, plTree.FindNode(rootID).ChildNodes, Convert.ToInt32(rootID));
                plTree.Nodes[0].Expand();
            }
            else
            {
                throw new Exception("There is no root level found");
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
                        plTree.Nodes.Add(tn);
                        DataTable dtSystem = await P3General.Get_DisplayGroupsAsync(3, 8, userID);
                        PopulateNodes(dtSystem, plTree.FindNode("8").ChildNodes, 8);
                        plTree.FindNode("8").CollapseAll();
                    }
                }
            }
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

        private async Task PopulateSubLevelAsync(int ModuleID, int ParentGroupID, TreeNode parentNode, int userID)
        {
            // Populate TreeView sublevels based upon which menu item in TabContainer1 is selected.
            DataTable dt = await P3General.Get_DisplayGroupsAsync(ModuleID, ParentGroupID, userID);
            PopulateNodes(dt, parentNode.ChildNodes, ParentGroupID);
            dt.Dispose();
        }

        protected async void PlTree_TreeNodePopulate(object sender, TreeNodeEventArgs e)
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
            await PopulateSubLevelAsync(moduleID, Convert.ToInt32(e.Node.Value), e.Node, UserID);
        }

		protected async void plTree_SelectedNodeChanged(object sender, EventArgs e)
		{
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                // Get user information from authentication cookie.
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);

                plTree.SelectedNode.Expand();

                int ModuleID = Convert.ToInt32(DDLModule.SelectedValue);
                int GroupID = Convert.ToInt32(plTree.SelectedValue);

                gvItemList.SelectedIndex = -1;

                string KeyNames = "ItemID,OrigID,FileExtension,ParentGroupID,TypeOfPublish,IsEvidence,IsCheckedOut,Status";
                gvItemList.Columns[3].Visible = true;
                gvItemList.Columns[4].Visible = false;
                if (ModuleID != 3)
                {
                    KeyNames = "ItemID,OrigID,ParentGroupID,Status,ObjTypeID";
                    gvItemList.Columns[3].Visible = false;
                    gvItemList.Columns[4].Visible = true;
                }
                gvItemList.DataKeyNames = KeyNames.Split(',');
                DataTable dt = await P3General.Get_ItemListAsync(ModuleID, UserID, GroupID.ToString());
                gvItemList.DataSource = dt;
                gvItemList.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "nologin", "alert('Your authentication has timed out.  Please log back in.')", true);
            }
            
        }

		#endregion

		#region GridView

        protected async void Gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int ModuleID = await Task.FromResult(Convert.ToInt32(DDLModule.SelectedValue));
                Image ItemIcon = (Image)e.Row.Cells[0].FindControl("ItemIcon");
                if (e.Row.Cells[3].Text.Contains("Current") || e.Row.Cells[3].Text.Contains("Complete") || e.Row.Cells[3].Text.Contains("Evidence") || e.Row.Cells[4].Text.Contains("Open") || e.Row.Cells[4].Text.Contains("Complete"))
                {
                    switch (ModuleID)
                    {
                        case 4:
                            ItemIcon.ImageUrl = "/images/record.png";
                            break;
                        case 6:
                            ItemIcon.ImageUrl = "/images/improvement.png";
                            break;
                        case 12:
                            ItemIcon.ImageUrl = "/images/training.png";
                            break;
                        default:
                            string FileExtension = gvItemList.DataKeys[e.Row.RowIndex].Values["FileExtension"].ToString();
                            bool IsEvidence = Convert.ToBoolean(gvItemList.DataKeys[e.Row.RowIndex].Values["IsEvidence"]);
                            if (IsEvidence)
                            {
                                ItemIcon.ImageUrl = "images/evd.png";
                            }
                            else
                            {
                                switch (FileExtension.ToUpper())
                                {
                                    case "DOC":
                                    case "DOCX":
                                        ItemIcon.ImageUrl = "images/doc.png";
                                        break;
                                    case "XLS":
                                    case "XLSX":
                                    case "XLSM":
                                        ItemIcon.ImageUrl = "images/xls.png";
                                        break;
                                    case "HTM":
                                    case "HTML":
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
                            break;
                    }
                }
                else
                {
                    e.Row.Visible = false;
                }

                e.Row.ToolTip = e.Row.Cells[0].Text;
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvItemList, "Select$" + e.Row.RowIndex);
            }
        }

        protected async void Gv_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ModuleID = Convert.ToInt32(DDLModule.SelectedValue);
            int OrigID = Convert.ToInt32(gvItemList.DataKeys[gvItemList.SelectedIndex].Values["OrigID"]);
            string Name = gvItemList.SelectedRow.Cells[1].Text;
            Image ItemIcon = (Image)gvItemList.SelectedRow.Cells[0].FindControl("ItemIcon");

            DataTable dt = new DataTable();
            if (ViewState["SelectedItems"] != null)
            {
                dt = (DataTable)ViewState["SelectedItems"];
            }
            else
            {
                dt.Columns.Add("ModuleID", typeof(int));
                dt.Columns.Add("OrigID", typeof(int));
                dt.Columns.Add(new DataColumn("Name", typeof(string)));
                dt.Columns.Add(new DataColumn("ImageUrl", typeof(string)));
            }

            bool IsSelected = false;
            for (int i = 0; i < LVSelected.Items.Count; i++)
            {
                ListViewItem li = LVSelected.Items[i];
                HiddenField HFModuleID = (HiddenField)li.FindControl("HFModuleID");
                HiddenField HFOrigID = (HiddenField)li.FindControl("HFOrigID");
                int liModuleID = Convert.ToInt32(HFModuleID.Value);
                int liOrigID = Convert.ToInt32(HFOrigID.Value);
                if (ModuleID == liModuleID && OrigID == liOrigID)
                {
                    IsSelected = true;
                }
            }

            if (!IsSelected)
            {
                DataRow dr = dt.NewRow();
                dr["ModuleID"] = ModuleID;
                dr["OrigID"] = OrigID;
                dr["Name"] = Name;
                dr["ImageUrl"] = ItemIcon.ImageUrl;

                dt.Rows.Add(dr);
                dt.AcceptChanges();
                ViewState["SelectedItems"] = dt;

                await AddLinkToList();
            }
            
            dt.Dispose();
        }

        protected async Task SortGv(object sender, GridViewSortEventArgs e)
        {
            GridView gv = (GridView)sender;
            int ModuleID = Convert.ToInt32(DDLModule.SelectedValue);
            string ParentGroupID = plTree.SelectedValue;
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
            DataTable dtItems = await P3General.Get_ItemListAsync(ModuleID, UserID, ParentGroupID);
            Direction = SortDirection.Ascending;
            string sortDirection = " ASC";
            if (Direction == SortDirection.Ascending)
            {
                Direction = SortDirection.Descending;
                sortDirection = " DESC";
            }
            dtItems.DefaultView.Sort = e.SortExpression + sortDirection;
            gv.DataSource = dtItems;
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

        #region ListView

        protected void LVSelected_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            LVSelected.SelectedIndex = e.NewSelectedIndex;
            
        }

        protected async void LVSelected_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = await Task.FromResult((DataTable)ViewState["SelectedItems"]);
            LVSelected.DataSource = dt;
            LVSelected.DataBind();
            dt.Dispose();
        }

        #endregion

        #region Controls

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "removelink":
                    if (LVSelected.Items.Count > 0)
                    {                        
                        DataTable dt = await Task.FromResult((DataTable)ViewState["SelectedItems"]);
                        int selIndex = LVSelected.SelectedIndex;
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (selIndex == i)
                            {
                                DataRow dr = dt.Rows[i];
                                dr.Delete();
                            }
                        }
                        dt.AcceptChanges();
                        ViewState["SelectedItems"] = dt;
                        LVSelected.SelectedIndex = -1;
                        LVSelected.DataSource = dt;
                        LVSelected.DataBind();
                    }
                    break;
                case "ok":
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        // Get user information from authentication cookie.
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');

                        int UserID = Convert.ToInt32(UserValues[0]);
                        string UserName = UserValues[1];
                        int ModID = Convert.ToInt32(Session["ModuleID"]);
                        int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);

                        if (ViewState["SelectedItems"] != null)
                        {
                            DataTable dt = (DataTable)ViewState["SelectedItems"];
                            if (dt.Rows.Count > 0)
                            {
                                try
                                {
                                    ParaLink.Add_Paralinks(OrigID, ModID, dt, UserName, UserID, 1);
                                    ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "ok", "alert('ParaLink(s) successfully added');pLinkRefresh();window.close()", true);
                                }
                                catch (SqlException ex)
                                {
                                    string msg = ex.Message.Replace(Environment.NewLine, string.Empty);
                                    msg = msg.Replace("'", string.Empty);
                                    ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "plinkerror", "alert('" + msg + "')", true);
                                }
                                finally
                                {
                                    dt.Dispose();
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "ok", "alert('You must select an item to link')", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "ok", "alert('You must select an item to link')", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "cancel", "alert('Your session has timed out. Please login and try again.');window.close()", true);
                    }
                    break;
                case "Cancel":
                    ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "cancel", "window.close()", true);
                    break;
            }
        }

        protected async void DDLModule_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ModuleID = Convert.ToInt32(DDLModule.SelectedValue);
            gvItemList.SelectedIndex = -1;
            gvItemList.DataSource = null;
            gvItemList.DataBind();
            await Fill_Tree(ModuleID);
        }

        protected async Task AddLinkToList()
        {
            DataTable dt = await Task.FromResult((DataTable)ViewState["SelectedItems"]);
            LVSelected.DataSource = dt;
            LVSelected.DataBind();
        }

        #endregion

    }
}