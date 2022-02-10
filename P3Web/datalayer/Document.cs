using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Collections;
using System.Web.Security;
using System.Threading.Tasks;

namespace Paradigm3.datalayer
{
    public class Document
    {

        #region Get Data

        public static DataTable Get_Document(int ItemID, int OptionID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Get_Document", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@OptionID", SqlDbType.Int, 4).Value = OptionID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> Get_DocumentAllVersionsAsync(int OrigID, int UserID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Get_Items", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> Get_DocumentAsync(int ItemID, bool IsItemID, int ItemStatus)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Get_Document", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@IsItemID", SqlDbType.Bit, 2).Value = IsItemID;
                cmd.Parameters.Add("@Status", SqlDbType.Int, 4).Value = ItemStatus;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_EditVersion(int OrigID, int Status)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Items3 WHERE OrigID = @OrigID AND Status = " + Status.ToString() + " AND IsDeleted = 0 AND IsWithdrawn = 0", conn)
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

        public static DataTable Get_Latest(int OrigID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Get_Latest", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_ParentGroupDetails(int GroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Groups3 WHERE GroupID = @GroupID", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static string Get_GroupOptionSet(int GroupID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                string OptionSet = string.Empty;
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT OptionSet FROM Groups3 WHERE GroupID = @GroupID", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    OptionSet = sdr["OptionSet"].ToString();
                }

                return OptionSet;
            }
        }

        public static async Task<string> Get_DocumentExtensionAsync(int OrigID)
        {
            string result = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 [FileExtension] FROM [dbo].[Items3] WHERE [OrigID] = @OrigID ORDER BY [ItemID] DESC", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = sdr["FileExtension"].ToString();
                }
            }
            return result;
        }

        public static async Task<int> Get_DocumentPublishTypeAsync(int OrigID)
        {
            int result = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 [TypeOfPublish] FROM [dbo].[Items3] WHERE [OrigID] = @OrigID ORDER BY [ItemID] DESC", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = Convert.ToInt32(sdr["TypeOfPublish"]);
                }
            }
            return result;
        }

        #endregion

        #region History

        public static async Task Edit_Document_HistoryAsync(int ModuleID, int OrigID, string ItemName, string LabelName, string TaskName, string UserName, string HistoryDetails)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }

                SqlDataAdapter da = new SqlDataAdapter()
                {
                    SelectCommand = new SqlCommand("dbo.v4_Default_Get_HistoryMemo", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    }
                };
                da.SelectCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                da.SelectCommand.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                da.UpdateCommand = new SqlCommand("dbo.v4_Default_Update_HistoryMemo", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                da.UpdateCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                da.UpdateCommand.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                da.UpdateCommand.Parameters.Add("@HistoryMemo", SqlDbType.NVarChar, -1, "MemoData");
                da.InsertCommand = new SqlCommand("dbo.v4_Default_Insert_HistoryMemo", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                da.InsertCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4, "ModuleID");
                da.InsertCommand.Parameters.Add("@OrigID", SqlDbType.Int, 4, "OrigID");
                da.InsertCommand.Parameters.Add("@Type", SqlDbType.Int, 4, "Type");
                da.InsertCommand.Parameters.Add("@DataType", SqlDbType.TinyInt, 2, "DataType");
                da.InsertCommand.Parameters.Add("@HistoryMemo", SqlDbType.NVarChar, -1, "MemoData");
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    DataRow dr = dt.Rows[0];
                    dr["MemoData"] = "Item Label: " + LabelName + "\r\n" +
                        "User Name: " + UserName + "\r\n" +
                        "Time: " + DateTime.Now.ToString() + "\r\n" +
                        "Action: " + TaskName + " [" + ItemName + "] \r\n" +
                        HistoryDetails + "\r\n\r\n" +
                        "****************************************************************" + "\r\n" +
                        dt.Rows[0]["MemoData"].ToString();
                    da.Update(dt);
                }
                else
                {
                    DataRow dr = dt.NewRow();
                    dr["OrigID"] = OrigID;
                    dr["Type"] = 1;
                    dr["ModuleID"] = ModuleID;
                    dr["DataType"] = 0;
                    dr["MemoData"] = "Item Label: " + LabelName + "\r\n" +
                        "User Name: " + UserName + "\r\n" +
                        "Time: " + DateTime.Now.ToString() + "\r\n" +
                        "Action: " + TaskName + " [" + ItemName + "] \r\n" +
                        HistoryDetails + "\r\n\r\n";
                    dt.Rows.Add(dr);
                    da.Update(dt);
                }
            }
        }

        #endregion

        #region Events

        public static DataTable Get_EventAssigned(int OrigID)
        {
            DataTable dt = new DataTable();
            string strResp = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Get_EventAssigned", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_RoleMember(int CatID, int OrigID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Get_RoleMember", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_PTtitleMember(int OrigID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Get_PTitleMember", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Has_Trigger_Event(int EventIndexID, int RelatedID, int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Document_Get_Event", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@EventIndexID", SqlDbType.Int, 4).Value = EventIndexID;
                cmd.Parameters.Add("@RelatedID", SqlDbType.Int, 4).Value = RelatedID;
                cmd.Parameters.Add("@RelatedModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static void Trigger_Event(int EventID, string EventTitle, int ModuleID, int ItemID, int ParentGroupID, string ItemName, string LabelName, string Details, string HistoryDetails, int RecipientID, string RecipientName, int StatusFrom, int StatusTo)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                int UserID = -1;
                string UserFullName = string.Empty;
                if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                    string UserData = ticket.UserData;
                    string[] UserValues = UserData.Split(',');
                    UserID = Convert.ToInt32(UserValues[0]);
                    UserFullName = UserValues[1];
                }

                string OldStatus = string.Empty;
                string NewStatus = string.Empty;
                switch (StatusFrom)
                {
                    case 0:
                        OldStatus = "OBSOLETE";
                        break;
                    case 2:
                        OldStatus = "DRAFT";
                        break;
                    case 3:
                        OldStatus = "COLLABORATE";
                        break;
                    case 5:
                        OldStatus = "REVIEW";
                        break;
                    case 6:
                        OldStatus = "READY";
                        break;
                    case 7:
                        OldStatus = "PENDING";
                        break;
                    case 9:
                        OldStatus = "CURRENT";
                        break;
                }
                switch (StatusTo)
                {
                    case 0:
                        NewStatus = "OBSOLETE";
                        break;
                    case 2:
                        NewStatus = "DRAFT";
                        break;
                    case 3:
                        NewStatus = "COLLABORATE";
                        break;
                    case 5:
                        NewStatus = "REVIEW";
                        break;
                    case 6:
                        NewStatus = "READY";
                        break;
                    case 7:
                        NewStatus = "PENDING";
                        break;
                    case 9:
                        NewStatus = "CURRENT";
                        break;
                }

                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dbo.Items14 WHERE AIID = -1", conn)
                {
                    InsertCommand = new SqlCommand("dbo.v4_Default_Trigger_Event", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    }
                };
                da.InsertCommand.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4, "ParentGroupID");
                da.InsertCommand.Parameters.Add("@AIType", SqlDbType.Int, 4, "AIType");
                da.InsertCommand.Parameters.Add("@ParentID", SqlDbType.Int, 4, "ParentID");
                da.InsertCommand.Parameters.Add("@Name", SqlDbType.NVarChar, 255, "Name");
                da.InsertCommand.Parameters.Add("@Details", SqlDbType.NVarChar, 4000, "Details");
                da.InsertCommand.Parameters.Add("@Status", SqlDbType.Int, 4, "Status");
                da.InsertCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4, "ModuleID");
                da.InsertCommand.Parameters.Add("@EventID", SqlDbType.Int, 4, "EventID");
                da.InsertCommand.Parameters.Add("@UserID", SqlDbType.Int, 4, "UserID");
                da.InsertCommand.Parameters.Add("@UserName", SqlDbType.NVarChar, 255, "UserName");
                da.InsertCommand.Parameters.Add("@SenderName", SqlDbType.NVarChar, 255, "SenderName");
                da.InsertCommand.Parameters.Add("@SenderID", SqlDbType.Int, 4, "SenderID");
                da.InsertCommand.Parameters.Add("@SendDate", SqlDbType.DateTime, 8, "SendDate");
                da.InsertCommand.Parameters.Add("@DateDue", SqlDbType.DateTime, 8, "DateDue");
                da.InsertCommand.Parameters.Add("@Priority", SqlDbType.Int, 4, "Priority");
                da.InsertCommand.Parameters.Add("@CompleteDate", SqlDbType.DateTime, 8, "CompleteDate");
                da.InsertCommand.Parameters.Add("@ResultID", SqlDbType.Int, 4, "ResultID");
                da.InsertCommand.Parameters.Add("@ResultName", SqlDbType.NVarChar, 255, "ResultName");
                da.InsertCommand.Parameters.Add("@Comments", SqlDbType.NText, 16, "Comments");
                da.InsertCommand.Parameters.Add("@ShowMeEnabled", SqlDbType.Bit, 1, "ShowMeEnabled");
                da.InsertCommand.Parameters.Add("@ShowGroupID", SqlDbType.Int, 4, "ShowGroupID");
                da.InsertCommand.Parameters.Add("@ShowID", SqlDbType.Int, 4, "ShowID");
                da.InsertCommand.Parameters.Add("@ShowIsItemID", SqlDbType.Bit, 1, "ShowIsItemID");
                da.InsertCommand.Parameters.Add("@ShowType", SqlDbType.Int, 4, "ShowType");
                da.InsertCommand.Parameters.Add("@ShowModuleID", SqlDbType.Int, 4, "ShowModuleID");
                da.InsertCommand.Parameters.Add("@ShowAction", SqlDbType.Int, 4, "ShowAction");
                da.InsertCommand.Parameters.Add("@DateSet", SqlDbType.DateTime, 8, "DateSet");
                da.InsertCommand.Parameters.Add("@IsRegReminder", SqlDbType.Bit, 1, "IsRegReminder");
                da.InsertCommand.Parameters.Add("@RegReminderDay", SqlDbType.Int, 4, "RegReminderDay");
                da.InsertCommand.Parameters.Add("@RegReminderDate", SqlDbType.DateTime, 8, "RegReminderDate");
                da.InsertCommand.Parameters.Add("@IsFinalReminder", SqlDbType.Bit, 1, "IsFinalReminder");
                da.InsertCommand.Parameters.Add("@FinalReminderDate", SqlDbType.DateTime, 8, "FinalReminderDate");
                da.InsertCommand.Parameters.Add("@NotifyOverDueDate", SqlDbType.DateTime, 8, "NotifyOverDueDate");
                da.InsertCommand.Parameters.Add("@NotifyOverDueEventID", SqlDbType.Int, 4, "NotifyOverDueEventID");
                da.InsertCommand.Parameters.Add("@NotifyCompletedEventID", SqlDbType.Int, 4, "NotifyCompletedEventID");
                da.InsertCommand.Parameters.Add("@Archive", SqlDbType.Bit, 1, "Archive");
                da.InsertCommand.Parameters.Add("@UrgentEmail", SqlDbType.Int, 4, "UrgentEmail");
                da.InsertCommand.Parameters.Add("@SendEmailCmpltAI", SqlDbType.Int, 4, "SendEmailCmpltAI");
                da.InsertCommand.Parameters.Add("@NextStartDate", SqlDbType.DateTime, 8, "NextStartDate");
                da.InsertCommand.Parameters.Add("@SchedRepeat", SqlDbType.Int, 4, "SchedRepeat");
                da.InsertCommand.Parameters.Add("@SchedIntervalType", SqlDbType.Int, 4, "SchedIntervalType");
                da.InsertCommand.Parameters.Add("@SchedRepeatNumber", SqlDbType.Int, 4, "SchedRepeatNumber");
                da.InsertCommand.Parameters.Add("@SchedUntilDate", SqlDbType.DateTime, 8, "SchedUntilDate");
                da.InsertCommand.Parameters.Add("@SchedStatus", SqlDbType.SmallInt, 2, "SchedStatus");
                da.InsertCommand.Parameters.Add("@IsDeleted", SqlDbType.Bit, 1, "IsDeleted");
                da.InsertCommand.Parameters.Add("@OptionSet", SqlDbType.NVarChar, 255, "OptionSet");
                da.InsertCommand.Parameters.Add("@NotifiedStatus", SqlDbType.SmallInt, 2, "NotifiedStatus");
                da.InsertCommand.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 255, "ModifiedBy");
                da.InsertCommand.Parameters.Add("@LastModified", SqlDbType.DateTime, 8, "LastModified");
                da.InsertCommand.Parameters.Add("@ModifierID", SqlDbType.Int, 4, "ModifierID");
                DataSet ds = new DataSet();
                da.Fill(ds, "Items14");
                DataRow dr = ds.Tables["Items14"].NewRow();
                dr["ParentGroupID"] = 2;
                dr["AIType"] = 0;
                dr["ParentID"] = DBNull.Value;
                dr["Name"] = EventTitle + " - " + ItemName;
                dr["Details"] = Details + "\r\n" +
                    "--------------------------------------- \r\n" +
                    "Item Label: " + LabelName + " \r\n" +
                    "User Name: " + UserFullName + " \r\n" +
                    "Time: " + DateTime.Now.ToString() + " \r\n" +
                    "Action: Converted from " + OldStatus + " to " + NewStatus + "\r\n" +
                    HistoryDetails;
                dr["Status"] = 2;
                dr["ModuleID"] = DBNull.Value;
                dr["EventID"] = EventID;
                dr["UserID"] = RecipientID;
                dr["UserName"] = RecipientName;
                dr["SenderName"] = UserFullName;
                dr["SenderID"] = UserID;
                dr["SendDate"] = DateTime.Now;
                dr["DateDue"] = DateTime.Today.AddDays(7);
                dr["Priority"] = 1;
                dr["CompleteDate"] = DBNull.Value;
                dr["ResultID"] = DBNull.Value;
                dr["ResultName"] = DBNull.Value;
                dr["Comments"] = DBNull.Value;
                dr["ShowMeEnabled"] = 1;
                dr["ShowGroupID"] = ParentGroupID;
                dr["ShowID"] = ItemID;
                dr["ShowIsItemID"] = 1;
                dr["ShowType"] = 1;
                dr["ShowModuleID"] = ModuleID;
                dr["ShowAction"] = 0;
                dr["DateSet"] = DBNull.Value;
                dr["IsRegReminder"] = 0;
                dr["RegReminderDay"] = DBNull.Value;
                dr["RegReminderDate"] = DBNull.Value;
                dr["IsFinalReminder"] = 0;
                dr["FinalReminderDate"] = DBNull.Value;
                dr["NotifyOverDueDate"] = DBNull.Value;
                dr["NotifyOverdueEventID"] = DBNull.Value;
                dr["NotifyCompletedEventID"] = DBNull.Value;
                dr["Archive"] = 0;
                dr["UrgentEmail"] = DBNull.Value;
                dr["SendEMailCmpltAI"] = DBNull.Value;
                dr["NextStartDate"] = DBNull.Value;
                dr["SchedRepeat"] = DBNull.Value;
                dr["SchedIntervalType"] = DBNull.Value;
                dr["SchedRepeatNumber"] = DBNull.Value;
                dr["SchedUntilDate"] = DBNull.Value;
                dr["SchedStatus"] = DBNull.Value;
                dr["IsDeleted"] = 0;
                dr["OptionSet"] = DBNull.Value;
                dr["NotifiedStatus"] = 1;
                dr["ModifiedBy"] = DBNull.Value;
                dr["LastModified"] = DBNull.Value;
                dr["ModifierID"] = DBNull.Value;
                // Add datarow to datatable
                ds.Tables["Items14"].Rows.Add(dr);
                // Update database table
                da.Update(ds, "Items14");
            }
        }

        #endregion

        #region Add

        public static async Task<int> Add_DocumentAsync(int TemplateID, int GroupID, string FileName, string FileExtension, int Status, bool IsEvidence, string LabelName, int UserID, string UserFullName)
        {
            int ItemID = 0;
            object ReturnID;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Create_Document2", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = FileName;
                cmd.Parameters.Add("@FileExtension", SqlDbType.NVarChar, 10).Value = FileExtension;
                cmd.Parameters.Add("@Status", SqlDbType.Int, 4).Value = Status;
                cmd.Parameters.Add("@IsEvidence", SqlDbType.Bit, 2).Value = IsEvidence;
                cmd.Parameters.Add("@LabelName", SqlDbType.NVarChar, 255).Value = LabelName;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@UserFullName", SqlDbType.NVarChar, 255).Value = UserFullName;
                ItemID = await Task.FromResult((int)cmd.ExecuteScalar());
                ReturnID = await cmd.ExecuteScalarAsync();
            }
            if (ReturnID != null)
            {
                ItemID = Convert.ToInt32(ReturnID);
            }
            return ItemID;
        }

        public static async Task Add_RolesToNewDocumentAsync(int GroupID, int OrigID, string UserName, int UserID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Document_Add_Roles_To_New_Document]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@UserFullName", SqlDbType.NVarChar, 255).Value = UserName;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static void Add_CreateFile(int ItemID, string TemplateItemIDFileName, string FileExtension)
        {
            string DocPath = ConfigurationManager.AppSettings["DocumentPath"];
            string TemplatePath = DocPath + TemplateItemIDFileName + "." + FileExtension;

            string NewFileName = ItemID.ToString().PadLeft(7, '0');
            NewFileName = NewFileName.PadLeft(8, 'D');
            NewFileName = NewFileName + "." + FileExtension;
            NewFileName = DocPath + NewFileName;

            File.Copy(TemplatePath, NewFileName);
        }

        public static async Task Add_EventDatesAsync(int ItemID, int GroupID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Document_Add_Event_Dates]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        #endregion

        #region Update

        public static async Task Update_CheckOutStatusAsync(int ItemID, string UserFullName, int CheckStatus)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Update_CheckInOut", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@UserFullName", SqlDbType.NVarChar, 255).Value = UserFullName;
                cmd.Parameters.Add("@CheckStatus", SqlDbType.Bit, 2).Value = CheckStatus;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static void Cancel_Checkout(int ItemID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Document_Cancel_Checkout", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.ExecuteNonQuery();
            }
        }

        public static void Remove_DraftRow(int ItemID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[Items3] WHERE ItemID = @ItemID", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.ExecuteNonQuery();
            }
        }

        public static async Task Remove_DocRowAsync(int ItemID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[Items3] WHERE ItemID = @ItemID", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                await Task.FromResult(cmd.ExecuteNonQuery());
            }
        }

        public static async Task Update_DocumentHistoryMemo(int ModuleID, int OrigID, int Type, string HistoryMemo)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("v4_Properties_Update_History", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@Type", SqlDbType.Int, 2).Value = Type;
                cmd.Parameters.Add("@HistoryMemo", SqlDbType.NVarChar, 500).Value = HistoryMemo;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        #endregion

    }
}