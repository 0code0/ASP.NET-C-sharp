using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload2");
        if (fu.HasFile)
        {

            string UploadFolderRelativePath = "~/Uploads";
            string UploadFolderAbsolutePath = Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, fu.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, fu.FileName);

            fu.SaveAs(FullFilePath);

            e.Values.Add("ImagePath", FileRelativePath);

        }


    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {

        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload1");
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.Insert);
    }
}