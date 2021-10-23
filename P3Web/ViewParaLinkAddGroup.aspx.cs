using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Threading.Tasks;
using System.Web.Security;
using System.Configuration;

namespace Paradigm3
{
	public partial class ViewParaLinkAddGroup : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
			
			if (!IsPostBack)
			{
				bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
				if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
				{
					Response.Redirect("Default.aspx", false);
				}
				else
				{
					int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
					await GetModules();
					await Fill_Tree(ModuleID);
				}				
			}
		}	

		#region Button

		protected void Button_Click(object sender, EventArgs e)
		{
			Button btn = (Button)sender;
			string arg = btn.CommandArgument;
			switch (arg)
			{
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

						int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
						int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
						int LinkedModuleID = Convert.ToInt32(DDLModule.SelectedValue);
						int LinkedOrigID = Convert.ToInt32(plTree.SelectedValue);

						DataTable dt = new DataTable();
						dt.Columns.Add("ModuleID", typeof(int));
						dt.Columns.Add("OrigID", typeof(int));
						dt.Columns.Add(new DataColumn("Name", typeof(string)));
						dt.Columns.Add(new DataColumn("ImageUrl", typeof(string)));

						DataRow dr = dt.NewRow();
						dr["ModuleID"] = LinkedModuleID;
						dr["OrigID"] = LinkedOrigID;
						dr["Name"] = txtPLinkedFolder.Text;
						dr["ImageUrl"] = "~/images/folder.png";

						dt.Rows.Add(dr);
						dr.AcceptChanges();

						try
						{
							ParaLink.Add_Paralinks(OrigID, ModuleID, dt, UserName, UserID, 0);
							ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "add", "pLinkRefresh();window.close();", true);
						}
						catch (Exception ex)
						{
							string msg = ex.Message.Replace(Environment.NewLine, string.Empty);
							msg = msg.Replace("'", string.Empty);
							ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "plinkerror", "alert('" + msg + "')", true);
						}
						
					}
					else
					{
						ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "auth", "alert('Your authentication has expired.  Please log on and try again.');", true);
						break;
					}

					break;
				case "cancel":
					ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "close", "window.close();", true);
					break;
			}
		}

		#endregion

		#region Drop Down List

		protected async Task GetModules()
		{
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
				string UserData = authTicket.UserData;
				string[] UserValues = UserData.Split(',');
				int UserID = Convert.ToInt32(UserValues[0]);
				int UserStatus = Convert.ToInt32(UserValues[3]);
				string[] ModuleAccess = UserValues[4].Split('_');

				DataTable dt = await Task.FromResult(P3General.Get_Modules());
				bool AddModule = false;
				foreach (DataRow dr in dt.Rows)
				{
					int drModuleID = Convert.ToInt32(dr["ModuleID"]);
					if (drModuleID > 1 && drModuleID < 14)
					{
						if (UserStatus == 1)
						{
							AddModule = true;
						}
						else
						{
							switch (drModuleID)
							{
								case 4:
									if (ModuleAccess[3] == "4|1")
									{
										AddModule = true;
									}
									break;
								case 6:
									if (ModuleAccess[4] == "6|1")
									{
										AddModule = true;
									}
									break;
								case 12:
									if (ModuleAccess[5] == "12|1")
									{
										AddModule = true;
									}
									break;
								case 3:
									if (ModuleAccess[2] == "3|1")
									{
										AddModule = true;
									}
									break;
							}
						}
						
					}
					if (AddModule)
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

		protected async void DDLModule_SelectedIndexChanged(object sender, EventArgs e)
		{
			int ModuleID = Convert.ToInt32(DDLModule.SelectedValue);
			await Fill_Tree(ModuleID);
		}

		#endregion

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

		protected async void plTree_TreeNodePopulate(object sender, TreeNodeEventArgs e)
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

		protected void plTree_SelectedNodeChanged(object sender, EventArgs e)
		{
			if (plTree.SelectedValue != "1")
			{
				int ModuleID = Convert.ToInt32(DDLModule.SelectedValue);
				if (plTree.SelectedValue != "8")
				{
					if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
					{
						// Get user information from authentication cookie.
						string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
						FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
						string UserData = authTicket.UserData;
						string[] UserValues = UserData.Split(',');

						plTree.SelectedNode.Expand();
						txtPLinkedFolder.Text = plTree.SelectedNode.Text;
					}
					else
					{
						ScriptManager.RegisterStartupScript(udpAddPLink, GetType(), "nologin", "alert('Your authentication has timed out.  Please log back in.')", true);
					}
				}				
			}			
		}

		#endregion
	}
}