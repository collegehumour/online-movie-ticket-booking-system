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
            int[] val = new int[4];
            int h = 0;
            foreach (int i in ListBox1.GetSelectedIndices())
            {
                selected[h++] = ListBox1.Items[i].ToString();
            }

            if (h >= 4)
            {
                val[3] = (int)(TextBox8.Text.ToUpper()[0]) - 64;
                TableRow row = new TableRow();
                TableCell cell = new TableCell();
                cell.Text = selected[3];
                cell.ColumnSpan = c;
                row.Cells.Add(cell);
                Table5.Rows.AddAt(val[3], row);
            }
            if (h >= 3)
            {
                val[2] = (int)(TextBox7.Text.ToUpper()[0]) - 64;
                TableRow row = new TableRow();
                TableCell cell = new TableCell();
                cell.Text = selected[2];
                cell.ColumnSpan = c;
                cell.HorizontalAlign = HorizontalAlign.Center;
                cell.Font.Bold = true;
                row.Cells.Add(cell);
                Table5.Rows.AddAt(val[2], row);
            }
            if (h >= 2)
            {
                val[1] = (int)(TextBox6.Text.ToUpper()[0]) - 64;
                TableRow row = new TableRow();
                TableCell cell = new TableCell();
                cell.Text = selected[1];
                cell.ColumnSpan = c;
                cell.HorizontalAlign = HorizontalAlign.Center;
                cell.Font.Bold = true;
                row.Cells.Add(cell);
                Table5.Rows.AddAt(val[1], row);
            }
            if (h >= 1)
            {
                val[0] = (int)(TextBox5.Text.ToUpper()[0]) - 64;
                TableRow row = new TableRow();
                TableCell cell = new TableCell();
                cell.Text = selected[0];
                cell.ColumnSpan = c;
                cell.HorizontalAlign = HorizontalAlign.Center;
                cell.Font.Bold = true;
                row.Cells.Add(cell);
                Table5.Rows.AddAt(val[0], row);
            }
            
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ConnectDB cdb = new ConnectDB();
            cdb.connectDataBase();
            SqlConnection con = cdb.connect;
            con.Open();
            SqlCommand com = cdb.command;
            
            com.CommandText = "insert into [dbo].[screen] (screen_no,user_id) values (@screen_no,@user_id)";
            com.Parameters.AddWithValue("@screen_no",TextBox2.Text);
            com.Parameters.AddWithValue("@user_id",Session["user_id"]);
            com.ExecuteNonQuery();





            com.CommandText = "insert into [dbo].[class] (seat_class,screen_id) values (@seat_class,@screen_id)";
            com.Parameters.AddWithValue("@screen_no", TextBox2.Text);
            com.Parameters.AddWithValue("@user_id", Session["user_id"]);
            com.ExecuteNonQuery();
            
        }
    }
}