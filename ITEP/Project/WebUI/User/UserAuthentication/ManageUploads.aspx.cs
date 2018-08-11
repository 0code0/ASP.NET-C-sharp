using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageUploads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
{
    hfUserName.Value = System.Web.Security.Membership.GetUser().UserName;       

}

    


    }
    
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataBind();
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }
    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload1");
        if (fu.HasFile)
        {

            string UploadFolderRelativePath = "~/Uploads/";
            string UploadFolderAbsolutePath = Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, fu.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, fu.FileName);

            fu.SaveAs(FullFilePath);

            e.Values.Add("ImagePath", FileRelativePath);

        }

    
    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload2");
        if (fu.HasFile)
        {

            string UploadFolderRelativePath = "~/Uploads";
            string UploadFolderAbsolutePath = Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, fu.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, fu.FileName);

            fu.SaveAs(FullFilePath);


            e.NewValues.Add("ImagePath", FileRelativePath);


        }

    }


    protected void DetailsView1_ItemInserting1(object sender, DetailsViewInsertEventArgs e)
    {
        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload2");
        if (fu.HasFile)
        {

            string UploadFolderRelativePath = "~/Uploads";
            string UploadFolderAbsolutePath = Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, fu.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, fu.FileName);

            fu.SaveAs(FullFilePath);


            e.Values.Add("Path", FileRelativePath);


        }


    }
    protected void DetailsView1_ItemUpdating1(object sender, DetailsViewUpdateEventArgs e)
    {
        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload1");
        if (fu.HasFile)
        {

            string UploadFolderRelativePath = "~/Uploads";
            string UploadFolderAbsolutePath = Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, fu.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, fu.FileName);

            fu.SaveAs(FullFilePath);


            e.NewValues.Add("Path", FileRelativePath);


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