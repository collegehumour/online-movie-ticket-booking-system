using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime
{
    public partial class AfterRegistration : System.Web.UI.Page
    {
        string uid; 
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (Request.QueryString["id"] != null)
            {
                if (!this.IsPostBack)
                {
                    try
                    {
                        uid = Decrypt(HttpUtility.UrlDecode(Request.QueryString["id"]));
                        string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        SqlConnection con = new SqlConnection(connectionString);
                        con.Open();
                        SqlCommand com = new SqlCommand();
                        com.Connection = con;
                        com.CommandText = @"insert into [dbo].[user] (user_id,name,email,password,role_name) select * from [dbo].[temp_user] where user_id='" + uid + "'";
                        com.ExecuteNonQuery();
                        com.CommandText = @"delete from [dbo].[temp_user] where user_id=@user_id";
                        com.Parameters.AddWithValue("@user_id",uid);
                        com.ExecuteNonQuery();
                        con.Close();
                        Label1.Text = "Your Account is Verified successfully.";

                    }
                    catch (Exception ex)
                    {

                        //Response.Redirect("Error.aspx");
                    }
                }

            }
            else {
                Label1.Text = "Invalid URL...Please SignUp Again..";
            }
        }

        private string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}