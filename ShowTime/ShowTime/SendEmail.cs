using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace ShowTime
{
    public class SendEmail
    {
        public string sendEmail(string toAddress,string sub, string messag,string SucRes)
        {
            string result = "Verification mail Sent Successfully.." + SucRes;

            string senderID = "noreply.showtime@gmail.com";
            const string senderPassword = "showtimeRK@8866";

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
                MailMessage message = new MailMessage(senderID,toAddress,sub,messag);
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