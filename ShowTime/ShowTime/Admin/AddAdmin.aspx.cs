using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.Admin
{
    public partial class AddAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || !Session["role_name"].Equals("Admin"))
            {
                Response.Redirect("~/Home.aspx");
            }        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "insert into [user] (user_id,name,email,password,role_name) values (@user_id,@name,@email,@password,'Admin')";
            com.Parameters.AddWithValue("@user_id",TextBox2.Text);
            com.Parameters.AddWithValue("@name",TextBox3.Text);
            com.Parameters.AddWithValue("@email",TextBox4.Text);
            com.Parameters.AddWithValue("@password", TextBox5.Text);
            com.ExecuteNonQuery();

            com.CommandText = "insert into admin_user (user_id,post) values (@user_id1,@post)";
            com.Parameters.AddWithValue("@user_id1", TextBox2.Text);
            com.Parameters.AddWithValue("@post", TextBox6.Text);
            com.ExecuteNonQuery();
            con.Close();

            Label6.Visible = true;

            SendEmail se = new SendEmail();
            se.sendEmail(TextBox4.Text,"SHOWTIME : WELCOME ADMIN","You are Added as new Admin.<br>Your UserName is : <b>"+ TextBox2.Text+"</b> and <br>Password is : <b>"+TextBox5.Text +"</b> .","");


        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;

                com.CommandText = "SELECT user_id from [dbo].[user] where email =@email and role_name='Admin'";
                com.Parameters.AddWithValue("@email", TextBox3.Text);
                
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

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;

                com.CommandText = "SELECT user_id from [dbo].[user] where user_id =@user_id";
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

    }
}