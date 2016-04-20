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
    public class AuthorizedMemberDB
    {
        public AuthorizedMemberDB() { }
        public static int Save(AuthorizedMember aMember)
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
                cmd.CommandText = "dbo.InsertUpdateAuthorizedMember";

                if (aMember.AuthMemberID == -1)
                {
                    cmd.Parameters.Add("@AuthMemberID", SqlDbType.Int).Value = DBNull.Value;
                }
                else
                {
                    cmd.Parameters.Add("@AuthMemberID", SqlDbType.Int).Value = aMember.AuthMemberID;
                }

                cmd.Parameters.Add("@Firstname", SqlDbType.VarChar).Value = aMember.Firstname;
                cmd.Parameters.Add("@Lastname", SqlDbType.VarChar).Value = aMember.Lastname;
                cmd.Parameters.Add("@RelationToAccountOwner", SqlDbType.VarChar).Value = aMember.RelationToAccountOwner;
                cmd.Parameters.Add("@AccountID", SqlDbType.Int).Value = aMember.AccountID;
                cmd.Parameters.Add("@CreatedDate", SqlDbType.DateTime).Value = aMember.CreatedDate;
                cmd.Parameters.Add("@ModifiedDate", SqlDbType.DateTime).Value = aMember.ModifiedDate;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.VarChar).Value = aMember.CreatedBy;
                cmd.Parameters.Add("@ModifiedBy",SqlDbType.VarChar).Value = aMember.ModifiedBy;

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

        public static int Delete(int memberID) 
        {
            int result;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();

            try
            {

                conn = myConn.OpenDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text ;
                cmd.CommandText = "Delete from AuthorizedMember where authmemberID = @MemberID";
                cmd.Parameters.Add("@MemberID", SqlDbType.Int).Value = memberID;  
                result =  cmd.ExecuteNonQuery();

            }
            finally
            {
                myConn.CloseDB(conn);
            }

            return result;
        }

        public static AuthorizedMember GetMemberByMemberID(int memberID)
        {
            AuthorizedMember authorizedMember = new AuthorizedMember();
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.Account where AuthMemberID = @AuthMemberID";
            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@AuthMemberID", SqlDbType.Int).Value = memberID;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                authorizedMember = FillDataRecord(dr);
            }
            cmd.Dispose();
            //close the connection
            myConn.CloseDB(conn);
            return authorizedMember;
        }
        public static AuthorizedMemberList GetListByAccountID(int accountID)
        {
            AuthorizedMemberList aMemberList = null;
            MyDBConnection myConn = new MyDBConnection();
            SqlConnection conn = new SqlConnection();
            SqlDataReader dr;
            SqlCommand cmd = null;
            string sql = "Select * from AquaOne.dbo.AuthorizedMember where AccountID = @AccountID";

            // Open the connection
            conn = myConn.OpenDB();
            cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add("@AccountID",SqlDbType.Int).Value = accountID;
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                aMemberList = new AuthorizedMemberList();
                while (dr.Read())
                {
                    aMemberList.Add(FillDataRecord(dr));
                }
            }

            cmd.Dispose();
            myConn.CloseDB(conn);
            return aMemberList;
        }

        /// <summary>
        /// helper method
        /// </summary>
        /// <param name="dr"></param>
        /// <returns></returns>
        private static AuthorizedMember FillDataRecord(IDataRecord dr)
        {
            AuthorizedMember aMember = new AuthorizedMember();
            aMember.AuthMemberID = dr.GetInt32(dr.GetOrdinal("AuthMemberID"));
            aMember.Firstname = dr.GetString(dr.GetOrdinal("Firstname"));
            aMember.Lastname = dr.GetString(dr.GetOrdinal("Lastname"));
            aMember.RelationToAccountOwner = dr.GetString(dr.GetOrdinal("RelationToAccountOwner"));
            aMember.AccountID = dr.GetInt32(dr.GetOrdinal("AccountID"));
            aMember.CreatedDate = dr.GetDateTime(dr.GetOrdinal("CreatedDate"));
            aMember.ModifiedDate = dr.GetDateTime(dr.GetOrdinal("ModifiedDate"));
            aMember.CreatedBy = dr.GetString(dr.GetOrdinal("CreatedBy"));
            return aMember;
        }
    }
}
