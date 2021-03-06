﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.Admin
{
    public partial class MovieDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user_id"] == null || !Session["role_name"].Equals("Admin"))
            {
                Response.Redirect("~/Home.aspx");
            }        

            String movie_id = Request.QueryString["id"];
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "SELECT * FROM movie WHERE movie_id='"+movie_id+"'";

            SqlDataReader rdr = com.ExecuteReader();
            rdr.Read();
            Label2.Text=rdr["name"].ToString();
            Label10.Text = rdr["genre"].ToString();
            Label11.Text = rdr["language"].ToString();
            string rdate = rdr["release_date"].ToString();
            rdate = rdate.Substring(0, 10);
            Label9.Text = rdate.ToString();
            Label12.Text = rdr["cast"].ToString();
            Label13.Text = rdr["director"].ToString();
            Label14.Text = rdr["duration"].ToString() + " Minutes";
            con.Close();
            Image2.ImageUrl = "~/Admin/Posters/"+movie_id+".png";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["movie_id"] = Request.QueryString["id"];
            Response.Redirect("AddMovie.aspx");
        }
    }
}