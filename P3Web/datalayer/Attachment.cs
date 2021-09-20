using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Paradigm3.datalayer
{
    public class Attachment
    {

        public static DataTable Get_TabList(int ItemID, int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Attachment_Get_TabList", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
            
        }

        public static DataTable Get_Attachments(int ItemID, int ObjID, int ModuleID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Attachment_Get_Attachments", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@ItemID", SqlDbType.Int, 4).Value = ItemID;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                cmd.Parameters.Add("@ObjID", SqlDbType.Int, 4).Value = ObjID;
                SqlDataReader myreader = cmd.ExecuteReader();
                dt.Load(myreader);
            }
            return dt;                
        }

        public static DataTable Get_AttachData(int AtchID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Attachment_Get_AttachData", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@AtchID", SqlDbType.Int, 4).Value = AtchID;
                SqlDataReader myReader = cmd.ExecuteReader();
                dt.Load(myReader);
            }
            return dt;
        }

    }
}