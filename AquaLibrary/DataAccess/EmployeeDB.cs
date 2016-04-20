using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;



namespace AquaLibrary.DataAccess
{
    public class EmployeeDB
    {
        public EmployeeDB() { }

        public static int Save(Employee employee)
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();

            try
            {
                conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.InsertUpdateEmployee";

                if (employee.EmployeeID == -1)
                {
                    cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = employee.EmployeeID;
                }
                cmd.Parameters.Add("@Firstname", SqlDbType.VarChar).Value = employee.Firstname;
                cmd.Parameters.Add("@Lastname", SqlDbType.VarChar).Value = employee.Lastname;
                cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = employee.Gender;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = employee.Email;
                cmd.Parameters.Add("@Homephone", SqlDbType.VarChar).Value = employee.Homephone;
                cmd.Parameters.Add("@Mobilephone", SqlDbType.VarChar).Value = employee.Mobilephone;
                cmd.Parameters.Add("@EmergencyContact", SqlDbType.VarChar).Value = employee.EmergencyContact;
                cmd.Parameters.Add("@EmergencyPhone1", SqlDbType.VarChar).Value = employee.EmergencyPhone1;
                cmd.Parameters.Add("@EmergencyPhone2", SqlDbType.VarChar).Value = employee.EmergencyPhone2;
                cmd.Parameters.Add("@IsEmployed", SqlDbType.Bit).Value = employee.IsEmployed;
                cmd.Parameters.Add("@HireDate", SqlDbType.DateTime).Value = employee.HireDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = employee.CreatedBy;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = employee.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = employee.ModifiedDate;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = employee.ModifiedBy;
                cmd.Parameters.Add("@Notes", SqlDbType.VarChar).Value = employee.Notes;
                cmd.Parameters.Add("@PositionID", SqlDbType.VarChar).Value = employee.JobPositionID;
                DbParameter returnValue = cmd.CreateParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(returnValue.Value);
            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return result;
        }

        public static int DeactivateEmployee(Employee employee)
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();

            try
            {
                conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.TerminateEmployee";

                
                cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = employee.EmployeeID;                
                cmd.Parameters.Add("@IsEmployed", SqlDbType.Bit).Value = employee.IsEmployed;
                cmd.Parameters.Add("@TerminatedDate", SqlDbType.DateTime).Value = employee.TerminatedDate;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = employee.ModifiedBy;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = employee.ModifiedDate;

                DbParameter returnValue = cmd.CreateParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(returnValue.Value);
            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return result;
        }

        public static Employee GetEmployeeByID(int id)
        {
            
            Employee employee = new Employee();
            MyDBConnection myConn = new MyDBConnection();
            
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            try
            {
                string sql = "Select * from AquaOne.dbo.Employee where EmployeeID = @EmployeeID";
                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = id;
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    employee = FillDataRecord(dr);
                }
            }
            finally
            {
                cmd.Dispose();
                //close the connection
                myConn.CloseDB(conn);
            }
            return employee;
        }

        public static EmployeeList GetList()
        {

            EmployeeList eList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.Employee";

            try
            {

                // Open the connection
                conn = myConn.OpenDB();
                cmd = new SqlCommand(sql, conn);

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    eList = new EmployeeList();
                    while (dr.Read())
                    {
                        eList.Add(FillDataRecord(dr));
                    }
                }
            }
            finally
            {
                cmd.Dispose();
                myConn.CloseDB(conn);
            }
            return eList;
        }

        public static List<string> GetTechnicians()
        {

            List<string> list = new List<string>() ;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd =  new SqlCommand();        

            try
            {

                // Open the connection
                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.getTechnicians";

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        list.Add(dr.GetString(0));
                    }
                }
            }
            finally
            {
                cmd.Dispose();
                myConn.CloseDB(conn);
            }
            return list;
        }


        private static Employee FillDataRecord(IDataRecord dr)
        {
            Employee employee = new Employee();
            employee.EmployeeID = dr.GetInt32(dr.GetOrdinal("EmployeeID"));
            employee.Firstname = dr.GetString(dr.GetOrdinal("Firstname"));
            employee.Lastname = dr.GetString(dr.GetOrdinal("Lastname"));
            employee.Gender = dr.GetString(dr.GetOrdinal("Gender"));
            employee.Email = dr.GetString(dr.GetOrdinal("Email"));
            employee.Homephone = dr.GetString(dr.GetOrdinal("Homephone"));
            employee.Mobilephone = dr.GetString(dr.GetOrdinal("Mobilephone"));
            employee.EmergencyContact = dr.GetString(dr.GetOrdinal("EmergencyContact"));
            employee.EmergencyPhone1 = dr.GetString(dr.GetOrdinal("EmergencyPhone1"));
            employee.EmergencyPhone2 = dr.GetString(dr.GetOrdinal("EmergencyPhone2"));
            employee.IsEmployed = dr.GetBoolean(dr.GetOrdinal("IsEmployed"));
            employee.Notes = dr.GetString(dr.GetOrdinal("Notes"));
            employee.HireDate = dr.GetDateTime(dr.GetOrdinal("HireDate"));
            employee.JobPositionID = dr.GetInt32(dr.GetOrdinal("PositionID"));

            if (!dr.IsDBNull(dr.GetOrdinal("TerminatedDate")))
            {
                employee.TerminatedDate = dr.GetDateTime(dr.GetOrdinal("TerminatedDate"));
            }
            employee.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            employee.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            employee.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            employee.ModifiedBy = dr.GetString(dr.GetOrdinal("ModifiedBy"));

            return employee;
        }

        public static DataTable GetEmployeeWithAddressBySearchCriteria(string searchBy, string searchString)
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.getemployeewithaddress";

                cmd.Parameters.Add("@SearchCriteria", SqlDbType.VarChar).Value = searchBy;
                cmd.Parameters.Add("@Input", SqlDbType.VarChar).Value = searchString;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);           
                dt.Load(dr);

            }
            finally
            {

                cmd.Dispose();
                myConn.CloseDB(conn);
            }

            return dt;

        }
     
        public static DataTable GetActiveEmployeeList()
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();

            try
            {
                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.GetActiveEmployeeList";

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                dt.Load(dr);
            }
            finally
            {

                cmd.Dispose();
                myConn.CloseDB(conn);
            }
            return dt;
        }

        public static DataTable GetEmployeeWithAddress()
        {
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr = null;
            SqlCommand cmd = new SqlCommand();
            DataTable dt = new DataTable();
            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.GetEmployeesWithAddress";


                //cmd.Parameters.Add("@SearchCriteria", SqlDbType.VarChar).Value = searchBy;
                //cmd.Parameters.Add("@Input", SqlDbType.VarChar).Value = searchString;

                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                dt.Load(dr);
            }
            finally
            {

                cmd.Dispose();
                myConn.CloseDB(conn);
            }
            return dt;

        }

        public static int Deactivate(Employee employee)
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();

            try
            {
                conn = myConn.OpenDB();             
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.DeactivateEmployee";

                cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = employee.EmployeeID;
                cmd.Parameters.Add("@TerminatedDate", SqlDbType.DateTime).Value = employee.TerminatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = employee.ModifiedDate;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = employee.ModifiedBy;

                DbParameter returnValue = cmd.CreateParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(returnValue.Value);

            }
            finally
            {
                cmd.Dispose();
                myConn.CloseDB(conn);
            }

            return result;
        }

        public static int Activate(Employee employee)
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();

            try
            {

                conn = myConn.OpenDB();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.ActivateEmployee";

                cmd.Parameters.Add("@EmployeeID", SqlDbType.Int).Value = employee.EmployeeID;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = employee.ModifiedDate;
                cmd.Parameters.Add("@ModifiedBy", SqlDbType.VarChar).Value = employee.ModifiedBy;
                cmd.Parameters.Add("@RehiredDate", SqlDbType.VarChar).Value = employee.RehiredDate;

                DbParameter returnValue = cmd.CreateParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(returnValue.Value);

            }
            finally
            {
                cmd.Dispose();
                myConn.CloseDB(conn);
            }

            return result;
        }
    }
}
