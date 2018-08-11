using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessObject;

public partial class AskQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        

    }
    protected void SubmitAns_Click(object sender, EventArgs e)
    {

        System.Web.Security.MembershipUser user = System.Web.Security.Membership.GetUser();

        Question question = new Question();

        
            question.Title = QuestionTitleV.Text;
            question.Description = DescriptionV.Text;
            question.UserName = user.UserName;

            if (System.Web.Security.Roles.IsUserInRole("Admin"))
            {
                question.IsApproved = true;
            }
            else
            {

                question.IsApproved = false;
            }
        
        
        question.CreatedOn = Convert.ToString(DateTime.Now);
            question.IsDeleted = false;


            QuestionBL.Add(question);

            Email email = new Email();

            email.to = System.Configuration.ConfigurationManager.AppSettings["Mail"];

            email.subject = QuestionTitleV.Text;


            email.body = QuestionTitleV.Text + "..............." + System.Web.Security.Membership.GetUser().Email + "................" + DescriptionV.Text + "<br/>" + "http://localhost:4949/WebUI/Admin/Default.aspx";


            EmailBL.sendmail(email);


            QuestionTitleV.Text = " "; 
       
        DescriptionV.Text = " ";

        
    }


    protected void SubmitAns_Disposed(object sender, EventArgs e)
    {
        SubmitAns.PostBackUrl = "~/User/Question.aspx";
    }
}