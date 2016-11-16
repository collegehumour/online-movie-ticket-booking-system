using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime
{
    public partial class UserDetails : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/Home.aspx");
            }        
            TextBox1.Text = Session["user_id"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                
                String connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                SqlCommand com1 = new SqlCommand();
                com1.Connection = con;
                com.CommandText = "SELECT role_name,email from [user] where ([user_id] = @user_id1)";
                com.Parameters.AddWithValue("@user_id1", Session["user_id"]);
                SqlDataReader rdr = com.ExecuteReader();
                if(rdr.Read())
                {
                    if (rdr["role_name"].ToString().Equals("Normal User"))
                    {
                        string email = rdr["email"].ToString();
                        rdr.Close();
                        com1.CommandText = "insert into [dbo].[normal_user] (user_id,mobile_no,address,city,state,pin_code) values (@user_id,@mobile_no,@address,@city,@state,@pin_code)";
                        com1.Parameters.AddWithValue("@user_id", Session["user_id"]);
                        com1.Parameters.AddWithValue("@mobile_no", TextBox2.Text);
                        com1.Parameters.AddWithValue("@address", TextBox3.Text);
                        com1.Parameters.AddWithValue("@city", DropDownList1.SelectedValue.ToString());
                        com1.Parameters.AddWithValue("@state", DropDownList2.SelectedValue.ToString());
                        com1.Parameters.AddWithValue("@pin_code", TextBox4.Text);
                        com1.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect("./User/ClientHome.aspx", false);
                        SendEmail se = new SendEmail();
                        se.sendEmail(email, "SHOWTIME : USER DETAILS ADDED", "Thank you For Submittting Your Details.<br> You can log in with Your Credentials.", "");
                        
                    }
                    else if (rdr["role_name"].ToString().Equals("Theater User"))
                    {
                        string email = rdr["email"].ToString();
                        rdr.Close();
                        com1.CommandText = "insert into [dbo].[theater_user] (user_id,contact_no,address,city,state,pin_code) values (@user_id2,@contact_no,@address2,@city2,@state2,@pin_code2)";
                        com1.Parameters.AddWithValue("@user_id2", Session["user_id"]);
                        com1.Parameters.AddWithValue("@contact_no", TextBox2.Text);
                        com1.Parameters.AddWithValue("@address2", TextBox3.Text);
                        com1.Parameters.AddWithValue("@city2", DropDownList1.SelectedValue.ToString());
                        com1.Parameters.AddWithValue("@state2", DropDownList2.SelectedValue.ToString());
                        com1.Parameters.AddWithValue("@pin_code2", TextBox4.Text);
                        com1.ExecuteNonQuery();
                        con.Close();

                        SendEmail se = new SendEmail();
                        se.sendEmail(email,"SHOWTIME : USER DETAILS ADDED","Thank you For Submittting Your Details. Wait For Approval.<br> After Receiveing Approval Email You can Log in With Your Credentials.","");

                        Response.Redirect("~/Home.aspx", false);     
                   
                    }
                }        
            }
            catch (Exception exc)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}