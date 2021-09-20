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
    public class ParaLink
    {
        public static async Task<DataSet> Get_ParaLinksAsync(int OrigID, int ModuleID)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlDataAdapter da = new SqlDataAdapter("dbo.v4_ParaLink_Get_PLinks", conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                da.SelectCommand.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                da.TableMappings.Add("table0", "LinkedTo");
                da.TableMappings.Add("table1", "LinkedFrom");

                da.Fill(ds);
            }
            return ds;
        }

        public static void Add_Paralinks(int OrigID, int ModuleID, DataTable SelectedItems, string UserName, int UserID, int LinkedType)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_ParaLink_Add_PLink]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };                
                foreach (DataRow dr in SelectedItems.Rows)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@OrigID", SqlDbType.Int, 4).Value = OrigID;
                    cmd.Parameters.Add("@ModuleID", SqlDbType.Int, 4).Value = ModuleID;
                    cmd.Parameters.Add("@LinkedOrigID", SqlDbType.Int, 4).Value = Convert.ToInt32(dr["OrigID"]);
                    cmd.Parameters.Add("@LinkedModuleID", SqlDbType.Int, 4).Value = Convert.ToInt32(dr["ModuleID"]);
                    cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                    cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                    cmd.Parameters.Add("@LinkedType", SqlDbType.Int, 4).Value = LinkedType;
                    cmd.ExecuteNonQuery();                    
                }
            }
        }

        public static async Task Remove_ParaLink(int PLinkID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_ParaLink_Remove_PLink]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("PLinkID", SqlDbType.Int, 4).Value = PLinkID;
                await cmd.ExecuteNonQueryAsync();
            }
        }
    }
}