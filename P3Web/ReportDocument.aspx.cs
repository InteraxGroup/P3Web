using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.Security;

namespace Paradigm3
{
    public partial class ReportDocument : SqlViewStatePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    ClientScript.RegisterStartupScript(GetType(), "sessionexpired", "alert('Your Paradigm 3 user session has expired. Please restart your browser and try again');window.close();", true);
                }
                int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
                lblDate.Text = DateTime.Now.ToString();
                InitializeAsync(ParentGroupID);
            }
        }        

        protected DataTable ParentFolders(int GroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("WITH cte " +
                    "AS(SELECT [GroupID], [Name] FROM [dbo].[Groups3] WHERE [ParentGroupID] = @GroupID OR [GroupID] = @GroupID " +
                    "UNION ALL " +
                    "SELECT a.[GroupID], a.[Name] FROM [dbo].[Groups3] a INNER JOIN cte b ON a.[ParentGroupID] = b.[GroupID]) " +
                    "SELECT DISTINCT [GroupID], [Name] FROM cte", conn);
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        protected DataTable Files(int ParentGroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [Name], [OrigID], [LabelName], [Version], [VersionedBy], [VersionDate] " +
                    "FROM [dbo].[Items3] " +
                    "WHERE [ParentGroupID] = @ParentGroupID AND [Status] = 9 AND [IsDeleted] = 0 AND [IsWithDrawn] = 0 " + 
                    "ORDER BY [Name]", conn);
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int ParentGroupID = 1;//Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            InitializeAsync(ParentGroupID);
            ph1.Visible = true;
        }

        #region Async Methods and Tasks

        protected async void InitializeAsync(int ParentGroupID)
        {
            int totalDocs = 0;
            DataTable dtFolders = await ParentFoldersAsync(ParentGroupID);
            if (dtFolders.Rows.Count > 0)
            {
                foreach (DataRow pr in dtFolders.Rows)
                {
                    int GroupID = Convert.ToInt32(pr["GroupID"]);
                    DataTable SubFiles = await FilesAsync(GroupID);
                    if (SubFiles.Rows.Count > 0)
                    {
                        totalDocs = totalDocs + SubFiles.Rows.Count;
                        // Add Table
                        Table fTable = new Table()
                        {
                            ID = "folderTable",
                            CssClass = "tbl"
                        };
                        ph1.Controls.Add(fTable);

                        // Add Header Row
                        TableRow fTableHeaderRow = new TableRow()
                        {
                            ID = "folderTableHeaderRow",
                            CssClass = "tblHdrRow"
                        };
                        fTable.Controls.Add(fTableHeaderRow);

                        // Add Header Cell
                        TableCell fTableHeaderCell = new TableCell()
                        {
                            ID = "folderTableHeaderCell",
                            CssClass = "tblHdrCell",
                            ColumnSpan = 7
                        };
                        fTableHeaderRow.Controls.Add(fTableHeaderCell);

                        // Add Header Label
                        Label lblFolderName = new Label()
                        {
                            ID = "lblFolderName",
                            CssClass = "folderLabel",
                            Text = pr["Name"].ToString()
                        };
                        fTableHeaderCell.Controls.Add(lblFolderName);

                        // Add Heading Row and Cells
                        TableRow hr = new TableRow()
                        {
                            ID = "hr",
                            CssClass = "hr"
                        };
                        fTable.Controls.Add(hr);

                        // Empty Header Cell
                        TableCell h1 = new TableCell()
                        {
                            ID = "h1",
                            CssClass = "headCell"
                        };

                        // Document Name Header Cell
                        TableCell h2 = new TableCell()
                        {
                            ID = "h2",
                            CssClass = "headCell"
                        };
                        Label lblH2 = new Label()
                        {
                            Text = "Document Name"
                        };
                        h2.Controls.Add(lblH2);

                        // Document ID Header Cell
                        TableCell h3 = new TableCell()
                        {
                            ID = "h3",
                            CssClass = "headCell"
                        };
                        h3.Style.Add("text-align", "center");
                        Label lblH3 = new Label()
                        {
                            Text = "ID"
                        };
                        h3.Controls.Add(lblH3);

                        // Document Label Header Cell
                        TableCell h4 = new TableCell()
                        {
                            ID = "h4",
                            CssClass = "headCell"
                        };
                        Label lblH4 = new Label()
                        {
                            Text = "Label"
                        };
                        h4.Controls.Add(lblH4);

                        // Document Version Header Cell
                        TableCell h5 = new TableCell()
                        {
                            ID = "h5",
                            CssClass = "headCell"
                        };
                        h5.Style.Add("text-align", "center");
                        Label lblH5 = new Label()
                        {
                            Text = "Version"
                        };
                        h5.Controls.Add(lblH5);

                        // Released By Header Cell
                        TableCell h6 = new TableCell()
                        {
                            ID = "h6",
                            CssClass = "headCell"
                        };
                        Label lblH6 = new Label()
                        {
                            Text = "Released By"
                        };
                        h6.Controls.Add(lblH6);

                        // Release Date Header Cell
                        TableCell h7 = new TableCell()
                        {
                            ID = "h7",
                            CssClass = "headCell"
                        };
                        Label lblH7 = new Label()
                        {
                            Text = "Released"
                        };
                        h7.Controls.Add(lblH7);

                        // Add Cells to Row
                        hr.Controls.Add(h1);
                        hr.Controls.Add(h2);
                        hr.Controls.Add(h3);
                        hr.Controls.Add(h4);
                        hr.Controls.Add(h5);
                        hr.Controls.Add(h6);
                        hr.Controls.Add(h7);

                        int i = 0;
                        foreach (DataRow cr in SubFiles.Rows)
                        {
                            // Add Data Row
                            int index = i;
                            TableRow rowData = new TableRow()
                            {
                                ID = "rowData",
                                CssClass = "tblContentRow"
                            };

                            fTable.Controls.Add(rowData);
                            i++;

                            // Empty Column
                            TableCell c1 = new TableCell()
                            {
                                ID = "c1",
                                CssClass = "cell1"
                            };

                            // Name Column
                            TableCell c2 = new TableCell()
                            {
                                ID = "c2",
                                CssClass = "cell2"
                            };
                            Label lblName = new Label()
                            {
                                ID = "lblName",
                                Text = cr["Name"].ToString()
                            };
                            c2.Controls.Add(lblName);

                            // ID Column
                            TableCell c3 = new TableCell()
                            {
                                ID = "c3",
                                CssClass = "cell3"
                            };
                            Label lblID = new Label()
                            {
                                ID = "lblID",
                                Text = cr["OrigID"].ToString()
                            };
                            c3.Controls.Add(lblID);

                            // Label Column
                            TableCell c4 = new TableCell()
                            {
                                ID = "c4",
                                CssClass = "cell4"
                            };
                            Label lblLabel = new Label()
                            {
                                ID = "lblLabel",
                                Text = cr["LabelName"].ToString()
                            };
                            c4.Controls.Add(lblLabel);

                            // Version Column
                            TableCell c5 = new TableCell()
                            {
                                ID = "c5",
                                CssClass = "cell5"
                            };
                            Label lblVersion = new Label()
                            {
                                ID = "lblVersion",
                                Text = cr["Version"].ToString()
                            };
                            c5.Controls.Add(lblVersion);

                            // Released By Column
                            TableCell c6 = new TableCell()
                            {
                                ID = "c6",
                                CssClass = "cell6"
                            };
                            Label lblReleasedBy = new Label()
                            {
                                ID = "lblReleasedBy",
                                Text = cr["VersionedBy"].ToString()
                            };
                            c6.Controls.Add(lblReleasedBy);

                            // Release Date Column
                            TableCell c7 = new TableCell()
                            {
                                ID = "c7",
                                CssClass = "cell7"
                            };
                            Label lblReleaseDate = new Label()
                            {
                                ID = "lblReleaseDate",
                                Text = cr["VersionDate"].ToString()
                            };
                            c7.Controls.Add(lblReleaseDate);

                            // Add Columns to Data Row
                            rowData.Controls.Add(c1);
                            rowData.Controls.Add(c2);
                            rowData.Controls.Add(c3);
                            rowData.Controls.Add(c4);
                            rowData.Controls.Add(c5);
                            rowData.Controls.Add(c6);
                            rowData.Controls.Add(c7);
                        }

                    }
                }
            }
            lblTotal.Text = totalDocs.ToString() + " files found";
        }

        protected async Task<DataTable> ParentFoldersAsync(int GroupID)
        {
            return await Task.Run(() => { return ParentFolders(GroupID); });
        }

        protected async Task<DataTable> FilesAsync(int ParentGroupID)
        {
            return await Task.Run(() => { return Files(ParentGroupID); });
        }

        #endregion
    }
}