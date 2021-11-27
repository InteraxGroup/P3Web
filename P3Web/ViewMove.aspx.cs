using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Data;
using Paradigm3.datalayer;
using System.Web.Security;
using System.Configuration;
using System.Runtime.CompilerServices;
using DocumentFormat.OpenXml.EMMA;

namespace Paradigm3
{
	public partial class ViewMove : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    string Message = GetLocalResourceObject("SessionTimeout").ToString();
                    ClientScript.RegisterStartupScript(GetType(), "sessiontimeout", "alert('" + Message + "');window.close();", true);
                }

                await Initialize();
            }
		}

		protected async Task Initialize()
		{
			int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
			int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
			int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
			bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);

			if (IsGroup)
			{
				lblTitle.Text = GetLocalResourceObject("lblTitlegrp").ToString();
			}
			else
			{
				lblTitle.Text = GetLocalResourceObject("lblTitleitem").ToString();
			}

            int DefaultGroupID = 1;
            string RootNodeImage = "~/images/documentroot.png";
            switch (ModuleID)
			{
                case 1:
                    if (Session["ParentGroupID"] != null)
					{
                        int ObjTypeID = P3General.Get_ObjTypeID(1, Convert.ToInt32(Session["ParentGroupID"]));
                        RootNodeImage = "~/images/entity.png";
                        if (ObjTypeID == 2)
						{
                            RootNodeImage = "~/images/users2.png";
						}
					}
                    break;
                case 4:
                    RootNodeImage = "~/images/recordroot.png";
                    DefaultGroupID = Convert.ToInt32(ConfigurationManager.AppSettings["DefRecGroupID"]);
                    break;
                case 6:
                    RootNodeImage = "~/images/improvementroot.png";
                    DefaultGroupID = Convert.ToInt32(ConfigurationManager.AppSettings["DefImpGroupID"]);
                    break;
                case 12:
                    RootNodeImage = "~/images/trainroot.png";
                    DefaultGroupID = Convert.ToInt32(ConfigurationManager.AppSettings["DefTrainGroupID"]);
                    break;
                default:
                    DefaultGroupID = Convert.ToInt32(ConfigurationManager.AppSettings["DefDocGroupID"]);
                    break;
            }
            p3Tree.RootNodeStyle.ImageUrl = RootNodeImage;
            if (ModuleID == 1)
			{
                if (RootNodeImage == "~/images/entity.png")
				{
                    PopulateRootLevel(1, UserID, 4);
				}
                else
				{
                    PopulateRootLevel(1, UserID, 3);
				}
			}
            else
			{
                PopulateRootLevel(ModuleID, UserID, DefaultGroupID);
            }            
            p3Tree.Nodes[0].Expand();

            DataTable dt = await P3General.Get_Item_Group_DetailsAsync(ModuleID, OrigID, IsGroup);
            string ItemName = dt.Rows[0]["Name"].ToString();

            lblMessage.Text = GetLocalResourceObject("lblMsg").ToString() + "<br> </br>"
                + "<strong>" + ItemName + "</strong>";
		}

        #region TreeView

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

            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            PopulateSubLevel(ModuleID, Convert.ToInt32(e.Node.Value), e.Node, UserID);
        }

        private void PopulateRootLevel(int ModuleID, int UserID, int RootID)
        {
            p3Tree.Nodes.Clear();
            DataTable dt = P3General.Get_DisplayGroups(ModuleID, RootID, UserID);
            DataRow[] root = dt.Select("GroupID=" + RootID.ToString());
            if (root.Length > 0)
            {
                TreeNode rootnode = new TreeNode(root[0]["Name"].ToString(), root[0]["GroupID"].ToString());
                p3Tree.Nodes.Add(rootnode);
                PopulateNodes(dt, p3Tree.FindNode(RootID.ToString()).ChildNodes, RootID);
            }
            else
            {
                //throw new Exception("There is no root level found");
                ClientScript.RegisterStartupScript(GetType(), "noroot", "alert('There is no root level found');", true);
            }

			dt.Dispose();
        }

        private void PopulateNodes(DataTable dt, TreeNodeCollection nodes, int ParentID)
        {
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int GroupID = Convert.ToInt32(Request.QueryString["OrigID"]);
            bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
            string NodeImage = "~/images/folder.png";

            if (ModuleID == 1)
			{
                if (p3Tree.RootNodeStyle.ImageUrl == "~/images/users2.png")
                {
                    NodeImage = "~/images/users2.png";
                }
                else
				{
                    NodeImage = "~/images/entity.png";
                }                
            }
            

            foreach (DataRow dr in dt.Rows)
            {
                if (IsGroup && !dr["GroupID"].Equals(GroupID))
				{
                    if (!dr["GroupID"].Equals(ParentID))
                    {
                        TreeNode tn = new TreeNode
                        {
                            Text = dr["Name"].ToString(),
                            Value = dr["GroupID"].ToString(),
                            ImageUrl = NodeImage
                        };
                        nodes.Add(tn);
                        tn.PopulateOnDemand = (Convert.ToInt32(dr["childnodecount"]) > 0);
                    }
                }
                else
				{
                    if (!dr["GroupID"].Equals(ParentID))
                    {
                        TreeNode tn = new TreeNode
                        {
                            Text = dr["Name"].ToString(),
                            Value = dr["GroupID"].ToString(),
                            ImageUrl = NodeImage
                        };
                        nodes.Add(tn);
                        tn.PopulateOnDemand = (Convert.ToInt32(dr["childnodecount"]) > 0);
                    }
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
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            Session["DestValuePath"] = p3Tree.SelectedNode.ValuePath;
            //int SelectedGroupID = Convert.ToInt32(p3Tree.SelectedValue);
			string strPath = $"\\\\";
			string[] path = p3Tree.SelectedNode.ValuePath.Split('/');
            foreach (string p in path)
			{
                string groupName = await P3General.Get_GroupNameAsync(ModuleID, Convert.ToInt32(p));
                strPath += groupName + $"\\";

            }

            txtFolderName.Text = strPath.TrimEnd('\\');
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

		protected async void btnSubmit_Click(object sender, EventArgs e)
		{
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
            string SourcePath = Server.UrlDecode(Request.QueryString["SourcePath"]);
            bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
            int DestinationID = Convert.ToInt32(p3Tree.SelectedValue);
            bool KeepProperties = chkProperties.Checked;

            if (!string.IsNullOrEmpty(txtFolderName.Text))
			{
                try
				{
                    string srcPath = $"\\\\";
                    string destPath = txtFolderName.Text;
                    string[] valSrcPath = SourcePath.Split('/');
                    foreach (string p in valSrcPath)
                    {
                        string GroupName = P3General.Get_GroupName(ModuleID, Convert.ToInt32(p));
                        srcPath += GroupName + $"\\";
                    }
                    srcPath = srcPath.TrimEnd('\\');

                    await P3General.MoveAsync(ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties);

                    string msg = GetLocalResourceObject("lblSuccessMsgitem").ToString(); 
                    if (IsGroup)
                    {
                        msg = GetLocalResourceObject("lblSuccessMsggrp").ToString();
                        ClientScript.RegisterStartupScript(GetType(), "refreshTree", "treeRefreshMove();", true);
                    }

					switch (ModuleID)
					{
                        case 1:
                            ClientScript.RegisterStartupScript(GetType(), "complete", "userRefresh();alert('" + msg + "');window.close();", true);
                            break;
						case 4:
						case 6:
						case 12:
							ClientScript.RegisterStartupScript(GetType(), "complete", "recordRefresh();alert('" + msg + "');window.close();", true);
							break;
						default:
							ClientScript.RegisterStartupScript(GetType(), "complete", "documentRefresh();alert('" + msg + "');window.close();", true);
							break;
					}

				}
                catch (Exception ex)
				{
                    ClientScript.RegisterStartupScript(GetType(), "complete", "alert('" + ex.Message + "');", true);
                }                
            }
            else
			{
                ClientScript.RegisterStartupScript(GetType(), "complete", "alert('You must select a destination')", true);
            }
        }
	}
}