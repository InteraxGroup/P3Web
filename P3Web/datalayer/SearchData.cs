using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Configuration;
using System.Threading.Tasks;

namespace Paradigm3.datalayer
{
    public class SearchData
    {

        #region General Objects

        public static DataSet Get_SearchVar(int ModuleID)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand("dbo.v4_Search_Get_SearchVar", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                da.SelectCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                da.TableMappings.Add("Table", "Get_EventDates");
                da.TableMappings.Add("Table1", "Get_ConvertedBy");
                da.TableMappings.Add("Table2", "Get_Initiator");
                da.TableMappings.Add("Table3", "Get_Roles");
                da.TableMappings.Add("Table4", "Get_Categories");
                da.Fill(ds);
            }
            return ds;
        }

        public static DataTable Get_RolesAssigned(int ModuleID, int RoleID)
        {
            DataTable dt = new DataTable();
            DataTable dtAll = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_Get_RoleAssigned", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = RoleID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dtAll.Load(sdr);
            }

            for (int i = 0; i < dtAll.Rows.Count; i++)
            {
                if (Convert.ToInt32(dtAll.Rows[i]["ControlType"]) == 6)
                {
                    int ControlID = Convert.ToInt32(dtAll.Rows[i]["ControlID"]);
                    DataTable dtMembers = ActionItem.Get_UsersFromEntity(ControlID);
                    if (dtMembers.Rows.Count > 0)
                    {
                        dtAll.Merge(dtMembers);
                        dtMembers.Dispose();
                    }
                }
            }

            DataView dv = new DataView(dtAll)
            {
                RowFilter = "ControlType = 1"
            };
            dt = dv.ToTable(true);
            dtAll.Dispose();
            return dt;
        }

        public static DataTable Get_Styles(int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_Get_Styles", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }

            return dt;
        }

        public static DataTable Get_ObjFields(int ModuleID, int ObjTypeID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_Get_ObjFields", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }

            return dt;
        }

        public static int Get_FieldType(int FieldID)
        {
            int FieldType = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_Get_FieldType", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    FieldType = Convert.ToInt32(sdr["FieldType"]);
                }
            }         

            return FieldType;
        }

        #endregion

        #region Async General Objects

        public static async Task<int> Get_FieldTypeAsync(int FieldID)
        {
            int FieldType = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_Get_FieldType", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    FieldType = Convert.ToInt32(sdr["FieldType"]);
                }
            }

            return FieldType;
        }

        #endregion

        #region Search Objects

        public static DataTable Get_SearchResults(int ModuleID, int ParentGroupID, string SearchField, string SearchText, string SearchConvertedBy, DateTime sDate, DateTime eDate, bool GroupOrigID, bool SearchSubGroups, bool SearchWithdrawn, int UserID, int UserStatus)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItems", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@SearchField", SqlDbType.NVarChar, 255).Value = SearchField;
                cmd.Parameters.Add("@SearchText", SqlDbType.NVarChar, 255).Value = SearchText;
                cmd.Parameters.Add("@SearchConvertedBy", SqlDbType.NVarChar, 255).Value = SearchConvertedBy;
                cmd.Parameters.Add("@sDate", SqlDbType.DateTime, 8).Value = sDate;
                cmd.Parameters.Add("@eDate", SqlDbType.DateTime, 8).Value = eDate;
                cmd.Parameters.Add("@GroupOrigID", SqlDbType.Bit, 2).Value = GroupOrigID;
                cmd.Parameters.Add("@SearchSubGroups", SqlDbType.Bit, 2).Value = SearchSubGroups;
                cmd.Parameters.Add("@SearchWithdrawn", SqlDbType.Bit, 2).Value = SearchWithdrawn;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@UserStatus", SqlDbType.Int, 4).Value = UserStatus;

                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_RoleSearchResults(int ModuleID, int ParentGroupID, int AssignedID, int RoleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItemsByRole", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@AssignedID", SqlDbType.Int, 4).Value = AssignedID;
                cmd.Parameters.Add("@RoleID", SqlDbType.Int, 4).Value = RoleID;

                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_CategorySearchResults(int ModuleID, int ParentGroupID, int CatID, bool IsSubGroup, bool IsWithdrawn, int UserID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }

				using (SqlCommand comm = new SqlCommand("SET ARITHABORT ON", conn))
				{
					comm.ExecuteNonQuery();
				}

				SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItemsByCategory", conn)
                {
                    CommandType = CommandType.StoredProcedure,
					CommandTimeout = 0
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
				cmd.Parameters.Add("@IsSubGroup", SqlDbType.Bit, 2).Value = IsSubGroup;
				cmd.Parameters.Add("@IsWithdrawn", SqlDbType.Bit, 2).Value = IsWithdrawn;
				cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;

				SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_StyleSearchResults(int ModuleID, int FieldID, int FieldType, int Modifier, string SearchString, int NumStart, int NumEnd, DateTime DateStart, DateTime DateEnd)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItemsByStyle", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                cmd.Parameters.Add("@FieldType", SqlDbType.Int, 4).Value = FieldType;
                cmd.Parameters.Add("@Modifier", SqlDbType.Int, 4).Value = Modifier;
                cmd.Parameters.Add("@SearchString", SqlDbType.NVarChar, 255).Value = SearchString;
                cmd.Parameters.Add("@NumStart", SqlDbType.Int, 4).Value = NumStart;
                cmd.Parameters.Add("@NumEnd", SqlDbType.Int, 4).Value = NumEnd;
                cmd.Parameters.Add("@DateStart", SqlDbType.DateTime, 8).Value = DateStart;
                cmd.Parameters.Add("@DateEnd", SqlDbType.DateTime, 8).Value = DateEnd;

                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_OrigIDFromIndex(string strSearch)
        {
            string strPath = ConfigurationManager.AppSettings["PathForIndexSearch"].ToString();
            DataTable dt = new DataTable();
            string strcmd = "SELECT System.ItemUrl FROM SYSTEMINDEX WHERE FREETEXT('" + strSearch + "') AND DIRECTORY = '" + strPath + "'";
            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["DocSearch"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                OleDbCommand cmd = new OleDbCommand(strcmd, conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 0
                };
                OleDbDataReader odr = cmd.ExecuteReader();
                DataColumn column = dt.Columns.Add("OrigID", Type.GetType("System.String"));
                while (odr.Read())
                {
                    DataRow dr = dt.NewRow();
                    string result = odr["System.ItemUrl"].ToString();
                    int pos = result.LastIndexOf("/") + 1;
                    result = result.Substring(pos, result.Length - pos);

                    int fullID = Convert.ToInt32(result.Substring(1, 7));
                    string finalID = fullID.ToString();
                    dr["OrigID"] = finalID;
                    dt.Rows.Add(dr);
                }
            }
            return dt;
        }

        public static DataTable Get_IndexSearchResults(string strSearch, int ParentGroupID, bool IncludeSubGroup, bool IsWithdrawn, int UserID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItemsByText", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4);
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@IncludeSubGroup", SqlDbType.Bit, 2).Value = IncludeSubGroup;
                cmd.Parameters.Add("@IsWithdrawn", SqlDbType.Int, 4).Value = IsWithdrawn;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dtOrigID = Get_OrigIDFromIndex(strSearch);
                foreach (DataRow dr in dtOrigID.Rows)
                {
                    DataTable dtTemp = new DataTable();
                    cmd.Parameters["@OrigID"].Value = Convert.ToInt32(dr["OrigID"]);
                    SqlDataReader myReader = cmd.ExecuteReader();
                    dtTemp.Load(myReader);
                    dt.Merge(dtTemp);
                }
            }
            return dt;
        }

        #endregion

        #region Async Search Objects

        public static async Task<DataTable> Get_SearchResultsAsync(int ModuleID, int ParentGroupID, string SearchField, string SearchText, string SearchConvertedBy, DateTime sDate, DateTime eDate, bool GroupOrigID, bool SearchSubGroups, bool SearchWithdrawn, int UserID, int UserStatus, string SiteID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItems", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@SearchField", SqlDbType.NVarChar, 255).Value = SearchField;
                cmd.Parameters.Add("@SearchText", SqlDbType.NVarChar, 255).Value = SearchText;
                cmd.Parameters.Add("@SearchConvertedBy", SqlDbType.NVarChar, 255).Value = SearchConvertedBy;
                cmd.Parameters.Add("@sDate", SqlDbType.DateTime, 8).Value = sDate;
                cmd.Parameters.Add("@eDate", SqlDbType.DateTime, 8).Value = eDate;
                cmd.Parameters.Add("@GroupOrigID", SqlDbType.Bit, 2).Value = GroupOrigID;
                cmd.Parameters.Add("@SearchSubGroups", SqlDbType.Bit, 2).Value = SearchSubGroups;
                cmd.Parameters.Add("@SearchWithdrawn", SqlDbType.Bit, 2).Value = SearchWithdrawn;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@UserStatus", SqlDbType.Int, 4).Value = UserStatus;
                cmd.Parameters.Add("@SiteID", SqlDbType.NVarChar, 100).Value = SiteID;

                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> Get_RoleSearchResultsAsync(int ModuleID, int ParentGroupID, int AssignedID, int RoleID, bool IsSubGroup, bool IsWithdrawn, int UserID, string SiteID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItemsByRole", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@AssignedID", SqlDbType.Int, 4).Value = AssignedID;
                cmd.Parameters.Add("@RoleID", SqlDbType.Int, 4).Value = RoleID;
                cmd.Parameters.Add("@IsSubGroup", SqlDbType.Bit, 2).Value = IsSubGroup;
                cmd.Parameters.Add("@IsWithdrawn", SqlDbType.Bit, 2).Value = IsWithdrawn;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@SiteID", SqlDbType.NVarChar, 100).Value = SiteID;

                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return await Task.FromResult(dt);
        }

        public static async Task<DataTable> Get_CategorySearchResultsAsync(int ModuleID, int ParentGroupID, int CatID, bool IsSubGroup, bool IsWithdrawn, int UserID, string SiteID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItemsByCategory", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                cmd.Parameters.Add("@IsSubGroup", SqlDbType.Bit, 2).Value = IsSubGroup;
                cmd.Parameters.Add("@IsWithdrawn", SqlDbType.Bit, 2).Value = IsWithdrawn;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@SiteID", SqlDbType.NVarChar, 100).Value = SiteID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> Get_StyleSearchResultsAsync(int ModuleID, int FieldID, int FieldType, int Modifier, string SearchString, int NumStart, int NumEnd, DateTime DateStart, DateTime DateEnd, string SiteID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItemsByStyle", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                cmd.Parameters.Add("@FieldType", SqlDbType.Int, 4).Value = FieldType;
                cmd.Parameters.Add("@Modifier", SqlDbType.Int, 4).Value = Modifier;
                cmd.Parameters.Add("@SearchString", SqlDbType.NVarChar, 255).Value = SearchString;
                cmd.Parameters.Add("@NumStart", SqlDbType.Int, 4).Value = NumStart;
                cmd.Parameters.Add("@NumEnd", SqlDbType.Int, 4).Value = NumEnd;
                cmd.Parameters.Add("@DateStart", SqlDbType.DateTime, 8).Value = DateStart;
                cmd.Parameters.Add("@DateEnd", SqlDbType.DateTime, 8).Value = DateEnd;
                cmd.Parameters.Add("@SiteID", SqlDbType.NVarChar, 100).Value = SiteID;

                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> Get_IndexSearchResultsAsync(string strSearch, int ParentGroupID, bool IncludeSubGroup, bool IsWithdrawn, int UserID, string SiteID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Search_SearchItemsByText", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4);
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@IncludeSubGroup", SqlDbType.Bit, 2).Value = IncludeSubGroup;
                cmd.Parameters.Add("@IsWithdrawn", SqlDbType.Int, 4).Value = IsWithdrawn;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@SiteID", SqlDbType.NVarChar, 100).Value = SiteID;
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dtOrigID = Get_OrigIDFromIndex(strSearch);
                foreach (DataRow dr in dtOrigID.Rows)
                {
                    DataTable dtTemp = new DataTable();
                    cmd.Parameters["@OrigID"].Value = Convert.ToInt32(dr["OrigID"]);
                    SqlDataReader myReader = await cmd.ExecuteReaderAsync();
                    dtTemp.Load(myReader);
                    dt.Merge(dtTemp);
                }
            }
            return dt;
        }

        public static async Task<DataTable> Get_OrigIDFromIndexAsync(string strSearch)
        {
            string strPath = ConfigurationManager.AppSettings["PathForIndexSearch"].ToString();
            DataTable dt = new DataTable();
            string strcmd = "SELECT System.ItemUrl FROM SYSTEMINDEX WHERE FREETEXT('" + strSearch + "') AND DIRECTORY = '" + strPath + "'";
            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["DocSearch"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                OleDbCommand cmd = new OleDbCommand(strcmd, conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 0
                };
                OleDbDataReader odr = (OleDbDataReader)await cmd.ExecuteReaderAsync();
                DataColumn column = dt.Columns.Add("OrigID", Type.GetType("System.String"));
                while (odr.Read())
                {
                    DataRow dr = dt.NewRow();
                    string result = odr["System.ItemUrl"].ToString();
                    int pos = result.LastIndexOf("/") + 1;
                    result = result.Substring(pos, result.Length - pos);

                    int fullID = Convert.ToInt32(result.Substring(1, 7));
                    string finalID = fullID.ToString();
                    dr["OrigID"] = finalID;
                    dt.Rows.Add(dr);
                }
            }
            return dt;
        }

        #endregion

    }
}