using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Paradigm3.datalayer
{
    public class RelatedActionItem
    {

        public static string Get_ItemName(int origid, int moduleid)
        {
            string ItemName = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_RelatedActionItem_Get_ItemName", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = origid;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = moduleid;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    ItemName = sdr["Name"].ToString();
                }
            }
            return ItemName;
        }

        public static DataTable Get_Versions(int origid, int moduleid)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_RelatedActionItem_Get_Versions", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = origid;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = moduleid;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_ActionItems(int origid, int moduleid, int version)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("v4_RelatedActionItem_Get_ActionItems", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = origid;
                cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = moduleid;
                cmd.Parameters.Add("@Version", SqlDbType.Int, 4).Value = version;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

    }
}