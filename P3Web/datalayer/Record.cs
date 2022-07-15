using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Threading.Tasks;
using System.IO;
using ClosedXML.Excel;
using System.Data.OleDb;
using System.Collections.Generic;

namespace Paradigm3.datalayer
{
    public class Record
    {

        #region Basic Record Data

        public static DataSet GetRecord(int ModuleID, int ItemID, int ReqID)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlDataAdapter da = new SqlDataAdapter
                {
                    SelectCommand = new SqlCommand("dbo.v4_Record_Get_Record", conn)
                };
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                da.SelectCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                da.SelectCommand.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = ReqID;
                da.TableMappings.Add("Table", "Get_ItemData");
                da.TableMappings.Add("Table1", "Get_TabList");
                da.TableMappings.Add("Table2", "Get_Fields");
                da.TableMappings.Add("Table3", "RecordsData");

                da.Fill(ds);
            }
            return ds;
        }

        public static string Get_RecordName(int ModuleID, int ItemID)
        {
            string s = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_RecordName", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    s = sdr["Name"].ToString();
                }
            }
            return s;
        }

        public static string Get_StepName(int ObjTypeID)
        {
            string s = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_StepName", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    s = sdr["Caption"].ToString();
                }
            }
            return s;
        }

        public static DataTable Get_Responsible(int ItemID, int ObjTypeID)
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
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_Responsible", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = 6;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_StepResponsible(int ItemID, int ObjTypeID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_StepResponsible", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_StepDueInterval(int ItemID, int ObjTypeID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_Step_DueInterval", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_TabAssigned(int ItemID, int ObjTypeID, int ModuleID)
        {
            DataTable dtAll = new DataTable();
            DataTable dtAllAssigned = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmdAll = new SqlCommand("dbo.v4_Record_Get_TabAssigned", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmdAll.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmdAll.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                cmdAll.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                // Get All Objects from Event                
                SqlDataReader allObjects = cmdAll.ExecuteReader();
                dtAll.Load(allObjects);

                DataTable dtUsers = dtAll.Clone();
                foreach (DataRow dr in dtAll.Rows)
                {
                    switch (Convert.ToInt32(dr["ListClass"]))
                    {
                        case 6:
                            // Position Title
                            DataTable dtPosition = new DataTable();
                            SqlCommand cmdPosition = new SqlCommand("v4_Record_PositionAssigned", conn);
                            cmdPosition.CommandType = CommandType.StoredProcedure;
                            cmdPosition.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = Convert.ToInt32(dr["ControlID"]);
                            SqlDataReader drPosition = cmdPosition.ExecuteReader();
                            dtPosition.Load(drPosition);
                            drPosition.Close();
                            dtUsers.Merge(dtPosition);
                            cmdPosition.Dispose();
                            dtPosition.Dispose();
                            break;
                        default:
                            // User Account
                            dtUsers.ImportRow(dr);
                            break;
                    }
                    dtAllAssigned = RemoveDuplicateRows(dtUsers, "ControlID");
                }
            }

            //DataTable dtAllAssigned = RemoveDuplicateRows(dtUsers, "ControlID");
            return dtAllAssigned;
        }

        public static DataTable Get_UserResp(int ModuleID, int OrigID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Broken || conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Record_Get_UserResp", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
        }

        public static DataTable IsEntityMember(int OrigID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_IsEntityMember", conn)
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

        public static DataTable Load_OnePane(int ItemID, int ObjID, int ModuleID, int ReqID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Load_OnePane", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ObjID", SqlDbType.Int, 4).Value = ObjID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = ReqID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Load_OneFieldData(int ItemID, int FieldID, int ReqID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Load_FieldValues", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = ReqID;

                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_DDLValues(int FieldID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_DDLValues", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;

                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_ExternalFieldData(int FieldID)
        {
            DataTable dtExtField = new DataTable();
            DataTable dt = new DataTable();
            dt.Columns.Add("ID", typeof(int));
            dt.Columns.Add("Caption", typeof(string));
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[ExtFields] WHERE [FieldID] = @FieldID", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dtExtField.Load(sdr);
            }

            if (dtExtField.Rows.Count > 0)
            {
                int ModuleID = Convert.ToInt32(dtExtField.Rows[0]["ModuleID"]);
                int ExtSrcType = Convert.ToInt32(dtExtField.Rows[0]["ExtSrcType"]);
                string ExtFileFullPath = dtExtField.Rows[0]["ExtFileFullPath"].ToString();
                string SheetName = dtExtField.Rows[0]["SheetName"].ToString();
                string ColNo = dtExtField.Rows[0]["ColNo"].ToString();
                int DatabaseType = Convert.ToInt32(dtExtField.Rows[0]["DatabaseType"]);

                if (ExtSrcType == 4)
                {
                    if (DatabaseType == 1) // SQL
                    {
                        SqlConnection extFieldConn = new SqlConnection(ExtFileFullPath);
                        using (extFieldConn)
                        {
                            if (extFieldConn.State == ConnectionState.Closed || extFieldConn.State == ConnectionState.Broken)
                            {
                                extFieldConn.Open();
                            }
                            string sqlCmd = "SELECT ROW_NUMBER() OVER(ORDER BY [" + ColNo + "]) AS [ID], [" + ColNo + "] AS [Caption] " +
                                "FROM [dbo].[" + SheetName + "] " +
                                "GROUP BY [" + ColNo + "]" +
                                "ORDER BY [" + ColNo + "]";
                            SqlCommand cmd = new SqlCommand(sqlCmd, extFieldConn)
                            {
                                CommandType = CommandType.Text
                            };
                            SqlDataReader extFieldSdr = cmd.ExecuteReader();
                            dt.Load(extFieldSdr);
                        }
                    }
                    else if (DatabaseType == 0) // MS Access
                    {
                        List<string> items = new List<string>();
                        OleDbConnection OleConn = new OleDbConnection(ExtFileFullPath);
                        using (OleConn)
                        {
                            if (OleConn.State == ConnectionState.Closed || OleConn.State == ConnectionState.Broken)
                            {
                                OleConn.Open();
                            }
                            string query = "SELECT [" + ColNo + "] AS [TEXT] FROM " + SheetName + " GROUP BY [" + ColNo + "] ORDER BY [" + ColNo + "]";

                            OleDbCommand OleCmd = new OleDbCommand(query, OleConn);
                            OleDbDataReader odr = OleCmd.ExecuteReader();
                            while (odr.Read())
                            {
                                items.Add(odr["TEXT"].ToString());
                            }

                            for (int i = 0; i < items.Count; i++)
                            {
                                DataRow dr = dt.NewRow();
                                dr["ID"] = (i + 1);
                                dr["Caption"] = items[i];
                                dt.Rows.Add(dr);
                                dt.AcceptChanges();
                            }
                        }
                    }

                }
                else if (ExtSrcType == 3) // MS Excel
                {
                    int UserID = 0;
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        //Retrieve http authentication cookie.
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                        //Get user information from http cookie.
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');
                        UserID = Convert.ToInt32(UserValues[0]);
                    }
                    string FileLocation = ExtFileFullPath;
                    DirectoryInfo dir = new DirectoryInfo(FileLocation);
                    string PublicLocation = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["PublicPath"] + UserID.ToString() + @"\");
                    if (!Directory.Exists(PublicLocation))
                    {
                        Directory.CreateDirectory(PublicLocation);
                    }
                    File.Copy(FileLocation, PublicLocation + dir.Name, true);
                    if (File.Exists(PublicLocation + dir.Name))
                    {
                        int ColumnNumber = Convert.ToInt32(ColNo);
                        var workBook = new XLWorkbook(PublicLocation + dir.Name);
                        using (workBook)
                        {
                            var workSheet = workBook.Worksheet(1);
                            var rows = workBook.Worksheet(ColumnNumber).RowsUsed();
                            foreach (var row in rows)
                            {
                                var RowNumber = row.RowNumber();
                                DataRow dr = dt.NewRow();
                                dr["ID"] = RowNumber;
                                dr["Caption"] = row.Cell((ColumnNumber + 1)).Value;
                                dt.Rows.Add(dr);
                                dt.AcceptChanges();
                            }
                        }
                        File.Delete(PublicLocation + dir.Name);
                    }
                }
                else if (ExtSrcType == 2) // CSV
                {
                    int UserID = 0;
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        //Retrieve http authentication cookie.
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                        //Get user information from http cookie.
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');
                        UserID = Convert.ToInt32(UserValues[0]);
                    }
                    string FileLocation = ExtFileFullPath;
                    DirectoryInfo dir = new DirectoryInfo(FileLocation);
                    string PublicLocation = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["PublicPath"] + UserID.ToString() + @"\");
                    File.Copy(FileLocation, PublicLocation + dir.Name, true);
                    if (File.Exists(PublicLocation + dir.Name))
                    {
                        int SelectedColumn = Convert.ToInt32(ColNo);
                        string[] lines = File.ReadAllLines(PublicLocation + dir.Name);
                        string[] cols = lines[0].Split(',');
                        int columns = cols.Length;
                        for (int i = 0; i < lines.Length; i++)
                        {
                            string[] values = lines[i].Split(',');
                            int ID = (i + 1);
                            string Caption = values[SelectedColumn];
                            DataRow drCSV = dt.NewRow();
                            drCSV["ID"] = ID;
                            drCSV["Caption"] = Caption;
                            dt.Rows.Add(drCSV);
                            dt.AcceptChanges();
                        }
                        File.Delete(PublicLocation + dir.Name);
                    }
                }
            }




            return dt;
        }

        public static DataTable Get_SelListValues(int ItemID, int FieldID, int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_SelListValues", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;

                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_TrainingLinks(int ItemID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Record_Get_TrainRelation", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;

                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_TrainingDefinitions(int GroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_TrainDefinitions", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
        }

        public static DataTable Get_TraineesForList()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Record_Get_Trainees", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
        }

        public static DataTable Get_TrainingSteps(int ItemID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Record_Get_TrainingSteps", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
        }

        public static int Get_DefReq(int DefID)
        {
            int i = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Record_Get_DefReq", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@MyID", SqlDbType.Int, 4).Value = DefID;
                SqlDataReader myReader = cmd.ExecuteReader();
                while (myReader.Read())
                {
                    i = Convert.ToInt32(myReader["ObjTypeID"]);
                }
            }
            return i;
        }

        public static string Get_FieldName(int FieldID)
        {
            string result = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Record_Get_FieldName]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    result = sdr["FieldName"].ToString();
                }
            }
            return result;
        }

        #endregion

        #region Edit/Save Data

        public static void Edit_Record(int ModuleID, int ItemID, int UserID, string UserFullName)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Record_Edit_Record", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@LastModified", SqlDbType.DateTime, 8).Value = DateTime.Now;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 255).Value = UserFullName;
                cmd.Parameters.Add("@ModifierID", SqlDbType.Int, 4).Value = UserID;

                cmd.ExecuteNonQuery();
            }
        }

        public static void Edit_History(int ModuleID, int OrigID, string TabName, string TaskName, string UserName)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
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
                    CommandType = CommandType.StoredProcedure
                };
                da.UpdateCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                da.UpdateCommand.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                da.UpdateCommand.Parameters.Add("@HistoryMemo", SqlDbType.NVarChar, -1, "MemoData");
                da.InsertCommand = new SqlCommand("dbo.v4_Default_Insert_HistoryMemo", conn)
                {
                    CommandType = CommandType.StoredProcedure
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
                    dr["MemoData"] = "User Name: " + UserName + "\r\n" +
                        "Time: " + DateTime.Now.ToString() + "\r\n" +
                        "Action: " + TaskName + " [" + TabName + "] \r\n\r\n\r\n" +
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
                    dr["MemoData"] = "User Name: " + UserName + "\r\n" +
                        "Time: " + DateTime.Now.ToString() + "\r\n" +
                        "Action: " + TaskName + " [" + TabName + "] \r\n\r\n\r\n";
                    dt.Rows.Add(dr);
                    da.Update(dt);
                }
            }
        }

        public static void Modify_FieldData(int ModuleID, int ItemID, int FieldID, int FieldType, object FieldText, object FieldValue)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlDataAdapter da = new SqlDataAdapter("dbo.v4_Record_Get_FieldData", conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                da.SelectCommand.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;

                da.Fill(ds, "RecordsData");
                if (ds.Tables["RecordsData"].Rows.Count > 0)
                {
                    da.UpdateCommand = new SqlCommand("dbo.v4_Record_Update_FieldData", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    da.UpdateCommand.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                    da.UpdateCommand.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                    da.UpdateCommand.Parameters.Add("@NumData", SqlDbType.Float, 8, "NumData");
                    da.UpdateCommand.Parameters.Add("@TextData", SqlDbType.NVarChar, 255, "TextData");
                    da.UpdateCommand.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000, "MemoData");
                    da.UpdateCommand.Parameters.Add("@DateData", SqlDbType.DateTime, 8, "DateData");
                    da.UpdateCommand.Parameters.Add("@IsDeleted", SqlDbType.Int, 4).Value = 0;
                    da.UpdateCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                    DataRow dr = ds.Tables["RecordsData"].Rows[0];
                    switch (FieldType)
                    {
                        case 0:
                        case 3:
                        case 7:
                            dr["NumData"] = DBNull.Value;
                            dr["TextData"] = FieldText.ToString();
                            dr["MemoData"] = DBNull.Value;
                            dr["DateData"] = DBNull.Value;
                            break;
                        case 1:
                        case 20:
                        case 30:
                            dr["NumData"] = DBNull.Value;
                            dr["TextData"] = DBNull.Value;
                            dr["MemoData"] = FieldText.ToString();
                            dr["DateData"] = DBNull.Value;
                            break;
                        case 2:
                        case 8:
                            dr["NumData"] = Convert.ToInt32(FieldText);
                            dr["TextData"] = DBNull.Value;
                            dr["MemoData"] = DBNull.Value;
                            dr["DateData"] = DBNull.Value;
                            break;
                        case 4:
                        case 16:
                            dr["NumData"] = DBNull.Value;
                            dr["TextData"] = DBNull.Value;
                            dr["MemoData"] = DBNull.Value;
                            dr["DateData"] = Convert.ToDateTime(FieldText);
                            break;
                        case 6:
                        case 18:
                            dr["NumData"] = DBNull.Value;
                            dr["TextData"] = DBNull.Value;
                            dr["MemoData"] = P3General.TextToRTF(FieldText.ToString());
                            dr["DateData"] = DBNull.Value;
                            break;
                    }
                }
                else
                {
                    DataTable dt = ds.Tables["RecordsData"];
                    DataRow dr = dt.NewRow();
                    da.InsertCommand = new SqlCommand("dbo.v4_Record_Insert_FieldData", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    da.InsertCommand.Parameters.Add("@FieldID", SqlDbType.Int, 4, "FieldID");
                    da.InsertCommand.Parameters.Add("@ItemID", SqlDbType.Int, 4, "ItemID");
                    da.InsertCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4, "ModuleID");
                    da.InsertCommand.Parameters.Add("@NumData", SqlDbType.Float, 8, "NumData");
                    da.InsertCommand.Parameters.Add("@TextData", SqlDbType.NVarChar, 255, "TextData");
                    da.InsertCommand.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000, "MemoData");
                    da.InsertCommand.Parameters.Add("@DateData", SqlDbType.DateTime, 8, "DateData");
                    da.InsertCommand.Parameters.Add("@IsDeleted", SqlDbType.Int, 4, "IsDeleted");
                    da.Fill(ds, "RecordsData");

                    switch (FieldType)
                    {
                        case 0:
                        case 3:
                        case 7:
                            dr["FieldID"] = FieldID;
                            dr["ItemID"] = ItemID;
                            dr["ModuleID"] = ModuleID;
                            dr["NumData"] = DBNull.Value;
                            dr["TextData"] = FieldText.ToString();
                            dr["MemoData"] = DBNull.Value;
                            dr["DateData"] = DBNull.Value;
                            dr["IsDeleted"] = 0;
                            break;
                        case 1:
                        case 20:
                        case 30:
                            dr["FieldID"] = FieldID;
                            dr["ItemID"] = ItemID;
                            dr["ModuleID"] = ModuleID;
                            dr["NumData"] = DBNull.Value;
                            dr["TextData"] = DBNull.Value;
                            dr["MemoData"] = FieldValue.ToString();
                            dr["DateData"] = DBNull.Value;
                            dr["IsDeleted"] = 0;
                            break;
                        case 6:
                        case 18:
                            dr["FieldID"] = FieldID;
                            dr["ItemID"] = ItemID;
                            dr["ModuleID"] = ModuleID;
                            dr["NumData"] = DBNull.Value;
                            dr["TextData"] = DBNull.Value;
                            dr["MemoData"] = P3General.TextToRTF(FieldValue.ToString());
                            dr["DateData"] = DBNull.Value;
                            dr["IsDeleted"] = 0;
                            break;
                        case 2:
                        case 8:
                            dr["FieldID"] = FieldID;
                            dr["ItemID"] = ItemID;
                            dr["ModuleID"] = ModuleID;
                            dr["NumData"] = Convert.ToInt32(FieldText);
                            dr["TextData"] = DBNull.Value;
                            dr["MemoData"] = DBNull.Value;
                            dr["DateData"] = DBNull.Value;
                            dr["IsDeleted"] = 0;
                            break;
                        case 4:
                        case 16:
                            dr["FieldID"] = FieldID;
                            dr["ItemID"] = ItemID;
                            dr["ModuleID"] = ModuleID;
                            dr["NumData"] = DBNull.Value;
                            dr["TextData"] = DBNull.Value;
                            dr["MemoData"] = DBNull.Value;
                            dr["DateData"] = Convert.ToDateTime(FieldText);
                            dr["IsDeleted"] = 0;
                            break;
                    }
                    dt.Rows.Add(dr);
                }
                da.Update(ds, "RecordsData");
            }
        }

        public static void Update_UserField(int ItemID, int FieldID, int UserID, string UserName, int ModuleID, int ReqID, int Condition)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Update_UserField", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = ReqID;
                cmd.Parameters.Add("@Condition", SqlDbType.Int, 4).Value = Condition;

                cmd.ExecuteNonQuery();
            }
        }

        public static void FLAG_FieldData(int ItemID, int FieldID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.Record_FLAG_FieldData", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = 6;

                cmd.ExecuteNonQuery();
            }
        }

        public static void Purge_FieldData()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Purge_FieldData", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.ExecuteNonQuery();
            }
        }

        public static void PurgeNull(int ItemID, int FieldID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_PurgeNull", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = 6;

                cmd.ExecuteNonQuery();
            }
        }

        public static void Complete_Tab(int index, int ModuleID, int ItemID, int ObjID, string UserFullName, int UserID, int ReqID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Complete_Tab", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserFullName", SqlDbType.NVarChar, 255).Value = UserFullName.ToString();
                cmd.Parameters.Add("@CheckerID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@CheckedDate", SqlDbType.DateTime, 8).Value = DateTime.Now;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ObjID", SqlDbType.Int, 4).Value = ObjID;
                cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = ReqID;
                cmd.ExecuteNonQuery();
            }
        }

        public static void Complete_Item(int ModuleID, int ItemID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Complete_Item", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;

                cmd.ExecuteNonQuery();
            }
        }

        public static void Make_NotApplicable(int ModuleID, int ItemID, int ObjID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Tab_NotApplicable", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ObjID", SqlDbType.Int, 4).Value = ObjID;

                cmd.ExecuteNonQuery();
            }
        }

        public static void RemoveResponsibleUser(int ModuleID, int ItemID, int ObjTypeID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Delete_Record_Responsible_User", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;

                cmd.ExecuteNonQuery();
            }
        }
        #endregion

        #region Event Data

        public static void Trigger_Event(int index, int ModuleID, int ItemID, int ObjID, int ParentGroupID, string ItemName, string TabName, int recID, string recName)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
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
                da.InsertCommand.Parameters.Add("@ShowObjID", SqlDbType.Int, 4, "ShowObjID");
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
                da.Fill(ds, "Items14");
                DataRow dr = ds.Tables["Items14"].NewRow();
                dr["ParentGroupID"] = 2;
                dr["AIType"] = 0;
                dr["ParentID"] = DBNull.Value;
                dr["Name"] = "Address Step : " + TabName +
                    " (" + ItemName + ")";
                dr["Details"] = "You have been assigned to address the step " + TabName + "\r\n\r\n" +
                    "Please access the item and address this step." + "\r\n" +
                    "Item Name: " + ItemName;
                dr["Status"] = 2;
                dr["ModuleID"] = DBNull.Value;
                dr["EventID"] = 0;
                dr["UserID"] = recID;
                dr["UserName"] = recName;
                if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    string authCookieValue = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookieValue);

                    string UserData = ticket.UserData;
                    string[] UserValues = UserData.Split(',');
                    int UserID = Convert.ToInt32(UserValues[0]);
                    string UserFullName = UserValues[1].ToString();

                    dr["SenderName"] = UserFullName;
                    dr["SenderID"] = UserID;
                }
                else
                {
                    dr["SenderName"] = "Guest Account";
                    dr["SenderID"] = 0;
                }
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
                dr["ShowObjID"] = ObjID;
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
            ds.Dispose();
        }

        public static DataTable Has_InternalEvent(int FieldID)
        {
            DataTable IEvents = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_InternalEvents", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = 6;

                SqlDataReader sdr = cmd.ExecuteReader();
                IEvents.Load(sdr);
            }
            return IEvents;
        }

        public static DataTable Get_InternalEvent(int EventID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.Record_Get_IEvent", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@EventID", SqlDbType.Int, 4).Value = EventID;

                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
        }

        public static void Trigger_Internal_Event(int EventID, int ItemID)
        {
            DataSet ds = new DataSet();
            DataTable IEvent = Get_InternalEvent(EventID);
            DataTable AssignedUsers = ActionItem.Get_AllAssigned(6, ItemID, EventID);
            string RelatedItemName = RelatedActionItem.Get_ItemName(ItemID, 6);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dbo.Items14 WHERE AIID = -1", conn)
                {
                    InsertCommand = new SqlCommand("dbo.v4_ActionItem_TriggerEvent", conn)
                };
                da.InsertCommand.CommandType = CommandType.StoredProcedure;
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
                // Create new dataset with datatable "Items14" and create new empty row in Items14 for data.           
                da.Fill(ds, "Items14");
                int Max = (AssignedUsers.Rows.Count - 1);
                int i = 0;
                for (i = 0; i <= Max; i++)
                {
                    DataRow dr = ds.Tables["Items14"].NewRow();
                    dr["ParentGroupID"] = 2;
                    dr["AIType"] = 0;
                    dr["ParentID"] = DBNull.Value;
                    if (ItemID > 0)
                    {
                        dr["Name"] = IEvent.Rows[0]["Name"] + " - " + RelatedItemName;
                    }
                    else
                    {
                        dr["Name"] = IEvent.Rows[0]["Name"];
                    }
                    dr["Details"] = IEvent.Rows[0]["Details"] + "\r\n\r\n" +
                        "----------------------------------------------------------" + "\r\n";
                    dr["Status"] = 2;
                    dr["ModuleID"] = DBNull.Value;
                    dr["EventID"] = IEvent.Rows[0]["EventID"];
                    dr["UserID"] = AssignedUsers.Rows[i]["ControlID"];
                    dr["UserName"] = AssignedUsers.Rows[i]["ControlFullName"];
                    int UserID = 0;
                    string UserFullName = "Guest Account";
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');
                        UserID = Convert.ToInt32(UserValues[0]);
                        UserFullName = UserValues[1].ToString();
                    }
                    dr["SenderName"] = UserFullName;
                    dr["SenderID"] = UserID;
                    dr["SendDate"] = DateTime.Now;
                    dr["DateDue"] = DateTime.Today.AddDays(Convert.ToInt32(IEvent.Rows[0]["DaysToComplete"]));
                    dr["Priority"] = IEvent.Rows[0]["Priority"];
                    dr["CompleteDate"] = DBNull.Value;
                    dr["ResultID"] = DBNull.Value;
                    dr["ResultName"] = DBNull.Value;
                    dr["Comments"] = DBNull.Value;
                    dr["ShowMeEnabled"] = 1;
                    dr["ShowGroupID"] = IEvent.Rows[0]["RelatedID"];
                    dr["ShowID"] = ItemID;
                    dr["ShowIsItemID"] = 1;
                    dr["ShowType"] = 1;
                    dr["ShowModuleID"] = 6;
                    dr["ShowAction"] = 0;
                    dr["DateSet"] = DBNull.Value;
                    dr["IsRegReminder"] = IEvent.Rows[0]["IsRegReminder"];
                    dr["RegReminderDay"] = IEvent.Rows[0]["RegReminderDay"];
                    if (IEvent.Rows[0]["RegReminderDay"] == DBNull.Value)
                    {
                        dr["RegReminderDate"] = DBNull.Value;
                    }
                    else
                    {
                        dr["RegReminderDate"] = DateTime.Today.AddDays(Convert.ToInt32(IEvent.Rows[0]["RegReminderDay"]));
                    }
                    dr["IsFinalReminder"] = IEvent.Rows[0]["IsFinalReminder"];
                    if (IEvent.Rows[0]["FinalReminderDay"] == DBNull.Value)
                    {
                        dr["FinalReminderDate"] = DBNull.Value;
                    }
                    else
                    {
                        dr["FinalReminderDate"] = DateTime.Today.AddDays(Convert.ToInt32(IEvent.Rows[0]["FinalReminderDay"]));
                    }
                    dr["NotifyOverDueDate"] = DBNull.Value;
                    dr["NotifyOverdueEventID"] = DBNull.Value;
                    dr["NotifyCompletedEventID"] = DBNull.Value;
                    dr["Archive"] = IEvent.Rows[0]["Archive"];
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
            }
            IEvent.Dispose();
            AssignedUsers.Dispose();
        }

        #endregion

        #region Gather New Record Data

        public static DataTable Get_SubFolders(int ModuleID, int ParentGroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Record_Get_SubGroups", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;


                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }

            return dt;
        }

        public static DataSet Get_NewRecord_Structure(int ModuleID, int ParentGroupID, int ObjTypeID, int DefID)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlDataAdapter da = new SqlDataAdapter("dbo.v4_Record_Get_NewRecordStructure", conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                da.SelectCommand.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                da.SelectCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                da.SelectCommand.Parameters.Add("@DefID", SqlDbType.Int, 4).Value = DefID;
                da.TableMappings.Add("Table", "Get_TabList");
                da.TableMappings.Add("Table1", "Get_AllResponsible");
                da.TableMappings.Add("Table2", "Get_AllFields");
                da.TableMappings.Add("Table3", "Get_TriggerEventDetails");
                da.Fill(ds);
            }
            return ds;
        }

        public static DataTable Get_TabResponsible(int ItemID, int ObjTypeID, int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_Responsible", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;

                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_TabSettings(int ModuleID, int ObjTypeID, int ParentGroupID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_TabSettings", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.AddWithValue("@ModuleID", ModuleID);
                cmd.Parameters.AddWithValue("@ObjTypeID", ObjTypeID);
                cmd.Parameters.AddWithValue("@ParentGroupID", ParentGroupID);
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
        }

        public static DataTable Get_RolesAssigned(int GroupID, int ControlID, int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_RolesAssigned", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                cmd.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = ControlID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_PositionsAssigned(int ControlID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_PositionAssigned", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = ControlID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        #endregion

        #region Add New Record

        public static void Create_Record(int ModuleID, int ObjTypeID, int ParentGroupID, string ItemName, string ItemLabel, string TraineeName, int TraineeID)
        {
            string userName = "Guest Account";
            int userID = 0;
            int NewItemID = 0;
            string sql = string.Empty;

            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');

                userID = Convert.ToInt32(UserValues[0]);
                userName = UserValues[1];
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Create_Record", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                if (ModuleID == 12)
                {
                    cmd.Parameters.Add("@IsGroupRecord", SqlDbType.Bit, 2).Value = 1;
                }
                else
                {
                    cmd.Parameters.Add("@IsGroupRecord", SqlDbType.Bit, 2).Value = 0;
                }
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@SerialID", SqlDbType.Int, 4).Value = 0;
                cmd.Parameters.Add("@ControlType", SqlDbType.Int, 4).Value = 0;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = ItemName;
                cmd.Parameters.Add("@LabelName", SqlDbType.NVarChar, 255).Value = ItemLabel;
                cmd.Parameters.Add("@HasPLink", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@Status", SqlDbType.Int, 4).Value = 2;
                cmd.Parameters.Add("@CreateBy", SqlDbType.NVarChar, 255).Value = userName;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime, 8).Value = DateTime.Now;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 255).Value = userName;
                cmd.Parameters.Add("@LastModified", SqlDbType.DateTime, 8).Value = DateTime.Now;
                cmd.Parameters.Add("@IsDeleted", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@CreatorID", SqlDbType.Int, 4).Value = userID;
                cmd.Parameters.Add("@ModifierID", SqlDbType.Int, 4).Value = userID;
                cmd.Parameters.Add("@DueDateEnabled", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@VersionDate", SqlDbType.DateTime, 8).Value = DateTime.Now;
                cmd.Parameters.Add("@VersionedBy", SqlDbType.NVarChar, 255).Value = userName;
                cmd.Parameters.Add("@VersionedByID", SqlDbType.Int, 4).Value = userID;
                cmd.Parameters.Add("@IsWithdrawn", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@PublishMode", SqlDbType.Int, 4).Value = 0;
                cmd.Parameters.Add("@NeedPublish", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@NeedPublishToSP", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@IsLockedForPublish", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@PublishNow", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@PublishToSPNow", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@RemovedFromPublish", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@UserFullName", SqlDbType.NVarChar, 255).Value = TraineeName;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = TraineeID;

                NewItemID = Convert.ToInt32(cmd.ExecuteScalar());
                HttpContext.Current.Session["NewItemID"] = NewItemID;
            }
        }

        public static async Task<int> Create_RecordAsync(int ModuleID, int ObjTypeID, int ParentGroupID, string ItemName, string ItemLabel, string TraineeName, int TraineeID)
        {
            string userName = "Guest Account";
            int userID = 0;
            int NewItemID = 0;
            string sql = string.Empty;

            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');

                userID = Convert.ToInt32(UserValues[0]);
                userName = UserValues[1];
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Create_Record", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                if (ModuleID == 12)
                {
                    cmd.Parameters.Add("@IsGroupRecord", SqlDbType.Bit, 2).Value = 1;
                }
                else
                {
                    cmd.Parameters.Add("@IsGroupRecord", SqlDbType.Bit, 2).Value = 0;
                }
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@SerialID", SqlDbType.Int, 4).Value = 0;
                cmd.Parameters.Add("@ControlType", SqlDbType.Int, 4).Value = 0;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 255).Value = ItemName;
                cmd.Parameters.Add("@LabelName", SqlDbType.NVarChar, 255).Value = ItemLabel;
                cmd.Parameters.Add("@HasPLink", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@Status", SqlDbType.Int, 4).Value = 2;
                cmd.Parameters.Add("@CreateBy", SqlDbType.NVarChar, 255).Value = userName;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime, 8).Value = DateTime.Now;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.NVarChar, 255).Value = userName;
                cmd.Parameters.Add("@LastModified", SqlDbType.DateTime, 8).Value = DateTime.Now;
                cmd.Parameters.Add("@IsDeleted", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@CreatorID", SqlDbType.Int, 4).Value = userID;
                cmd.Parameters.Add("@ModifierID", SqlDbType.Int, 4).Value = userID;
                cmd.Parameters.Add("@DueDateEnabled", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@VersionDate", SqlDbType.DateTime, 8).Value = DateTime.Now;
                cmd.Parameters.Add("@VersionedBy", SqlDbType.NVarChar, 255).Value = userName;
                cmd.Parameters.Add("@VersionedByID", SqlDbType.Int, 4).Value = userID;
                cmd.Parameters.Add("@IsWithdrawn", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@PublishMode", SqlDbType.Int, 4).Value = 0;
                cmd.Parameters.Add("@NeedPublish", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@NeedPublishToSP", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@IsLockedForPublish", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@PublishNow", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@PublishToSPNow", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@RemovedFromPublish", SqlDbType.Bit, 2).Value = 0;
                cmd.Parameters.Add("@UserFullName", SqlDbType.NVarChar, 255).Value = TraineeName;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = TraineeID;

                NewItemID = Convert.ToInt32(await cmd.ExecuteScalarAsync());
            }
            return NewItemID;
        }

        public static void Create_Tabs(int ModuleID, int ObjTypeID, int ParentGroupID, int NewItemID, DataSet ds, int DefID)
        {
            DataTable Tabs = ds.Tables[0];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }

                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dbo.ItemObj WHERE ItemID = -1", conn)
                {
                    InsertCommand = new SqlCommand("dbo.v4_Record_Create_Tabs", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    }
                };
                da.InsertCommand.Parameters.Add("@ItemID", SqlDbType.Int, 4, "ItemID");
                da.InsertCommand.Parameters.Add("@ObjID", SqlDbType.Int, 4, "ObjID");
                da.InsertCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4, "ModuleID");
                da.InsertCommand.Parameters.Add("@StepDueDate", SqlDbType.DateTime, 8, "StepDueDate");
                da.InsertCommand.Parameters.Add("@DueStatus", SqlDbType.Int, 4, "DueStatus");
                da.InsertCommand.Parameters.Add("@DefID", SqlDbType.Int, 4, "DefID");
                da.InsertCommand.Parameters.Add("@ReqID", SqlDbType.Int, 4, "ReqID");
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (NewItemID > 0)
                {
                    int Max = (Tabs.Rows.Count - 1);
                    for (int i = 0; i <= Max; i++)
                    {
                        DataRow dr = dt.NewRow();
                        dr["ItemID"] = NewItemID;
                        dr["ObjID"] = Tabs.Rows[i]["ObjID"];
                        dr["ModuleID"] = ModuleID;
                        if (i == 0)
                        {
                            dr["StepDueDate"] = DateTime.Now.AddDays(5);
                            dr["DueStatus"] = 1;
                        }
                        else
                        {
                            dr["StepDueDate"] = DBNull.Value;
                            dr["DueStatus"] = 0;
                        }

                        if (ModuleID == 12)
                        {
                            dr["DefID"] = DefID;
                            dr["ReqID"] = Tabs.Rows[i]["MyID"];
                        }
                        else
                        {
                            dr["DefID"] = 0;
                            dr["ReqID"] = 0;
                        }
                        dt.Rows.Add(dr);
                    }
                    da.Update(dt);
                }
            }
            if (ModuleID != 12)
            {
                Add_AllResponsible(ParentGroupID, NewItemID, ModuleID);
            }
        }

        public static void Add_TabDueDateSettings(int ModuleID, int ParentGroupID, int NewItemID)
        {
            int UserID = 0;
            string UserFullName = "Guest Account";
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');

                UserID = Convert.ToInt32(UserValues[0]);
                UserFullName = UserValues[1];
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Add_TabDueDate", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = NewItemID;
                cmd.Parameters.Add("@CreateBy", SqlDbType.NVarChar, 255).Value = UserFullName;
                cmd.Parameters.Add("@CreatorID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@CreateDate", SqlDbType.DateTime, 8).Value = DateTime.Now;
                cmd.ExecuteNonQuery();
            }
        }

        public static void Add_AllResponsible(int ParentGroupID, int NewItemID, int ModuleID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Add_AllResponsible", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@NewItemID", SqlDbType.Int, 4).Value = NewItemID;
                cmd.Parameters.Add("@ParentGroupID", SqlDbType.Int, 4).Value = ParentGroupID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4, "ModuleID").Value = ModuleID;
                cmd.ExecuteNonQuery();
            }
        }

        public static void Add_StepResponsible(int ModuleID, int ItemID, int ObjTypeID, int ControlID, string ControlFullName, string ControlType)
        {
            // Get Logged on user info and add to responsible
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');

                int UserID = Convert.ToInt32(UserValues[0]);
                string UserFullName = UserValues[1];

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
                using (conn)
                {
                    if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand("dbo.v4_Record_Add_StepResponsible", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                    cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = ItemID;
                    cmd.Parameters.Add("ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                    cmd.Parameters.Add("@ControlID", SqlDbType.Int, 4).Value = ControlID;
                    cmd.Parameters.Add("@ControlFullName", SqlDbType.NVarChar, 255).Value = ControlFullName;
                    if (ControlType == "User")
                    {
                        cmd.Parameters.Add("@ControlType", SqlDbType.Int, 4).Value = 1;
                    }
                    else
                    {
                        cmd.Parameters.Add("@ControlType", SqlDbType.Int, 4).Value = 6;
                    }
                    cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserFullName;
                    cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;

                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static void Add_FieldValues(int ModuleID, int NewItemID, DataSet dsData)
        {
            string sField = string.Empty;
            int i = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                try
                {
                    int TotalFields = (dsData.Tables["Get_AllFields"].Rows.Count - 1);
                    for (i = 0; i <= TotalFields; i++)
                    {
                        SqlCommand cmd = new SqlCommand("dbo.v4_Record_Add_FieldValues", conn)
                        {
                            CommandType = CommandType.StoredProcedure,
                            CommandTimeout = 120
                        };
                        int FieldType = Convert.ToInt32(dsData.Tables["Get_AllFields"].Rows[i]["FieldType"]);
                        cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = dsData.Tables["Get_AllFields"].Rows[i]["FieldID"];
                        cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = NewItemID;
                        cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                        cmd.Parameters.Add("@BinaryData", SqlDbType.VarBinary, -1).Value = DBNull.Value;
                        if (ModuleID == 12)
                        {
                            cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = dsData.Tables["Get_AllFields"].Rows[i]["MyID"];
                        }
                        else
                        {
                            cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = 0;
                        }
                        switch (FieldType)
                        {
                            case 0:
                            case 3:
                            case 7:
                                cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = DBNull.Value;
                                if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"] != DBNull.Value)
                                {
                                    cmd.Parameters.Add("@TextData", SqlDbType.NVarChar, 255).Value = dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"];
                                }
                                else
                                {
                                    cmd.Parameters.Add("@TextData", SqlDbType.NVarChar, 255).Value = DBNull.Value;
                                }
                                cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = DBNull.Value;
                                cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = DBNull.Value;
                                break;
                            case 1:
                                cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = DBNull.Value;
                                cmd.Parameters.Add("@TextData", SqlDbType.NVarChar, 255).Value = DBNull.Value;
                                if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"] == DBNull.Value)
                                {
                                    cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = DBNull.Value;
                                }
                                else if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"].ToString() == "0")
                                {
                                    cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = DBNull.Value;
                                }
                                else
                                {
                                    cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = P3General.RTFtoText(dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"].ToString());
                                }
                                cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = DBNull.Value;
                                break;
                            case 6:
                                cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = DBNull.Value;
                                cmd.Parameters.Add("@TextData", SqlDbType.NVarChar, 255).Value = DBNull.Value;
                                if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"] == DBNull.Value)
                                {
                                    cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = DBNull.Value;
                                }
                                else if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"].ToString() == "0")
                                {
                                    cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = DBNull.Value;
                                }
                                else
                                {
                                    cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = P3General.TextToRTF(dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"].ToString());
                                }

                                cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = DBNull.Value;
                                break;
                            case 2:
                                if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"] != DBNull.Value)
                                {
                                    if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"].ToString() != string.Empty)
                                    {
                                        cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = Convert.ToInt32(dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"]);
                                    }
                                    else
                                    {
                                        cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = 0;
                                    }
                                }
                                else
                                {
                                    cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = 0;
                                }

                                cmd.Parameters.Add("@TextData", SqlDbType.NVarChar, 255).Value = DBNull.Value;
                                cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = DBNull.Value;
                                cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = DBNull.Value;
                                break;
                            case 8:
                                if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"] != DBNull.Value)
                                {
                                    if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"].ToString() != string.Empty)
                                    {
                                        cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = Convert.ToInt32(dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"]);
                                    }
                                    else
                                    {
                                        cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = DBNull.Value;
                                    }
                                }
                                else
                                {
                                    cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = DBNull.Value;
                                }

                                cmd.Parameters.Add("@TextData", SqlDbType.NVarChar, 255).Value = DBNull.Value;
                                cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = DBNull.Value;
                                cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = DBNull.Value;
                                break;
                            case 4:
                            case 16:
                                cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = DBNull.Value;
                                cmd.Parameters.Add("@TextData", SqlDbType.NVarChar, 255).Value = DBNull.Value;
                                cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = DBNull.Value;
                                if (dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"] != DBNull.Value)
                                {
                                    if (!object.ReferenceEquals(dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"], string.Empty))
                                    {
                                        cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = Convert.ToDateTime(dsData.Tables["Get_AllFields"].Rows[i]["DefaultValue"]);
                                    }
                                    else
                                    {
                                        cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = DateTime.Now;
                                    }
                                }
                                else
                                {
                                    cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = DateTime.Now;
                                }
                                break;
                            case 5:
                                cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = 0;
                                cmd.Parameters.Add("@TextData", SqlDbType.NVarChar, 255).Value = string.Empty;
                                cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = "1";
                                cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = DBNull.Value;
                                break;
                            default:
                                cmd.Parameters.Add("@NumData", SqlDbType.Int, 4).Value = DBNull.Value;
                                cmd.Parameters.Add("@TextData", SqlDbType.NVarChar, 255).Value = DBNull.Value;
                                cmd.Parameters.Add("@MemoData", SqlDbType.NVarChar, 4000).Value = DBNull.Value;
                                cmd.Parameters.Add("@DateData", SqlDbType.DateTime, 8).Value = DBNull.Value;
                                break;
                        }
                        cmd.Parameters.Add("@IsDeleted", SqlDbType.Bit, 2).Value = 0;
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }

        }

        public static int Get_ParentReq(int DefReq)
        {
            int i = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT ObjTypeID FROM DefReq WHERE ParentID = @MyID", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@MyID", SqlDbType.Int, 4).Value = DefReq;
                SqlDataReader myReader = cmd.ExecuteReader();
                while (myReader.Read())
                {
                    i = Convert.ToInt32(myReader["ObjTypeID"]);
                }
            }
            return i;
        }

        public static void TriggerEvent(int NewItemID, int ModuleID, int ObjTypeID, int ParentGroupID, DataSet dsData, string ItemName)
        {
            // Create a new Action Item for every recipient specified in the
            // "Get_TriggerEventAssignTo" function and send them.
            int UserID = 0;
            string UserFullName = "Guest Account";
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');

                UserID = Convert.ToInt32(UserValues[0]);
                UserFullName = UserValues[1].ToString();
            }

            DataTable dtTE = dsData.Tables[3];
            int EventID = Convert.ToInt32(dtTE.Rows[0]["EventID"]);
            int RelatedID = Convert.ToInt32(dtTE.Rows[0]["RelatedID"]);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Items14 WHERE AIID = -1", conn)
                {
                    InsertCommand = new SqlCommand("v4_ActionItem_TriggerEvent", conn)
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

                // Create new dataset with datatable "Items14" and create new empty row in Items14 for data.
                DataSet ds = new DataSet();

                da.Fill(ds, "Items14");
                int Max = (ActionItem.Get_AllAssigned(ModuleID, RelatedID, EventID).Rows.Count - 1);
                int i = 0;
                for (i = 0; i <= Max; i++)
                {
                    DataRow dr = ds.Tables["Items14"].NewRow();
                    dr["ParentGroupID"] = 2;
                    dr["AIType"] = 0;
                    dr["ParentID"] = DBNull.Value;
                    dr["Name"] = dtTE.Rows[0]["Name"].ToString() + " - " + ItemName;
                    dr["Details"] = dtTE.Rows[0]["Details"].ToString() + "\r\n\r\n" +
                            "----------------------------------------------------------" + "\r\n" +
                            "Related Name: " + ItemName + "\r\n" +
                            "User Name: " + UserFullName + "\r\n" +
                            "Time: (" + DateTime.Now.ToString() + ") " + "\r\n" +
                            "Action: Added New Item (" + ItemName + ")";
                    dr["Status"] = 2;
                    dr["ModuleID"] = DBNull.Value;
                    dr["EventID"] = 0;
                    dr["UserID"] = ActionItem.Get_AllAssigned(ModuleID, RelatedID, EventID).Rows[i]["ControlID"];
                    dr["UserName"] = ActionItem.Get_AllAssigned(ModuleID, RelatedID, EventID).Rows[i]["ControlFullName"];
                    dr["SenderName"] = UserFullName;
                    dr["SenderID"] = UserID;
                    dr["SendDate"] = DateTime.Now;
                    if (ModuleID == 4)
                    {
                        dr["DateDue"] = DateTime.Today.AddDays(Convert.ToInt32(dtTE.Rows[0]["DaysToComplete"]));
                        dr["Priority"] = Convert.ToInt32(dtTE.Rows[0]["Priority"]);
                    }
                    else
                    {
                        dr["DateDue"] = DateTime.Today.AddDays(7);
                        dr["Priority"] = 1;
                    }
                    dr["CompleteDate"] = DBNull.Value;
                    dr["ResultID"] = DBNull.Value;
                    dr["ResultName"] = DBNull.Value;
                    dr["Comments"] = DBNull.Value;
                    dr["ShowMeEnabled"] = 1;
                    dr["ShowGroupID"] = ParentGroupID;
                    dr["ShowID"] = NewItemID;
                    dr["ShowIsItemID"] = 1;
                    dr["ShowType"] = 1;
                    dr["ShowModuleID"] = ModuleID;
                    dr["ShowAction"] = 0;
                    dr["DateSet"] = DBNull.Value;
                    if (ModuleID == 4)
                    {
                        dr["IsRegReminder"] = dtTE.Rows[0]["IsRegReminder"];
                        dr["RegReminderDay"] = dtTE.Rows[0]["RegReminderDay"];
                    }
                    else
                    {
                        dr["IsRegReminder"] = 0;
                        dr["RegReminderDay"] = DBNull.Value;
                    }
                    if (ModuleID == 4)
                    {
                        if (dtTE.Rows[0]["RegReminderDay"] == DBNull.Value)
                        {
                            dr["RegReminderDate"] = DBNull.Value;
                        }
                        else
                        {
                            dr["RegReminderDate"] = DateTime.Today.AddDays(Convert.ToInt32(dtTE.Rows[0]["RegReminderDay"]));
                        }
                        dr["IsFinalReminder"] = dtTE.Rows[0]["IsFinalReminder"];
                        if (dtTE.Rows[0]["FinalReminderDay"] == DBNull.Value)
                        {
                            dr["FinalReminderDate"] = DBNull.Value;
                        }
                        else
                        {
                            dr["FinalReminderDate"] = DateTime.Today.AddDays(Convert.ToInt32(dtTE.Rows[0]["FinalReminderDay"]));
                        }
                    }
                    else
                    {
                        dr["RegReminderDate"] = DBNull.Value;
                        dr["IsFinalReminder"] = 0;
                        dr["FinalReminderDate"] = DBNull.Value;
                    }
                    dr["NotifyOverDueDate"] = DBNull.Value;
                    dr["NotifyOverdueEventID"] = DBNull.Value;
                    dr["NotifyCompletedEventID"] = DBNull.Value;
                    if (ModuleID == 4)
                    {
                        dr["Archive"] = dtTE.Rows[0]["Archive"];
                    }
                    else
                    {
                        dr["Archive"] = 0;
                    }
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
                }

                // Update database table
                da.Update(ds, "Items14");
            }
        }

        public static void TriggerStepEvent(int NewItemID, string ItemName, int ModuleID, int ObjTypeID, int ParentGroupID, int ControlID, string ControlFullName, DataSet dsData)
        {
            // Create a new Action Item for every recipient specified in the
            // "Get_TriggerEventAssignTo" function and send them.
            String UserFullName = "Guest Account";
            int UserID = 0;
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
                UserFullName = UserValues[1].ToString();
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dbo.Items14 WHERE AIID = -1", conn)
                {
                    InsertCommand = new SqlCommand("dbo.v4_ActionItem_TriggerEvent", conn)
                };
                da.InsertCommand.CommandType = CommandType.StoredProcedure;
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
                // Create new dataset with datatable "Items14" and create new empty row in Items14 for data.
                DataSet ds = new DataSet();
                da.Fill(ds, "Items14");
                DataRow dr = ds.Tables["Items14"].NewRow();
                dr["ParentGroupID"] = 2;
                dr["AIType"] = 0;
                dr["ParentID"] = DBNull.Value;
                dr["Name"] = "Address Step: No. 1 - " + dsData.Tables["Get_TabList"].Rows[0]["Caption"].ToString() +
                    " (" + ItemName + ")";
                dr["Details"] = "You have been assigned to address the step " + dsData.Tables["Get_TabList"].Rows[0]["Caption"].ToString() + "\r\n\r\n" +
                    "Please access the item and address this step." + "\r\n" +
                    "Item Name: " + ItemName + "";
                dr["Status"] = 2;
                dr["ModuleID"] = DBNull.Value;
                dr["EventID"] = 0;
                dr["UserID"] = ControlID;
                dr["UserName"] = ControlFullName;
                dr["SenderName"] = UserFullName;
                dr["SenderID"] = UserID;
                dr["SendDate"] = DateTime.Now;
                if (ModuleID == 4)
                {
                    dr["DateDue"] = DateTime.Today.AddDays(Convert.ToInt32(dsData.Tables["Get_TriggerEventDetails"].Rows[0]["DaysToComplete"]));
                    dr["Priority"] = dsData.Tables["Get_TriggerEventDetails"].Rows[0]["Priority"];
                }
                else
                {
                    dr["DateDue"] = DateTime.Today.AddDays(7);
                    dr["Priority"] = 1;
                }
                dr["CompleteDate"] = DBNull.Value;
                dr["ResultID"] = DBNull.Value;
                dr["ResultName"] = DBNull.Value;
                dr["Comments"] = DBNull.Value;
                dr["ShowMeEnabled"] = 1;
                dr["ShowGroupID"] = ParentGroupID;
                dr["ShowID"] = NewItemID;
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
                da.Update(ds, "Items14");
            }
        }

        public static void AutoFill_Label(int ModuleID, int GroupID, int ItemID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("v4_Record_HasAutoLabel", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                    cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                    cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                    cmd.ExecuteNonQuery();
                }
            }
        }

        #endregion

        #region Training Competency Assessments

        public static bool Has_Assessment(int ReqID)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Training_Has_Assessment", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = ReqID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    if (!sdr["QuesSetID"].Equals(0) && !sdr["QuesSetID"].Equals(DBNull.Value))
                    {
                        result = true;
                    }
                }
            }
            return result;
        }

        public static bool Has_Passed(int UserID, int ItemID, int ReqID)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Training_Passed_Assessment", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = ReqID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    if (sdr["ResultID"].Equals(1))
                    {
                        result = true;
                    }
                }
            }
            return result;
        }

        public static string Get_QuesSetID(int ReqID)
        {
            string result = "0";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Training_Get_QuesSetID", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = ReqID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    result = sdr["QuesSetID"].ToString();
                }
            }
            return result;
        }

        public static int Get_OfrdNoOfQues(int QuesSetID)
        {
            int result = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Training_Get_OfrdNoOfQues", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@QuesSetID", SqlDbType.Int, 4).Value = QuesSetID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    result = Convert.ToInt32(sdr["OfrdNoOfQues"]);
                }
                return result;
            }
        }

        public static string Get_QuestionText(int QuesID)
        {
            string result = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Training_Get_QuesText", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@QuesID", SqlDbType.Int, 4).Value = QuesID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    result = sdr["QuesText"].ToString();
                }
                return result;
            }
        }

        public static DataTable Get_Assessment(int QuesSetID, int OfrdNoOfQues)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Training_Get_Assessment", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@QuesSetID", SqlDbType.Int, 4).Value = QuesSetID;
                cmd.Parameters.Add("@OfrdNoOfQues", SqlDbType.Int, 4).Value = OfrdNoOfQues;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_QuesPsbleAnswrs(int QuesID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Training_Get_Question_Possible_Answers", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@QuesID", SqlDbType.Int, 4).Value = QuesID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_AssessmentResult(int AttemptID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Training_Get_AssessmentResult", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@AttemptID", SqlDbType.Int, 4).Value = AttemptID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static void Add_AssessmentRecord(int UserID, int ItemID, int ReqID, int QuesSetID, int TotalQuestions, int TotalToPass, int TotalCorrect, int ResultID, float time)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Training_Add_AssessmentResult", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ReqID", SqlDbType.Int, 4).Value = ReqID;
                cmd.Parameters.Add("@QuesSetID", SqlDbType.Int, 4).Value = QuesSetID;
                cmd.Parameters.Add("@TotalQuestions", SqlDbType.Int, 4).Value = TotalQuestions;
                cmd.Parameters.Add("@TotalToPass", SqlDbType.Int, 4).Value = TotalToPass;
                cmd.Parameters.Add("@TotalCorrect", SqlDbType.Int, 4).Value = TotalCorrect;
                cmd.Parameters.Add("@ResultID", SqlDbType.Int, 4).Value = ResultID;
                cmd.Parameters.Add("@Time", SqlDbType.Float, 16).Value = time;

                int NewID = 0;
                NewID = Convert.ToInt32(cmd.ExecuteScalar());
                HttpContext.Current.Session["NewID"] = NewID;
            }
        }

        public static void Add_AssessmentAnswer(int AttemptID, int QuesID, string QuesText, string AnsText, bool AnsIsCorrect, float time)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Training_Add_AssessmentAnswer", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@AttemptID", SqlDbType.Int, 4).Value = AttemptID;
                cmd.Parameters.Add("@QuesID", SqlDbType.Int, 4).Value = QuesID;
                cmd.Parameters.Add("@QuesText", SqlDbType.NVarChar, 255).Value = QuesText;
                cmd.Parameters.Add("@AnsText", SqlDbType.NVarChar, 255).Value = AnsText;
                cmd.Parameters.Add("@AnsIsCorrect", SqlDbType.Bit, 2).Value = AnsIsCorrect;
                cmd.Parameters.Add("@Time", SqlDbType.Float, 16).Value = time;
                cmd.ExecuteNonQuery();
            }
        }

        #endregion

        #region Asynchronous Tasks

        public static async Task<DataTable> Get_ResponsibleAsync(int ItemID, int ObjTypeID)
        {
            DataTable dt = new DataTable();
            string strResp = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_Get_Responsible", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ObjTypeID", SqlDbType.Int, 4).Value = ObjTypeID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = 6;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task Edit_RecordAsync(int ModuleID, int ItemID, int UserID, string UserFullName)
        {
            await Task.Run(() => { Edit_Record(ModuleID, ItemID, UserID, UserFullName); });

        }

        public static async Task Edit_HistoryAsync(int ModuleID, int OrigID, string TabName, string TaskName, string UserName)
        {
            await Task.Run(() => { Edit_History(ModuleID, OrigID, TabName, TaskName, UserName); });
        }

        public static async Task Modify_FieldDataAsync(int ModuleID, int ItemID, int FieldID, int FieldType, object FieldText, object FieldValue)
        {
            await Task.Run(() => { Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, FieldText, FieldValue); });
        }

        public static async Task Update_UserFieldAsync(int ItemID, int FieldID, int UserID, string UserName, int ModuleID, int ReqID, int Condition)
        {
            await Task.Run(() => { Update_UserField(ItemID, FieldID, UserID, UserName, ModuleID, ReqID, Condition); });
        }

        public static async Task FLAG_FieldDataAsync(int ItemID, int FieldID)
        {
            await Task.Run(() => { FLAG_FieldData(ItemID, FieldID); });
        }

        public static async Task Purge_FieldDataAsync()
        {
            await Task.Run(() => { Purge_FieldData(); });
        }

        public static async Task PurgeNullAsync(int ItemID, int FieldID)
        {
            await Task.Run(() => { PurgeNull(ItemID, FieldID); });
        }

        public static async Task Complete_ItemAsync(int ModuleID, int ItemID)
        {
            await Task.Run(() => { Complete_Item(ModuleID, ItemID); });
        }

        public static async Task Make_NotApplicableAsync(int ModuleID, int ItemID, int ObjID)
        {
            await Task.Run(() => { Make_NotApplicable(ModuleID, ItemID, ObjID); });
        }

        public static async Task Trigger_Internal_EventAsync(int EventID, int ItemID)
        {
            await Task.Run(() => { Trigger_Internal_Event(EventID, ItemID); });
        }

        public static async Task Complete_TabAsync(int index, int ModuleID, int ItemID, int ObjID, string UserFullName, int UserID, int ReqID)
        {
            await Task.Run(() => { Complete_Tab(index, ModuleID, ItemID, ObjID, UserFullName, UserID, ReqID); });
        }

        public static async Task<DataTable> Has_InternalEventAsync(int FieldID)
        {
            DataTable IEvents = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Record_InternalEvents", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = FieldID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = 6;

                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                IEvents.Load(sdr);
            }
            return IEvents;
        }

        public static async Task<DataTable> Get_InternalEventAsync(int EventID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.Record_Get_IEvent", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@EventID", SqlDbType.Int, 4).Value = EventID;

                SqlDataReader myReader = await cmd.ExecuteReaderAsync();
                dt.Load(myReader);
            }
            return dt;
        }

        public static async Task Trigger_EventAsync(int index, int ModuleID, int ItemID, int ObjID, int ParentGroupID, string ItemName, string TabName, int recID, string recName)
        {
            await Task.Run(() => { Trigger_Event(index, ModuleID, ItemID, ObjID, ParentGroupID, ItemName, TabName, recID, recName); });
        }

        public static async Task<bool> Get_FieldTypeAsync(int fieldid)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Record_Get_CalculatedType]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = fieldid;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = Convert.ToBoolean(sdr["IsResult"]);
                }
            }
            return result;
        }

        public static async Task<object> CalculateFieldAsync(int itemid, int fieldid)
        {
            object result = null;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Record_Get_CalculatedValue]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = itemid;
                cmd.Parameters.Add("@FieldID", SqlDbType.Int, 4).Value = fieldid;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    result = sdr["FieldValue"];
                }
            }
            return result;
        }

        public static async Task<string> Get_NameFormulaAsync(int ModuleID, int GroupID)
        {
            string NameFormula = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Record_Get_Name_Formula]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@GroupID", SqlDbType.Int, 4).Value = GroupID;
                SqlDataReader myReader = await cmd.ExecuteReaderAsync();
                while (myReader.Read())
                {
                    NameFormula = myReader["NameFormula"].ToString();
                }
            }
            return NameFormula;
        }

        #endregion
    }

    [Serializable]
    public class AssessmentResponse
    {
        public int QuestionID { get; set; }
        public int QuestionType { get; set; }
        public string QuestionText { get; set; }
        public string Response { get; set; }
        public string CorrectResponse { get; set; }
        public int ToPass { get; set; }
    }
}