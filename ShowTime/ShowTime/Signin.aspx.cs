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
                    rdr.Close();
                    
                    if(role.Equals("Admin"))
                        Response.Redirect("Admin/AdminHome.aspx");


                    if (role.Equals("Theater User"))
                    {

                        com.CommandText = "SELECT user_id from [dbo].[theater_user] where user_id =@user_id2";
                        com.Parameters.AddWithValue("@user_id2", Session["user_id"]);
                        SqlDataReader rdr2 = com.ExecuteReader();
                        if (!rdr2.Read())
                        {
                            Response.Redirect("~/UserDetails.aspx");
                        }
                        rdr2.Close();
                        com.CommandText = "Select approval from theater_user where user_id=@user_id1";
                        com.Parameters.AddWithValue("@user_id1",Session["user_id"].ToString());
                        SqlDataReader rdr1 = com.ExecuteReader();
                        if (rdr1.Read())
                        {
                            if (rdr1["approval"].ToString().Equals("Y"))
                            {
                                Response.Redirect("Theater/TheaterHome.aspx");
                            }
                            else {
                                Label3.Text = "Your Theater Approval is Pending..Wait for Approval.";
                                Label3.ForeColor = System.Drawing.Color.Green;
                                Label3.Visible = true;
                                Session.RemoveAll();
                            }
                        }      
                    }
                    
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