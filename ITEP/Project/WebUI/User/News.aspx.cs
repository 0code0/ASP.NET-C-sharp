using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        

    }

    
    
    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        Page_Load(null,EventArgs.Empty);
     
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Page_Load(null, EventArgs.Empty);
    }
    protected void Repeater1_Load(object sender, EventArgs e)
    {
        Page_Load(null, EventArgs.Empty);
    }
    protected void Repeater1_PreRender(object sender, EventArgs e)
    {
        Page_Load(null, EventArgs.Empty);
    }
    protected void Repeater1_Unload(object sender, EventArgs e)
    {
        Page_Load(null, EventArgs.Empty);
    }
    protected void Repeater1_Init(object sender, EventArgs e)
    {
        Page_Load(null, EventArgs.Empty);
    }
    protected void Repeater1_Disposed(object sender, EventArgs e)
    {
        Page_Load(null, EventArgs.Empty);
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Page_Load(null, EventArgs.Empty);
    }
    protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
        Page_Load(null, EventArgs.Empty);
    }
    protected void Repeater1_DataBinding(object sender, EventArgs e)
    {
        Page_Load(null, EventArgs.Empty);
    }
}