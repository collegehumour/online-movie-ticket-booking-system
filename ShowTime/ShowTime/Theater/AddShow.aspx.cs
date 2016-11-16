using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.Theater
{
    public partial class AddShow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || !Session["role_name"].Equals("Theater User"))
            {
                Response.Redirect("~/Home.aspx");
            }        
            Label9.Text = Session["movie_name"].ToString();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String movie_id = Request.QueryString["id"];
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            int flag = 0;
            com.CommandText = "SELECT screen.screen_no,DATEADD(minute,movie.duration+15,show.show_time) AS end_time FROM screen INNER JOIN show ON screen.screen_id=show.screen_id INNER JOIN movie ON show.movie_id=movie.movie_id WHERE show.show_date=@show_date AND screen.user_id=@user_id1";
            com.Parameters.AddWithValue("@show_date", TextBox2.Text);
            com.Parameters.AddWithValue("@user_id1", Session["user_id"]);
            SqlDataReader rdr1 = com.ExecuteReader();
            while (rdr1.Read())
            {
                if (rdr1["screen_no"].ToString() == DropDownList1.SelectedItem.Text)
                {
                    if (DateTime.Compare(DateTime.Parse(rdr1["end_time"].ToString()), DateTime.Parse(TextBox3.Text)) > 0)
                    {
                        TextBox3.Text = "";
                        TextBox3.Focus();
                        Label10.Visible = true;
                        flag = 1;
                    }
                    
                }
            }
            if (flag == 0)
            { Label10.Visible = false; }
            rdr1.Close();
            com.CommandText = "SELECT seat_class FROM [dbo].[class] WHERE screen_id=(SELECT screen_id FROM [dbo].[screen] where screen_no=@screen_no AND user_id=@user_id)";
            com.Parameters.AddWithValue("@screen_no",DropDownList1.SelectedItem.Text);
            com.Parameters.AddWithValue("@user_id",Session["user_id"]);
            SqlDataReader rdr = com.ExecuteReader();
            
            int classes=0;
            while (rdr.Read())
            { 
                classes++;
                if (classes == 1)
                {
                    Label5.Text = rdr["seat_class"].ToString();
                    Row1.Visible = true;
                }
                if (classes==2)
                {
                    Label6.Text = rdr["seat_class"].ToString();
                    Row2.Visible = true;
                }
                if (classes==3)
                {
                    Label7.Text = rdr["seat_class"].ToString();
                    Row3.Visible = true;
                }
                if (classes==4)
                {
                    Label8.Text = rdr["seat_class"].ToString();
                    Row4.Visible = true;
                }
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String movie_id = Session["movie_id"].ToString();
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "SELECT screen_id FROM [dbo].[screen] where screen_no=@screen_no AND user_id=@user_id";
            com.Parameters.AddWithValue("@screen_no", DropDownList1.SelectedItem.Text);
            com.Parameters.AddWithValue("@user_id", Session["user_id"]);
            SqlDataReader rdr = com.ExecuteReader();
            rdr.Read();
            string screen_id = rdr["screen_id"].ToString();
            rdr.Close();

            com.CommandText = "INSERT INTO [dbo].[show](show_date,show_time,movie_id,screen_id) VALUES (@show_date,@show_time,@movie_id,@screen_id)";
            com.Parameters.AddWithValue("@show_date",TextBox2.Text);
            com.Parameters.AddWithValue("@show_time", TextBox3.Text);
            com.Parameters.AddWithValue("@movie_id",movie_id);
            com.Parameters.AddWithValue("@screen_id",screen_id);
            com.ExecuteNonQuery();

            com.CommandText = "SELECT show_id FROM [dbo].[show] WHERE show_date=@show_date1 AND show_time=@show_time1 AND movie_id=@movie_id1 AND screen_id=@screen_id1";
            com.Parameters.AddWithValue("@show_date1", TextBox2.Text);
            com.Parameters.AddWithValue("@show_time1", TextBox3.Text);
            com.Parameters.AddWithValue("@movie_id1", movie_id);
            com.Parameters.AddWithValue("@screen_id1", screen_id);
            SqlDataReader rdr1 = com.ExecuteReader();
            rdr1.Read();
            string show_id = rdr1["show_id"].ToString();
            rdr1.Close();


            com.CommandText = "SELECT class_id FROM [dbo].[class] WHERE screen_id=(SELECT screen_id FROM [dbo].[screen] where screen_no=@screen_no1 AND user_id=@user_id1)";
            com.Parameters.AddWithValue("@screen_no1", DropDownList1.SelectedItem.Text);
            com.Parameters.AddWithValue("@user_id1", Session["user_id"]);
            SqlDataReader rdr2 = com.ExecuteReader();

            int classes = 0;
            String[] classid = new String[4];

            while (rdr2.Read())
            {
                classid[classes] = rdr2["class_id"].ToString();
                classes++;
            }
            rdr2.Close();
                
                if (classes >= 4)
                {
                    com.CommandText = "INSERT INTO [dbo].[show_price](class_id,price,show_id) VALUES (@class_id3,@price3,@show_id3)";
                    com.Parameters.AddWithValue("@class_id3", classid[3]);
                    com.Parameters.AddWithValue("@price3", TextBox7.Text);
                    com.Parameters.AddWithValue("@show_id3", show_id);
                    com.ExecuteNonQuery();
                }
                if (classes >= 3)
                {
                    com.CommandText = "INSERT INTO [dbo].[show_price](class_id,price,show_id) VALUES (@class_id2,@price2,@show_id2)";
                    com.Parameters.AddWithValue("@class_id2", classid[2]);
                    com.Parameters.AddWithValue("@price2", TextBox6.Text);
                    com.Parameters.AddWithValue("@show_id2", show_id);
                    com.ExecuteNonQuery();
                }
                if (classes >= 2)
                {
                    com.CommandText = "INSERT INTO [dbo].[show_price](class_id,price,show_id) VALUES (@class_id1,@price1,@show_id1)";
                    com.Parameters.AddWithValue("@class_id1", classid[1]);
                    com.Parameters.AddWithValue("@price1", TextBox5.Text);
                    com.Parameters.AddWithValue("@show_id1", show_id);
                    com.ExecuteNonQuery();
                }
                if (classes >= 1)
                {
                    com.CommandText = "INSERT INTO [dbo].[show_price](class_id,price,show_id) VALUES (@class_id,@price,@show_id)";
                    com.Parameters.AddWithValue("@class_id", classid[0]);
                    com.Parameters.AddWithValue("@price",TextBox4.Text);
                    com.Parameters.AddWithValue("@show_id",show_id);
                    com.ExecuteNonQuery();
                }
                Response.Redirect("ShowList.aspx");
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            if (DateTime.Parse(TextBox2.Text) < DateTime.Now)
            {
                TextBox2.Text = "";
                Label21.Visible = true;
            }
            else
            {
                Label21.Visible = false;
            }
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            int flag = 0;
            com.CommandText = "SELECT screen.screen_no,DATEADD(minute,movie.duration+15,show.show_time) AS end_time FROM screen INNER JOIN show ON screen.screen_id=show.screen_id INNER JOIN movie ON show.movie_id=movie.movie_id WHERE show.show_date=@show_date AND screen.user_id=@user_id1";
            com.Parameters.AddWithValue("@show_date", TextBox2.Text);
            com.Parameters.AddWithValue("@user_id1", Session["user_id"]);
            SqlDataReader rdr1 = com.ExecuteReader();
            while (rdr1.Read())
            {
                if (rdr1["screen_no"].ToString() == DropDownList1.SelectedItem.Text)
                {
                    if(TextBox3.Text!="")
                        if (DateTime.Compare(DateTime.Parse(rdr1["end_time"].ToString()), DateTime.Parse(TextBox3.Text)) > 0)
                        {
                            TextBox3.Text = "";
                            TextBox3.Focus();
                            Label10.Visible = true;
                            flag = 1;
                        }
                }
            }
            if (flag == 0)
            { Label10.Visible = false; }
            rdr1.Close();
            con.Close();
        }
    }
}