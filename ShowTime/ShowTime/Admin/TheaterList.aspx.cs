using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.Admin
{
    public partial class TheaterList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || !Session["role_name"].Equals("Admin"))
            {
                Response.Redirect("~/Home.aspx");
            }        
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;    
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "select * from theater_user where user_id = @user_id";
            com.Parameters.AddWithValue("@user_id",row.Cells[1].Text);
            SqlDataReader rdr = com.ExecuteReader();
            if (rdr.Read())
            {
                Label4.Text = rdr["contact_no"].ToString();
                Label6.Text = rdr["address"].ToString();
                Label8.Text = rdr["city"].ToString();
                Label10.Text = rdr["state"].ToString();
                Label12.Text = rdr["pin_code"].ToString();
            }
            rdr.Close();
            con.Close();
            Table3.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "UPDATE theater_user set approval = @approval where user_id = @user_id1";
            com.Parameters.AddWithValue("@approval", "Y");
            com.Parameters.AddWithValue("@user_id1", row.Cells[1].Text);
            com.ExecuteNonQuery();
            GridView1.DataBind();
            GridView2.DataBind();
            Table3.Visible = false;

            string email = row.Cells[3].Text;
            string subject = "SHOWIME : THEATER APPROVAL";
            string msg = "Hello...<br> Your Theater is Verified By SHOWTIME And Approved. <br> You can now Sign In with Your Credentials.. ";
            SendEmail se = new SendEmail();
            se.sendEmail(email, subject, msg, "");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            GridViewRow row = GridView1.SelectedRow;
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "UPDATE theater_user set payment = '0' where user_id = @user_id2";
            com.Parameters.AddWithValue("@user_id2", row.Cells[1].Text);
            com.ExecuteNonQuery();
            GridView1.DataBind();
            Table4.Visible = false;

            string email = row.Cells[3].Text;
            string subject = "SHOWIME : PAYMENT";
            string msg = "Hello...<br> Your Remaining Amount Of Rs."+row.Cells[9].Text+" has been paid by SHOWTIME.<br><br><br>Thank You.";
            SendEmail se = new SendEmail();
            se.sendEmail(email, subject, msg, "");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        
            GridViewRow row = GridView1.SelectedRow;    
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "select * from theater_user where user_id = @user_id";
            com.Parameters.AddWithValue("@user_id",row.Cells[1].Text);
            SqlDataReader rdr = com.ExecuteReader();
            if (rdr.Read())
            {
                Label14.Text=rdr["user_id"].ToString();
                Label16.Text=rdr["payment"].ToString();
            }
            rdr.Close();
            con.Close();
            Table4.Visible = true;
        }        
    }
}