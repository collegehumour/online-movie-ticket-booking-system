using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.Admin
{
    public partial class MovieList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || !Session["role_name"].Equals("Admin"))
            {
                Response.Redirect("~/Home.aspx");
            }        
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin/MovieDetails.aspx?id=" + Eval("movie_id"));
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMovie.aspx");
        }
   }
}