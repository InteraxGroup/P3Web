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

namespace Paradigm3.custom.bayshore
{
    public partial class Homepage : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
			{
                await PopulateEIHotlinks();
                await PopulateHRHotlinks();
                //await PopulateHSHotlinks();
                await PopulateCQHIPHotlinks();
                await PopulateISHotlinks();
			}
        }

        protected void BayShoreMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "0":
                    HomePanel.Visible = true;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "1":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = true;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "2":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = true;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "3":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = true;
                    CQHIPPanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "4":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = true;
                    ISPanel.Visible = false;
                    break;
                case "5":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "6":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    ISPanel.Visible = true;
                    break;
                default:
                    HomePanel.Visible = true;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
            }
        }

        private string GenerateSql()
        {
            return ";WITH cte AS " +
                    "(SELECT [GroupID] " +
                    "FROM [dbo].[Groups3] " +
                    "WHERE ([ParentGroupID] = @GroupID OR [GroupID] = @GroupID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '' " +
                    "UNION ALL " +
                    "SELECT a.[GroupID] FROM [dbo].[Groups3] AS a " +
                    "INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] " +
                    "WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> '') " +
                "SELECT [ItemID],[OrigID],[Name],[LabelName],[Status],[FileExtension],[TypeOfPublish] " +
                "FROM [dbo].[Items3] " +
                "WHERE [Status] = 9 AND [IsEvidence] = 0 AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [VersionDate] > @cutoff AND [ParentGroupID] IN (select distinct [GroupID] from cte) " +
                "ORDER BY [VersionDate] DESC";
        }     

        private async Task PopulateEIHotlinks()
		{
            DataTable dt = new DataTable();
            DateTime cutoff = DateTime.Today.AddDays(-30);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand(GenerateSql(), conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = 150;
                cmd.Parameters.Add("@Cutoff", SqlDbType.DateTime, 8).Value = cutoff;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);

            }
            GridViewEI.DataSource = dt;
            GridViewEI.DataBind();
        }

        private async Task PopulateHRHotlinks()
		{
            DataTable dt = new DataTable();
            DateTime cutoff = DateTime.Today.AddDays(-30);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand(GenerateSql(), conn)
                {
					CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = 150;
                cmd.Parameters.Add("@Cutoff", SqlDbType.DateTime, 8).Value = cutoff;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);

			}
            GridViewHR.DataSource = dt;
            GridViewHR.DataBind();
		}

        private async Task PopulateHSHotlinks()
		{
            DataTable dt = new DataTable();
            DateTime cutoff = DateTime.Today.AddDays(-30);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand(GenerateSql(), conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = 179;
                cmd.Parameters.Add("@Cutoff", SqlDbType.DateTime, 8).Value = cutoff;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);

            }
            //GridViewHS.DataSource = null;
            //GridViewHS.DataBind();
		}

        private async Task PopulateCQHIPHotlinks()
		{
            DataTable dt = new DataTable();
            DateTime cutoff = DateTime.Today.AddDays(-30);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand(GenerateSql(), conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = 117;
                cmd.Parameters.Add("@Cutoff", SqlDbType.DateTime, 8).Value = cutoff;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);

            }
            GridViewCQHIP.DataSource = dt;
            GridViewCQHIP.DataBind();
		}

        private async Task PopulateISHotlinks()
		{
            DataTable dt = new DataTable();
            DateTime cutoff = DateTime.Today.AddDays(-30);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand(GenerateSql(), conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = 149;
                cmd.Parameters.Add("@Cutoff", SqlDbType.DateTime, 8).Value = cutoff;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);

            }
            GridViewIS.DataSource = dt;
            GridViewIS.DataBind();
        }

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
		{
            GridView gv = (GridView)sender;
            if (e.Row.RowType == DataControlRowType.DataRow)
			{
                string fileExtension = gv.DataKeys[e.Row.RowIndex].Values["FileExtension"].ToString();
                Image ItemIcon = (Image)e.Row.Cells[0].FindControl("ItemIcon");
                switch (fileExtension.ToUpper())
				{
                    case "DOC":
                    case "DOCX":
                    case "DOCM":
                    case "RTF":
                        ItemIcon.ImageUrl = "~/images/docx.png";
                        break;
                    case "XLS":
                    case "XLSX":
                    case "XLSM":
                        ItemIcon.ImageUrl = "~/images/xlsx.png";
                        break;
                    case "HTM":
                    case "HTML":
                    case "MHT":
                    case "MHTM":
                        ItemIcon.ImageUrl = "~/images/html.png";
                        break;
                    case "PPT":
                    case "PPTX":
                        ItemIcon.ImageUrl = "~/images/pptx.png";
                        break;
                    case "DWG":
                        ItemIcon.ImageUrl = "~/images/dwg.png";
                        break;
                    case "PDF":
                        ItemIcon.ImageUrl = "~/images/pdf.png";
                        break;
                    default:
                        ItemIcon.ImageUrl = "~/images/item.png";
                        break;
                }
                string ItemID = gv.DataKeys[e.Row.RowIndex].Values["OrigID"].ToString();

                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("ondblclick", "openDocument(" + ItemID + ",false,9);");
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
                e.Row.ToolTip = e.Row.Cells[1].Text;
            }
		}

		protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
		{
            GridView gv = (GridView)sender;
		}
	}
}