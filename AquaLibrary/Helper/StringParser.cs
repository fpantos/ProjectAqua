using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.Helper
{
    public class StringParser
    {

        public static string GetStatus(string isActive)
        {
            string returnValue = "";
            if (isActive.ToLower() == "true")
            {
                returnValue = "Active";
            }
            else
            {
                returnValue = "Inactive";
            }

            return returnValue;
        }
        ///// <summary>
        ///// this method parses a phone number into Area Code, Prefix, and Line number
        ///// </summary>
        ///// <param name="str"></param>
        ///// <param name="location"></param>
        ///// <returns></returns>
        //public static string GetSubstringOnPhoneNumber(string str, string location)
        //{
        //    string returnVal = "";
        //    if (str != "")
        //    {

        //        if (location == "areaCode")
        //        {
        //            returnVal = str.Substring(0, 3);
        //        }
        //        else if (location == "phoneSegment1")
        //        {
        //            returnVal = str.Substring(3, 3);
        //        }

        //        else if (location == "phoneSegment2")
        //        {
        //            returnVal = str.Substring(6, 4);
        //        }


        //    }


        //    return returnVal;
        //}

        public static string ConvertCheckBoxValueIntoYesNo(string checkboxValue)
        {
            string returnValue = "";
            if (checkboxValue.ToLower() == "true")
            {
                returnValue = "Yes";
            }
            else
            {
                returnValue = "No";
            }
            return returnValue;
        }

        public static string GetProductStatus(string isDiscontinued)
        {
            string returnValue = "";
            if (isDiscontinued.ToLower() == "true")
            {
                returnValue = "Discontinued";
            }
            else
            {
                returnValue = "Active";
            }

            return returnValue;
        }

        public static string PrepareNullValueForDisplay(string val)
        {
            string returnValue = "";
            if (val == "")
            {
                returnValue = "-";
            }
            else
            {
                returnValue = val;
            }
            return returnValue;
        }

        public static string FormatPhonenumber(string phonenumber)
        {
            string returnValue = "";

            if (phonenumber != "-")
            {
                returnValue = String.Format("{0:(###) ###-####}", Convert.ToInt64(phonenumber));
            }
            else //phonenumber == "-"
            {
                returnValue = phonenumber;
            }

            return returnValue;
        }

        public static string FormatShortTimeString(string theTime) 
        {
            string returnValue = "";

            returnValue = Convert.ToDateTime(theTime).ToShortTimeString();

            //add a leading zero 0 if the length of the chars is not equal 8
            // i.e 9:00 AM will turn into 09:00 AM
            if (returnValue.Length != 8)
            {
                returnValue = "0" + returnValue;
            }

            return returnValue;
          
        }

        public static string GetReminderFrequencyValueInString(string value)
        {
            string retVal = "";

            if (value == "12") 
            {
                retVal = "Annually";
            }
            else if (value == "6")
            {
                retVal = "Semi-Annually";
            }
            else if (value == "3")
            {
                retVal = "Quarterly";
            }
            else 
            {
                retVal = "-";
            }
            return retVal;
        
        }

    }


}
