using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Company_Module
{
    public partial class Company_About_Us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Company_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
        }
    }
}