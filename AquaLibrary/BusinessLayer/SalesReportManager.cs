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
    public class SalesReportManager
    {
        public static DataTable GetSalesByDateRange(string fromMonth, string fromYear, string toMonth, string toYear) 
        {
            return SalesReportDB.GetSalesByDateRange( fromMonth, fromYear, toMonth, toYear);
        }

        public static DataTable GetYTDSales() 
        {
            return SalesReportDB.GetYTDSales();
        }
    }
}
