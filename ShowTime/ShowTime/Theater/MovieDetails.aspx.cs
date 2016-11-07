using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.Theater
{
    public partial class MovieDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String movie_id = Request.QueryString["id"];
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "SELECT * FROM movie WHERE movie_id='" + movie_id + "'";

            SqlDataReader rdr = com.ExecuteReader();
            rdr.Read();
            Label2.Text = rdr["name"].ToString();
            Label10.Text = rdr["genre"].ToString();
            Label11.Text = rdr["language"].ToString();
            Label9.Text = rdr["release_date"].ToString();
            Label12.Text = rdr["cast"].ToString();
            Label13.Text = rdr["director"].ToString();
            Label14.Text = rdr["duration"].ToString();
            con.Close();
            Image2.ImageUrl = "~/Admin/Posters/" + movie_id + ".png";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}