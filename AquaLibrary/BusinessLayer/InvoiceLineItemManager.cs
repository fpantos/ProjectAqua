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
    public class InvoiceLineItemManager
    {

        public static int Save(InvoiceLineItem lineItem)
        {
            return InvoiceLineItemDB.Save(lineItem);
        }
    }
}
