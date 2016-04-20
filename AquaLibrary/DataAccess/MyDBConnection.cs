using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AquaLibrary.DataAccess
{
    public class MyDBConnection
    {
         ConnectionStringSettings conSettings = ConfigurationManager.ConnectionStrings["myConnection"];
         string constring ="";
        public MyDBConnection()
        {
            constring = conSettings.ConnectionString;
        }

        public SqlConnection OpenDB()
        {
            SqlConnection conn = new SqlConnection();
            try
            {
                conn.ConnectionString = constring;
                conn.Open();
            }
            catch (SqlException sqle)
            {
                throw new Exception("Error connecting to Database: " + sqle.Message);
            }

            return conn;

        }

        public void CloseDB(SqlConnection conn)
        {
            if (conn.State == ConnectionState.Open)
                try
                {
                    conn.Close();
                }
                catch (SqlException ex)
                {
                    throw new Exception("Unable to close connection " + ex.Message);
                }
        }

    }



}
