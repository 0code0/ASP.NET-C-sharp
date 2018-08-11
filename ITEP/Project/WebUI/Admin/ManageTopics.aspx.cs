using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageTopics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.Insert);

    }


    protected void DropDownList5_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;

        ListItem li = new ListItem("-Select-", "0");
        ddl.Items.Insert(0, li);

    }
    protected void DropDownList6_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;

        ListItem li = new ListItem("-Select-", "0");
        ddl.Items.Insert(0, li);


    }

    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {

        DetailsView DV = (DetailsView)sender;
        
        if (DV.CurrentMode == DetailsViewMode.Edit)
        {

            DropDownList ddl = DV.FindControl("DropDownList5") as DropDownList;
            if (ddl != null)
            {
                BusinessObject.Topics topic = DV.DataItem as BusinessObject.Topics;


                if (topic != null)
                {
                    ddl.SelectedValue = Convert.ToString(topic.ParentId);
                }
            }  
       
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


    

    protected void DropDownList7_DataBound(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        DetailsView dv = (DetailsView)sender;

        DropDownList ddl = dv.FindControl("DropDownList6") as DropDownList;

        e.Values.Add("ParentId",ddl.SelectedValue);
        

    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        DetailsView dv = (DetailsView)sender;

        DropDownList ddl = dv.FindControl("DropDownList5") as DropDownList;

        e.NewValues.Add("ParentId", ddl.SelectedValue);
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    
}
