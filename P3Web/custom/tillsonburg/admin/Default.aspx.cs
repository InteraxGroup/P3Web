using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Paradigm3.custom.tillsonburg.admin
{
	public partial class Default : SqlViewStatePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				Menu1.Items[0].Selected = true;
				MultiView1.ActiveViewIndex = 0;				
			}
		}

		protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
		{
			MenuItem item = e.Item;
			item.Selected = true;
			MultiView1.ActiveViewIndex = Convert.ToInt32(e.Item.Value);
		}		

		#region Message Tab Functions and Methods

		protected void ddlTabSelect_SelectedIndexChanged(object sender, EventArgs e)
		{
			int index = ddlTabSelect.SelectedIndex;
			lblTextItem.Text = string.Empty;
			edtTextItem.Text = string.Empty;
			//edtTextItem.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview;
			btnSubmit.Visible = false;
			switch (index)
			{
				case 0:
					ddlMessageSelect.Items.Clear();
					ddlMessageSelect.Items.Add(new ListItem("(Select Message)", "0"));
					ddlMessageSelect.Enabled = false;
					break;
				case 1:
					ddlMessageSelect.Items.Clear();
					ddlMessageSelect.Enabled = true;
					ddlMessageSelect.Items.Add(new ListItem("(Select Message)", "0"));
					ddlMessageSelect.Items.Add("Welcome Message");
					ddlMessageSelect.DataBind();
					ddlMessageSelect.Enabled = true;
					break;
				case 2:
					ddlMessageSelect.Items.Clear();
					ddlMessageSelect.Enabled = true;
					ddlMessageSelect.Items.Add(new ListItem("(Select Message)", "0"));
					ddlMessageSelect.Items.Add("Employee Information Welcome Message");
					ddlMessageSelect.Items.Add("Education");
					ddlMessageSelect.Items.Add("Employee Health & Wellness");
					ddlMessageSelect.Items.Add("Health Infromation & Privacy");
					ddlMessageSelect.Items.Add("Human Resources");
					ddlMessageSelect.Items.Add("Payroll");
					ddlMessageSelect.DataBind();
					ddlMessageSelect.Enabled = true;
					break;
				case 3:
					ddlMessageSelect.Items.Clear();
					ddlMessageSelect.Enabled = true;
					ddlMessageSelect.Items.Add(new ListItem("(Select Message)", "0"));
					ddlMessageSelect.Items.Add("General Information Welcome Message");
					ddlMessageSelect.Items.Add("Accreditation");
					ddlMessageSelect.Items.Add("Administration");
					ddlMessageSelect.Items.Add("Committees");
					ddlMessageSelect.Items.Add("Emergency Response");
					ddlMessageSelect.Items.Add("Ethics");
					ddlMessageSelect.Items.Add("Infection Control");
					ddlMessageSelect.Items.Add("IMAC");
					ddlMessageSelect.Items.Add("IT How Do I...");
					ddlMessageSelect.Items.Add("Joint Health & Safety");
					ddlMessageSelect.Items.Add("News & Events");
					ddlMessageSelect.Items.Add("Pastoral Care");
					ddlMessageSelect.Items.Add("Patient Safety");
					ddlMessageSelect.Items.Add("Recreation Committee");
					ddlMessageSelect.DataBind();
					ddlMessageSelect.Enabled = true;
					break;
			}
		}

		protected void ddlMessageSelect_SelectedIndexChanged(object sender, EventArgs e)
		{
			int tabValue = ddlTabSelect.SelectedIndex;
			int msgValue = ddlMessageSelect.SelectedIndex;
			edtTextItem.Text = string.Empty;
			if (ddlMessageSelect.SelectedValue == "0")
			{
				lblTextItem.Text = string.Empty;
				edtTextItem.Text = string.Empty;
				edtTextItem.Visible = false;
				btnSubmit.Visible = false;
			}
			else
			{
				lblTextItem.Text = ddlMessageSelect.SelectedItem.Text + ":";
				btnSubmit.Enabled = true;
				edtTextItem.Visible = true;
				btnSubmit.Visible = true;
				Display_Content(tabValue, msgValue);
			}
		}

		protected void Display_Content(int tabValue, int msgValue)
		{
			int msgID = 0;
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			switch (tabValue)
			{
				case 1:
					msgID = 1;
					break;
				case 2:
					switch (msgValue)
					{
						case 1:
							msgID = 2;
							break;
						case 2:
							msgID = 3;
							break;
						case 3:
							msgID = 4;
							break;
						case 4:
							msgID = 5;
							break;
						case 5:
							msgID = 6;
							break;
						case 6:
							msgID = 7;
							break;
					}
					break;
				case 3:
					switch (msgValue)
					{
						case 1:
							msgID = 8;
							break;
						case 2:
							msgID = 9;
							break;
						case 3:
							msgID = 10;
							break;
						case 4:
							msgID = 11;
							break;
						case 5:
							msgID = 12;
							break;
						case 6:
							msgID = 13;
							break;
						case 7:
							msgID = 14;
							break;
						case 8:
							msgID = 15;
							break;
						case 9:
							msgID = 16;
							break;
						case 10:
							msgID = 17;
							break;
						case 11:
							msgID = 18;
							break;
						case 12:
							msgID = 19;
							break;
						case 13:
							msgID = 20;
							break;
						case 14:
							msgID = 21;
							break;
					}
					break;
			}
			SqlCommand cmd = new SqlCommand("SELECT Text FROM zz_Message WHERE ID = @ID", conn);
			cmd.Parameters.Add("@ID", SqlDbType.Int, 4).Value = msgID;
			try
			{
				conn.Open();
				SqlDataReader myreader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
				while (myreader.Read())
				{
					//edtTextItem.Content = myreader["Text"].ToString();
					edtTextItem.Text = myreader["Text"].ToString();
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
			finally
			{
				conn.Close();
			}
		}

		protected void btnSubmit_Click(object sender, EventArgs e)
		{
			int tabValue = ddlTabSelect.SelectedIndex;
			int msgValue = ddlMessageSelect.SelectedIndex;
			int msgID = 0;
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM zz_Message WHERE ID = @ID", conn);
			switch (tabValue)
			{
				case 1:
					msgID = 1;
					break;
				case 2:
					switch (msgValue)
					{
						case 1:
							msgID = 2;
							break;
						case 2:
							msgID = 3;
							break;
						case 3:
							msgID = 4;
							break;
						case 4:
							msgID = 5;
							break;
						case 5:
							msgID = 6;
							break;
						case 6:
							msgID = 7;
							break;
					}
					break;
				case 3:
					switch (msgValue)
					{
						case 1:
							msgID = 8;
							break;
						case 2:
							msgID = 9;
							break;
						case 3:
							msgID = 10;
							break;
						case 4:
							msgID = 11;
							break;
						case 5:
							msgID = 12;
							break;
						case 6:
							msgID = 13;
							break;
						case 7:
							msgID = 14;
							break;
						case 8:
							msgID = 15;
							break;
						case 9:
							msgID = 16;
							break;
						case 10:
							msgID = 17;
							break;
						case 11:
							msgID = 18;
							break;
						case 12:
							msgID = 19;
							break;
						case 13:
							msgID = 20;
							break;
						case 14:
							msgID = 21;
							break;
					}
					break;
			}
			da.SelectCommand.Parameters.Add("@ID", SqlDbType.Int, 4).Value = msgID;
			DataTable dt = new DataTable();
			da.Fill(dt);
			da.UpdateCommand = new SqlCommand("UPDATE zz_Message SET Text = @FieldText WHERE ID = @ID", conn);
			da.UpdateCommand.Parameters.Add("@ID", SqlDbType.Int, 4).Value = msgID;
			da.UpdateCommand.Parameters.Add("@FieldText", SqlDbType.NVarChar, 4000, "Text");
			DataRow dr = dt.Rows[0];
			dr["Text"] = edtTextItem.Text;
			da.Update(dt);
			//edtTextItem.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview;
			ScriptManager.RegisterStartupScript(this.udpMultiView, this.udpMultiView.GetType(), "myScript", "alert('Message successfully saved');", true);
		}

		#endregion

		#region Hot Links Tab Functions and Methods

		protected string ComputeHLType(int tv)
		{
			string hlType = string.Empty;
			switch (tv)
			{
				case 0:
					hlType = "Document";
					break;
				case 1:
					hlType = "Folder";
					break;
				default:
					hlType = "External Link";
					break;
			}
			return hlType;
		}

		protected void btnAddHotLink_Click(object sender, EventArgs e)
		{
			lblSelectType.Visible = true;
			ddlHLType.Visible = true;
			HLMultiView.ActiveViewIndex = 0;
			ddlHLType.SelectedIndex = 0;
		}

		protected void ddlHLType_SelectedIndexChanged(object sender, EventArgs e)
		{
			lblSelectType.Visible = true;
			ddlHLType.Visible = true;
			HLMultiView.ActiveViewIndex = ddlHLType.SelectedIndex;
			txtDocID.Text = string.Empty;
			gvDocList.DataSource = null;
			gvDocList.DataBind();
			btnDocIDInsert.Visible = false;
			txtGroupID.Text = string.Empty;
			gvGroupList.DataSource = null;
			gvGroupList.DataBind();
			btnGroupIDInsert.Visible = false;
			txtHLName.Text = string.Empty;
			txtURL.Text = string.Empty;
			gvListHL.DataSource = null;
			gvListHL.DataBind();
		}

		// DocID Links
		protected void btnDocIDSearch_Click(object sender, EventArgs e)
		{
			int OrigID = Convert.ToInt32(txtDocID.Text);
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			SqlCommand cmd = new SqlCommand("Select a.[OrigID], a.[Name], a.[Version], b.[Name] AS [GroupName] " +
				"FROM [dbo].[Items3] AS a " +
				"INNER JOIN [dbo].[Groups3] AS b ON a.[ParentGroupID] = b.[GroupID] AND b.[IsDeleted] = 0 " +
				"WHERE a.[OrigID] = @OrigID " + "AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithDrawn] = 0", conn);
			cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
			using (conn)
			{
				try
				{
					conn.Open();
					SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
					if (myReader.HasRows)
					{
						gvDocList.DataSource = myReader;
						gvDocList.DataBind();
					}
					else
					{
						ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('No CURRENT Document was found that matches your search');", true);
					}					
				}					
				catch (SqlException ex)
				{
					string Error1 = ex.Message;
					string Result1 = Error1.Replace("\"", string.Empty).Replace("'", string.Empty);
					ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('" + Result1 + "');", true);
				}
			}
			
			if(gvDocList.Rows.Count > 0)
			{
				btnDocIDInsert.Visible = true;
			}
		}

		protected void btnDocIDClear_Click(object sender, EventArgs e)
		{
			txtDocID.Text = string.Empty;
			lblHLStatus.Text = string.Empty;
			gvDocList.DataSource = null;
			gvDocList.DataBind();
			btnDocIDInsert.Visible = false;
			lblHLStatus.Visible = false;
		}

		protected void btnDocIDInsert_Click(object sender, EventArgs e)
		{
			int DocID = Convert.ToInt32(gvDocList.Rows[0].Cells[0].Text);
			string DocName = gvDocList.Rows[0].Cells[1].Text;
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			SqlCommand cmd = new SqlCommand("INSERT INTO zz_HotLink (Type, OrigID, LinkName) VALUES(@Type, @OrigID, @LinkName)", conn);
			cmd.Parameters.Add("@Type", SqlDbType.Int, 4).Value = 0;
			cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = DocID;
			cmd.Parameters.Add("@LinkName", SqlDbType.NVarChar, 255).Value = DocName;
			using (conn)
			{
				try
				{
					conn.Open();
					cmd.ExecuteNonQuery();
					ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('Hot Link added successfully!');", true);
					txtDocID.Text = string.Empty;
					lblHLStatus.Text = string.Empty;
					gvDocList.DataSource = null;
					gvDocList.DataBind();
					btnDocIDInsert.Visible = false;
					lblHLStatus.Visible = false;
				}
				catch (SqlException ex)
				{
					string Error1 = ex.Message;
					string Result1 = Error1.Replace("\"", string.Empty).Replace("'", string.Empty);
					ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('" + Result1 + "');", true);
				}
			}
		}

		// GroupID Links
		protected void btnGroupIDSearch_Click(object sender, EventArgs e)
		{
			int GroupID = Convert.ToInt32(txtGroupID.Text);
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			SqlCommand cmd = new SqlCommand("SELECT [GroupID], [ParentGroupID], [Name] " +
				"FROM [dbo].[Groups3] " +
				"WHERE [Name] IS NOT NULL AND [GroupID] = @GroupID AND [TypeOfPublish] > 0 AND [IsDeleted] = 0", conn);
			cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
			using (conn)
			{
				try
				{
					conn.Open();
					SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
					if (myReader.HasRows)
					{
						gvGroupList.DataSource = myReader;
						gvGroupList.DataBind();
						myReader.Close();
						btnGroupIDInsert.Visible = true;
					}
					else
					{
						ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('No PUBLISHED group was found that matches your search');", true);
					}

				}
				catch (SqlException ex)
				{
					string Error1 = ex.Message;
					string Result1 = Error1.Replace("\"", string.Empty).Replace("'", string.Empty);
					ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('" + Result1 + "');", true);
				}
			}

		}

		protected void btnGroupIDClear_Click(object sender, EventArgs e)
		{
			txtGroupID.Text = string.Empty;
			lblHLStatus.Text = string.Empty;
			gvGroupList.DataSource = null;
			gvGroupList.DataBind();
			btnGroupIDInsert.Visible = false;
			lblHLStatus.Visible = false;
		}

		protected void btnGroupIDInsert_Click(object sender, EventArgs e)
		{
			int GroupID = Convert.ToInt32(gvGroupList.Rows[0].Cells[0].Text);
			int parentGroupID = Convert.ToInt32(gvGroupList.Rows[0].Cells[2].Text);
			string GroupName = gvGroupList.Rows[0].Cells[1].Text;
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[zz_HotLink] ([Type], [GroupID], [ParentGroupID], [LinkName]) " +
				"VALUES (@Type, @GroupID, @ParentGroupID, @Name)", conn);
			cmd.Parameters.Add("@Type", SqlDbType.Int, 4).Value = 1;
			cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
			cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = parentGroupID;
			cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = GroupName;
			try
			{
				conn.Open();
				cmd.ExecuteNonQuery();
				ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('Group Hot Link added successfully');", true);
				txtGroupID.Text = string.Empty;
				gvGroupList.DataSource = null;
				gvGroupList.DataBind();
				btnGroupIDInsert.Visible = false;
			}
			catch (SqlException ex)
			{
				string Error1 = ex.Message;
				string Result1 = Error1.Replace("\"", string.Empty).Replace("'", string.Empty);
				ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('" + Result1 + "');", true);
			}
		}

		// Standard Hyperlinks
		protected void btnHLInsert_Click(object sender, EventArgs e)
		{
			string HLName = txtHLName.Text;
			string HLProtocol = ddlURLProtocol.SelectedItem.Text;
			string HLURL = txtURL.Text;
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[zz_HotLink] ([Type], [LinkName], [URLProtocol], [NavigateURL]) " +
				"VALUES(@Type, @LinkName, @UrlProtocol, @NavigateURL)", conn);
			cmd.Parameters.Add("@Type", SqlDbType.Int, 4).Value = 2;
			cmd.Parameters.Add("@LinkName", SqlDbType.NVarChar, 255).Value = HLName;
			cmd.Parameters.Add("@URLProtocol", SqlDbType.NVarChar, 50).Value = HLProtocol;
			cmd.Parameters.Add("@NavigateURL", SqlDbType.NVarChar, 255).Value = HLURL;
			using (conn)
			{
				try
				{
					conn.Open();
					cmd.ExecuteNonQuery();
					ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('External Hot Link added successfully');", true);
					txtHLName.Text = string.Empty;
					txtURL.Text = string.Empty;
					ddlURLProtocol.SelectedIndex = 0;
				}
				catch (SqlException ex)
				{
					string Error1 = ex.Message;
					string Result1 = Error1.Replace("\"", string.Empty).Replace("'", string.Empty);
					ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('" + Result1 + "');", true);
				}
			}
		}
		protected void btnHLClear_Click(object sender, EventArgs e)
		{
			txtHLName.Text = string.Empty;
			txtURL.Text = string.Empty;
			ddlURLProtocol.SelectedIndex = 0;
		}

		// Purge all Hot Links
		protected void btnPurgeHotLinks_Click(object sender, EventArgs e)
		{
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
			SqlCommand cmd = new SqlCommand("SET NOCOUNT ON TRUNCATE TABLE zz_HotLink", conn);
			using (conn)
			{
				try
				{
					conn.Open();
					cmd.ExecuteNonQuery();
					ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('All Hot Links removed');", true);

				}
				catch (SqlException ex)
				{
					string Error1 = ex.Message;
					string Result1 = Error1.Replace("\"", string.Empty).Replace("'", string.Empty);
					ScriptManager.RegisterStartupScript(udpMultiView, udpMultiView.GetType(), "confirm", "alert('" + Result1 + "');", true);
				}
			}
		}
		#endregion

		// List all Hot Links
		protected void btnListHotLinks_Click(object sender, EventArgs e)
		{
			//gvListHL.DataSource = Load_HotLinks();
			gvListHL.DataBind();
			HLMultiView.ActiveViewIndex = 4;
		}
	}
}