using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading.Tasks;

namespace Paradigm3.datalayer
{
    public class Properties
    {
        #region General Properties

        public static async Task<DataTable> Get_PropertiesAsync(int ItemID, int ModuleID, int IsGroup)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Properties_Get_Info", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public async static Task<DataTable> Get_UserMembershipsAsync(int UserID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Get_UserMemberships]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<int> Update_UserMembershipsAsync(int userID, int controlID, string controlFullName, int currentUserID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Update_UserMembershipList]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = userID;
                cmd.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = controlID;
                cmd.Parameters.Add("@ControlFullName", SqlDbType.NVarChar, 255).Value = controlFullName;
                cmd.Parameters.Add("@CurrentUserID", SqlDbType.Int, 4).Value = currentUserID;
                return await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task<int> Remove_UserMembershipAsync(int UserId, int GroupID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Remove_UserMembership]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserId;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                return await cmd.ExecuteNonQueryAsync();
            }
        }

        public async static Task<DataTable> Get_UserTrainingAsync(int UserID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Get_UserTraining]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public async static Task<DataTable> Get_UserOtherUserAIListAsync(int UserID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Get_OtherUserAIList]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public async static Task<int> Update_OtherUserAIListAsync(int userID, int controlID, string controlFullName, int controlType, int currentUserID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Update_OtherUserAIList]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = userID;
                cmd.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = controlID;
                cmd.Parameters.Add("@ControlFullName", SqlDbType.NVarChar, 255).Value = controlFullName;
                cmd.Parameters.Add("@ControlType", SqlDbType.Int, 4).Value = controlType;
                cmd.Parameters.Add("@CurrentUserID", SqlDbType.Int, 4).Value = currentUserID;
                return await cmd.ExecuteNonQueryAsync();
            }
        }

        public async static Task<int> Get_TotalLicenses(int Status)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                int result = 0;
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("SELECT COUNT([UserID]) AS [Total] FROM [dbo].[Items1] WHERE [Status] = @Status AND [IsDeleted] = 0;", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@Status", SqlDbType.Int, 4).Value = Status;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = Convert.ToInt32(sdr["Total"]);
                }
                return result;
            }
        }

        public async static Task<int> Add_NewUserAsync(string Name, int ParentGroupID, string FirstName, string LastName, string Password, string Email, string Mobile, string Spare01, string Spare02,
            DateTime Spare03, DateTime Spare04, string Description, int Status, string ModuleAccess, string OptionSet, string Language, int CreatorID)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Users_Add_New_User]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 255).Value = FirstName;
                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 255).Value = LastName;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 255).Value = Password;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 255).Value = Email;
                cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar, 255).Value = Mobile;
                cmd.Parameters.Add("@Spare01", SqlDbType.NVarChar, 255).Value = Spare01;
                cmd.Parameters.Add("@Spare02", SqlDbType.NVarChar, 255).Value = Spare02;
                cmd.Parameters.Add("@Spare03", SqlDbType.DateTime, 8).Value = Spare03;
                cmd.Parameters.Add("@Spare04", SqlDbType.DateTime, 8).Value = Spare04;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value = Description;
                cmd.Parameters.Add("@Status", SqlDbType.Int, 4).Value = Status;
                cmd.Parameters.Add("@ModuleAccess", SqlDbType.NVarChar, 255).Value = ModuleAccess;
                cmd.Parameters.Add("@OptionSet", SqlDbType.NVarChar, 255).Value = OptionSet;
                cmd.Parameters.Add("@Language", SqlDbType.NVarChar, 255).Value = Language;
                cmd.Parameters.Add("@CreatorID", SqlDbType.Int, 4).Value = CreatorID;
                return await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task<int> Update_UserAsync(int UserID, string FirstName, string LastName, string Password, string Email, string Mobile, string Spare01, string Spare02,
            DateTime Spare03, DateTime Spare04, string Description, int Status, string ModuleAccess, string OptionSet, string Language, int ModifierID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                await conn.OpenAsync();
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Users_Update_User]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 255).Value = FirstName;
                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 255).Value = LastName;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 255).Value = Password;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 255).Value = Email;
                cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar, 255).Value = Mobile;
                cmd.Parameters.Add("@Spare01", SqlDbType.NVarChar, 255).Value = Spare01;
                cmd.Parameters.Add("@Spare02", SqlDbType.NVarChar, 255).Value = Spare02;
                cmd.Parameters.Add("@Spare03", SqlDbType.DateTime, 8).Value = Spare03;
                cmd.Parameters.Add("@Spare04", SqlDbType.DateTime, 8).Value = Spare04;
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value = Description;
                cmd.Parameters.Add("@Status", SqlDbType.Int, 4).Value = Status;
                cmd.Parameters.Add("@ModuleAccess", SqlDbType.NVarChar, 255).Value = ModuleAccess;
                cmd.Parameters.Add("@OptionSet", SqlDbType.NVarChar, 255).Value = OptionSet;
                cmd.Parameters.Add("@Language", SqlDbType.NVarChar, 255).Value = Language;
                cmd.Parameters.Add("@ModifierID", SqlDbType.Int, 4).Value = ModifierID;
                return await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Save_NotesAsync(int ModuleID, int OrigID, int IDType, string StrNotes)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Update_Notes]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IDType", SqlDbType.Int, 4).Value = IDType;
                cmd.Parameters.Add("@Notes", SqlDbType.NVarChar, -1).Value = StrNotes;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Add_NotesAsync(int ModuleID, int OrigID, int IDType, string StrNotes)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Update_Notes]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IDType", SqlDbType.Int, 4).Value = IDType;
                cmd.Parameters.Add("@Notes", SqlDbType.NVarChar, -1).Value = StrNotes;
                await cmd.ExecuteNonQueryAsync();
            }
        }
        #endregion

        #region Roles Tab

        public static async Task<DataTable> Get_RolesAsync(int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("v4_Properties_Get_Roles", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> Get_RoleMembersAsync(int ModuleID, int ID, int CatID, int IsGroup)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("v4_Properties_Get_Role_Members", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ID", SqlDbType.Int, 4).Value = ID;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task Add_RoleMemberAsync(int ModuleID, int OrigID, int IsGroup, int CatID, int ControlID, string ControlFullName, int ControlType, int CreatorID, string CreateBy)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Add_Role_Members]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                cmd.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = ControlID;
                cmd.Parameters.Add("@ControlFullName", SqlDbType.NVarChar, 255).Value = ControlFullName;
                cmd.Parameters.Add("@ControlType", SqlDbType.Int, 4).Value = ControlType;
                cmd.Parameters.Add("@CreatorID", SqlDbType.Int, 4).Value = CreatorID;
                cmd.Parameters.Add("@CreateBy", SqlDbType.NVarChar, 255).Value = CreateBy;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Remove_RoleMemberAsync(int ID, int ModuleID, int OrigID, int IsGroup, int CatID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("v4_Properties_Remove_Role_Member", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ID", SqlDbType.Int, 4).Value = ID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("IsGroup", SqlDbType.Bit, 2).Value = IsGroup;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Purge_RoleMembersAsync(int Type, int ModuleID, int ID, int CatID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Purge_Role_Members]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@Type", SqlDbType.Int, 4).Value = Type;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ID", SqlDbType.Int, 4).Value = ID;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Apply_RoleMemberToSubsAsync(int Type, int ModuleID, int GroupID, int CatID, string CreateBy, int CreatorID)
        {
            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Apply_Role_Members]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@Type", SqlDbType.Int, 4).Value = Type;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                cmd.Parameters.Add("@CreateBy", SqlDbType.NVarChar, 255).Value = CreateBy;
                cmd.Parameters.Add("@CreatorID", SqlDbType.Int, 4).Value = CreatorID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        #endregion

        #region Event Dates Tab

        public static async Task<DataTable> Get_EventDatesAsync(int ModuleID, int OrigID, int IDType)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Get_EventDates]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IDType", SqlDbType.Int, 4).Value = IDType;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }

            return dt;
        }

        public static async Task<DataTable> Get_EventDateListAsync(int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("SELECT [CatID], [CatCaption] FROM [dbo].[CatDateSet] WHERE [ModuleID] = @ModuleID AND [CatClass] = 1 ORDER BY [CatCaption]", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }

            return dt;
        }

        public static async Task<DataTable> Get_EventDateDetailsAsync(int ModuleID, int OrigID, int CatID, int IDType)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [CatID] = @CatID AND [IDType] = @IDType", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                cmd.Parameters.Add("@IDType", SqlDbType.Int, 4).Value = IDType;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }

            return dt;
        }

        public async static Task Save_EventDateAsync(int ModuleID, int IsGroup, int OrigID, int CatID, int SetType, int DateType, int Repeat, int IntervalNum,
            int IntervalType, DateTime DateValue, int TriggerNum, int TriggerType, DateTime? TriggerDate, int TriggerBeforeAfter)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Apply_EventDate]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                cmd.Parameters.Add("@SetType", SqlDbType.Int, 4).Value = SetType;
                cmd.Parameters.Add("@DateType", SqlDbType.Int, 4).Value = DateType;
                cmd.Parameters.Add("@Repeat", SqlDbType.Int, 4).Value = Repeat;
                cmd.Parameters.Add("@IntervalNum", SqlDbType.Int, 4).Value = IntervalNum;
                cmd.Parameters.Add("@IntervalType", SqlDbType.Int, 4).Value = IntervalType;
                cmd.Parameters.Add("@DateValue", SqlDbType.DateTime, 8).Value = DateValue;
                cmd.Parameters.Add("@TriggerNum", SqlDbType.Int, 4).Value = TriggerNum;
                cmd.Parameters.Add("@TriggerType", SqlDbType.Int, 4).Value = TriggerType;
                cmd.Parameters.Add("@TriggerDate", SqlDbType.DateTime, 8).Value = TriggerDate;
                cmd.Parameters.Add("@TriggerBeforeAfter", SqlDbType.Int, 4).Value = TriggerBeforeAfter;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Save_EventDateToSubItemsAsync(int ModuleID, int GroupID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Apply_EventDate_To_SubItems]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Save_EventDateToSubFoldersAsync(int ModuleID, int GroupID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Apply_EventDate_To_SubFolders]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        #endregion

        #region Categories Tab

        public static async Task<DataTable> Get_ItemCategoriesAsync(int ModuleID, int OrigID, int IsGroup)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Get_ItemCategories]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }

            return dt;
        }

        public static void Update_Category(int ModuleID, int OrigID, int CatID, int IsGroup, bool IsChecked)
        {
            int IDType = 1;
            if (IsGroup == 1)
            {
                IDType = 0;
            }
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Update_Category]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                cmd.Parameters.Add("@IDType", SqlDbType.Int, 4).Value = IDType;
                cmd.Parameters.Add("@IsChecked", SqlDbType.Bit, 2).Value = IsChecked;
                cmd.ExecuteNonQuery();
            }
        }

        public static async Task Save_CategoriesToSubItemsAsync(int ModuleID, int GroupID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Apply_Categories_To_SubItems]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Save_CategoriesToSubFoldersAsync(int ModuleID, int GroupID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Apply_Categories_To_SubFolders]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        #endregion

        #region History Tab

        public static async Task<string> Get_HistoryAsync(int OrigID, int ModuleID, int IsGroup)
        {
            string ItemHistory = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Properties_Get_History", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    ItemHistory = sdr["MemoData"].ToString();
                }
            }
            return ItemHistory;
        }

        public static async Task Update_HistoryAsync(int ModuleID, int OrigID, int IsGroup, string UserName, int TransType)
        {
            // TransType 0 = Event Date, TransType 1 = Category

            int Type = 0;
            if (IsGroup == 0)
            {
                Type = 1;
            }
            string Details = "Following properties has been changed by: " + UserName + " (" + DateTime.Now.ToString() + ")\n" +
                "1. Event Date has been changed.\n\n" +
                "****************************************************************";
            if (TransType == 1)
            {
                Details = "Following properties has been changed by: " + UserName + " (" + DateTime.Now.ToString() + ")\n" +
                    "1. Categories have been changed.\n\n" +
                    "****************************************************************";
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Update_History]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@Type", SqlDbType.Int, 4).Value = Type;
                cmd.Parameters.Add("@HistoryMemo", SqlDbType.NVarChar, -1).Value = Details;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Add_HistoryMemoAsync(int ModuleID, int OrigID, int Type, string UserName, string HistoryMemo)
        {
            string Details = "User Name: " + UserName + "\n" + 
                "Time: " + DateTime.Now.ToString() + ")\n" +
                "Action: [P3Web] - " + HistoryMemo + "\n\n" +
                "****************************************************************\n";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Properties_Add_History]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@Type", SqlDbType.Int, 4).Value = Type;
                cmd.Parameters.Add("@HistoryMemo", SqlDbType.NVarChar, -1).Value = Details;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        #endregion

        #region Training Tab

        public static async Task<DataTable> Get_TrainingForItemAsync(int ItemID, int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Properties_Get_Training", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        #endregion
    }
}