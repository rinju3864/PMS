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
    public partial class Company_Interested_Students : System.Web.UI.Page
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
                try
                {
                    SqlDataAdapter Sda = new SqlDataAdapter("SELECT tbl_Student_Basic_Details.Student_Photo, tbl_Student_Basic_Details.Student_Id, tbl_Student_Basic_Details.Student_Name, tbl_Student_Basic_Details.Student_Phone_No, tbl_Student_Basic_Details.Student_Email_Id, tbl_Student_Basic_Details.Student_UG_Course, tbl_Student_Basic_Details.Student_PG_Course FROM tbl_Company_Basic_Details INNER JOIN tbl_Interested_Student ON tbl_Company_Basic_Details.Company_Id = tbl_Interested_Student.Company_Id INNER JOIN tbl_Student_Basic_Details ON tbl_Interested_Student.Student_Id = tbl_Student_Basic_Details.Student_Id WHERE (tbl_Company_Basic_Details.Company_Id = '"+Convert.ToInt32(Session["Company_Id"].ToString())+"')", Con);
                    DataSet Ds = new DataSet();
                    Sda.Fill(Ds);
                    if (Ds.Tables[0].Rows.Count != 0)
                    {
                        pnl_Message.Visible = false;
                        DataList_Student_Details.Visible = true;
                        DataList_Student_Details.DataSource = Ds.Tables[0];
                        DataList_Student_Details.DataBind();
                    }
                    else
                    {
                        pnl_Message.Visible = true;
                        DataList_Student_Details.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}