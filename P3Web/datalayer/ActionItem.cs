using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Collections;
using System.Threading.Tasks;

namespace Paradigm3.datalayer
{
    public class ActionItem
    {

        #region Get Action Item Data

        public static DataTable Get_ActionItem(int AIID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                try
                {
                    conn.Open();
                }
                catch (InvalidOperationException ioe)
                {
                    throw ioe;
                }

                DataTable dt = new DataTable();

                try
                {
                    SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_Get_ActionItem", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@AIID", SqlDbType.Int, 4).Value = AIID;
                    SqlDataReader myReader = cmd.ExecuteReader();
                    dt.Load(myReader);
                    return dt;
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }

        }

        public static async Task<DataTable> Get_ActionItemAsync(int aiid)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_Get_ActionItem", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@AIID", SqlDbType.Int, 4).Value = aiid;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_AttachedRecord(int ItemID, int ModuleID, bool ShowIsItemID, string OptionSet)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                conn.Open();
                DataTable dt = new DataTable();

                try
                {
                    SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_Get_Record", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                    cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                    cmd.Parameters.Add("@ShowIsItemID", SqlDbType.Bit, 2).Value = ShowIsItemID;
                    cmd.Parameters.Add("@OptionSet", SqlDbType.NVarChar, 50).Value = OptionSet;
                    SqlDataReader myReader = cmd.ExecuteReader();
                    dt.Load(myReader);
                    return dt;
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static DataTable Get_Results(int EventID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                conn.Open();
                DataTable dt = new DataTable();

                try
                {
                    SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_Get_Results", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@EventID", SqlDbType.Int, 4).Value = EventID;
                    SqlDataReader myReader = cmd.ExecuteReader();
                    dt.Load(myReader);
                    return dt;
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static void Set_NotifiedStatusRead(int AIID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                conn.Open();

                try
                {
                    SqlCommand cmd = new SqlCommand("UPDATE [dbo].[Items14] SET [NotifiedStatus] = 0 WHERE [AIID] = @AIID", conn)
                    {
                        CommandType = CommandType.Text,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@AIID", SqlDbType.Int, 4).Value = AIID;
                    cmd.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static async Task<string> Get_ShowMeFileExtensionAndPublishTypeAsync(int ShowID, bool ShowIsItemID)
        {
            string result = string.Empty;
            string sql = "SELECT TOP 1 [ItemID],[OrigID],[FileExtension],[TypeOfPublish],[Status] FROM[dbo].[Items3] WHERE [OrigID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 ORDER BY [ItemID] DESC";
            if (ShowIsItemID)
            {
                sql = "SELECT [ItemID],[OrigID],[FileExtension],[TypeOfPublish],[Status] FROM[dbo].[Items3] WHERE [ItemID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0";
            }
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand(sql, conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120

                };
                cmd.Parameters.Add("@ShowID", SqlDbType.Int, 4).Value = ShowID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = sdr["ItemID"].ToString() + "," + sdr["OrigID"].ToString() + "," + sdr["FileExtension"].ToString() + "," + sdr["TypeOfPublish"].ToString() + "," + sdr["Status"].ToString();
                }
            }
            return result;
        }

        public static async Task<DataTable> Get_OtherUsersAIAsync(int ControlID, int ControlType)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_RelatedActionItem_Get_OtherUsers]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = ControlID;
                cmd.Parameters.Add("@ControlType", SqlDbType.Int, 4).Value = ControlType;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<bool> Get_PasswordComepleteStatus(int EventID)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("SELECT [IsPWConfirm] FROM [dbo].[AIEventSet] WHERE [EventID] = @EventID", conn);
                cmd.Parameters.Add("@EventID", SqlDbType.Int, 4).Value = EventID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = Convert.ToBoolean(sdr["IsPWConfirm"]);
                }
            }
            return result;
        }

        #endregion

        #region Complete Action Item Events

        public static void AI_Complete(int AIID, int ResultID, string ResultText, string Comments, string UserFullName, int UserID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                conn.Open();

                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("dbo.v4_ActionItem_Get_ActionItem", conn);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@AIID", SqlDbType.Int, 4).Value = AIID;
                    da.UpdateCommand = new SqlCommand("dbo.v4_ActionItem_Complete", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    da.UpdateCommand.Parameters.Add("@AIID", SqlDbType.Int, 4).Value = AIID;
                    da.UpdateCommand.Parameters.Add("@Details", SqlDbType.NVarChar, -1, "Details");
                    da.UpdateCommand.Parameters.Add("@CompleteDate", SqlDbType.DateTime, 8, "CompleteDate");
                    da.UpdateCommand.Parameters.Add("@Comments", SqlDbType.NVarChar, -1, "Comments");
                    da.UpdateCommand.Parameters.Add("@ResultID", SqlDbType.Int, 4, "ResultID");
                    da.UpdateCommand.Parameters.Add("@ResultName", SqlDbType.NVarChar, 255, "ResultName");
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    DataRow dr = dt.Rows[0];
                    int ModuleID = Convert.ToInt32(dr["ShowModuleID"]);
                    dr["CompleteDate"] = DateTime.Now;
                    dr["Comments"] = Comments;
                    if (ResultID > 0)
                    {
                        dr["ResultID"] = ResultID.ToString();
                        dr["ResultName"] = ResultText;
                        dr["Details"] = UserFullName + " (" + DateTime.Now.ToString("G") + ")" + "\r\n" +
                            "Result: " + ResultText + "\r\n" +
                            "Comments: " + Comments + "\r\n" +
                            "----------------------------------------------------------" + "\r\n\r\n" +
                            dt.Rows[0]["Details"].ToString();

                        DataTable HasTrigger = Has_TriggerEvent(ResultID);
                        if (HasTrigger.Rows.Count > 0)
                        {
                            Trigger_Event(AIID, ModuleID, ResultID, UserFullName, UserID, ResultText, Comments);
                        }
                    }
                    else
                    {
                        dr["ResultID"] = DBNull.Value;
                        dr["ResultName"] = DBNull.Value;
                        dr["Details"] = UserFullName + " (" + DateTime.Now.ToString("G") + ") \r\n" +
                            "Comments: " + Comments + "\r\n" +
                            "----------------------------------------------------------" + "\r\n\r\n" +
                            dt.Rows[0]["Details"].ToString();
                        int EventID = Convert.ToInt32(dt.Rows[0]["EventID"]);
                        if (EventID > 0)
                        {
                            DataTable HasTrigger = Has_TriggerEvent(EventID);
                            if (HasTrigger.Rows.Count > 0)
                            {
                                Trigger_Event(AIID, ModuleID, EventID, UserFullName, UserID, ResultText, Comments);
                            }
                        }
                    }
                    da.Update(dt);
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static DataTable Has_TriggerEvent(int EventID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                conn.Open();

                try
                {
                    DataTable TriggerEvent = new DataTable();
                    SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_HasTriggerEvent", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@EventID", SqlDbType.Int, 4).Value = EventID;
                    SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    TriggerEvent.Load(myReader);
                    return TriggerEvent;
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static DataTable Get_AllAssigned(int ModuleID, int RelatedID, int EventID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                conn.Open();
                DataTable dtUsers = new DataTable();

                try
                {
                    // Get All Objects from Event
                    SqlCommand cmdAll = new SqlCommand("dbo.v4_ActionItem_AllAssigned", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmdAll.Parameters.Add("@EventID", SqlDbType.Int, 4).Value = EventID;
                    cmdAll.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                    DataTable dtAll = new DataTable();
                    SqlDataReader drAll = cmdAll.ExecuteReader();
                    dtAll.Load(drAll);
                    dtUsers = dtAll.Clone();
                    foreach (DataRow dr in dtAll.Rows)
                    {
                        switch (Convert.ToInt32(dr["ControlType"]))
                        {
                            case 1:
                                //User
                                dtUsers.ImportRow(dr);
                                break;
                            case 5:
                                //Role
                                DataTable dtRoles = new DataTable();
                                SqlCommand cmdRoles = new SqlCommand("dbo.v4_ActionItem_RoleAssigned", conn);
                                cmdRoles.CommandType = CommandType.StoredProcedure;
                                cmdRoles.Parameters.Add("@RelatedID", SqlDbType.Int, 4).Value = RelatedID;
                                cmdRoles.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = Convert.ToInt32(dr["ControlID"]);
                                SqlDataReader drRoles = cmdRoles.ExecuteReader();
                                dtRoles.Load(drRoles);
                                foreach (DataRow RoleRow in dtRoles.Rows)
                                {
                                    switch (Convert.ToInt32(RoleRow["ControlType"]))
                                    {
                                        case 1:
                                            // User
                                            dtUsers.ImportRow(RoleRow);
                                            break;
                                        case 6:
                                            //Position Title
                                            DataTable dtRoleTemp = new DataTable();
                                            SqlCommand cmdRoleTemp = new SqlCommand("dbo.v4_ActionItem_PositionAssigned", conn);
                                            cmdRoleTemp.CommandType = CommandType.StoredProcedure;
                                            cmdRoleTemp.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = Convert.ToInt32(RoleRow["ControlID"]);
                                            SqlDataReader drRoleTemp = cmdRoleTemp.ExecuteReader();
                                            dtRoleTemp.Load(drRoleTemp);
                                            dtUsers.Merge(dtRoleTemp);
                                            break;
                                    }
                                }

                                dtRoles.Dispose();
                                break;
                            case 6:
                                //Position Title
                                DataTable dtPosition = new DataTable();
                                SqlCommand cmdPosition = new SqlCommand("dbo.v4_ActionItem_PositionAssigned", conn);
                                cmdPosition.CommandType = CommandType.StoredProcedure;
                                cmdPosition.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = Convert.ToInt32(dr["ControlID"]);
                                SqlDataReader drPosition = cmdPosition.ExecuteReader();
                                dtPosition.Load(drPosition);
                                dtUsers.Merge(dtPosition);
                                break;
                        }
                    }
                    DataTable dtAllAssigned = RemoveDuplicateRows(dtUsers, "ControlID");
                    return dtAllAssigned;
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static DataTable RemoveDuplicateRows(DataTable dTable, string colName)
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

        #endregion

        #region Trigger Events

        public static void Trigger_Event(int AIID, int ModuleID, int ResultID, string UserFullName, int UserID, string ResultText, string Comments)
        {
            DataTable AIDetails = Get_ActionItem(AIID);
            DataTable TEDetails = Has_TriggerEvent(ResultID);

            // Create a new Action Item for every recipient specified in the
            // "Get_TriggerEventAssignTo" function and send them.
            int EventID = Convert.ToInt32(TEDetails.Rows[0]["EventID"]);
            int RelatedID = 0;
            string OptionSet = P3General.Get_GroupOptionSet(ModuleID, Convert.ToInt32(AIDetails.Rows[0]["ShowGroupID"]));
            if (OptionSet.Length > 1)
            {
                OptionSet = OptionSet.Substring(6, 3);
            }
            bool ShowIsItemID = Convert.ToBoolean(AIDetails.Rows[0]["ShowIsItemID"]);
            if (ShowIsItemID == true)
            {
                int ItemID = Convert.ToInt32(AIDetails.Rows[0]["ShowID"]);
                RelatedID = Convert.ToInt32(Get_AttachedRecord(ItemID, ModuleID, ShowIsItemID, OptionSet).Rows[0]["OrigID"]);
            }
            else
            {
                RelatedID = Convert.ToInt32(AIDetails.Rows[0]["ShowID"]);
            }
            string RelatedItemName = string.Empty;
            if (Get_AttachedRecord(RelatedID, ModuleID, ShowIsItemID, OptionSet).Rows.Count > 0)
            {
                RelatedItemName = Get_AttachedRecord(RelatedID, ModuleID, ShowIsItemID, OptionSet).Rows[0]["Name"].ToString();
            }
            DataTable AssignedUsers = Get_AllAssigned(ModuleID, RelatedID, EventID);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dbo.Items14 WHERE AIID = -1", conn);
                    da.InsertCommand = new SqlCommand("dbo.v4_ActionItem_TriggerEvent", conn);
                    da.InsertCommand.CommandType = CommandType.StoredProcedure;
                    da.InsertCommand.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4, "ParentGroupID");
                    da.InsertCommand.Parameters.Add("@AIType", SqlDbType.Int, 4, "AIType");
                    da.InsertCommand.Parameters.Add("@ParentID", SqlDbType.Int, 4, "ParentID");
                    da.InsertCommand.Parameters.Add("@Name", SqlDbType.NVarChar, 255, "Name");
                    da.InsertCommand.Parameters.Add("@Details", SqlDbType.NVarChar, -1, "Details");
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
                    da.InsertCommand.Parameters.Add("@Comments", SqlDbType.NVarChar, -1, "Comments");
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
                    // Create new dataset with datatable "Items14" and create new empty row in Items14 for data.
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Items14");
                    int Max = (AssignedUsers.Rows.Count - 1);
                    int i = 0;
                    for (i = 0; i <= Max; i++)
                    {
                        DataRow dr = ds.Tables["Items14"].NewRow();
                        dr["ParentGroupID"] = 2;
                        dr["AIType"] = 0;
                        dr["ParentID"] = DBNull.Value;
                        if (RelatedID > 0)
                        {
                            dr["Name"] = TEDetails.Rows[0]["Name"] + " - " + RelatedItemName;
                        }
                        else
                        {
                            dr["Name"] = TEDetails.Rows[0]["Name"];
                        }
                        dr["Details"] = TEDetails.Rows[0]["Details"] + "\r\n\r\n" +
                            "----------------------------------------------------------" + "\r\n" +
                            UserFullName + " (" + DateTime.Now.ToString() + ")" + "\r\n" +
                            "Result: " + ResultText + "\r\n" +
                            "Comments: " + Comments + "\r\n\r\n" +
                            "----------------------------------------------------------" + "\r\n" +
                            AIDetails.Rows[0]["Details"].ToString();
                        dr["Status"] = 2;
                        dr["ModuleID"] = DBNull.Value;
                        dr["EventID"] = TEDetails.Rows[0]["EventID"];
                        dr["UserID"] = AssignedUsers.Rows[i]["ControlID"];
                        dr["UserName"] = AssignedUsers.Rows[i]["ControlFullName"];
                        dr["SenderName"] = UserFullName;
                        dr["SenderID"] = UserID;
                        dr["SendDate"] = DateTime.Now;
                        dr["DateDue"] = DateTime.Today.AddDays(Convert.ToInt32(TEDetails.Rows[0]["DaysToComplete"]));
                        dr["Priority"] = TEDetails.Rows[0]["Priority"];
                        dr["CompleteDate"] = DBNull.Value;
                        dr["ResultID"] = DBNull.Value;
                        dr["ResultName"] = DBNull.Value;
                        dr["Comments"] = DBNull.Value;
                        dr["ShowMeEnabled"] = AIDetails.Rows[0]["ShowMeEnabled"];
                        dr["ShowGroupID"] = AIDetails.Rows[0]["ShowGroupID"];
                        dr["ShowID"] = AIDetails.Rows[0]["ShowID"];
                        dr["ShowIsItemID"] = AIDetails.Rows[0]["ShowIsItemID"];
                        dr["ShowType"] = AIDetails.Rows[0]["ShowType"];
                        dr["ShowModuleID"] = ModuleID;
                        dr["ShowAction"] = AIDetails.Rows[0]["ShowAction"];
                        dr["DateSet"] = DBNull.Value;
                        dr["IsRegReminder"] = TEDetails.Rows[0]["IsRegReminder"];
                        dr["RegReminderDay"] = TEDetails.Rows[0]["RegReminderDay"];
                        if (TEDetails.Rows[0]["RegReminderDay"] == DBNull.Value)
                        {
                            dr["RegReminderDate"] = DBNull.Value;
                        }
                        else
                        {
                            dr["RegReminderDate"] = DateTime.Today.AddDays(Convert.ToInt32(TEDetails.Rows[0]["RegReminderDay"]));
                        }
                        dr["IsFinalReminder"] = TEDetails.Rows[0]["IsFinalReminder"];
                        if (TEDetails.Rows[0]["FinalReminderDay"] == DBNull.Value)
                        {
                            dr["FinalReminderDate"] = DBNull.Value;
                        }
                        else
                        {
                            dr["FinalReminderDate"] = DateTime.Today.AddDays(Convert.ToInt32(TEDetails.Rows[0]["FinalReminderDay"]));
                        }
                        dr["NotifyOverDueDate"] = DBNull.Value;
                        dr["NotifyOverdueEventID"] = DBNull.Value;
                        dr["NotifyCompletedEventID"] = DBNull.Value;
                        dr["Archive"] = TEDetails.Rows[0]["Archive"];
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

                        ds.Tables["Items14"].Rows.Add(dr);
                    }
                    da.Update(ds, "Items14");
                    ds.Dispose();
                    da.Dispose();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }



        }

        #endregion

        #region Forward/Reply Action Item Events

        public static DataTable Get_SelListvalues(int ItemID, int FieldID)
        {
            DataTable selListValues = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                try
                {
                    SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_Get_SelListValues", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                    cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                    cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = 6;
                    SqlDataReader myReader = cmd.ExecuteReader();
                    if (myReader.HasRows)
                    {
                        selListValues.Load(myReader);
                        myReader.Close();
                    }
                    cmd.Dispose();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
            return selListValues;
        }

        public static DataTable Get_ListUsers()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                try
                {
                    SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_Fill_Users", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    dt.Load(myReader);
                    DataTable dtAllUsers = RemoveDuplicateRows(dt, "FullName");
                    return dtAllUsers;
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static DataTable Get_UsersFromEntity(int GroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_GetUsersFromEntity", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> Get_AllUsersFromEntity(int ModuleID, int GroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_Get_EntityUser_Members", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static void Forward_ActionItem(int AIID, int ModuleID, int SendToUserID, string SendToUserName, int UserID, string UserFullName, string Comments)
        {
            DataTable dtAI = Get_ActionItem(AIID);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dbo.Items14 WHERE AIID = -1", conn);
                    da.InsertCommand = new SqlCommand("dbo.v4_ActionItem_TriggerEvent", conn);
                    da.InsertCommand.CommandType = CommandType.StoredProcedure;
                    da.InsertCommand.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4, "ParentGroupID");
                    da.InsertCommand.Parameters.Add("@AIType", SqlDbType.Int, 4, "AIType");
                    da.InsertCommand.Parameters.Add("@ParentID", SqlDbType.Int, 4, "ParentID");
                    da.InsertCommand.Parameters.Add("@Name", SqlDbType.NVarChar, 255, "Name");
                    da.InsertCommand.Parameters.Add("@Details", SqlDbType.NVarChar, -1, "Details");
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
                    da.InsertCommand.Parameters.Add("@Comments", SqlDbType.NVarChar, -1, "Comments");
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
                    // Create new dataset with datatable "Items14" and create new empty row in Items14 for data.
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Items14");

                    DataRow dr = ds.Tables["Items14"].NewRow();
                    dr["ParentGroupID"] = 2;
                    dr["AIType"] = 0;
                    dr["ParentID"] = DBNull.Value;
                    dr["Name"] = "FW: " + dtAI.Rows[0]["Name"];
                    dr["Details"] = UserFullName + " (" + DateTime.Now.ToString("G") + "): " + "\r\n" +
                        Comments + "\r\n" +
                        "----------------------------------------------------------" + "\r\n" +
                        dtAI.Rows[0]["Details"];
                    dr["Status"] = 2;
                    dr["ModuleID"] = DBNull.Value;
                    dr["EventID"] = dtAI.Rows[0]["EventID"];
                    dr["UserID"] = SendToUserID;
                    dr["UserName"] = SendToUserName;
                    dr["SenderName"] = UserFullName;
                    dr["SenderID"] = UserID;
                    dr["SendDate"] = DateTime.Now;
                    dr["DateDue"] = DateTime.Today.AddDays(7);
                    dr["Priority"] = dtAI.Rows[0]["Priority"];
                    dr["CompleteDate"] = DBNull.Value;
                    dr["ResultID"] = DBNull.Value;
                    dr["ResultName"] = DBNull.Value;
                    dr["Comments"] = DBNull.Value;
                    dr["ShowMeEnabled"] = dtAI.Rows[0]["ShowMeEnabled"];
                    dr["ShowGroupID"] = dtAI.Rows[0]["ShowGroupID"];
                    dr["ShowID"] = dtAI.Rows[0]["ShowID"];
                    dr["ShowIsItemID"] = dtAI.Rows[0]["ShowIsItemID"];
                    dr["ShowType"] = dtAI.Rows[0]["ShowType"];
                    dr["ShowModuleID"] = ModuleID;
                    dr["ShowAction"] = dtAI.Rows[0]["ShowAction"];
                    dr["DateSet"] = DBNull.Value;
                    dr["IsRegReminder"] = dtAI.Rows[0]["IsRegReminder"];
                    dr["RegReminderDay"] = dtAI.Rows[0]["RegReminderDay"];
                    if (dtAI.Rows[0]["RegReminderDay"] == DBNull.Value)
                    {
                        dr["RegReminderDate"] = DBNull.Value;
                    }
                    else
                    {
                        dr["RegReminderDate"] = DateTime.Today.AddDays(Convert.ToInt32(dtAI.Rows[0]["RegReminderDay"]));
                    }
                    dr["IsFinalReminder"] = dtAI.Rows[0]["IsFinalReminder"];
                    dr["FinalReminderDate"] = dtAI.Rows[0]["FinalReminderDate"];
                    dr["NotifyOverDueDate"] = DBNull.Value;
                    dr["NotifyOverdueEventID"] = DBNull.Value;
                    dr["NotifyCompletedEventID"] = DBNull.Value;
                    dr["Archive"] = dtAI.Rows[0]["Archive"];
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
                    ds.Tables["Items14"].Rows.Add(dr);
                    da.Update(ds, "Items14");
                    ds.Dispose();
                    da.Dispose();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static void Reply_ActionItem(int AIID, int ModuleID, int UserID, string UserFullName, string Comments)
        {
            DataTable dtAI = ActionItem.Get_ActionItem(AIID);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dbo.Items14 WHERE AIID = -1", conn);
                    da.InsertCommand = new SqlCommand("dbo.v4_ActionItem_TriggerEvent", conn);
                    da.InsertCommand.CommandType = CommandType.StoredProcedure;
                    da.InsertCommand.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4, "ParentGroupID");
                    da.InsertCommand.Parameters.Add("@AIType", SqlDbType.Int, 4, "AIType");
                    da.InsertCommand.Parameters.Add("@ParentID", SqlDbType.Int, 4, "ParentID");
                    da.InsertCommand.Parameters.Add("@Name", SqlDbType.NVarChar, 255, "Name");
                    da.InsertCommand.Parameters.Add("@Details", SqlDbType.NVarChar, -1, "Details");
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
                    da.InsertCommand.Parameters.Add("@Comments", SqlDbType.NVarChar, -1, "Comments");
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
                    // Create new dataset with datatable "Items14" and create new empty row in Items14 for data.
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Items14");
                    DataRow dr = ds.Tables["Items14"].NewRow();
                    dr["ParentGroupID"] = 2;
                    dr["AIType"] = 0;
                    dr["ParentID"] = DBNull.Value;
                    dr["Name"] = "RE: " + dtAI.Rows[0]["Name"];
                    dr["Details"] = UserFullName + " (" + DateTime.Now.ToString("G") + "): " + "\r\n" +
                        Comments + "\r\n" +
                        "----------------------------------------------------------" + "\r\n" +
                        dtAI.Rows[0]["Details"];
                    dr["Status"] = 2;
                    dr["ModuleID"] = DBNull.Value;
                    dr["EventID"] = dtAI.Rows[0]["EventID"];
                    dr["UserID"] = dtAI.Rows[0]["SenderID"];
                    dr["UserName"] = dtAI.Rows[0]["SenderName"];
                    dr["SenderName"] = UserFullName;
                    dr["SenderID"] = UserID;
                    dr["SendDate"] = DateTime.Now;
                    dr["DateDue"] = DateTime.Today.AddDays(7);
                    dr["Priority"] = dtAI.Rows[0]["Priority"];
                    dr["CompleteDate"] = DBNull.Value;
                    dr["ResultID"] = DBNull.Value;
                    dr["ResultName"] = DBNull.Value;
                    dr["Comments"] = DBNull.Value;
                    dr["ShowMeEnabled"] = dtAI.Rows[0]["ShowMeEnabled"];
                    dr["ShowGroupID"] = dtAI.Rows[0]["ShowGroupID"];
                    dr["ShowID"] = dtAI.Rows[0]["ShowID"];
                    dr["ShowIsItemID"] = dtAI.Rows[0]["ShowIsItemID"];
                    dr["ShowType"] = dtAI.Rows[0]["ShowType"];
                    dr["ShowModuleID"] = ModuleID;
                    dr["ShowAction"] = dtAI.Rows[0]["ShowAction"];
                    dr["DateSet"] = DBNull.Value;
                    dr["IsRegReminder"] = dtAI.Rows[0]["IsRegReminder"];
                    dr["RegReminderDay"] = dtAI.Rows[0]["RegReminderDay"];
                    dr["RegReminderDate"] = dtAI.Rows[0]["RegReminderDate"];
                    dr["IsFinalReminder"] = dtAI.Rows[0]["IsFinalReminder"];
                    dr["FinalReminderDate"] = dtAI.Rows[0]["FinalReminderDate"];
                    dr["NotifyOverDueDate"] = DBNull.Value;
                    dr["NotifyOverdueEventID"] = DBNull.Value;
                    dr["NotifyCompletedEventID"] = DBNull.Value;
                    dr["Archive"] = dtAI.Rows[0]["Archive"];
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
                    ds.Tables["Items14"].Rows.Add(dr);
                    da.Update(ds, "Items14");
                    ds.Dispose();
                    da.Dispose();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        public static async Task<int> Send_ActionItem(int ParentGroupID, string Name, string Details, int ModuleID, int UserID, string UserName, string SenderName,
           int SenderID, DateTime SendDate, DateTime DateDue, int Priority, int ShowGroupID, int ShowID, int ShowModuleID, int ShowAction, DateTime EscalateDate, int IsGroup)
        {
            int aiid;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                try
                {
                    SqlCommand cmd = new SqlCommand("dbo.v4_Send_ActionItem", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };


                    cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = Name;
                    cmd.Parameters.Add("@Details", SqlDbType.NVarChar, 500).Value = Details;
                    cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                    cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                    cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                    cmd.Parameters.Add("@SenderName", SqlDbType.NVarChar, 255).Value = SenderName;
                    cmd.Parameters.Add("@SenderID", SqlDbType.Int, 4).Value = SenderID;
                    cmd.Parameters.Add("@SendDate", SqlDbType.DateTime, 8).Value = SendDate;
                    cmd.Parameters.Add("@DateDue", SqlDbType.DateTime, 8).Value = DateDue;
                    cmd.Parameters.Add("@Priority", SqlDbType.Int, 4).Value = Priority;
                    cmd.Parameters.Add("@ShowGroupID", SqlDbType.Int, 4).Value = ShowGroupID;
                    cmd.Parameters.Add("@ShowID", SqlDbType.Int, 4).Value = ShowID;
                    cmd.Parameters.Add("@ShowModuleID", SqlDbType.Int, 4).Value = ShowModuleID;
                    cmd.Parameters.Add("@ShowAction", SqlDbType.Int, 4).Value = ShowAction;
                    cmd.Parameters.Add("@EscalateDate", SqlDbType.DateTime, 8).Value = EscalateDate;
                    cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 2).Value = IsGroup;


                    var retValue = await cmd.ExecuteScalarAsync();
                    if (retValue != DBNull.Value)

                    {
                        aiid = Convert.ToInt32(retValue);

                    }
                    else
                    {
                        aiid = 0;
                    }
                }
                catch (SqlException ex)
                {
                    throw ex;
                }

                return aiid;
            }

        }

        public static async Task<DataTable> Get_SendAIUsersAsync(int ModuleID, int ID, int IsGroup)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("v4_ActionItem_Get_Users", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ID", SqlDbType.Int, 4).Value = ID;

                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task Add_UserMemberAsync(int ModuleID, int OrigID, int IsGroup, int ControlID, string ControlFullName, int ControlType, int CreatorID, string CreateBy)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_ActionItem_Add_Users]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Int, 4).Value = IsGroup;
                cmd.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = ControlID;
                cmd.Parameters.Add("@ControlFullName", SqlDbType.NVarChar, 255).Value = ControlFullName;
                cmd.Parameters.Add("@ControlType", SqlDbType.Int, 4).Value = ControlType;
                cmd.Parameters.Add("@CreatorID", SqlDbType.Int, 4).Value = CreatorID;
                cmd.Parameters.Add("@CreateBy", SqlDbType.NVarChar, 255).Value = CreateBy;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Remove_AIUserMemberAsync(int ID, int ModuleID, int OrigID, int IsGroup, string controlFullName)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("v4_ActionItem_Remove_User_Member", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ID", SqlDbType.Int, 4).Value = ID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 2).Value = IsGroup;
                cmd.Parameters.Add("@ControlFullName", SqlDbType.NVarChar, 255).Value = controlFullName;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task Delete_AllActionItemUserAsync(int UserID, int OrigID, int IsGroup)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Delete_ActionItem_Users", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };


                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@IsGroup", SqlDbType.Bit, 2).Value = IsGroup;

                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task AddCategories_ActionItemAsync(int OrigID, int CatID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_ActionItem_Add_Categories", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };

                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@CatID", SqlDbType.Int, 4).Value = CatID;
                await cmd.ExecuteNonQueryAsync();
            }
        }

        public static async Task<DataTable> Get_ItemCategoriesAsync()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_ActionItem_Get_Categories]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };

                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }

            return dt;
        }

        #endregion

    }
}