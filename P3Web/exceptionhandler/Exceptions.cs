using P3Web.exceptionhandler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace P3Web
{
    public class Exceptions : Exception, IExceptionHandler
    {

        //public void LogException(string message, string userid)
        //{
        //   // throw new NotImplementedException();


        //}

        public async Task LogExceptionAsync(string message, int userid)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Add_Application_Exceptions]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar, int.MaxValue).Value = message;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = userid;
                cmd.Parameters.Add("@AppName", SqlDbType.NVarChar, 255).Value = "P3WebApp";
             //   cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                await cmd.ExecuteNonQueryAsync();
            }
            RedirectErrorPage();
        }

        public void LogExceptiontoDB(string message, int userid,  string IP, string url)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString))
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Add_Application_Exceptions]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar, int.MaxValue).Value = message;
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = userid;
                cmd.Parameters.Add("@AppName", SqlDbType.NVarChar, 255).Value = "P3WebApp";
                cmd.Parameters.Add("@UserIP", SqlDbType.NVarChar, 255).Value = IP;
                cmd.Parameters.Add("@Url", SqlDbType.NVarChar, 255).Value = url;
                //   cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.ExecuteNonQueryAsync();
            }
            RedirectErrorPage();
        }

        public void LogExceptiontoDB(string message, int userid)
        {
            throw new NotImplementedException();
        }

        public void RedirectErrorPage()
        {

         HttpContext.Current.Response.Redirect("~/ViewError.aspx", false);
        }
    }
}