using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Company_Module
{
    public partial class Company_Alerts : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Company_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
            if (!IsPostBack)
            {
                SqlDataAdapter Da = new SqlDataAdapter("SELECT [Company_Id], [Company_Email_Id], [Subject], [Message], [Alert_Time] FROM [tbl_Company_Alerts] WHERE ([Company_Id] = '"+Convert.ToInt32(Session["Company_Id"].ToString())+"') ORDER BY [Alert_Time] DESC", Con);
                DataSet Ds = new DataSet();
                Da.Fill(Ds, "tbl_Company_Alerts");
                if (Ds.Tables[0].Rows.Count != 0)
                {
                    rpt_Alerts.DataSource = Ds.Tables[0];
                    rpt_Alerts.DataBind();
                }
                else
                {
                    lbl_Message.Visible = true;
                    lbl_Message.Text = "No Alerts Received Till Now.";
                }
            }
        }
    }
}