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
    public class Ref_ProductCategoryManager
    {

        public static int Save(Ref_ProductCategory prodCategory)
        {
            return Ref_ProductCategoryDB.Save(prodCategory);

        }


        public static int DeleteProductCategory(int categoryID)
        {
            return Ref_ProductCategoryDB.DeleteProductCategory(categoryID);

        }
        public static Ref_ProductCategoryList GetList()
        {
            return Ref_ProductCategoryDB.GetList();
        }

        public static Ref_ProductCategory GetByID(int id) 
        {
            return Ref_ProductCategoryDB.GetByID(id);
        }
    }
}
