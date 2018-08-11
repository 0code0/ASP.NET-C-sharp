using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using DataAccess;
using BusinessObject;

public partial class User_AnswerById : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        editor1.Visible = false;
        answerwithoutsign.Visible = true;

        System.Web.Security.MembershipUser user = System.Web.Security.Membership.GetUser();
        if (User.Identity.IsAuthenticated)
        {

            editor1.Visible = true;
            answerwithoutsign.Visible = false;

            
        }

        int questionid = Convert.ToInt16(Request.QueryString["Id"]);
        if (!(questionid == 0)) {
            BusinessObject.Question question = BusinessLogic.QuestionBL.GetSingle(questionid);
            question.NoOfViews++;

            BusinessLogic.QuestionBL.Update(question);
        
        }

    }

    protected void lnkVoteUp_Click(object sender, EventArgs e)
    {
        
        IButtonControl btn = (IButtonControl)sender;

        int answerId = Convert.ToInt16(btn.CommandArgument);
        BusinessObject.Answers answer = BusinessLogic.AnswerBL.GetSingle(answerId);
        answer.Votes++;

        BusinessLogic.AnswerBL.Update(answer);
        Repeater1.DataBind();
    }

    protected void lnkVoteDown_Click(object sender, EventArgs e)
    {
        IButtonControl btn = (IButtonControl)sender;

        int answerId = Convert.ToInt16(btn.CommandArgument);
        BusinessObject.Answers answer = BusinessLogic.AnswerBL.GetSingle(answerId);
        answer.Votes--;

        BusinessLogic.AnswerBL.Update(answer);
        Repeater1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        System.Web.Security.MembershipUser user = System.Web.Security.Membership.GetUser();
        if (User.Identity.IsAuthenticated)
        {
            
            BusinessObject.Answers answer = new BusinessObject.Answers();
            answer.Ans = editor1.Text;
            answer.QuestionId = Convert.ToInt16(Request.QueryString["Id"]);
            answer.CreatedOn = Convert.ToString(DateTime.Now);
            answer.UserName = user.UserName;
            answer.IsApproved = false;
            answer.IsDeleted = false;
            BusinessLogic.AnswerBL.Add(answer);

            Repeater1.DataBind();

            Email email = new Email();

            email.to = System.Configuration.ConfigurationManager.AppSettings["Mail"];

            email.subject = System.Web.Security.Membership.GetUser().Email;

            email.body = editor1.Text + "................"+System.Web.Security.Membership.GetUser().Email;

            EmailBL.sendmail(email);
            

        }
        
            }
}