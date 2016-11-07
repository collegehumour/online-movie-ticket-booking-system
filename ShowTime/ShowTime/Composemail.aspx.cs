using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace WebApplication1
{
    public partial class Composemail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string SendEmail(string toAddress, string subject, string body)
        {
            string result = "Message Sent Successfully..!!";

            string senderID = "Hackrooks@gmail.com";// use sender’s email id here..
            const string senderPassword = "HackRooks@123"; // sender password here…

            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com", // smtp server address here…
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                    Timeout = 30000,

                };
            MailMessage message = new MailMessage(senderID, toAddress, subject, body);

                smtp.Send(message);
            }
            catch (Exception ex)
            {
                result = "Error sending email.!!!";
            }

            return result;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.BackColor = System.Drawing.Color.Red;
            Label1.Text = SendEmail(TextBox1.Text, TextBox2.Text, TextBox3.Text);
        }            
    }
}