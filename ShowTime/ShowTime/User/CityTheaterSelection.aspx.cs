using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.User
{
    public partial class CityTheaterSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || !Session["role_name"].Equals("Normal User"))
            {
                Response.Redirect("~/Home.aspx");
            }     
        }
        protected void View2_Activate(object sender, EventArgs e)
        {
            String movie_id = Request.QueryString["id"];
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;

            com.CommandText = "SELECT class.seat_class,show_price.price,seat.seat_no FROM class INNER JOIN screen ON class.screen_id = screen.screen_id INNER JOIN seat ON class.class_id = seat.class_id INNER JOIN show ON screen.screen_id = show.screen_id INNER JOIN show_price ON class.class_id = show_price.class_id AND show.show_id = show_price.show_id INNER JOIN theater_user ON screen.user_id = theater_user.user_id INNER JOIN [user] ON theater_user.user_id = [user].user_id WHERE [show].show_date=@show_date AND [show].movie_id=@movie_id AND [theater_user].city=@city AND [user].name = @name AND [show].show_time=@show_time";
            com.Parameters.AddWithValue("@show_date", TextBox1.Text);
            com.Parameters.AddWithValue("@movie_id", Session["movie_id"]);
            com.Parameters.AddWithValue("@city", DropDownList1.SelectedValue);
            com.Parameters.AddWithValue("@name", DropDownList2.SelectedValue);
            com.Parameters.AddWithValue("@show_time", DropDownList3.SelectedValue);

            SqlDataReader rdr = com.ExecuteReader();
            rdr.Read();
            string cls = rdr["seat_class"].ToString();
            char start = rdr["seat_no"].ToString()[0];
            int i = 0;
            Label6.Text = cls+" : ";
            Label7.Text = "Starts From "+start.ToString()+" - ";
            Label8.Text = "Rs. "+rdr["price"].ToString();
            Row1.Visible = true;
            
            while (rdr.Read())
            {
                if (!(cls.Equals(rdr["seat_class"].ToString())))
                {
                    if (i == 0)
                    {
                        Label9.Text = rdr["seat_class"].ToString()+" : ";
                        Label10.Text = "Starts From "+rdr["seat_no"].ToString()[0].ToString()+" - ";
                        Label11.Text = "Rs. " + rdr["price"].ToString();
                        Row2.Visible = true;
                    }
                    if (i == 1)
                    {
                        Label12.Text = rdr["seat_class"].ToString()+" : ";
                        Label13.Text = "Starts From " + rdr["seat_no"].ToString()[0].ToString()+" - ";
                        Label14.Text = "Rs. " + rdr["price"].ToString();
                        Row3.Visible = true;
                    }
                    if (i == 2)
                    {
                        Label15.Text = rdr["seat_class"].ToString()+" : ";
                        Label16.Text = "Starts From " +rdr["seat_no"].ToString()[0].ToString()+" - ";
                        Label17.Text = "Rs. " + rdr["price"].ToString();
                        Row4.Visible = true;
                    }
                    i++;    
                }
                cls = rdr["seat_class"].ToString();                
            }
            con.Close();          
        }

        protected void CheckBoxList1_DataBound(object sender, EventArgs e)
        {
            int count = 0;
            while (CheckBoxList1.Items[count].Text[0].Equals('A'))
                count++;
            CheckBoxList1.RepeatColumns = count;

            String movie_id = Request.QueryString["id"];
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "SELECT show.show_id FROM class INNER JOIN screen ON class.screen_id = screen.screen_id INNER JOIN seat ON class.class_id = seat.class_id INNER JOIN show ON screen.screen_id = show.screen_id INNER JOIN show_price ON class.class_id = show_price.class_id AND show.show_id = show_price.show_id INNER JOIN theater_user ON screen.user_id = theater_user.user_id INNER JOIN [user] ON theater_user.user_id = [user].user_id WHERE [show].show_date='" + TextBox1.Text + "' AND [show].movie_id='" + Session["movie_id"] + "' AND [theater_user].city='" + DropDownList1.SelectedValue + "' AND [user].name = '" + DropDownList2.SelectedValue + "' AND [show].show_time='" + DropDownList3.SelectedValue + "'";
            SqlDataReader rdr = com.ExecuteReader();
            rdr.Read();
            string show_id=rdr["show_id"].ToString();
            rdr.Close();

            foreach (ListItem li in CheckBoxList1.Items)
            {
                com.CommandText = "SELECT seat.seat_no FROM seat INNER JOIN ticket ON seat.seat_id = ticket.seat_id WHERE ticket.show_id='"+show_id+"'";
                SqlDataReader rdr1 = com.ExecuteReader();
                while (rdr1.Read())
                {
                    if (li.Text.Equals(rdr1["seat_no"].ToString()))
                    {
                        li.Enabled = false;
                        li.Attributes.Add("Style","color:red;");
                    }
                }
                rdr1.Close();
            }
            con.Close();
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Enabled == false)
                {
                    li.Attributes.Add("Style", "color:red;");
                }
            }
            String movie_id = Request.QueryString["id"];
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            int selected = 0;
            int items = 0;
            int price=0;
            int flag = 0;
            foreach (ListItem li in CheckBoxList1.Items)
            {
                items++;
                if (li.Selected)
                {
                    selected++;
                    Label18.Text = selected.ToString();

                    int temp_item=items;
                    com.CommandText = "SELECT show_price.price FROM class INNER JOIN screen ON class.screen_id = screen.screen_id INNER JOIN seat ON class.class_id = seat.class_id INNER JOIN show ON screen.screen_id = show.screen_id INNER JOIN show_price ON class.class_id = show_price.class_id AND show.show_id = show_price.show_id INNER JOIN theater_user ON screen.user_id = theater_user.user_id INNER JOIN [user] ON theater_user.user_id = [user].user_id WHERE [show].show_date='" + TextBox1.Text + "' AND [show].movie_id='" + Session["movie_id"] + "' AND [theater_user].city='" + DropDownList1.SelectedValue + "' AND [user].name = '" + DropDownList2.SelectedValue + "' AND [show].show_time='" + DropDownList3.SelectedValue + "'";
                    SqlDataReader rdr = com.ExecuteReader();
                    
                    while (temp_item > 0)
                    {
                        rdr.Read();
                        temp_item--;
                    }
                    price += Int32.Parse(rdr["price"].ToString());
                    Label20.Text = price.ToString();
                    rdr.Close();
                    flag = 1;
                }
            }
            if (flag == 0)
            {
                Label20.Text = "0";
                Label18.Text = "";
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
          
                string message = "";
                string subject = "SHOWTIME : TICKET BOOKED";

                String movie_id = Request.QueryString["id"];
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;

                int selected = 0;
                int items = 0;
                string theater_id = "";

                com.CommandText = "SELECT theater_user.address,theater_user.city,theater_user.state,[user].name,movie.name,screen.screen_no,show.show_date,show.show_time FROM class INNER JOIN screen ON class.screen_id = screen.screen_id INNER JOIN seat ON class.class_id = seat.class_id INNER JOIN show ON screen.screen_id = show.screen_id INNER JOIN movie ON show.movie_id = movie.movie_id INNER JOIN theater_user ON screen.user_id = theater_user.user_id INNER JOIN [user] ON theater_user.user_id = [user].user_id WHERE [show].show_date='" + TextBox1.Text + "' AND [show].movie_id='" + Session["movie_id"] + "' AND [theater_user].city='" + DropDownList1.SelectedValue + "' AND [user].name = '" + DropDownList2.SelectedValue + "' AND [show].show_time='" + DropDownList3.SelectedValue + "'";
                SqlDataReader rdr0 = com.ExecuteReader();
                rdr0.Read();
                message = "Movie : " + rdr0[4].ToString() + "<br>Theater : " + rdr0[3] + "<br>Address : " + rdr0[0] + ", " + rdr0[1] + ", " + rdr0[2] + "<br>Date : " + rdr0[6].ToString().Substring(0, 10) + "<br>Time : " + rdr0[7] + "<br>Screen Number : " + rdr0[5] + "<br>Seats : ";
                rdr0.Close();
                foreach (ListItem li in CheckBoxList1.Items)
                {
                    items++;
                    if (li.Selected)
                    {
                        message += li.Text + "  ";
                        selected++;

                        int temp_item = items;
                        com.CommandText = "SELECT theater_user.user_id,seat.seat_id,show.show_id FROM class INNER JOIN screen ON class.screen_id = screen.screen_id INNER JOIN seat ON class.class_id = seat.class_id INNER JOIN show ON screen.screen_id = show.screen_id INNER JOIN show_price ON class.class_id = show_price.class_id AND show.show_id = show_price.show_id INNER JOIN theater_user ON screen.user_id = theater_user.user_id INNER JOIN [user] ON theater_user.user_id = [user].user_id WHERE [show].show_date='" + TextBox1.Text + "' AND [show].movie_id='" + Session["movie_id"] + "' AND [theater_user].city='" + DropDownList1.SelectedValue + "' AND [user].name = '" + DropDownList2.SelectedValue + "' AND [show].show_time='" + DropDownList3.SelectedValue + "'";
                        SqlDataReader rdr = com.ExecuteReader();



                        while (temp_item > 0)
                        {
                            rdr.Read();
                            temp_item--;
                        }
                        theater_id = rdr["user_id"].ToString();
                        string seat_id = rdr["seat_id"].ToString();
                        string show_id = rdr["show_id"].ToString();
                        string user_id = Session["user_id"].ToString();

                        rdr.Close();

                        com.CommandText = "INSERT INTO [dbo].[ticket](seat_id, show_id, user_id) VALUES ('" + seat_id + "','" + show_id + "','" + user_id + "')";
                        com.ExecuteNonQuery();
                    }
                }

                com.CommandText = "SELECT payment FROM [dbo].[theater_user] WHERE user_id=@user_id";
                com.Parameters.AddWithValue("@user_id", theater_id);
                SqlDataReader rdr1 = com.ExecuteReader();
                rdr1.Read();
                int payment = Int32.Parse(rdr1["payment"].ToString());
                payment += Int32.Parse(Label20.Text);
                rdr1.Close();

                com.CommandText = "UPDATE theater_user SET payment=@payment WHERE user_id=@user_id1";
                com.Parameters.AddWithValue("@payment", payment);
                com.Parameters.AddWithValue("@user_id1", theater_id);
                com.ExecuteNonQuery();

                com.CommandText = "SELECT email FROM [user] WHERE user_id=@user_id3";
                com.Parameters.AddWithValue("@user_id3", Session["user_id"]);
                SqlDataReader rdr2 = com.ExecuteReader();
                rdr2.Read();
                string to = rdr2[0].ToString();
                rdr2.Close();
                con.Close();

                SendEmail se = new SendEmail();
                se.sendEmail(to, subject, message, "");

                Response.Redirect("AfterBooking.aspx");
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            DateTime cur = DateTime.Parse(DateTime.Now.ToShortDateString());
            DateTime et = DateTime.Parse(TextBox1.Text);
            if (et<cur)
            {
                TextBox1.Text = "";
                Label21.Visible = true;
            }
            else
            {
                Label21.Visible = false;
            }
        }
    }
}