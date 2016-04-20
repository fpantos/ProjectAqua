using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Web.Security;

namespace Aqua
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
        {
            System.Net.Mail.SmtpClient smtpSender = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            smtpSender.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtpSender.Credentials = new System.Net.NetworkCredential("no.reply.theproject@gmail.com", "Winter2011!@#");
            smtpSender.EnableSsl = true;//no.reply.theproject@gmail.com

            smtpSender.Send(e.Message);
            e.Cancel = true;
          
          
   
            /*
            System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential("bata.reiner@gmail.com", "dellpcnei");
            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            mailClient.EnableSsl = true;
            mailClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = mailAuthentication;
            
            MailMessage myMessage = new MailMessage();
            myMessage.To.Add(new MailAddress("reinerbata@hotmail.com"));
            myMessage.Subject = "dis wont work man 222";
            mailClient.Send(myMessage);
            
            
              MailMessage myMessage = new MailMessage();
            SmtpClient mySmtpClient = new SmtpClient();
            //System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential("bata.reiner@gmail.com","dellpcnei");
            

          //string answer= (PasswordRecovery1.FindControl("Answer") as TextBox).Text;
           
            //  string password = Membership.Provider.GetPassword(UsernameTextBox.Text, answer);
            myMessage.To.Add(new MailAddress("bata.reiner@gmail.com"));
            myMessage.Subject = "Your new password";
            myMessage.IsBodyHtml = false;
            mySmtpClient.Port = 587;


            mySmtpClient.Credentials = new System.Net.NetworkCredential("bata.reiner@gmail.com", "dellpcnei");
            mySmtpClient.EnableSsl = true;
            mySmtpClient.Send(myMessage);
*/
        }
    }
}