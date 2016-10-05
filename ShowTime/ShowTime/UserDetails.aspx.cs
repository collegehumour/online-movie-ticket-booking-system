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
    public partial class UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                String connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandText = @"insert into [dbo].[user] (user_id,name,email,password,role_name) values (select user_id,name,email,password,role_name from [dbo].[temp_user] where )";

                com.Parameters.AddWithValue("@name", TextBox1.Text);
                com.Parameters.AddWithValue("@user_id", TextBox2.Text);
                com.Parameters.AddWithValue("@email", TextBox3.Text);
                com.Parameters.AddWithValue("@password", TextBox4.Text);
                com.Parameters.AddWithValue("@role_name", DropDownList1.SelectedItem.Text);

                com.ExecuteNonQuery();
                con.Close();

                

            }
            catch (Exception exc)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}