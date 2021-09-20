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
    public class Status
    {

        public static string GetCurrentStatus(int ModuleID, int OrigID)
        {
            string CurrentStatus = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand("dbo.V4_Status_Get_CurrentVersionStatus", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                    cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        CurrentStatus = sdr["Status"].ToString();
                    }
                }
            }
            return CurrentStatus;

        }

        public static DataTable GetCurrentVersionStatus(int ModuleID, int OrigID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Status_Get_CurrentVersionStatus", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static async Task<DataTable> GetCurrentVersionStatusAsync(int ModuleID, int OrigID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Status_Get_CurrentVersionStatus", conn)
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

        public static void Convert_Status(int ModuleID, int ItemID, int OrigID, string Version, int StatusFrom, int StatusTo, DateTime EffectiveDate, int UserID, string UserName)
        {
            //int NewItemID = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Status_Convert_Status", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@Version", SqlDbType.NVarChar, 255).Value = Version;
                cmd.Parameters.Add("@StatusFrom", SqlDbType.Int, 4).Value = StatusFrom;
                cmd.Parameters.Add("@StatusTo", SqlDbType.Int, 4).Value = StatusTo;
                cmd.Parameters.Add("@EffectiveDate", SqlDbType.DateTime, 8).Value = EffectiveDate;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                cmd.ExecuteNonQuery();
            }
        }

        public static int GetCurrentID(int OrigID)
        {
            int value = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Status_Get_CurrentItemID", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    value = Convert.ToInt32(sdr["ItemID"]);
                }
                return value;
            }
        }

        public static async Task<bool> GetControlOptionAsync(int ModuleID, int OrigID)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Status_Get_ControlType]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while(sdr.Read())
                {
                    if (sdr["IsSimpleControl"].Equals(1))
                    {
                        result = true;
                    }
                }
            }

            return result;
        }

        public static async Task<DataTable> GetStatusOptionsAsync(int ModuleID, int OrigID, int UserID, int CanEdit)
		{
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    await conn.OpenAsync();
				}
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Status_Get_AvailableOptions]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@CanEdit", SqlDbType.Bit, 2).Value = CanEdit;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
		}

    }
}