using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using AquaLibrary.DataAccess;
using AquaLibrary.BusinessObject;

namespace AquaLibrary.BusinessLayer
{
    public class InvoiceManager
    {

        public static int Save(Invoice inv) 
        {
            return InvoiceDB.Save(inv);
        }

        public static DataTable GetInvoiceByID(int id)
        {
            return InvoiceDB.GetInvoiceByID(id);
        }

        public static DataTable GetInvoiceBySearchCriteria(string _searchBy, string _searchString)
        {
            return InvoiceDB.GetInvoiceBySearchCriteria(_searchBy, _searchString);
        }


    }
}
