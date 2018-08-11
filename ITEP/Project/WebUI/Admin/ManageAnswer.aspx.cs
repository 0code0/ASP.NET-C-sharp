using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageAnswer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.Insert);
    }




    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values.Add("IsApproved",true);
        e.Values.Add("CreatedOn", Convert.ToString(DateTime.Now));
        e.Values.Add("IsDeleted", false);
        e.Values.Add("UserName", System.Web.Security.Membership.GetUser().UserName);
            }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {

        e.NewValues.Add("CreatedOn", Convert.ToString(DateTime.Now));
        e.NewValues.Add("IsDeleted", false);
        e.NewValues.Add("UserName", System.Web.Security.Membership.GetUser().UserName);
     
    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataBind();

    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }
    
}