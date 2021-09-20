using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;
using System.Collections;
using System.Web.Security;
using System.Xml.Linq;
using System.Threading.Tasks;


namespace Paradigm3.datalayer
{
    public class P3General
    {

        #region Shared

        public static int Get_ObjTypeID(int ModuleID, int GroupID)
        {
            int ObjTypeID = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_ObjTypeID", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;

                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    ObjTypeID = Convert.ToInt32(sdr["ObjTypeID"]);
                }
            }
            return ObjTypeID;
        }

        public static int Get_ParentGroupID(int ModuleID, int ItemID)
        {
            int i = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Default_Get_ParentGroupID", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    i = Convert.ToInt32(sdr["ParentGroupID"]);
                }
            }
            return i;
        }

        public static DataTable Get_Modules()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Get_Modules]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static bool Is_ModuleActive(int ModuleID)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [ModuleType] FROM [dbo].[Modules] WHERE [ModuleID] = @ModuleID", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    if (Convert.ToInt32(sdr["ModuleType"]) == 0)
                    {
                        result = true;
                    }
                }
            }
            return result;
        }

        #endregion

        #region TreeView

        public static DataTable Get_PermittedUsers(int ParentGroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("dbo.v4_TreeView_Get_PermittedUsers", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
        }

        public static DataTable Get_PermittedPositions(int ParentGroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("dbo.v4_TreeView_Get_PermittedPositions", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@parentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
        }

        public static DataTable Get_GroupSecurity(int ModuleID, int GroupID)
        {
            DataTable dt = new DataTable();
            DataTable dtAllPermittedUsers = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("dbo.v4_TreeView_Get_GroupPermitted", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
                dtAllPermittedUsers = RemoveDuplicateRows(dt, "ControlID");
            }
            return dtAllPermittedUsers;
        }

        private static DataTable RemoveDuplicateRows(DataTable dTable, string colName)
        {
            Hashtable hTable = new Hashtable();
            ArrayList duplicateList = new ArrayList();

            foreach (DataRow drow in dTable.Rows)
            {
                if (hTable.Contains(drow[colName]))
                {
                    duplicateList.Add(drow);
                }
                else
                {
                    hTable.Add(drow[colName], string.Empty);
                }
            }
            foreach (DataRow dRow in duplicateList)
            {
                dTable.Rows.Remove(dRow);
            }
            return dTable;
        }

        public static DataTable Get_DisplayGroups(int moduleid, int groupid, int userid)
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

                SqlCommand cmd = new SqlCommand("dbo.v4_TreeView_Get_AllGroups", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 0
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = moduleid;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = groupid;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = userid;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> Get_DisplayGroupsAsync(int moduleid, int groupid, int userid)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }

                using (SqlCommand comm = new SqlCommand("SET ARITHABORT ON", conn))
                {
                    await comm.ExecuteNonQueryAsync();
                }

                SqlCommand cmd = new SqlCommand("dbo.v4_TreeView_Get_AllGroups", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 0
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = moduleid;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = groupid;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = userid;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static string Get_GroupName(int ModuleID, int GroupID)
        {
            string GroupName = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_TreeView_Get_GroupName", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (myReader.Read())
                {
                    GroupName = myReader["Name"].ToString();
                }
            }
            return GroupName;
        }

        public static async Task<string> Get_GroupNameAsync(int ModuleID, int GroupID)
		{
            string GroupName = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_TreeView_Get_GroupName", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader myReader = await cmd.ExecuteReaderAsync();
                while (myReader.Read())
                {
                    GroupName = myReader["Name"].ToString();
                }
            }
            return GroupName;
        }

        public static string Get_GroupOptionSet(int ModuleID, int GroupID)
        {
            string OptionSet = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_TreeView_Get_GroupOptionSet", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (myReader.Read())
                {
                    OptionSet = myReader["OptionSet"].ToString();
                }
            }
            return OptionSet;
        }

        public static async Task<DataTable> Get_DirectLinksAsync(string SiteID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_TreeView_Get_DirectLinks]", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.Add("@SiteID", SqlDbType.VarChar, 500).Value = SiteID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> AllGroupsAsync(int ModuleID, int ParentGroupID, int UserID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("zzzTEST", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        #endregion

        #region GridView

        public static DataTable Get_ItemList(int moduleID, int userID, string parentGroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();                    
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_ListView_Get_ItemList", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = Convert.ToInt32(parentGroupID);
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = moduleID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = userID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> Get_ItemListAsync(int moduleID, int userID, string parentGroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_ListView_Get_ItemList", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = Convert.ToInt32(parentGroupID);
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = moduleID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = userID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        #endregion

        #region Rich Text Functions

        public static string RTFtoText(string RTFString)
        {
            string newText = RTFString;

            if (RTFString != null)
            {
                if (IsRichTextString(RTFString))
                {
                    using (RichTextBox rtb = new RichTextBox())
                    {
                        rtb.Rtf = RTFString;
                        newText = rtb.Text;
                        rtb.Dispose();
                    }
                }
            }
            return newText;
        }

        public static string TextToRTF(string TextString)
        {
            string newText = TextString;

            if (TextString != null)
            {
                if (!IsRichTextString(TextString))
                {
                    using (RichTextBox rtb = new RichTextBox())
                    {
                        rtb.Text = TextString;
                        newText = rtb.Rtf;
                        rtb.Dispose();
                    }
                }
            }
            return newText;
        }

        public static bool IsRichTextString(string testString)
        {
            bool result = false;
            if (testString != null)
            {
                if (testString.TrimStart().StartsWith("{\\rtf") || testString.TrimStart().StartsWith("\rtf1") || testString.TrimStart().StartsWith("{\rtf1"))
                {
                    result = true;
                }
            }
            return result;
        }

        #endregion

        #region Security

        public static async Task<bool> HasAddPermissionAsync(int ModuleID, int GroupID, int UserID)
        {
            bool result = false;
            //DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("v4_ListView_Get_AddPermission", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
				{
                    result = true;
				}
            }
            return (result);
        }

        public static async Task<DataTable> GetAddPermissionListAsync(int ModuleID, int GroupID, int UserID)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_ListView_Get_AddPermissionList]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<bool> HasStatusPermissionAsync(int ModuleID, int OrigID, int UserID)
        {
            bool result = false;
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("v4_ListView_Get_StatusPermission", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
			}

            if (dt.Rows.Count > 0)
			{
                foreach (DataRow dr in dt.Rows)
				{
                    if (UserID == Convert.ToInt32(dr["ID"]))
					{
                        result = true;
					}
				}
			}
            dt.Dispose();
            return result;
        }

        public static async Task<bool> HasEditPermissionAsync(int ModuleID, int OrigID, int UserID)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            DataTable dt = new DataTable();
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("v4_ListView_Get_EditPermission", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            if (dt.Rows.Count > 0)
			{
                foreach (DataRow dr in dt.Rows)
				{
                    if (UserID == Convert.ToInt32(dr["ID"]))
					{
                        result = true;
					}
				}
			}
            dt.Dispose();
            return result;
        }

        public static async Task<bool> HasRolePermissionAsync(int ModuleID, int OrigID, int UserID, int IsGroup)
        {
            bool result = false;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_ListView_Get_RolePermission]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = true;
                }
            }
            return result;
        }

        public static async Task<bool> HasRenamePermissionAsync(int ModuleID, int GroupID, int UserID)
		{
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    await conn.OpenAsync();
				}
                SqlCommand cmd = new SqlCommand("[dbo].[v4_TreeView_Has_Rename_Permission]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
				{
                    result = true;
				}
            }
            return result;
		}

        public static async Task<bool> HasMovePermissionAsync(int ModuleID, int GroupID, int UserID)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_TreeView_Has_Move_Permission]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = true;
                }
            }
            return result;
        }

        public static async Task<bool> HasDeletePermissionAsync(int ModuleID, int GroupID, int UserID)
		{
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_TreeView_Has_Delete_Permission]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = true;
                }
            }
            return result;
        }

        public static async Task<bool> HasEventDatePermissionsAsync(int ModuleID, int OrigID, int IsGroup, int UserID)
		{
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Has_EventDate_Permission]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = true;
                }
            }
            return result;
		}

        public static async Task<bool> HasCategoryPermissionsAsync(int ModuleID, int OrigID, int IsGroup, int UserID)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Has_Category_Permission]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = true;
                }
                return result;
            }
        }

        public static async Task<bool> HasSetRepublishPermissionAsync(int ModuleID, int OrigID, int UserID)
		{            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                bool result = false;
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("[dbo].[v4_TreeView_Has_SetRepublish_Permission]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
				{
                    result = true;
				}
                return result;
			}
		}

        #endregion

        #region Asynchronous Functions and Methods

        public static async Task<int> Has_TriggerEventAsync(int EventIndexID, int RelatedID, int RelatedModuleID)
        {
            int TriggerEventID = 0;
            //DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("SELECT [EventID] FROM [dbo].[AIEventSet] WHERE [EventIndexID] = @EventIndexID AND [RelatedID] = @RelatedID AND [RelatedModuleID] = @RelatedModuleID", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@EventIndexID", SqlDbType.Int, 4).Value = EventIndexID;
                cmd.Parameters.Add("@RelatedID", SqlDbType.Int, 4).Value = RelatedID;
                cmd.Parameters.Add("@RelatedModuleID", SqlDbType.Int, 4).Value = RelatedModuleID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    TriggerEventID = Convert.ToInt32(sdr["EventID"]);
                }
            }
            return TriggerEventID;
        }

        public static async Task Trigger_EventAsync(int? EventID, int ParentGroupID, int ModuleID, int ItemID, string UserName, int UserID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Trigger_Events]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@EventID", SqlDbType.Int).Value = EventID;
                cmd.Parameters.Add("@ShowGroupID", SqlDbType.Int).Value = ParentGroupID;
                cmd.Parameters.Add("@ShowModuleID", SqlDbType.Int).Value = ModuleID;
                cmd.Parameters.Add("@ShowID", SqlDbType.Int).Value = ItemID;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Edit_Group_HistoryAsync(int ModuleID, int GroupID, string ItemName, string ItemLabel, string TaskName, int TaskType, string UserName)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Update_Group_History]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@ItemName", SqlDbType.NVarChar, 255).Value = ItemName;
                cmd.Parameters.Add("@ItemLabel", SqlDbType.NVarChar, 255).Value = ItemLabel;
                cmd.Parameters.Add("@TaskName", SqlDbType.NVarChar, 255).Value = TaskName;
                cmd.Parameters.Add("@TaskType", SqlDbType.Int, 4).Value = TaskType;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                await cmd.ExecuteNonQueryAsync();
            }            
        }

        public static async Task<int> Add_FolderAsync(int ModuleID, int ParentGroupID, string Name, string UserName, int UserID)
        {
            int GroupID = 0;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Add_Folder]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                GroupID = await cmd.ExecuteNonQueryAsync();
            }
            return GroupID;
        }

        public static async Task<string> Get_GroupOptionSetAsync(int ModuleID, int GroupID)
        {
            string OptionSet = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_TreeView_Get_GroupOptionSet", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader myReader = await cmd.ExecuteReaderAsync();
                while (myReader.Read())
                {
                    OptionSet = myReader["OptionSet"].ToString();
                }
            }
            return OptionSet;
        }

        public static async Task<DataTable> Get_Item_Group_DetailsAsync(int ModuleID, int OrigID, bool IsGroup)
		{
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    await conn.OpenAsync();
				}
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Get_Item_Group_Details]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 2).Value = IsGroup;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
		}

        public static async Task<DataTable> Get_Item_Version_DetailsAsync(int ModuleID, int OrigID)
		{
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    await conn.OpenAsync();
				}
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Get_ItemVersions]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
			}
            return dt;
		}

        public static async Task RenameAsync(int ModuleID, int OrigID, int UserID, bool IsGroup, string OldName, string NewName, string OldLabel, string NewLabel)
		{
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    await conn.OpenAsync();
				}
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Rename]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@userID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 2).Value = IsGroup;
                cmd.Parameters.Add("@OldName", SqlDbType.NVarChar, 255).Value = OldName;
                cmd.Parameters.Add("@NewName", SqlDbType.NVarChar, 255).Value = NewName;
                cmd.Parameters.Add("@OldLabel", SqlDbType.NVarChar, 255).Value = OldLabel;
                cmd.Parameters.Add("@NewLabel", SqlDbType.NVarChar, 255).Value = NewLabel;
                await cmd.ExecuteNonQueryAsync();
			}
        }

        public static async Task DeleteAsync(int ModuleID, int OrigID, int UserID, bool IsGroup)
		{
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    await conn.OpenAsync();
				}
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Delete]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 4).Value = IsGroup;
                await cmd.ExecuteNonQueryAsync();
            }
		}

        public static async Task MoveAsync(int ModuleID, int OrigID, int DestinationID, string SourcePath, string DestinationPath, int UserID, bool IsGroup, bool KeepProperties)
		{
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Move]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@DestinationID", SqlDbType.Int, 4).Value = DestinationID;
                cmd.Parameters.Add("@SourcePath", SqlDbType.NVarChar, 500).Value = SourcePath;
                cmd.Parameters.Add("@DestinationPath", SqlDbType.NVarChar, 500).Value = DestinationPath;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 2).Value = IsGroup;
                cmd.Parameters.Add("@KeepProperties", SqlDbType.Bit, 2).Value = KeepProperties;
                await cmd.ExecuteNonQueryAsync();
            }
		}

        public static async Task<DataSet> CheckCopyRules(string Name, int ModuleID, int OrigID, int DestinationID, int UserID, bool IsGroup)
        {
            
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Validate_Copy]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@CopyName", SqlDbType.NVarChar, 100).Value = Name;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@DestinationID", SqlDbType.Int, 4).Value = DestinationID;            
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 2).Value = IsGroup;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                da.Fill(ds);
            }
            return ds;
        }

        public static async Task CopyAsync(string Name, int ModuleID, int OrigID, int DestinationID, string SourcePath, string DestinationPath, int UserID, bool IsGroup, bool KeepProperties, string Version)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Copy]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@CopyName", SqlDbType.NVarChar, 100).Value = Name;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@DestinationID", SqlDbType.Int, 4).Value = DestinationID;
                cmd.Parameters.Add("@SourcePath", SqlDbType.NVarChar, 500).Value = SourcePath;
                cmd.Parameters.Add("@DestinationPath", SqlDbType.NVarChar, 500).Value = DestinationPath;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 2).Value = IsGroup;
                cmd.Parameters.Add("@KeepProperties", SqlDbType.Bit, 2).Value = KeepProperties;
                cmd.Parameters.Add("@Version", SqlDbType.NVarChar, 10).Value = Version;
                await cmd.ExecuteNonQueryAsync();

            }
           
        }

        public static DataTable Get_CopyVersion(int OrigID, int Status, int ModuleID, string Name)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Items" + ModuleID + " WHERE [Name] ='" + Name + "' AND IsDeleted = 0 AND IsWithdrawn = 0 order by LastModified desc", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }
        public static async Task<DataTable> Get_Users_For_SelectedNode(int NodeId)
		{
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("[dbo].[v4_TreeView_Get_UsersForNode]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@NodeID", SqlDbType.Int, 4).Value = NodeId;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
		}

        public static async Task<bool> User_ExsistsAsync(string UserName)
		{            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                bool result = false;
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Check_UserName]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
				{
                    result = true;
				}
                return result;
			}
		}

        public static async Task<int> Set_RepublishAsync(int ID, int UserID, bool IsGroup)
		{
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                int result = 0;
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Default_Set_Republish]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ID", SqlDbType.Int, 4).Value = ID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 2).Value = IsGroup;
                result = await cmd.ExecuteNonQueryAsync();
                return result;
            }
		}

        #endregion

    }

	[Serializable]
    public class P3Folder
    {
        public int GroupID { get; set; }
        public int ParentGroupID { get; set; }
        public string Name { get; set; }
        public int ControlType { get; set; }

    }
}