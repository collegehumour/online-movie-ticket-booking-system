using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime
{
    public partial class forgetPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SendEmail se = new SendEmail();
            string u_id = "", pswd = "", msg = "", email = TextBox1.Text, role = DropDownList1.SelectedValue.ToString();
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;

            com.CommandText = "SELECT user_id,password from [dbo].[user] where email =@email and role_name =@role_name";
            com.Parameters.AddWithValue("@email", TextBox1.Text);
            com.Parameters.AddWithValue("@role_name",role);

            SqlDataReader rdr;
            rdr = com.ExecuteReader();
            if (rdr.Read()) 
            {
                u_id = rdr["user_id"].ToString();
                pswd = rdr["password"].ToString();
            }
            rdr.Close();
            con.Close();
            msg ="User id is : <i>"+u_id+"</i><br>Password is : <i>"+pswd+"</i><br>Role is : <i>"+role+"</i><br>Please Login with This Credentials.";
            Label2.Text = se.sendEmail(email, "ShowTime : Forget Password.", msg, "Please Check Your Credentials..!!");
            Label2.Visible = true;
            Label2.ForeColor = System.Drawing.Color.Green;
            Button1.Text = "Resend";

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;

                com.CommandText = "SELECT email from [dbo].[user] where email =@email";
                com.Parameters.AddWithValue("@email", TextBox1.Text);

                SqlDataReader rdr;
                rdr = com.ExecuteReader();
                if (!rdr.Read())
                {
                    Label2.Visible = true;
                    TextBox1.Focus();
                }
                con.Close();

            }
            catch (Exception exc)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}