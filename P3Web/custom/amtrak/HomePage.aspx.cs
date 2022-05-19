using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
//using System.Security.Principal;
using System.Web.Security;

namespace Paradigm3.custom.amtrak
{
	public partial class HomePage : SqlViewStatePage
	{
		protected async void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				int UserID = 0;
				if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
				{
					//Retrieve http authentication cookie.
					string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
					FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

					//Get user information from http cookie.
					string UserData = ticket.UserData;
					string[] UserValues = UserData.Split(',');
					UserID = Convert.ToInt32(UserValues[0]);
				}
				
				int TotalActionItems = await Get_ActionItems(UserID);
				if (UserID != 0 && TotalActionItems > 0)
				{
					pnlActionItems.Visible = true;
					lblActionItems.Text = "You have " + TotalActionItems.ToString() + " open Action Items";
				}

				//gvRecentBulletins.DataSource = await Get_Bulletins(7735);
				gvRecentBulletins.DataSource = await Get_Bulletins(109);
				gvRecentBulletins.DataBind();
			}
		}

		protected void Page_PreRender(object sender, EventArgs e)
		{
			this.Page.ClientScript.GetPostBackEventReference(gvRecentBulletins, string.Empty);
		}

		protected async Task<int> Get_ActionItems(int UserID)
		{
			int result = 0;
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				string command = "SELECT COUNT(AIID) AS [Total] FROM [dbo].[Items14] WHERE [UserID] = @UserID AND [Status] <> 0 AND [ParentGroupID] = 2 AND [IsDeleted] = 0";
				SqlCommand cmd = new SqlCommand(command, conn)
				{
					CommandType = CommandType.Text
				};
				cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
				SqlDataReader sdr = cmd.ExecuteReader();
				while (sdr.Read())
				{
					result = Convert.ToInt32(sdr["Total"]);
				}
				return await Task.FromResult(result);
			}
		}

		protected async Task<DataTable> Get_Bulletins(int GroupID)
		{
			DataTable dt = new DataTable();
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			using (conn)
			{
				if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
					conn.Open();
				}
				//string command = "SELECT TOP 100 * FROM [dbo].[Items3] WHERE [Status] = 9 AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [IsEvidence] = 0 ORDER BY [VersionDate] DESC";
				string command2 = ";WITH cte AS " +
					"(" +
						"SELECT [GroupID] " +
						"FROM [dbo].[Groups3] " +
						"WHERE ([ParentGroupID] = @GroupID OR [GroupID] = @GroupID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '' " +
						"UNION ALL " +
						"SELECT a.[GroupID] " +
						"FROM [dbo].[Groups3] AS a " +
						"INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] " +
						"WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''" +
					") " +
					"SELECT * FROM [dbo].[Items3] WHERE [ParentGroupID] IN (SELECT [GroupID] FROM cte) AND [Status] = 9 AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [IsEvidence] = 0 AND [VersionDate] > DATEADD(DAY, -180, GETDATE()) " +
					"ORDER BY [VersionDate] DESC";

				SqlCommand cmd = new SqlCommand(command2, conn)
				{
					CommandType = CommandType.Text
				};
				cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
				SqlDataReader sdr = cmd.ExecuteReader();
				dt.Load(sdr);
			}
			return await Task.FromResult(dt);
		}

		protected void Gv_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvRecentBulletins, "Select$" + e.Row.RowIndex);
				int itemID = Convert.ToInt32(gvRecentBulletins.DataKeys[e.Row.RowIndex].Values["ItemID"]);
				int origID = Convert.ToInt32(gvRecentBulletins.DataKeys[e.Row.RowIndex].Values["OrigID"]);
				int status = Convert.ToInt32(gvRecentBulletins.DataKeys[e.Row.RowIndex].Values["Status"]);				
				bool isItemID = false;
				string pubPath = ConfigurationManager.AppSettings["PublishPath"];
				string fileExtension = gvRecentBulletins.DataKeys[e.Row.RowIndex].Values["FileExtension"].ToString();
				int PublishFormat = Convert.ToInt32(gvRecentBulletins.DataKeys[e.Row.RowIndex].Values["TypeOfPublish"]);
				e.Row.Attributes.Add("ondblclick", "amtrakOpenDocWindow(" + itemID + "," + origID + "," + status + ",'" + isItemID + "','" + pubPath + "','" + fileExtension + "'," + PublishFormat + ");");
				e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
				e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
			}
		}

		protected void Gv_SelectedIndexChanged(object sender, EventArgs e)
		{

		}
	}
}