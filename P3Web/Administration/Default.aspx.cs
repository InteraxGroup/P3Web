using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Threading;
using System.Threading.Tasks;
using Paradigm3.datalayer;
using System.Web.Security;

namespace Paradigm3.Administration
{
	public partial class Default : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
				{
					// Get user information from authentication cookie.
					string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
					FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
					string UserData = authTicket.UserData;
					string[] UserValues = UserData.Split(',');
					int UserStatus = Convert.ToInt32(UserValues[3]);

					if (UserStatus == 1)
					{
						pnlAdmin.Visible = true;
						pnlNotAuthorized.Visible = false;
						await BindPathsAndDefaults();
						await BindDirectLinks();
						await Fill_Tree(dlTree, 3);
						mpeAddDLink.Hide();
					}
					else
					{
						pnlAdmin.Visible = false;
						pnlNotAuthorized.Visible = true;
					}
				}
				else
				{
					pnlAdmin.Visible = false;
					pnlNotAuthorized.Visible = true;
				}
			}
		}

		#region Data

		protected async Task BindPathsAndDefaults()
		{
			Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
			// Domain
			txtDomain.Text = config.AppSettings.Settings["DomainName"].Value;
			// Document Path
			txtDocPath.Text = config.AppSettings.Settings["DocumentPath"].Value;
			// Published Document Path
			txtPublishPath.Text = config.AppSettings.Settings["PublishPath"].Value;
			// Public Path
			txtPublicPath.Text = config.AppSettings.Settings["PublicPath"].Value;
			// Indexed Search Path
			txtIndexSearchPath.Text = config.AppSettings.Settings["PathForIndexSearch"].Value;
			// Attachments Path
			txtAttachPath.Text = config.AppSettings.Settings["AttachmentPath"].Value;

			// Default Module
			ddlDefModule.SelectedValue = config.AppSettings.Settings["DefModuleID"].Value;
			// Default Document Group
			int DefDocGroupID = Convert.ToInt32(config.AppSettings.Settings["DefDocGroupID"].Value);
			txtDefDocGroup.Text = await FolderName(3, DefDocGroupID);
			// Default Records Group
			int DefRecGroupID = Convert.ToInt32(config.AppSettings.Settings["DefRecGroupID"].Value);
			txtDefRecGroup.Text = await FolderName(4, DefRecGroupID);
			// Default Improvements Group
			int DefImpGroupID = Convert.ToInt32(config.AppSettings.Settings["DefImpGroupID"].Value);
			txtDefImpGroup.Text = await FolderName(6, DefImpGroupID);
			// Default Training Group
			int DefTrainGroupID = Convert.ToInt32(config.AppSettings.Settings["DefTrainGroupID"].Value);
			txtDefTrainGroup.Text = await FolderName(12, DefTrainGroupID);
			// Default Action Items Group
			int DefAIGroupID = Convert.ToInt32(config.AppSettings.Settings["DefAIGroupID"].Value);
			txtDefAIGroup.Text = await FolderName(14, DefAIGroupID);

			// Simple Document Search
			bool UseSimpleDocSearch = Convert.ToBoolean(config.AppSettings.Settings["UseSimpleDocSearch"].Value);
			ddlSimpleSearch.SelectedValue = "false";
			if (UseSimpleDocSearch)
            {
				ddlSimpleSearch.SelectedValue = "true";
            }
			// Default Search Page
			string DefaultSearchTab = config.AppSettings.Settings["DefaultSearchTab"].Value;
			ddlDefaultSearchTab.SelectedValue = DefaultSearchTab;
			if (UseSimpleDocSearch)
            {
				ddlDefaultSearchTab.SelectedValue = "true";
				ddlDefaultSearchTab.Enabled = false;
            }			
			// Hide Search on Read Only
			bool HideSearchOnReadOnly = Convert.ToBoolean(config.AppSettings.Settings["HideSearchOnReadOnly"].Value);
			ddlHideSearch.SelectedValue = "false";
			if (HideSearchOnReadOnly)
            {
				ddlHideSearch.SelectedValue = "true";
            }
			// Default Search Field
			string DefaultSearchField = config.AppSettings.Settings["DefaultSearchType"].Value;
			ddlDefaultSearchField.SelectedValue = DefaultSearchField;

		}

		protected async Task BindDirectLinks()
		{
			gvDirectLinks.DataSource = await DirectLinkData();
			gvDirectLinks.DataBind();
		}

		private async Task<DataTable> DirectLinkData()
		{
			string SiteID = ConfigurationManager.AppSettings["SiteID"];
			DataTable dt = new DataTable();
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				SqlCommand cmd = new SqlCommand("[dbo].[v4_TreeView_Get_DirectLinks]", conn)
				{
					CommandType = CommandType.StoredProcedure
				};
				cmd.Parameters.Add("@SiteID", SqlDbType.NVarChar, 500).Value = SiteID;
				SqlDataReader sdr = cmd.ExecuteReader();
				dt.Load(sdr);
			}
			return await Task.FromResult(dt);
		}

		private async Task<string> FolderName(int ModuleID, int GroupID)
		{
			string result = "";
			string SelTable;
			switch (ModuleID)
			{
				case 4:
					SelTable = "[dbo].[Groups4]";
					break;
				case 6:
					SelTable = "[dbo].[Groups6]";
					break;
				case 12:
					SelTable = "[dbo].[Groups12]";
					break;
				case 14:
					SelTable = "[dbo].[Groups14]";
					break;
				default:
					SelTable = "[dbo].[Groups3]";
					break;
			}

			string sql = "SELECT [Name] FROM " + SelTable + " WHERE [GroupID] = @GroupID";
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				SqlCommand cmd = new SqlCommand(sql, conn)
				{
					CommandType = CommandType.Text
				};
				cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
				SqlDataReader sdr = cmd.ExecuteReader();
				while (sdr.Read())
				{
					result = sdr["Name"].ToString();
				}
			}
			
			return await Task.FromResult(result);
		}

		private void DownLoadSDData()
		{
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["P3SD"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}

				// Empty Tables and populate data from live DB
				string sqlcmd = "TRUNCATE TABLE [dbo].[Calculation];TRUNCATE TABLE [dbo].[ExtFields];TRUNCATE TABLE [dbo].[ObjFields];TRUNCATE TABLE [dbo].[Objects];TRUNCATE TABLE [dbo].[ObjType];TRUNCATE TABLE [dbo].[Modules];" +
					"INSERT INTO [dbo].[Modules] SELECT * FROM [P3].[dbo].[Modules] WHERE [ModuleID] > 0;" +
					"INSERT INTO[dbo].[ObjType] SELECT[ObjTypeID],[ObjParentID],[ObjClass],[DueInterval],[ModuleID],[Caption],[Notes],[ListOrder],[IsCurrent],[CARDep],0,0,[IsDeleted],0 FROM[P3].[dbo].[ObjType];" +
					"INSERT INTO[dbo].[Objects] SELECT[ObjID],[OrigID],[ObjTypeID],[ModuleID],[CreateBy],[CreateDate],[ModifiedBy],[LastModified],[IsDeleted],[IsCurrent],[CreatorID],[ModifierID],0,0,0 FROM[P3].[dbo].[Objects];" +
					"INSERT INTO[dbo].[ObjFields] SELECT[FieldID],[FieldOrigID],[ObjID],[FieldName],[FieldNotes],[CellRef],[FieldType],[IsMandatory],[DefaultValue],[HasValueRange],[MinValue],[MaxValue],[IsAllowOut],[ForeColour],[IsBold],[IsItalics],[DisplayTop],[DisplayLeft],[DisplayWidth],[DisplayHeight],[IsDisabled],[MustValidate],[IsMasterLink],[LinkStatus],[IsNotSorted],[IsDeleted],[HasCalc],[IsExternalField],[WdXlContent],0,0,0,[IsReadOnly],[PrmryFltrFld],[ScndryFltrFld] FROM[P3].[dbo].[ObjFields];" +
					"INSERT INTO[dbo].[ExtFields] SELECT* FROM[P3].[dbo].[ExtFields];" +
					"INSERT INTO[dbo].[Calculation] SELECT* FROM[P3].[dbo].[Calculation];";
				SqlCommand cmd = new SqlCommand(sqlcmd, conn)
				{
					CommandType = CommandType.Text
				};
				cmd.ExecuteNonQuery();
			}	
		}

		private void GetStyleData(int ModuleID)
		{
			DataTable dt = new DataTable();
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["P3SD"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				SqlCommand cmd = new SqlCommand("SELECT [ObjTypeID],[Caption] " +
					"FROM [dbo].[ObjType] " +
					"WHERE [ModuleID] = @ModuleID AND [ObjParentID] = 0 AND [IsDeleted] = 0 AND [IsCurrent] = 1 " +
					"ORDER BY [Caption]", conn)
				{
					CommandType = CommandType.Text
				};
				cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
				SqlDataReader sdr = cmd.ExecuteReader();
				dt.Load(sdr);
			}
			
			ddlSDStyles.DataSource = dt;
			ddlSDStyles.DataTextField = "Caption";
			ddlSDStyles.DataValueField = "ObjTypeID";
			ddlSDStyles.DataBind();
			ddlSDModules.Enabled = true;
			ddlSDStyles.Enabled = true;
			ddlSDPages.Enabled = false;
			ddlSDFields.Enabled = false;
			dt.Dispose();
		}

		#endregion

		#region GridView

		protected void gvDirectLinks_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				string moduleid = e.Row.Cells[1].Text;
				Label lblModule = (Label)e.Row.Cells[1].FindControl("lblModule");
				switch (moduleid)
				{
					case "4":						
						lblModule.Text = "Records";
						break;
					case "6":
						lblModule.Text = "Improvements";
						break;
					case "12":
						lblModule.Text = "Training";
						break;
					default:
						lblModule.Text = "Documents";
						break;
				}
			}
		}

		protected async void gvDirectLinks_RowEditing(object sender, GridViewEditEventArgs e)
		{
			gvDirectLinks.EditIndex = e.NewEditIndex;
			await BindDirectLinks();
		}

		protected async void gvDirectLinks_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{
			
			TextBox SiteID = (TextBox)gvDirectLinks.Rows[e.RowIndex].Cells[2].FindControl("txtSiteID");
			int GroupID = Convert.ToInt32(gvDirectLinks.DataKeys[e.RowIndex].Values["GroupID"]);
			int ModuleID = Convert.ToInt32(gvDirectLinks.DataKeys[e.RowIndex].Values["ModuleID"]);

			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				SqlCommand cmd = new SqlCommand("UPDATE [dbo].[WebEnabledFolders] SET [PrfrdFolderName] = @SiteID WHERE [GroupID] = @GroupID AND [ModuleID] = @ModuleID", conn)
				{
					CommandType = CommandType.Text
				};
				cmd.Parameters.Add("@SiteID", SqlDbType.NVarChar, 500).Value = SiteID.Text;
				cmd.Parameters.Add("GroupID", SqlDbType.Int, 4).Value = GroupID;
				cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
				cmd.ExecuteNonQuery();
			}
			gvDirectLinks.EditIndex = -1;
			await BindDirectLinks();
		}

		protected async void gvDirectLinks_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			int GroupID = Convert.ToInt32(gvDirectLinks.DataKeys[e.RowIndex].Values["GroupID"]);
			int ModuleID = Convert.ToInt32(gvDirectLinks.DataKeys[e.RowIndex].Values["ModuleID"]);

			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[WebEnabledFolders] WHERE [GroupID] = @GroupID AND [ModuleID] = @ModuleID", conn)
				{
					CommandType = CommandType.Text
				};
				cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
				cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
				cmd.ExecuteNonQuery();
			}

			gvDirectLinks.SelectedIndex = -1;
			await BindDirectLinks();
		}

		protected async void gvDirectLinks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
		{
			gvDirectLinks.EditIndex = -1;
			await BindDirectLinks();
		}

		#endregion

		#region TreeView

		protected async Task Fill_Tree(TreeView tv, int ModuleID)
		{
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				// Get user information from authentication cookie.
				string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				string UserData = authTicket.UserData;
				string[] UserValues = UserData.Split(',');
				int userID = Convert.ToInt32(UserValues[0]);


				await PopulateRootLevelAsync(tv, ModuleID, userID, "1");
			}
			else
			{
				ScriptManager.RegisterStartupScript(udpDLinks, GetType(), "no login", "alert('Your authentication has timed out.  Please log back in.');window.close()", true);
			}
		}

		private async Task PopulateRootLevelAsync(TreeView tv, int moduleID, int userID, string rootID)
		{
			tv.Nodes.Clear();
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
				tv.Nodes.Add(rootnode);
				PopulateNodes(dt, tv.FindNode(rootID).ChildNodes, Convert.ToInt32(rootID));
				tv.Nodes[0].Expand();
			}
			else
			{
				throw new Exception("There is no root level found");
			}

			dt.Dispose();
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

		protected async void TreeView_TreeNodePopulate(object sender, TreeNodeEventArgs e)
		{
			//int UserID = 0;
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				string UserData = authTicket.UserData;
				string[] UserValues = UserData.Split(',');
				int UserID = Convert.ToInt32(UserValues[0]);

				int moduleID = Convert.ToInt32(ddlDLinkModule.SelectedValue);
				await PopulateSubLevelAsync(moduleID, Convert.ToInt32(e.Node.Value), e.Node, UserID);
			}
		}

		protected void TreeView_SelectedNodeChanged(object sender, EventArgs e)
		{			
			TreeView tv = (TreeView)sender;
			tv.SelectedNode.Expand();
			switch (tv.ID)
			{
				case "dlTree":
					mpeAddDLink.Show();
					break;
				case "dgTree":
					mpeUpdateDefaults.Show();
					break;
			}
		}

		protected void TreeView_TreeNodeExpanded(object sender, TreeNodeEventArgs e)
		{
			TreeView tv = (TreeView)sender;
			switch (tv.ID)
			{
				case "dlTree":
					mpeAddDLink.Show();
					break;
				case "dgTree":
					mpeUpdateDefaults.Show();
					break;
			}
		}

		protected void TreeView_TreeNodeCollapsed(object sender, TreeNodeEventArgs e)
		{
			TreeView tv = (TreeView)sender;
			switch (tv.ID)
			{
				case "dlTree":
					mpeAddDLink.Show();
					break;
				case "dgTree":
					mpeUpdateDefaults.Show();
					break;
			}
		}

		#endregion

		#region Direct Link Controls

		protected async void ddlDLinkModule_SelectedIndexChanged(object sender, EventArgs e)
		{
			int ModuleID = Convert.ToInt32(ddlDLinkModule.SelectedValue);
			txtDLinkSiteID.Text = "";
			await Fill_Tree(dlTree, ModuleID);
			mpeAddDLink.Show();
		}

		protected async void btnSubmitNewDLink_Click(object sender, EventArgs e)
		{
			if (dlTree.SelectedNode != null && dlTree.SelectedValue != "1")
			{
				int ModuleID = Convert.ToInt32(ddlDLinkModule.SelectedValue);
				int GroupID = Convert.ToInt32(dlTree.SelectedValue); ;
				string SiteID = txtDLinkSiteID.Text;

				SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
				using (conn)
				{
					if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
					{
						conn.Open();
					}
					SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[WebEnabledFolders]([ModuleID],[GroupID],[PrfrdFolderName]) VALUES(@ModuleID,@GroupID,@SiteID);", conn)
					{
						CommandType = CommandType.Text
					};
					cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
					cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
					cmd.Parameters.Add("@SiteID", SqlDbType.NVarChar, 500).Value = SiteID;
					cmd.ExecuteNonQuery();

					await BindDirectLinks();
					await Fill_Tree(dlTree, 3);
					mpeAddDLink.Hide();
				}
			}
			else
			{
				ScriptManager.RegisterStartupScript(udpDLinks, GetType(), "noselectednode", "alert('You must select a valid node');", true);
			}
		}

		protected void btnUpdateDomain_Click(object sender, EventArgs e)
		{
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["DomainName"].Value = txtDomain.Text;
			config.Save();
		}

		protected void btnUpdateDocPath_Click(object sender, EventArgs e)
		{
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["DocumentPath"].Value = txtDocPath.Text;
			config.Save();
		}

		protected void btnUpdatePublishPath_Click(object sender, EventArgs e)
		{
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["PublishPath"].Value = txtPublishPath.Text;
			config.Save();
		}

		protected void btnUpdatePublicPath_Click(object sender, EventArgs e)
		{
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["PublicPath"].Value = txtPublicPath.Text;
			config.Save();
		}

		protected void btnUpdateIndexSearchPath_Click(object sender, EventArgs e)
		{
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["PathForIndexSearch"].Value = txtIndexSearchPath.Text;
			config.Save();
		}

		protected void btnUpdateAttachPath_Click(object sender, EventArgs e)
		{
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["AttachmentPath"].Value = txtAttachPath.Text;
			config.Save();
		}

		protected async void btnUpdateDefDocGroup_Click(object sender, EventArgs e)
		{
			ddlDefGroupModule.SelectedIndex = 0;
			await Fill_Tree(dgTree, 3);
			mpeUpdateDefaults.Show();
		}

		protected async void btnUpdateDefRecGroup_Click(object sender, EventArgs e)
		{
			ddlDefGroupModule.SelectedIndex = 1;
			await Fill_Tree(dgTree, 4);
			mpeUpdateDefaults.Show();
		}

		protected async void btnUpdateDefImpGroup_Click(object sender, EventArgs e)
		{
			ddlDefGroupModule.SelectedIndex = 2;
			await Fill_Tree(dgTree, 6);
			mpeUpdateDefaults.Show();
		}

		protected async void btnUpdateDefTrainGroup_Click(object sender, EventArgs e)
		{
			ddlDefGroupModule.SelectedIndex = 3;
			await Fill_Tree(dgTree, 12);
			mpeUpdateDefaults.Show();
		}

		protected async void btnUpdateDefAIGroup_Click(object sender, EventArgs e)
		{
			ddlDefGroupModule.SelectedIndex = 4;
			await Fill_Tree(dgTree, 14);
			mpeUpdateDefaults.Show();
		}

		protected void btnSubmitUpdateDefFolder_Click(object sender, EventArgs e)
		{

			string GroupID = dgTree.SelectedValue;
			string GroupName = dgTree.SelectedNode.Text;
			string ModuleID = ddlDefGroupModule.SelectedValue;
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			switch (ModuleID)
			{
				case "4":
					config.AppSettings.Settings["DefRecGroupID"].Value = GroupID;
					txtDefRecGroup.Text = GroupName;
					break;
				case "6":
					config.AppSettings.Settings["DefImpGroupID"].Value = GroupID;
					txtDefImpGroup.Text = GroupName;
					break;
				case "12":
					config.AppSettings.Settings["DefTrainGroupID"].Value = GroupID;
					txtDefTrainGroup.Text = GroupName;
					break;
				case "14":
					config.AppSettings.Settings["DefAIGroupID"].Value = GroupID;
					txtDefAIGroup.Text = GroupName;
					break;
				default:
					config.AppSettings.Settings["DefDocGroupID"].Value = GroupID;
					txtDefDocGroup.Text = GroupName;
					break;
			}
			config.Save();
		}

		protected void ddlDefModule_SelectedIndexChanged(object sender, EventArgs e)
		{
			string SelectedModule = ddlDefModule.SelectedValue;
			//ScriptManager.RegisterStartupScript(udpDefaults, GetType(), "test", "alert(" + SelectedModule + ");", true);
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["DefModuleID"].Value = SelectedModule;
			config.Save();
		}

		#endregion

		#region Style Designer Controls and Methods

		protected async void btnSDDownloadDB_Click(object sender, EventArgs e)
		{
			try
			{
				//await DownLoadSDData();
				await Task.Run(() => DownLoadSDData());
				await Task.Run(() => GetStyleData(4));
				ScriptManager.RegisterStartupScript(udpSD, GetType(), "SqlSuccess", "alert('Styles data successfully copied');", true);
			}
			catch (SqlException ex)
			{
				ScriptManager.RegisterStartupScript(udpSD, GetType(), "SqlError", "alert('" + ex.Message + "');", true);
			}
		}

		protected void ResetFields()
		{
			// Styles Dropdown
			ddlSDStyles.Items.Clear();
			ddlSDStyles.Items.Add(new ListItem("", "0"));

			// Pages Dropdown
			ddlSDPages.Items.Clear();
			ddlSDPages.Items.Add(new ListItem("", "0"));

			// Fields Dropdown
			ddlSDPages.Items.Clear();
			ddlSDPages.Items.Add(new ListItem("", "0"));
		}

		protected async void ddlSDModules_SelectedIndexChanged(object sender, EventArgs e)
		{
			int ModuleID = Convert.ToInt32(ddlSDModules.SelectedValue);
			ResetFields();
			await Task.Run(() => GetStyleData(ModuleID));
		}

		#endregion

		#region Default Search Controls		

		protected void ddlSimpleSearch_SelectedIndexChanged(object sender, EventArgs e)
		{
			string value = ddlSimpleSearch.SelectedValue;
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["UseSimpleDocSearch"].Value = value;
			config.Save();

			ddlDefaultSearchTab.Enabled = true;
			if (value == "true")
            {
				ddlDefaultSearchTab.Enabled = false;
            }
		}

		protected void ddlDefaultSearchTab_SelectedIndexChanged(object sender, EventArgs e)
		{
			string value = ddlDefaultSearchTab.SelectedValue;
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["DefaultSearchTab"].Value = value;
			config.Save();
		}

		protected void ddlHideSearch_SelectedIndexChanged(object sender, EventArgs e)
		{
			string value = ddlHideSearch.SelectedValue;
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["HideSearchOnReadOnly"].Value = value;
			config.Save();
		}

		protected void ddlDefaultSearchField_SelectedIndexChanged(object sender, EventArgs e)
		{
			string value = ddlDefaultSearchField.SelectedValue;
			Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
			config.AppSettings.Settings["DefaultSearchType"].Value = value;
			config.Save();
		}

		#endregion

	}
}