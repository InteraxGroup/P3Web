using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security;
using System.Security.Cryptography;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading.Tasks;

namespace Paradigm3.datalayer
{
    public class P3Security
    {

		#region Functions

		//public static string Encrypt(string strToEncrypt, string strKey)
		//{
		//	using (MD5CryptoServiceProvider objHashMD5 = new MD5CryptoServiceProvider())
		//	{
		//		byte[] byteHash;
		//		byte[] byteBuff;

		//		byteHash = objHashMD5.ComputeHash(Encoding.ASCII.GetBytes(strKey));
		//		TripleDESCryptoServiceProvider objDESCrypto = new TripleDESCryptoServiceProvider();
		//		objDESCrypto.Key = byteHash;
		//		objDESCrypto.Mode = CipherMode.ECB;
		//		//CBC, CFB
		//		byteBuff = Encoding.ASCII.GetBytes(strToEncrypt);
		//		return Convert.ToBase64String(objDESCrypto.CreateEncryptor().TransformFinalBlock(byteBuff, 0, byteBuff.Length));
		//	}
		//}

        public static string Encrypt(string strToEncrypt, string strKey, bool IsFIPS)
        {
            string result = string.Empty;
            if (!IsFIPS)
            {
                using (MD5CryptoServiceProvider objHashMD5 = new MD5CryptoServiceProvider())
                {
                    byte[] byteHash;
                    byte[] byteBuff;

                    byteHash = objHashMD5.ComputeHash(Encoding.ASCII.GetBytes(strKey));
					TripleDESCryptoServiceProvider objDESCrypto = new TripleDESCryptoServiceProvider
					{
						Key = byteHash,
						Mode = CipherMode.ECB
					};
					//CBC, CFB
					byteBuff = Encoding.ASCII.GetBytes(strToEncrypt);
                    result = Convert.ToBase64String(objDESCrypto.CreateEncryptor().TransformFinalBlock(byteBuff, 0, byteBuff.Length));
                }
            }
            else
            {
                using (TripleDESCryptoServiceProvider objDESCrypto = new TripleDESCryptoServiceProvider())
                {
                    byte[] byteHash = new byte[24];
                    byte[] byteBuff;
                    byte[] byteExtra = new byte[4];
                    byte[] byteTemp;
                    string strTempKey = strKey;

                    SHA1CryptoServiceProvider objHashSHA1 = new SHA1CryptoServiceProvider();
                    byteTemp = objHashSHA1.ComputeHash(Encoding.ASCII.GetBytes(strTempKey));
                    byteExtra[0] = 125;
                    byteExtra[1] = 126;
                    byteExtra[2] = 127;
                    byteExtra[3] = 128;

                    byteTemp.CopyTo(byteHash, 0);
                    byteExtra.CopyTo(byteHash, 20);

                    objHashSHA1 = null/* TODO Change to default(_) if this is not a reference type */;
                    objDESCrypto.Key = byteHash;
                    objDESCrypto.Mode = CipherMode.ECB;

                    byteBuff = Encoding.ASCII.GetBytes(strToEncrypt);
                    result = Convert.ToBase64String(objDESCrypto.CreateEncryptor().TransformFinalBlock(byteBuff, 0, byteBuff.Length));
                }
            }
            return result;
        }

		public static string ProcessGTST(string sInputStr, long lEncodeOrDecode)
        {
            string sOutputString;
            ASCIIEncoding myASCIIEncoding;
            byte[] myBytes;

            sOutputString = sInputStr;

            if ((lEncodeOrDecode == 1))
            {
                myASCIIEncoding = new ASCIIEncoding();
                myBytes = myASCIIEncoding.GetBytes(sOutputString);
                sOutputString = Convert.ToBase64String(myBytes);
            }
            else if ((lEncodeOrDecode == 2))
            {
                myBytes = Convert.FromBase64String(sOutputString);
                sOutputString = new UTF8Encoding().GetString(myBytes);
            }
            return sOutputString;
        }

        public static async Task<string> EncryptAsync(string strToEncrypt, string strKey, bool IsFIPS)
        {
            string result = string.Empty;
            if (!IsFIPS)
            {
                using (MD5CryptoServiceProvider objHashMD5 = new MD5CryptoServiceProvider())
                {
                    byte[] byteHash;
                    byte[] byteBuff;

                    byteHash = objHashMD5.ComputeHash(Encoding.ASCII.GetBytes(strKey));
                    TripleDESCryptoServiceProvider objDESCrypto = new TripleDESCryptoServiceProvider();
                    objDESCrypto.Key = byteHash;
                    objDESCrypto.Mode = CipherMode.ECB;
                    //CBC, CFB
                    byteBuff = Encoding.ASCII.GetBytes(strToEncrypt);
                    result = Convert.ToBase64String(objDESCrypto.CreateEncryptor().TransformFinalBlock(byteBuff, 0, byteBuff.Length));
                }
            }
            else
            {
                using (TripleDESCryptoServiceProvider objDESCrypto = new TripleDESCryptoServiceProvider())
                {
                    byte[] byteHash = new byte[24];
                    byte[] byteBuff;
                    byte[] byteExtra = new byte[4];
                    byte[] byteTemp;
                    string strTempKey = strKey;

                    SHA1CryptoServiceProvider objHashSHA1 = new SHA1CryptoServiceProvider();
                    byteTemp = objHashSHA1.ComputeHash(Encoding.ASCII.GetBytes(strTempKey));
                    byteExtra[0] = 125;
                    byteExtra[1] = 126;
                    byteExtra[2] = 127;
                    byteExtra[3] = 128;

                    byteTemp.CopyTo(byteHash, 0);
                    byteExtra.CopyTo(byteHash, 20);

                    objHashSHA1 = null/* TODO Change to default(_) if this is not a reference type */;
                    objDESCrypto.Key = byteHash;
                    objDESCrypto.Mode = CipherMode.ECB;

                    byteBuff = Encoding.ASCII.GetBytes(strToEncrypt);
                    result = Convert.ToBase64String(objDESCrypto.CreateEncryptor().TransformFinalBlock(byteBuff, 0, byteBuff.Length));
                }
            }
            return await Task.FromResult(result);
        }

        public static string Decrypt(string strEncrypted, string strKey)
        {
            TripleDESCryptoServiceProvider objDESCrypto = new TripleDESCryptoServiceProvider();
            MD5CryptoServiceProvider objHashMD5 = new MD5CryptoServiceProvider();

            byte[] byteHash;
            byte[] byteBuff;
            string strTempKey = strKey;

            byteHash = objHashMD5.ComputeHash(Encoding.ASCII.GetBytes(strTempKey));
            objHashMD5 = null;
            objDESCrypto.Key = byteHash;
            objDESCrypto.Mode = CipherMode.ECB;
            //CBC, CFB
            byteBuff = Convert.FromBase64String(strEncrypted);
            string strDecrypted = Encoding.ASCII.GetString(objDESCrypto.CreateDecryptor().TransformFinalBlock(byteBuff, 0, byteBuff.Length));
            objDESCrypto = null;

            return strDecrypted;
        }

        public static string Get_PWStatus(string userName)
        {
            string PWStatus = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Login_Get_PWordStatus", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = userName;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    PWStatus = sdr[0].ToString();
                }
                sdr.Close();
            }

            if (PWStatus.Length > 0)
            {
                char c = PWStatus[2];
                PWStatus = c.ToString();
            }
            return PWStatus;
        }

        public static async Task<string> Get_PWStatusAsync(string username)
        {
            string PWStatus = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Login_Get_PWordStatus", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = username;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    PWStatus = sdr[0].ToString();
                }
            }

            if (PWStatus.Length > 0)
            {
                char c = PWStatus[2];
                PWStatus = c.ToString();
            }
            return PWStatus;
        }

        public static DataTable Get_FDAStatus()
        {
            DataTable dt = new DataTable();        
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Login_Get_FDAStatus", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static DataTable Get_ForbiddenPasswords(string UserName, int PrevPass)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Login_Get_ForbiddenPasswords", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            dt.AsEnumerable().Take(PrevPass).CopyToDataTable();
            return dt;
        }

        public static string Get_UserOptionSet(string UserName)
        {
            string OptionSet = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Login_Get_UserOptionSet", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = UserName;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    OptionSet = sdr["OptionSet"].ToString();
                }
            }
            return OptionSet;
        }

        public static bool IsUserNamePWordValid(string sUsername, string encPassword)
        {
            bool isValid = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Login_Get_User", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = sUsername;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 255).Value = encPassword;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    isValid = true;
                }
            }
            return isValid;
        }

        public static async Task<bool> IsUserValidAsync(string username, string password)
        {
            bool isValid = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    await conn.OpenAsync();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Login_Get_User", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = username;
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 255).Value = password;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
                {
                    isValid = true;
                }
            }
            return isValid;
        }

        public static bool IsWinP3User(string username)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Login_Get_WinUser]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = username;
                SqlDataReader sdr = cmd.ExecuteReader();
                while(sdr.Read())
                {
                    result = true;
                }
            }
            return result;
        }

        private static DataTable UserLogin(string sUsername, string encPassword)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("dbo.v4_Login_Get_User", conn)
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandTimeout = 120
                    };
                    cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = sUsername;
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 255).Value = encPassword;
                    SqlDataReader sdr = cmd.ExecuteReader();
                    dt.Load(sdr);
                }
            }
            return dt;
        }

        private static DataTable WinUserLogin(string username)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[v4_Login_Get_WinUser]", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = username;
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);
            }
            return dt;
        }

        public static bool IsFIPS()
        {
            bool IsFIPS = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [Value2] FROM [dbo].[SystemSettings] WHERE [P3Key] = 'DltSPEmptyFldr'", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    if (sdr["Value2"] != null)
                    {
                        if (sdr["Value2"].Equals("True"))
                        {
                            IsFIPS = true;
                        }
                    }
                }
            }
            return IsFIPS;
        }

        public static async Task<string> DigitalSignature(string username, string password, bool IsFips)
		{
            string result = "No User";
            string encPassword = await EncryptAsync(password, username.ToUpper(), IsFips);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    await conn.OpenAsync();
				}
                SqlCommand cmd = new SqlCommand("SELECT [FullName] FROM [dbo].[Items1] WHERE [Name] = @UserName AND [PWord] = @PWord AND [Status] <> 9 AND [IsDeleted] = 0", conn)
                {
                    CommandType = CommandType.Text
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = username;
                cmd.Parameters.Add("@PWord", SqlDbType.NVarChar, 255).Value = encPassword;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
				{
                    result = sdr["FullName"].ToString();
				}
			}
            return result;
		}

        #endregion

        #region Subroutines

        public static void Do_Login(string username, string encPassword)
        {
            // Create authentication objects and login user.
            DataTable dsUser = UserLogin(username, encPassword);

            if (dsUser.Rows.Count > 0)
            {
                // Create user property strings from Paradigm 3 for authentication cookie.
                string usrID = dsUser.Rows[0]["UserID"].ToString();
                string usrFullName = dsUser.Rows[0]["FullName"].ToString();
                string usrEmail = dsUser.Rows[0]["Email"].ToString();
                string usrStatus = dsUser.Rows[0]["Status"].ToString();
                string usrModuleAccess = dsUser.Rows[0]["ModuleAccess"].ToString();
                string usrOptionSet = dsUser.Rows[0]["OptionSet"].ToString();
                string usrLanguage = dsUser.Rows[0]["MyLanguage"].ToString();
                string usrLoginName = dsUser.Rows[0]["Name"].ToString();
                string usrData = usrID + "," + usrFullName + "," + usrEmail + "," + usrStatus + "," + usrModuleAccess + "," + usrOptionSet + "," + usrLanguage + "," + usrLoginName;
                // Create authentication cookie for user
                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, username, DateTime.Now, DateTime.Now.AddMinutes(60), false, usrData, FormsAuthentication.FormsCookiePath);
                string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
				HttpCookie myCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)
				{
					HttpOnly = true
				};
                HttpContext.Current.Response.Cookies.Add(myCookie);
            }
            dsUser.Dispose();
        }

        public static void Do_WinLogin(string username)
        {
            // Create authentication objects and login user.
            DataTable dsUser = WinUserLogin(username);

            if (dsUser.Rows.Count > 0)
            {
                // Create user property strings from Paradigm 3 for authentication cookie.
                string usrID = dsUser.Rows[0]["UserID"].ToString();
                string usrFullName = dsUser.Rows[0]["FullName"].ToString();
                string usrEmail = dsUser.Rows[0]["Email"].ToString();
                string usrStatus = dsUser.Rows[0]["Status"].ToString();
                string usrModuleAccess = dsUser.Rows[0]["ModuleAccess"].ToString();
                string usrOptionSet = dsUser.Rows[0]["OptionSet"].ToString();
                string usrLanguage = dsUser.Rows[0]["MyLanguage"].ToString();
                string usrLoginName = dsUser.Rows[0]["Name"].ToString();
                string usrData = usrID + "," + usrFullName + "," + usrEmail + "," + usrStatus + "," + usrModuleAccess + "," + usrOptionSet + "," + usrLanguage + "," + usrLoginName;
                // Create authentication cookie for user
                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, username, DateTime.Now, DateTime.Now.AddMinutes(60), false, usrData, FormsAuthentication.FormsCookiePath);
                string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
                HttpCookie myCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)
                {
                    HttpOnly = true
                };
                HttpContext.Current.Response.Cookies.Add(myCookie);
            }
            dsUser.Dispose();
        }

        public static void Do_Logout()
        {
            FormsAuthentication.SignOut();
			HttpContext.Current.Session.Abandon();
        }

        public static void Do_ChangePassword(int UserID, string NewPass, string OptionSet, int IsFDA)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
            {
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("dbo.v4_Login_Update_PWord", conn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = UserID;
                cmd.Parameters.Add("@NewPass", SqlDbType.NVarChar, 255).Value = NewPass;
                cmd.Parameters.Add("@OptionSet", SqlDbType.NVarChar, 255).Value = OptionSet;
                cmd.Parameters.Add("@IsFDA", SqlDbType.Bit, 2).Value = IsFDA;
                cmd.ExecuteNonQuery();
            }
        }

        public static async Task<bool> Confirm_PasswordAsync(string key, string encpw)
		{
            bool result = false;
            string response = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    await conn.OpenAsync();
				}
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 [PWord] FROM [dbo].[Items1] WHERE [Name] = @UserName AND [IsDeleted] = 0 AND [Status] NOT IN (-2,9)", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar, 255).Value = key;
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
				{
                    response = sdr["Pword"].ToString();
				}
			}

            if (encpw == response)
			{
                result = true;
			}
            return result;
		}

        #endregion

        #region Asynchronous Methods

        public static async Task Do_LoginAsync(string username, string password)
        {
            await Task.Run(() => { Do_Login(username, password); });
        }

        public static async Task Do_WinLoginAsync(string username)
        {
            await Task.Run(() => { Do_WinLogin(username); });
        }

        public static async Task Do_LogoutAsync()
        {
            await Task.Run(() => { Do_Logout(); });
        }

        public static async Task Do_ChangePasswordAsync(int UserID, string NewPass, string OptionSet, int IsFDA)
        {
            await Task.Run(() => { Do_ChangePassword(UserID, NewPass, OptionSet, IsFDA); });
        }

        public static async Task<bool> IsValidGroupIDAsync(int ModuleID, int GroupID)
		{
            bool result = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Paradigm3"].ConnectionString);
            string ModuleTable;
            switch (ModuleID)
			{
                case 4:
                    ModuleTable = "[dbo].[Groups4]";
                    break;
                case 6:
                    ModuleTable = "[dbo].[Groups6]";
                    break;
                case 12:
                    ModuleTable = "[dbo].[Groups12]";
                    break;
                case 14:
                    ModuleTable = "[dbo].[Groups14]";
                    break;
                default:
                    ModuleTable = "[dbo].[Groups3]";
                    break;
			}
            using (conn)
			{
                if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
				{
                    await conn.OpenAsync();
				}
                SqlCommand cmd = new SqlCommand("SELECT [GroupID] FROM " + ModuleTable + " WHERE [IsDeleted] = 0 AND ISNULL([Name], '') <> ''", conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = 120
                };
                SqlDataReader sdr = await cmd.ExecuteReaderAsync();
                while (sdr.Read())
				{
                    result = true;
				}
			}
            return result;
		}

        #endregion

    }
}