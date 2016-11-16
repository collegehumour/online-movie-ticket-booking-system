using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.Admin
{
    public partial class AddMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || !Session["role_name"].Equals("Admin"))
            {
                Response.Redirect("~/Home.aspx");
            }        


            if (Session["movie_id"] != null)
            {
                Button1.Text = "Update";
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;
                com.CommandText = "Select * from [dbo].[movie] where movie_id='"+Session["movie_id"].ToString()+"'";
                SqlDataReader rdr = com.ExecuteReader();
                rdr.Read();
                TextBox1.Text=rdr["name"].ToString();
                //TextBox2.Text = rdr["release_date"].ToString();
                TextBox3.Text = rdr["cast"].ToString();
                TextBox4.Text = rdr["director"].ToString();
                TextBox5.Text = rdr["duration"].ToString();
                DropDownList1.SelectedValue = rdr["genre"].ToString();
                DropDownList2.SelectedValue = rdr["language"].ToString();
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;

                if (Session["movie_id"] != null)
                {
                    com.CommandText = "update [dbo].[movie] set name=@name,genre=@genre,language=@language,cast=@cast,director=@director,release_date=@release_date,duration=@duration,user_id=@user_id where movie_id='" + Session["movie_id"].ToString() +"'";
                }
                else
                {
                    com.CommandText = "insert into [dbo].[movie] (name,genre,language,cast,director,release_date,duration,user_id) values (@name,@genre,@language,@cast,@director,@release_date,@duration,@user_id)";
                }
                com.Parameters.AddWithValue("@name", TextBox1.Text);
                com.Parameters.AddWithValue("@genre", DropDownList1.SelectedItem.Text);
                com.Parameters.AddWithValue("@language", DropDownList2.SelectedItem.Text);
                com.Parameters.AddWithValue("@release_date", TextBox2.Text);
                com.Parameters.AddWithValue("@cast", TextBox3.Text);
                com.Parameters.AddWithValue("@director", TextBox4.Text);
                com.Parameters.AddWithValue("@duration", TextBox5.Text);
                com.Parameters.AddWithValue("@user_id", "ktkakadiya");
                com.ExecuteNonQuery();

                //for getting id of last added movie
                if (Session["movie_id"] == null)
                {
                    SqlCommand temp = cdb.command;
                    temp.CommandText = "SELECT MAX(movie_id) AS id FROM movie";
                    SqlDataReader rdr = temp.ExecuteReader();
                    rdr.Read();
                    Session["movie_id"] = rdr["id"];
                    Label1.Text = Session["movie_id"].ToString();
                }
                
                con.Close();

                if (FileUpload1.HasFile)
                {
                    if (File.Exists(Server.MapPath("~/Admin/Posters/") + Session["movie_id"]+".png"))
                        File.Delete(Server.MapPath("~/Admin/Posters/") + Session["movie_id"] + ".png");
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/Posters/") + Session["movie_id"] + ".png");
                }

                if (CustomValidator1.IsValid == true)
                {
                    Session.Remove("movie_id");
                    Response.Redirect("MovieList.aspx");
                }
            }
            catch (Exception exc)
            {

            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string[] validFileTypes = { "gif", "png", "jpg", "jpeg" };
            string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
            bool isValidFile = false;
            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (ext == "." + validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile)
            {
                CustomValidator1.ErrorMessage = "Invalid File. Please upload a File with extension " +
                               string.Join(",", validFileTypes);
                CustomValidator1.ForeColor = System.Drawing.Color.Red;
                args.IsValid = false;
            }
            else
            {
                CustomValidator1.ForeColor = System.Drawing.Color.Green;
                CustomValidator1.ErrorMessage = "File uploaded successfully.";
                args.IsValid = true;
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            if (DateTime.Parse(TextBox2.Text) < DateTime.Now)
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