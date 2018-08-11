using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using BusinessLogic;
using BusinessObject;
using DataAccess;
public partial class User_FeedBacks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        Email email = new Email();

        email.to =System.Configuration.ConfigurationManager.AppSettings["Mail"];
        email.subject = MsgTitle.Text+" "+EmailAddress.Text;
        email.body = Body.Text;

        EmailBL.sendmail(email);

        EmailAddress.Text = " ";
        MsgTitle.Text = " ";
        Body.Text = " ";
        Number.Text = " ";
        FullName.Text = " ";


    }
}