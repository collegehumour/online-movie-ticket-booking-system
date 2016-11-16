using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShowTime.Theater
{
    public partial class AddScreen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null || !Session["role_name"].Equals("Theater User"))
            {
                Response.Redirect("~/Home.aspx");
            }        
        }
        protected void View2_Activate(object sender, EventArgs e)
        {
            String[] selected = new String[4];
            int j = 0;
            foreach (int i in ListBox1.GetSelectedIndices())
            {
                selected[j++] = ListBox1.Items[i].ToString()+" Starts From : ";
            }
            
            if (j >= 4 )
            {
                Label10.Text = selected[3];
                Row4.Visible = true;
            }
            if (j >= 3)
            {
                Label9.Text = selected[2];
                Row3.Visible = true;
            }
            if (j >= 2)
            {
                Label8.Text = selected[1];
                Row2.Visible = true;
            }
            if (j >= 1)
            {
                Label7.Text = selected[0];
                Row1.Visible = true;
            }
            
        }

        protected void View3_Activate(object sender, EventArgs e)
        {
            int r = (int)(TextBox4.Text.ToUpper()[0]) - 64;
            int c = Int32.Parse(TextBox3.Text);

            TableRow hrow = new TableRow();

            for (int j = 0; j <= c; j++)
            {
                TableCell cell = new TableCell();
                cell.Width = 20;
                Label l = new Label();
                if (j == 0)
                    l.Text = " ";
                else
                    l.Text = j.ToString();
                cell.Controls.Add(l);
                hrow.Cells.Add(cell);
            }
            Table5.Rows.Add(hrow);

            for (int i = 1; i <= r; i++)
            {
                TableRow row = new TableRow();
                for (int j = 0; j <= c; j++)
                {
                    TableCell cell = new TableCell();
                    cell.Width = 20;
                    if (j == 0)
                    {
                        Label l = new Label();
                        l.Text = Convert.ToChar(i + 64).ToString();
                        cell.Controls.Add(l);
                    }
                    else
                    {
                        Image img = new Image();
                        img.ImageUrl = "gchair.png";
                        cell.Controls.Add(img);
                    }
                    row.Cells.Add(cell);
                }
                Table5.Rows.Add(row);
            }

            String[] selected = new String[4];
            int[] val = new int[4]{0,0,0,0};
            

            int h = 0;
            foreach (int i in ListBox1.GetSelectedIndices())
            {
                selected[h++] = ListBox1.Items[i].ToString();
            }

            if (h >= 4)
            {
                val[3] = (int)(TextBox8.Text.ToUpper()[0]) - 64;
            }
            if (h >= 3)
            {
                val[2] = (int)(TextBox7.Text.ToUpper()[0]) - 64;
            }
            if (h >= 2)
            {
                val[1] = (int)(TextBox6.Text.ToUpper()[0]) - 64;
            }
            if (h >= 1)
            {
                val[0] = (int)(TextBox5.Text.ToUpper()[0]) - 64;
            }

            int itemp;
            string stemp;
            for (int u = 0; u < h - 1; u++)
            {
                for (int v = 0; v < h - u - 1; v++)
                {
                    if (val[v] > val[v + 1])
                    {
                        itemp = val[v];
                        val[v] = val[v + 1];
                        val[v + 1] = itemp;
                        stemp = selected[v];
                        selected[v] = selected[v + 1];
                        selected[v + 1] = stemp;
                    }
                }
            }

            for (int g = h-1; g>=0; g--)
            {
                TableRow row = new TableRow();
                TableCell cell = new TableCell();
                cell.Text = selected[g];
                cell.ColumnSpan = c;
                cell.HorizontalAlign = HorizontalAlign.Center;
                cell.Font.Bold = true;
                row.Cells.Add(cell);
                Table5.Rows.AddAt(val[g], row);               
            }
            
            
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;

            com.CommandText = "insert into [dbo].[screen] (screen_no,user_id) values (@screen_no,@user_id)";
            com.Parameters.AddWithValue("@screen_no", TextBox2.Text);
            com.Parameters.AddWithValue("@user_id", Session["user_id"]);
            com.ExecuteNonQuery();

            com.CommandText = "SELECT screen_id FROM [dbo].[screen] WHERE screen_no=@screen_no1 AND user_id=@user_id1";
            com.Parameters.AddWithValue("@screen_no1", TextBox2.Text);
            com.Parameters.AddWithValue("@user_id1", Session["user_id"]);
            SqlDataReader rdr = com.ExecuteReader();
            rdr.Read();
            String screen_id = rdr["screen_id"].ToString();
            rdr.Close();

            foreach (int i in ListBox1.GetSelectedIndices())
            {
                com.CommandText = "insert into [dbo].[class] (seat_class,screen_id) values ('" + ListBox1.Items[i].ToString() + "','" + screen_id + "')";
                com.ExecuteNonQuery();
            }

            for (int z = 0; z < h; z++)
            {
                com.CommandText = "SELECT class_id FROM [dbo].[class] WHERE seat_class='" + selected[z] + "' AND screen_id='" + screen_id + "'";
                SqlDataReader rdr1 = com.ExecuteReader();
                rdr1.Read();
                String class_id = rdr1["class_id"].ToString();
                rdr1.Close();

                int start = val[z];
                int end = 0;
                if (z == h - 1)
                    end = r+1;
                else
                    end = val[z+1];

                while(start!=end)
                {
                    for (int d = 1; d <= c; d++)
                    {
                        com.CommandText = "INSERT INTO [dbo].[seat](seat_no,class_id) VALUES ('" + Convert.ToChar(start + 64).ToString() +d.ToString() + "','" + class_id + "')";
                        com.ExecuteNonQuery();
                    }
                    start++;    
                }
            }                
            con.Close();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            int s_no = Int32.Parse(TextBox2.Text);
            if (s_no > 5 || s_no < 1)
            {
                Label12.Visible = true;
                TextBox2.Text = "";
                return;
            }
            else
            {
                ConnectDB cdb = new ConnectDB();
                cdb.connectDataBase();
                SqlConnection con = cdb.connect;
                con.Open();
                SqlCommand com = cdb.command;
                com.CommandText = "SELECT [screen_no] from [screen] where ([user_id] = @user_id3)";
                com.Parameters.AddWithValue("@user_id3", Session["user_id"]);
                SqlDataReader rd = com.ExecuteReader();
                while (rd.Read())
                {
                    if (rd["screen_no"].ToString().Equals(s_no.ToString()))
                    {
                        Label12.Visible = true;
                        TextBox2.Text = "";
                        return;
                    }
                    else 
                    {
                        Label12.Visible = false;
                    }
                }
                con.Close();
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selected = 0;
            foreach (int i in ListBox1.GetSelectedIndices())
            {
                selected++;
            }
            if (selected > 4)
            {
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    ListBox1.Items[i].Selected = false;
                }
            }
        }

    }
}