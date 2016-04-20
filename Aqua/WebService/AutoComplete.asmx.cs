using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AquaLibrary.BusinessObject.Collections;
using AquaLibrary.BusinessObject;
using AquaLibrary.BusinessLayer;
using System.Data;

namespace Aqua.WebService
{
    /// <summary>
    /// Summary description for AutoComplete
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class AutoComplete : System.Web.Services.WebService
    {

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<string> GetSearchItems(string prefixText, int count, string contextKey) 
        {
            List<string> myList = AccountManager.GetAutoCompleteList(contextKey, prefixText);
            return myList.Take(count).ToList<string>();
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<string> GetProductSearchItems(string prefixText, int count, string contextKey)
        {
            List<string> myList = ProductManager.GetAutoCompleteList(contextKey, prefixText);          
            return myList.Take(count).ToList<string>();
        }


        
    }
}
