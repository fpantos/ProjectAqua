using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessObject.Collections;
namespace AquaLibrary.BusinessLayer
{
    public class AuthorizedMemberManager
    {

        public static int Save(AuthorizedMember authorizedMember)
        {
            return AuthorizedMemberDB.Save(authorizedMember);//AccountDB.Save(account);
            
        }

        public static int Delete(int memberID) 
        {
            return AuthorizedMemberDB.Delete(memberID);
        }
        public static AuthorizedMember GetMemberByMemberID(int memberID) 
        {
            return AuthorizedMemberDB.GetMemberByMemberID(memberID);
        }

        public static AuthorizedMemberList GetListByAccountID(int accountID) 
        {
            return AuthorizedMemberDB.GetListByAccountID(accountID);
        }



        
    }
}
