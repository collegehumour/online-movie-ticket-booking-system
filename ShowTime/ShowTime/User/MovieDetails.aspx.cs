using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.User
{
    public partial class MovieDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user_id"] == null || !Session["role_name"].Equals("Normal User"))
                {
                    Response.Redirect("~/Home.aspx");
                }
            if(IsPostBack==false)
                TextBox1.Text = "0";
                    

            String movie_id = Request.QueryString["id"];
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "SELECT * FROM movie WHERE movie_id='"+movie_id+"'";

            SqlDataReader rdr = com.ExecuteReader();
            rdr.Read();
            Label2.Text  = rdr["name"].ToString();
            Label10.Text = rdr["genre"].ToString();
            Label11.Text = rdr["language"].ToString();
            string rdate  = rdr["release_date"].ToString();
            rdate = rdate.Substring(0,10);
            Label9.Text = rdate.ToString();
            Label12.Text = rdr["cast"].ToString();
            Label13.Text = rdr["director"].ToString();
            Label14.Text = rdr["duration"].ToString()+" Minutes";
            Label16.Text = rdr["ratings"].ToString()+"/5";
            con.Close();
            Image2.ImageUrl = "~/Admin/Posters/"+movie_id+".png";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["movie_id"] = Request.QueryString["id"];
            Response.Redirect("CityTheaterSelection.aspx");
        }

        protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            Label1.Text = e.Value;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            float val = float.Parse(TextBox1.Text);
            int incusr=0;
            String movie_id = Request.QueryString["id"];
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "SELECT ratings,rated_user FROM movie WHERE movie_id='" + movie_id + "'";
            SqlDataReader rdr = com.ExecuteReader();
            rdr.Read();
            val = (float.Parse(rdr["ratings"].ToString()) * Int32.Parse(rdr["rated_user"].ToString()) + val) / (Int32.Parse(rdr["rated_user"].ToString()) + 1);
            incusr = Int32.Parse(rdr["rated_user"].ToString()) + 1;
            rdr.Close();
            com.CommandText = "UPDATE movie SET ratings ='"+ val +"',rated_user = '"+ incusr +"' WHERE movie_id='" + movie_id + "'";
            com.ExecuteNonQuery();
            com.CommandText = "SELECT ratings FROM movie WHERE movie_id='" + movie_id + "'";
            SqlDataReader rdr1 = com.ExecuteReader();
            rdr1.Read();
            Label16.Text=rdr1[0].ToString()+"/5";
            rdr1.Close();
            con.Close();
        }

        
    }
}