using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paradigm3.datalayer;
using System.Threading.Tasks;
using System.Data;
using System.Web.Security;
using System.Configuration;
using System.IO;

namespace Paradigm3
{
	public partial class ViewDocumentAddFromTemplate : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = authTicket.UserData;
                    string[] UserValues = UserData.Split(',');
                    int UserID = Convert.ToInt32(UserValues[0]);

                    int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
                    string GroupOptionSet = await P3General.Get_GroupOptionSetAsync(3, GroupID);
                    if (!string.IsNullOrEmpty(GroupOptionSet) && GroupOptionSet.Contains("1_6"))
                    {
                        string NameFormula = await Record.Get_NameFormulaAsync(3, GroupID);
                        string[] NameFormulaValues = NameFormula.Split('|');
                        string NameF = NameFormulaValues[0];
                        string LabelF = NameFormulaValues[1];
                        if (!string.IsNullOrEmpty(NameF))
                        {
                            Session["NewDocName"] = NameF;
                            txtName.Text = NameF;
                            txtName.ReadOnly = true;
                        }

                        if (!string.IsNullOrEmpty(LabelF))
                        {
                            Session["NewDocLabel"] = LabelF;
                            txtLabel.Text = LabelF;
                            txtLabel.ReadOnly = true;
                        }
                    }
                    bool HasTemplate = false;
                    if (!string.IsNullOrEmpty(GroupOptionSet))
                    {
                        string[] templateoptions = GroupOptionSet.Split('|');
                        foreach (string option in templateoptions)
                        {
                            if (option.Contains("_4"))
                            {
                                string[] optionsettings = option.Split('_');
                                if (optionsettings[0] != "0")
                                {
                                    Session["TemplateID"] = optionsettings[0];
                                    HasTemplate = true;
                                }
                            }
                        }
                    }
                    if (HasTemplate)
                    {
                        ModalPopupExtender1.Show();
                        btnAddFromTemplate.Enabled = true;
                        btnCancelAdd.OnClientClick = "window.close();";
                    }
                    else
                    {
                        await Fill_Tree(UserID);
                    }
                }
            }
		}

		#region TreeView

		protected async Task Fill_Tree(int UserID)
		{
            await PopulateRootLevelAsync(UserID);
		}

        private async Task PopulateRootLevelAsync(int userID)
        {
            addFromTree.Nodes.Clear();
            DataTable dt = await P3General.Get_DisplayGroupsAsync(3, 8, userID);
            TreeNode rootNode = new TreeNode("System", "8")
            {
                ImageUrl = "~/images/documentroot.png"
            };
            addFromTree.Nodes.Add(rootNode);
            PopulateNodes(dt, addFromTree.FindNode("8").ChildNodes, Convert.ToInt32("8"));
            addFromTree.Nodes[0].Expand();

            dt.Dispose();
        }

        private void PopulateNodes(DataTable dt, TreeNodeCollection nodes, int ParentID)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (!dr["GroupID"].Equals(ParentID) && !dr["GroupID"].Equals(20))
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

        protected async void addFromTree_TreeNodePopulate(object sender, TreeNodeEventArgs e)
		{
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);

                await PopulateSubLevelAsync(3, Convert.ToInt32(e.Node.Value), e.Node, UserID);
            }
            
        }

		protected async void addFromTree_SelectedNodeChanged(object sender, EventArgs e)
		{
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);

                if (!addFromTree.SelectedValue.Equals("8"))
                {
                    addFromTree.SelectedNode.Expand();
                    gvItemList.SelectedIndex = -1;
                    gvItemList.DataSource = await P3General.Get_ItemListAsync(3, UserID, addFromTree.SelectedValue);
                    gvItemList.DataBind();
                }
            }
            
		}

		#endregion

		#region GridView

        protected async void Gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int Status = Convert.ToInt32(gvItemList.DataKeys[e.Row.RowIndex].Values["Status"]);
                if (Status == 9)
                {
                    Image ItemIcon = (Image)e.Row.Cells[0].FindControl("ItemIcon");
                    string FileExtension = await Task.FromResult(gvItemList.DataKeys[e.Row.RowIndex].Values["FileExtension"].ToString());
                    switch (FileExtension.ToUpper())
                    {
                        case "DOC":
                        case "DOCX":
                        case "DOCM":
                        case "RTF":
                            ItemIcon.ImageUrl = "~/images/doc.png";
                            break;
                        case "XLS":
                        case "XLSX":
                        case "XLSM":
                            ItemIcon.ImageUrl = "~/images/xls.png";
                            break;
                        case "PDF":
                            ItemIcon.ImageUrl = "~/images/pdf.png";
                            break;
                        case "DWG":
                            ItemIcon.ImageUrl = "~/images/dwg.png";
                            break;
                        default:
                            ItemIcon.ImageUrl = "~/images/item.png";
                            break;
                    }

                    e.Row.ToolTip = e.Row.Cells[0].Text;
                    e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                    e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvItemList, "Select$" + e.Row.RowIndex);
                }
                else
                {
                    e.Row.Visible = false;
                }
            }
        }

        protected void Gv_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSelectedTemplate.Text = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["Name"].ToString();
            btnOK.Enabled = true;
        }

        #endregion

        protected async void btnAddFromTemplate_Click(object sender, EventArgs e)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                string UserName = UserValues[1];
                int GroupID = Convert.ToInt32(Request.QueryString["GroupID"]);
                int TemplateID = Convert.ToInt32(gvItemList.DataKeys[gvItemList.SelectedIndex].Values["ItemID"]);
                string TemplateExtension = gvItemList.DataKeys[gvItemList.SelectedIndex].Values["FileExtension"].ToString();
                string TemplateFileName = TemplateID.ToString().PadLeft(7, '0') + "." + TemplateExtension;
                TemplateFileName = "D" + TemplateFileName;
                int TypeOfPublish = Convert.ToInt32(gvItemList.DataKeys[gvItemList.SelectedIndex].Values["TypeOfPublish"]);
                string DocPath = ConfigurationManager.AppSettings["DocumentPath"];
                string PublicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"]);

                // Copy Template to public folder, create row in DB, then copy file from public to DOCS with new name.
                if (!string.IsNullOrEmpty(txtName.Text))
                {
                    if (File.Exists(DocPath + TemplateFileName))
                    {
                        using (FileStream SourceStream = File.Open(DocPath + TemplateFileName, FileMode.Open))
                        {
                            using (FileStream TempStream = File.Create(PublicPath + TemplateFileName))
                            {
                                await SourceStream.CopyToAsync(TempStream);
                            }

                            if (File.Exists(PublicPath + TemplateFileName))
                            {
                                try
                                {
                                    // Add row to Database and pull ItemID
                                    int NewItemID = await Document.Add_DocumentAsync(TemplateID, GroupID, txtName.Text, TemplateExtension, 2, false, txtLabel.Text, UserID, UserName);
                                    // Update History for new item
                                    await Document.Edit_Document_HistoryAsync(3, NewItemID, txtName.Text, txtLabel.Text, "Added new item ", UserName, string.Empty);
                                    await P3General.Edit_Group_HistoryAsync(3, GroupID, txtName.Text, txtLabel.Text, "Added new item", 0, UserName);
                                    // Trigger Event
                                    await TriggerEventAsync(1, GroupID, 3, NewItemID, UserName, UserID);
                                    // Generate new file name
                                    string NewDocName = NewItemID.ToString().PadLeft(7, '0');
                                    NewDocName = "D" + NewDocName + "." + TemplateExtension;
                                    // Copy template file to public from DOCS
                                    using (FileStream TempStream = File.Open(PublicPath + TemplateFileName, FileMode.Open))
                                    {
                                        // Copy Public file back into DOCS with new name
                                        using (FileStream FinalStream = File.Create(DocPath + NewDocName))
                                        {
                                            await TempStream.CopyToAsync(FinalStream);                                                                                        
                                        }                                        
                                    }
                                    // Update role members for new document
                                    await Document.Add_RolesToNewDocumentAsync(GroupID, NewItemID, UserName, UserID);
                                    // Delete temporary file from Public folder
                                    if (File.Exists(PublicPath + TemplateFileName))
                                    {
                                        File.Delete(PublicPath + TemplateFileName);
                                    }
                                    ClientScript.RegisterStartupScript(GetType(), "close", "alert('New DRAFT file successfully created from Template');documentRefresh();window.close();", true);
                                }
                                catch (Exception ex)
                                {
                                    File.Delete(PublicPath + TemplateFileName);
                                    string msg = ex.Message.Replace(Environment.NewLine, string.Empty);
                                    msg = msg.Replace("'", string.Empty);
                                    ClientScript.RegisterStartupScript(GetType(), "plinkerror", "alert('" + msg + "');", true);
                                }
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(GetType(), "close", "alert('Could not create file at location, @" + PublicPath + TemplateFileName + "');", true);
                            }
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "nofile", "alert('Source file not found');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "nofile", "alert('You must enter a file name');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "nofile", "alert('Your session has timed out.  Please log in and try again');", true);
            }
        }

        protected async Task TriggerEventAsync(int EventIndexID, int RelatedID, int RelatedModuleID, int ItemID, string UserName, int UserID)
        {
            // Trigger Event if exists
            int? EventID = await P3General.Has_TriggerEventAsync(EventIndexID, RelatedID, RelatedModuleID);
            if (EventID != null)
            {
                await P3General.Trigger_EventAsync(EventID, RelatedID, RelatedModuleID, ItemID, UserName, UserID);
            }
        }
    }
}