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
    public class ProductPartReplacementManager
    {

        public static int Save(ProductPartReplacement prodReplacement) 
        {
            return ProductPartReplacementDB.Save(prodReplacement);
        }
    }
}
