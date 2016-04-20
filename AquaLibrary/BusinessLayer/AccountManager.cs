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
    public class AccountManager
    {

        public static int Save(Account account) 
        {
            return AccountDB.Save(account);
        }

        public static Account GetAccountByID(int id) 
        {
            Account a = AccountDB.GetAccountByID(id);

            return a;
        }

        public static AccountList GetList() 
        {
            return AccountDB.GetList();
        }

        public static List<string> GetAutoCompleteList(string searchBy, string searchString)      
        {
            return AccountDB.GetAutoCompleteList(searchBy, searchString);
        }

        public static DataTable GetAccountWithAddressBySearchCriteria(string searchBy, string searchString) 
        {
            return AccountDB.GetAccountWithAddressBySearchCriteria(searchBy, searchString);
        }

        public static DataTable GetAccountWithAddress(int accountID) 
        {
            return AccountDB.GetAccountWithAddress(accountID);
        }

        public static DataTable GetAccountsWithAddress() 
        {
            return AccountDB.GetAccountsWithAddress();
        }

        public static int Deactivate(Account account) 
        {
            return AccountDB.Deactivate(account);
        }

        public static int Activate(Account account)
        {
            return AccountDB.Activate(account);
        }


    }
}
