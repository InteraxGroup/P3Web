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
using System.Text.RegularExpressions;
using System.Web.Configuration;
using System.IO;

namespace Paradigm3
{
    public partial class ViewCopy : SqlViewStatePage
    {
        bool ObjectTypeID = false;
        bool SameNameObject = false;
        bool GeneralFolder = false;
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                lblTitle.Text = "Copy Group";
                dv_copyFrom.Attributes.CssStyle.Add("display", "none;");
                dv_copyAs.Attributes.CssStyle.Add("display", "none;");
            }
            else
            {
                lblTitle.Text = "Copy Item";
                dv_copyFrom.Attributes.CssStyle.Add("display", "block;");
                dv_copyAs.Attributes.CssStyle.Add("display", "block;");
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
                case 3:
                    ddl_CopyType.Items.Add("Draft");
                    ddl_CopyType.Items.Add("Collaborate");
                    break;
                case 4:
                    RootNodeImage = "~/images/recordroot.png";
                    DefaultGroupID = Convert.ToInt32(ConfigurationManager.AppSettings["DefRecGroupID"]);
                    ddl_CopyType.Items.Add("Open");
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
            txt_CopyName.Text = "Copy as " + ItemName;

            DataTable dtItem = await P3General.Get_Item_Version_DetailsAsync(ModuleID, OrigID);
            foreach (DataRow dr in dtItem.Rows)
            {
                ddl_CopyVersion.Items.Add(new ListItem(dr["Version"].ToString() + " (" + dr["Status"].ToString() + ")", dr["ItemID"].ToString()));
            }
            
            lblMessage.Text = "The following item will be copied.  Are you sure you want to continue with the operation?<br /><br />"
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
            string groupName = ""
 ;           foreach (string p in path)
            {
                groupName = await P3General.Get_GroupNameAsync(ModuleID, Convert.ToInt32(p));
                strPath += groupName + $"\\";

            }

            txtFolderName.Text = strPath.TrimEnd('\\');

            string Name = txt_CopyName.Text;
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
            string SourcePath = Server.UrlDecode(Request.QueryString["SourcePath"]);
            bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
            int DestinationID = Convert.ToInt32(p3Tree.SelectedValue);

            
            DataSet dtCheck = await P3General.CheckCopyRules(Name, ModuleID, OrigID, DestinationID, UserID, IsGroup);
            if (dtCheck.Tables[0].Columns.Count != 0)
            {
                ObjectTypeID = Convert.ToBoolean(dtCheck.Tables[0].Rows[0]["ObjTypeID"]);
                SameNameObject = Convert.ToBoolean(dtCheck.Tables[0].Rows[0]["ItemNameRule"]);
                if (!string.IsNullOrEmpty(dtCheck.Tables[0].Rows[0]["GeneralFolder"].ToString()))
                {
                    GeneralFolder = Convert.ToBoolean(dtCheck.Tables[0].Rows[0]["GeneralFolder"]);
                }
                else
                {
                    GeneralFolder = false;
                }
            }
            switch (ModuleID)
            {
                case 3:

                    if (!IsGroup && SameNameObject == true)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Same name items are not allowed by Admin. Please check name!" + "');", true);
                        frmbtnSubmit.Attributes.Add("disabled", "disabled");
                        CopyNewName(Name);
                        break;
                    }

                    else
                    {                      
                            frmbtnSubmit.Attributes.Remove("disabled");
                            frmbtnSubmit.Attributes.Add("enabled", "true");
                            break;

                    }
                       
                case 4:            
    
                    if (GeneralFolder)
                    {
                        if (!IsGroup && SameNameObject == true)
                        {    
                            ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Same name items are not allowed by Admin. Please check name!" + "');", true);
                            frmbtnSubmit.Attributes.Add("disabled", "disabled");
                            CopyNewName(Name);
                            break;
                        }

                        else
                        {
                            frmbtnSubmit.Attributes.Remove("disabled");
                            frmbtnSubmit.Attributes.Add("enabled", "true");
                            break;

                        }
                    }

                    else if (ObjectTypeID)
                    {
                        if (!IsGroup && SameNameObject == true)
                        {                 
                            ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Same name items are not allowed by Admin. Please check name!" + "');", true);
                            frmbtnSubmit.Attributes.Add("disabled", "disabled");
                            CopyNewName(Name);
                            break;
                        }

                        else
                        {
                            frmbtnSubmit.Attributes.Remove("disabled");
                            frmbtnSubmit.Attributes.Add("enabled", "enabled");
                            break;

                        }
                    }

                    else
                    {          
                        frmbtnSubmit.Attributes.Add("disabled", "disabled");
                        break;
                    }

                case 6:
       
                    if (GeneralFolder)
                    {
                        if (!IsGroup && SameNameObject == true)
                        {
                           
                            ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Same name items are not allowed by Admin. Please check name!" + "');", true);
                            frmbtnSubmit.Attributes.Add("disabled", "disabled");
                            CopyNewName(Name);
                            break;
                        }

                        else
                        {
                            frmbtnSubmit.Attributes.Remove("disabled");
                            frmbtnSubmit.Attributes.Add("enabled", "enabled");
                            break;

                        }
                    }

                    else if (ObjectTypeID)
                    {
                        if (!IsGroup && SameNameObject == true)
                        {
                          
                            ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Same name folders/items are not allowed by Admin!" + "');", true);
                            frmbtnSubmit.Attributes.Add("disabled", "disabled");
                            CopyNewName(Name);
                            break;
                        }

                        else
                        {
                            frmbtnSubmit.Attributes.Remove("disabled");
                            frmbtnSubmit.Attributes.Add("enabled", "enabled");
                            break;

                        }
                    }

                    else
                    {
                        //ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Destination folder type should be same!" + "');window.close();", true);
                        frmbtnSubmit.Attributes.Add("disabled", "disabled");
                        break;
                    }

               case 12:

                    if (GeneralFolder)
                    {
                        if (!IsGroup && SameNameObject == true)
                        {

                            ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Same name items are not allowed by Admin. Please check name!" + "');", true);
                            frmbtnSubmit.Attributes.Add("disabled", "disabled");
                            CopyNewName(Name);
                            break;
                        }

                        else
                        {
                            frmbtnSubmit.Attributes.Remove("disabled");
                            frmbtnSubmit.Attributes.Add("enabled", "enabled");
                            break;

                        }
                    }

                    else if (ObjectTypeID)
                    {
                        if (!IsGroup && SameNameObject == true)
                        {

                            ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Same name folders/items are not allowed by Admin!" + "');", true);
                            frmbtnSubmit.Attributes.Add("disabled", "disabled");
                            CopyNewName(Name);
                            break;
                        }

                        else
                        {
                            frmbtnSubmit.Attributes.Remove("disabled");
                            frmbtnSubmit.Attributes.Add("enabled", "enabled");
                            break;

                        }
                    }

                    else
                    {           
                        frmbtnSubmit.Attributes.Add("disabled", "disabled");
                        break;
                    }
            }

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
            string Name = txt_CopyName.Text.Trim();
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
            string SourcePath = Server.UrlDecode(Request.QueryString["SourcePath"]);
            bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
            int DestinationID = Convert.ToInt32(p3Tree.SelectedValue);
            bool KeepProperties = chkProperties.Checked;
           

            if (IsGroup)
            {
             
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

                        string msg = "Item copied successfully";
                        if (IsGroup)
                        {
                            msg = "Group copied successfully";
                            ClientScript.RegisterStartupScript(GetType(), "refreshTree", "treeRefreshMove();", true);
                        }

                        switch (ModuleID)
                        {
                            case 1:

                                //await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                //ClientScript.RegisterStartupScript(GetType(), "complete", "userRefresh();alert('" + msg + "');window.close();", true);
                                ClientScript.RegisterStartupScript(GetType(), "complete", "alert('Not Supported for User Module')", true);
                                break;
                            case 4:     
                                
                                await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                ClientScript.RegisterStartupScript(GetType(), "complete", "userRefresh();alert('" + msg + "');window.close();", true);
                                break;
              
                            case 6:

                                await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                ClientScript.RegisterStartupScript(GetType(), "complete", "userRefresh();alert('" + msg + "');window.close();", true);
                                break;

                            case 12:

                                await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                ClientScript.RegisterStartupScript(GetType(), "complete", "recordRefresh();alert('" + msg + "');window.close();", true);
                                break;

                            default:

                                await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
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

            else
            {
                DataSet dtCheck = await P3General.CheckCopyRules(Name, ModuleID, OrigID, DestinationID, UserID, IsGroup);
                if (dtCheck.Tables[0].Columns.Count != 0)
                {               
                    SameNameObject = Convert.ToBoolean(dtCheck.Tables[0].Rows[0]["ItemNameRule"]);             
                }
                if (SameNameObject == true)
                {
                    int SelectedGroupID = Convert.ToInt32(p3Tree.SelectedValue);
                    List<string> ItemName = new List<string>();
                    DataTable dt = P3General.Get_ItemList(ModuleID, UserID, SelectedGroupID.ToString());
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            ItemName.Add(dr["Name"].ToString());
                        }
                    }

                    if (ItemName.Contains(Name))
                    {
                        ClientScript.RegisterStartupScript(GetType(), "complete", "alert('Same name exists, change the name')", true);
                    }

                    else
                    {
                        string version = Regex.Replace(ddl_CopyVersion.SelectedItem.Text, @"\(.*\)", "");
                        //string status = ddl_CopyVersion
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



                                string msg = "Item copied successfully";
                                if (IsGroup)
                                {
                                    msg = "Group copied successfully";
                                    ClientScript.RegisterStartupScript(GetType(), "refreshTree", "treeRefreshMove();", true);
                                }

                                switch (ModuleID)
                                {
                                    case 1:
                                        ClientScript.RegisterStartupScript(GetType(), "complete", "alert('Not Supported for User Module')", true);
                                        break;

                                    case 3:
                                        await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                        if (CreateCopyFile(OrigID, 12, 3, Name))
                                        {
                                            ClientScript.RegisterStartupScript(GetType(), "complete", "documentRefresh();alert('" + msg + "');window.close();", true);
                                            break;
                                        }
                                        else
                                        {
                                            break;
                                        }
                                    case 4:
                                        await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                        ClientScript.RegisterStartupScript(GetType(), "complete", "recordRefresh();alert('" + msg + "');window.close();", true);
                                        break;
                                    case 6:
                                    case 12:
                                        await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                        ClientScript.RegisterStartupScript(GetType(), "complete", "recordRefresh();alert('" + msg + "');window.close();", true);
                                        break;
                                    default:
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

                else
                {
                    string version = Regex.Replace(ddl_CopyVersion.SelectedItem.Text, @"\(.*\)", "");
                    //string status = ddl_CopyVersion
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



                            string msg = "Item copied successfully";
                            if (IsGroup)
                            {
                                msg = "Group copied successfully";
                                ClientScript.RegisterStartupScript(GetType(), "refreshTree", "treeRefreshMove();", true);
                            }

                            switch (ModuleID)
                            {
                                case 1:

                                    ClientScript.RegisterStartupScript(GetType(), "complete", "alert('Not Supported for User Module')", true);
                                    break;
                                case 4:

                                    await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                    ClientScript.RegisterStartupScript(GetType(), "complete", "recordRefresh();alert('" + msg + "');window.close();", true);
                                    break;
                                case 6:
                                case 12:
                                    await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                    ClientScript.RegisterStartupScript(GetType(), "complete", "recordRefresh();alert('" + msg + "');window.close();", true);
                                    break;
                                default:

                                    await P3General.CopyAsync(Name, ModuleID, OrigID, DestinationID, srcPath, destPath, UserID, IsGroup, KeepProperties, null);
                                    if (CreateCopyFile(OrigID, 12, 3, Name))
                                    {
                                        ClientScript.RegisterStartupScript(GetType(), "complete", "documentRefresh();alert('" + msg + "');window.close();", true);
                                        break;
                                    }
                                    else
                                    {
                                        break;
                                    }
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

        protected bool CreateCopyFile(int SourceID, int OrigID, int ModuleID, string Name)
        {
            string DocPath = WebConfigurationManager.AppSettings["DocumentPath"];
            DocPath = @"" + DocPath.Replace(@"\\", @"\");
            DataTable dtDraft = P3General.Get_CopyVersion(SourceID, 2, ModuleID, Name);
            int ItemID = 0;
            if (dtDraft.Rows.Count > 0)
            {
                // Get file extension.
                string FileExtension = dtDraft.Rows[0]["FileExtension"].ToString();

                // Get source file name
                string SourceFileName = SourceID.ToString().PadLeft(7, '0');
                SourceFileName = SourceFileName.PadLeft(8, 'D');
                SourceFileName = SourceFileName + "." + FileExtension;

                // Create Draft file name
                ItemID = Convert.ToInt32(dtDraft.Rows[0]["ItemID"]);
                string NewFileName = ItemID.ToString().PadLeft(7, '0');
                NewFileName = NewFileName.PadLeft(8, 'D');
                NewFileName = NewFileName + "." + FileExtension;

                // Build source and destination path strings
                string SourcePath = Path.Combine(DocPath, SourceFileName);
                string DestPath = Path.Combine(DocPath, NewFileName);
               

                // Copy physical source file to destination
                if (File.Exists(SourcePath))
                {
                    File.Copy(SourcePath, DestPath, true);

                    if (!File.Exists(DestPath))
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Could not create file at location at" + DestPath+ "');", true);
                        // Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, 'Could not create file at location, @" + DestPath + "', true)", true);
                        // code to delete new row from DB
                        Document.Remove_DraftRow(ItemID);
                        return false;
                    }
                }
                else
                {
                     ClientScript.RegisterStartupScript(GetType(), "alert", "userRefresh();alert('" + "Source file not found!" + "');", true);

                     //Page.ClientScript.RegisterStartupScript(GetType(), "close", "showStatusMessage(3, 'Source file not found', true)", true);
                     Document.Remove_DraftRow(ItemID);
                     return false;
                     
                }
            }
            else
            {
                dtDraft.Dispose();
                return true;
            }

            return true;
        }

        private void CopyNewName(string Name)
        {

            if (!String.IsNullOrEmpty(Name))
            {
                txt_CopyName.Enabled = true;
                txt_CopyName.ReadOnly = false;
                frmbtnSubmit.Attributes.Remove("disabled");
                frmbtnSubmit.Attributes.Add("enabled", "enabled");
            }
        }

    }
}