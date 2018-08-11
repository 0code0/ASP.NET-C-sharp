using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        regularsectionNews.Visible = false;
       
        if (User.Identity.IsAuthenticated) {

            Login1.Visible = false;

            regularsectionNews.Visible = true;

        
        }

    }


}