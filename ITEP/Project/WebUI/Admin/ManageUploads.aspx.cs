using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Admin_ManageUploads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.Insert);
    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataBind();
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }
    

    protected void DetailsView1_ItemInserting1(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values.Add("UserName", System.Web.Security.Membership.GetUser().UserName);
        e.Values.Add("IsApproved", true);
        e.Values.Add("IsDeleted", false);
        e.Values.Add("CreatedOn", Convert.ToString(DateTime.Now));
        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload2");
        if (fu.HasFile)
        {

            string UploadFolderRelativePath = "~/Uploads/";
            string UploadFolderAbsolutePath = Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, fu.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, fu.FileName);

            fu.SaveAs(FullFilePath);


            e.Values.Add("Path", FileRelativePath);


        }



    }
    protected void DetailsView1_ItemUpdating1(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues.Add("UserName", System.Web.Security.Membership.GetUser().UserName);
        //e.NewValues.Add("IsApproved", true);
        e.NewValues.Add("IsDeleted", false);
        e.NewValues.Add("CreatedOn", Convert.ToString(DateTime.Now));
        
          

        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload1");
        if (fu.HasFile)
        {

            string UploadFolderRelativePath = "~/Uploads/";
            string UploadFolderAbsolutePath = Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, fu.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, fu.FileName);

            fu.SaveAs(FullFilePath);


            e.NewValues.Add("Path", FileRelativePath);


        }
        else if(!fu.HasFile){

            HiddenField link = (HiddenField)DetailsView1.FindControl("ImagePath");

            e.NewValues.Add("Path",link.Value);
        }
      

    }
    protected void DetailsView1_ItemInserted1(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataBind();

    }
    protected void DetailsView1_ItemUpdated1(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }

    
}