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
    public class Reports
    {

        public static async Task<DataTable> GetSavedReportsAsync(int ModuleID, int UserID)
        {            
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }

                SqlCommand cmd = new SqlCommand("[dbo].[v4_Report_Get_SavedReports]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                dt.Load(sdr);
            }
            return dt;
        }

        public static string GetSavedReport(int ReportID)
        {
            string result = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT [SrchAndRprtValue] FROM [dbo].[SearchAndReport] WHERE [SrchAndRprtID] = @ReportID", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ReportID", SqlDbType.Int, 4).Value = ReportID;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    result = sdr["SrchAndRprtValue"].ToString();
                }
            }
            return result;
        }

        public static DataTable GetRecordInfo(int ModuleID, int ItemID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_Report_Get_RecordInfo", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }
    }
}