using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.User
{
    public partial class ClientHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || !Session["role_name"].Equals("Normal User") )
            {
                Response.Redirect("~/Home.aspx");
            }

            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;

            com.CommandText = "SELECT user_id from [dbo].[normal_user] where user_id =@user_id";
            com.Parameters.AddWithValue("@user_id", Session["user_id"]);
            SqlDataReader rdr = com.ExecuteReader();
            if (!rdr.Read())
                Response.Redirect("~/UserDetails.aspx");
            rdr.Close();
            con.Close();
            
        }
    }
}