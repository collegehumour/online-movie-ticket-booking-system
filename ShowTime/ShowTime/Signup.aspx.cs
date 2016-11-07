﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace ShowTime
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String msg="";
            try{
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command; 
                com.CommandText = "insert into [dbo].[temp_user] (user_id,name,email,password,role_name) values (@user_id,@name,@email,@password,@role_name)";

                com.Parameters.AddWithValue("@name", TextBox1.Text);
                com.Parameters.AddWithValue("@user_id", TextBox2.Text);
                com.Parameters.AddWithValue("@email", TextBox3.Text);
                com.Parameters.AddWithValue("@password", TextBox4.Text);
                com.Parameters.AddWithValue("@role_name", DropDownList1.SelectedItem.Text);
                com.ExecuteNonQuery();
                con.Close();

                string user_id = TextBox2.Text.ToString();
                
                string encrypteduserid = HttpUtility.UrlEncode(Encrypt(user_id));
                
                msg = "http://localhost:46662/AfterRegistration.aspx?id" + "=" + encrypteduserid;

                string link = "Please Click the link to verify Your EmailId . . .<br><a href = " + msg + ">Click_here</a>";
                
                Label9.ForeColor = System.Drawing.Color.Green;

                Label9.Text = SendEmail(TextBox3.Text,link);

                //Response.Redirect("AfterRegistration.aspx");

                
            }
            catch (Exception exc) {
                Label1.Text = exc.Message;
            }
        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;

                com.CommandText = "SELECT user_id from [dbo].[temp_user] where user_id =@user_id";
                com.Parameters.AddWithValue("@user_id", TextBox2.Text);

                SqlDataReader rdr;
                rdr = com.ExecuteReader();
                if (rdr.Read())
                {
                    TextBox2.Text = "";
                    Label7.Visible = true;
                    TextBox2.Focus();
                }
                else
                {
                    Label7.Visible = false;
                    TextBox3.Focus();
                }
                con.Close();

            }
            catch (Exception exc)
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;

                com.CommandText = "SELECT user_id from [dbo].[temp_user] where email =@email and role_name=@role_name";
                com.Parameters.AddWithValue("@email", TextBox3.Text);
                com.Parameters.AddWithValue("@role_name", DropDownList1.SelectedItem.Text);

                SqlDataReader rdr;
                rdr = com.ExecuteReader();
                if (rdr.Read())
                {
                    Label8.Visible = true;
                    TextBox3.Text = "";
                    TextBox3.Focus();
                }
                else
                {
                    Label8.Visible = false;
                    TextBox4.Focus();
                }
                con.Close();

            }
            catch (Exception exc)
            {
                Response.Redirect("Error.aspx");
            }
        }

        private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
        protected string SendEmail(string toAddress, String messag)
        {
            string result = "Verification mail Sent Successfully.. Please verify Your Account..!!";

            string senderID = "Hackrooks@gmail.com";
            const string senderPassword = "HackRooks@123";

            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                    Timeout = 30000,

                };
                MailMessage message = new MailMessage(senderID, toAddress, "ShowTime : Verify Your Account",messag);
                message.IsBodyHtml = true;
                smtp.Send(message);
            }
            catch (Exception ex)
            {
                result = "Error sending email.!!!";
            }

            return result;
        }
    }
}