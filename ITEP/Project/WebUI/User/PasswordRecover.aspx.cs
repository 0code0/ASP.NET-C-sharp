using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
public partial class User_PasswordRecover : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
    {

       

      SmtpClient client = new SmtpClient();
           client.DeliveryMethod = SmtpDeliveryMethod.Network;

           client.Host = System.Configuration.ConfigurationManager.AppSettings["Host"];
           client.Port = Convert.ToInt16(System.Configuration.ConfigurationManager.AppSettings["Port"]);
           client.EnableSsl= Convert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings["EnableSsl"]);
           client.UseDefaultCredentials = false;
           client.Credentials = new System.Net.NetworkCredential(System.Configuration.ConfigurationManager.AppSettings["Email"],System.Configuration.ConfigurationManager.AppSettings["Password"]);

        

    }
}