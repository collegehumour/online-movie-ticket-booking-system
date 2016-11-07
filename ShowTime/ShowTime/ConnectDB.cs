using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace ShowTime
{
    public class ConnectDB
    {
        public SqlConnection connect;
        public SqlCommand command;
        public void connectDataBase()
        {
            String connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            connect = new SqlConnection(connectionString);

            command = new SqlCommand();
            command.Connection = connect;
        }
    }
}