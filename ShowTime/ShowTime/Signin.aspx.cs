using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime
{
    public partial class Signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;

                com.CommandText = "SELECT user_id,role_name from [dbo].[user] where user_id =@user_id and password = @password" ;
                com.Parameters.AddWithValue("@user_id",TextBox1.Text);
                com.Parameters.AddWithValue("@password", TextBox2.Text);

                SqlDataReader rdr; 
                rdr = com.ExecuteReader();
                if (rdr.Read())
                {
                    Session["user_id"]=rdr["user_id"].ToString();
                    Session["role_name"] = rdr["role_name"].ToString();
                    String role = rdr["role_name"].ToString();
                    if(role.Equals("Admin"))
                        Response.Redirect("Admin/AdminHome.aspx");
                    if(role.Equals("Theater User"))
                        Response.Redirect("Theater/TheaterHome.aspx");
                    if(role.Equals("Normal User"))
                        Response.Redirect("User/ClientHome.aspx");
                }
                else
                {
                    Label3.Visible = true;
                }
                con.Close();
                
            }
            catch (Exception exc)
            {
               
            }
        }
    }
}