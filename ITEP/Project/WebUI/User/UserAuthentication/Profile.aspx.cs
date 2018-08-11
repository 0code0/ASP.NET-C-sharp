using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessObject;


public partial class User_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // To get the username, we will have to use the Membership class in System.Web.Security namespace
        System.Web.Security.MembershipUser user = System.Web.Security.Membership.GetUser();


        Uploads upload = new Uploads();

        upload.UserName = user.UserName;


        if (System.Web.Security.Roles.IsUserInRole("Admin"))
        {
            upload.IsApproved = true;
        }
        else {

            upload.IsApproved = false;
        }
        upload.IsDeleted = false;


        upload.CreatedOn = Convert.ToString(DateTime.Now);
       

        upload.TopicsId = Convert.ToInt16(DropDownList2.SelectedValue);
        upload.IsDeleted = false;
        upload.UploadsTypeId = Convert.ToInt16(DropDownList3.SelectedValue);

        upload.Title = UploadFileTitle.Text;

        if (FileUpload1.HasFile)
        {

            string UploadFolderRelativePath = "~/Uploads/";
            string UploadFolderAbsolutePath = Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, FileUpload1.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, FileUpload1.FileName);

            FileUpload1.SaveAs(FullFilePath);
            upload.Path = FileRelativePath;
        }
        

        

        UploadsBL.Add(upload);

        
        Email send = new Email();

        send.to = "sjaswinder300@gmail.com";

        send.subject = System.Web.Security.Membership.GetUser().Email;

        send.body = "New user add some file <a href='http://localhost:2709/WebUI/Admin/ManageUploads.aspx'>click Link to approved the file</a>";

        EmailBL.sendmail(send);

        

    }


    protected void FileUpload1_DataBinding(object sender, EventArgs e)
    {
        
    }
}