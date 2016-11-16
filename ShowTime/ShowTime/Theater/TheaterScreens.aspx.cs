using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.Theater
{
    public partial class TheaterScreens : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || !Session["role_name"].Equals("Theater User"))
            {
                Response.Redirect("~/Home.aspx");
            }        
        }

        

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label4.Text = "";
            string enter="";
            GridViewRow row = GridView2.SelectedRow;
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            com.CommandText = "SELECT seat_no FROM seat WHERE class_id=@class_id";
            com.Parameters.AddWithValue("@class_id",row.Cells[1].Text);
            SqlDataReader rdr = com.ExecuteReader();
            while (rdr.Read())
            {
                if (!enter.Equals(rdr["seat_no"].ToString().Substring(0, 1)))
                {
                    Label4.Text += "<br/>";
                }           
                Label4.Text += rdr["seat_no"].ToString()+" ";
                enter=rdr["seat_no"].ToString().Substring(0,1);
            }
            rdr.Close();
            con.Close();
        }

    }
}