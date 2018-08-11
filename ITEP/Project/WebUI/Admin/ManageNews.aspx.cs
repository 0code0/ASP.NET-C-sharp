using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {

        
        e.Values.Add("IsDeleted",false);
      
        e.Values.Add("CreatedOn", Convert.ToString(DateTime.Now));

        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload2");
        if (fu.HasFile)
        { 
            
            string UploadFolderRelativePath = "~/Uploads/";
            string UploadFolderAbsolutePath  =Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, fu.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, fu.FileName);

            fu.SaveAs(FullFilePath);

            e.Values.Add("ImagePath",FileRelativePath);
        
        }

    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues.Add("CreatedOn", Convert.ToString(DateTime.Now));
        e.NewValues.Add("IsDeleted", false);
      
        FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload1");
        if (fu.HasFile)
        {

            string UploadFolderRelativePath = "~/Uploads/";
            string UploadFolderAbsolutePath = Server.MapPath(UploadFolderRelativePath);

            string FullFilePath = string.Format("{0}/{1}", UploadFolderAbsolutePath, fu.FileName);
            string FileRelativePath = string.Format("{0}/{1}", UploadFolderRelativePath, fu.FileName);

            fu.SaveAs(FullFilePath);


            e.NewValues.Add("ImagePath", FileRelativePath);
        }
        else if(!fu.HasFile) {

            HiddenField link = (HiddenField)DetailsView1.FindControl("TmageReload");


            e.NewValues.Add("ImagePath",link.Value);

        
        }

        
    }
    protected void Button1_Click1(object sender, EventArgs e)
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

    protected void DropDownList5_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;

        ListItem li = new ListItem("-Select-", "0");
        ddl.Items.Insert(0, li);
    }
    protected void DropDownList4_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;

        ListItem li = new ListItem("-Select-", "0");
        ddl.Items.Insert(0, li);
    }
    
}