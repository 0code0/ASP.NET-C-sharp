using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink7.Visible = false;
        HyperLink8.Visible = false;

        if (Roles.IsUserInRole("Admin"))
        {

            HyperLink8.Visible = true;
            HyperLink7.Visible = true;
            RegisterMenu.Visible = false;
        }
        if(Roles.IsUserInRole("User")){

          HyperLink7.Visible = true;
          RegisterMenu.Visible = false;
        }

       


    }

    
}
