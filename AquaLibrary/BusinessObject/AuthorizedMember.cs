using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AquaLibrary.BusinessObject
{
    public class AuthorizedMember : RecordLogger
    {
        public AuthorizedMember() 
        {
            AuthMemberID = -1;
            Firstname = "";
            Lastname = "";
            RelationToAccountOwner = "";
            AccountID = 0;
        }

        public int AuthMemberID { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string RelationToAccountOwner { get; set; }
        public int AccountID { get; set; }


    }
}
