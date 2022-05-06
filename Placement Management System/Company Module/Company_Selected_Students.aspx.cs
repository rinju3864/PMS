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
    public partial class Company_Selected_Students : System.Web.UI.Page
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
                    SqlDataAdapter Sda = new SqlDataAdapter("SELECT tbl_Student_Basic_Details.Student_Photo, tbl_Student_Basic_Details.Student_Id, tbl_Student_Basic_Details.Student_Name, tbl_Interview_Results.Final_Stipend, tbl_Interview_Results.Final_Package, tbl_Interview_Results.Final_Tenure FROM tbl_Student_Basic_Details INNER JOIN tbl_Interview_Results ON tbl_Student_Basic_Details.Student_Id = tbl_Interview_Results.Student_Id WHERE([Company_Id] = '"+Convert.ToInt32(Session["Company_Id"].ToString())+"') and Status = 'Select'", Con);
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