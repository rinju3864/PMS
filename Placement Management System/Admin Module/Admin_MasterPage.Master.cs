using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Admin_Module
{
    public partial class Admin_MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Init(object Sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
            lbl_Username.Text = Session["Admin_Name"].ToString();
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>Confirm('Are You Sure You Want To Logout?')</script>");

            Session.Remove("Admin_Id");
            Session.Remove("Admin_Email_Id");
            Session.Remove("Admin_Name");
            Response.Redirect("../LoginPage.aspx");
        }

    }
}