using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Aqua
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Session.RemoveAll();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            Exception theException = HttpContext.Current.Server.GetLastError();

            if ((theException is HttpUnhandledException) && (theException.InnerException != null))
            {
                theException = theException.InnerException;
            }

            //Server.Transfer("~/Error/Uh-oh.aspx");
            //Server.Transfer("~/Error/Whoops.aspx");


        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        


    }
}