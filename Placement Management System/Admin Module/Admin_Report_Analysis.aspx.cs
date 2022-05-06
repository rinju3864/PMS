using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Admin_Module
{
    public partial class Admin_Report_Analysis : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }

            if (!IsPostBack)
            {
                ddl_Report_List_SelectedIndexChanged(sender, e);
                ddl_Company_List.DataBind();
                ddl_Year_List.DataBind();
            }
        }

        protected void ddl_Report_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnl_Select.Visible = false;
            SqlCommand Query = new SqlCommand();
            Query.Connection = Con;
            if (ddl_Report_List.SelectedIndex == 0)
            {
                //Report 1
                // Current Year Stipend,Package,Tenure Offered By Each Company
                Query.CommandText = "SELECT tbl_Company_Basic_Details.Company_Name as [Company Name], tbl_Company_Past_Records.Highest_Stipend as [Highest Stipend Offered], tbl_Company_Past_Records.Highest_Package  as [Highest Package Offered], tbl_Company_Past_Records.Lowest_Tenure  as [Lowest Tenure Offered], tbl_Company_Past_Records.No_Of_Recruited_Students as [No Of Recruited Students] FROM tbl_Company_Basic_Details INNER JOIN tbl_Company_Past_Records ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Past_Records.Company_Id where Updation_Year='" + DateTime.Now.Year + "'";
            }
            else if (ddl_Report_List.SelectedIndex == 1)
            {
                //Report 2
                // Previous Years Statistics of Each Company
                Query.CommandText = "SELECT tbl_Company_Past_Records.Updation_Year as [Year],tbl_Company_Basic_Details.Company_Name as [Company Name], tbl_Company_Past_Records.Highest_Stipend as [Highest Stipend Offered], tbl_Company_Past_Records.Highest_Package  as [Highest Package Offered], tbl_Company_Past_Records.Lowest_Tenure  as [Lowest Tenure Offered], tbl_Company_Past_Records.No_Of_Recruited_Students as [No Of Recruited Students] FROM tbl_Company_Basic_Details INNER JOIN tbl_Company_Past_Records ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Past_Records.Company_Id order by Updation_Year";
            }
            else if (ddl_Report_List.SelectedIndex == 2)
            {
                //Report 3
                // Total Recruited Students By Each Company Uptill Now
                Query.CommandText = "SELECT tbl_Company_Basic_Details.Company_Name as [Company Name], SUM(tbl_Company_Past_Records.No_Of_Recruited_Students) as [Total Recruited Students] FROM tbl_Company_Basic_Details INNER JOIN tbl_Company_Past_Records ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Past_Records.Company_Id group by tbl_Company_Basic_Details.Company_Name";
            }
            else if (ddl_Report_List.SelectedIndex == 3)
            {
                //Report 4
                // Previous Year's Highest Package Offered
                Query.CommandText = "sp_Report4_Highest_Package";
                Query.CommandType = CommandType.StoredProcedure;
            }
            else if (ddl_Report_List.SelectedIndex == 4)
            {
                //Report 5
                // Previous Year's Highest Stipend Offered

                Query.CommandText = "sp_Report5_Highest_Stipend";
                Query.CommandType = CommandType.StoredProcedure;
            }
            else if (ddl_Report_List.SelectedIndex == 5)
            {
                //Report 6
                //Current Year Attendance Report of Each Company

                Query.CommandText = "sp_Report6_Attendance_Statistics";
                Query.CommandType = CommandType.StoredProcedure;
            }
            else if (ddl_Report_List.SelectedIndex == 6)
            {
                //Report 7
                //Year Wise Reports of Individual Company's

                pnl_Select.Visible = true;
                Query.CommandText = "SELECT tbl_Company_Past_Records.Updation_Year as [Year],tbl_Company_Basic_Details.Company_Name as [Company Name], tbl_Company_Past_Records.Highest_Stipend as [Highest Stipend Offered], tbl_Company_Past_Records.Highest_Package  as [Highest Package Offered], tbl_Company_Past_Records.Lowest_Tenure  as [Lowest Tenure Offered], tbl_Company_Past_Records.No_Of_Recruited_Students as [No Of Recruited Students] FROM tbl_Company_Basic_Details INNER JOIN tbl_Company_Past_Records ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Past_Records.Company_Id where tbl_Company_Basic_Details.Company_Name='"+ddl_Company_List.SelectedValue+ "' and tbl_Company_Past_Records.Updation_Year='"+ddl_Year_List.SelectedValue+"' order by tbl_Company_Past_Records.Updation_Year";
            }
            else if (ddl_Report_List.SelectedIndex == 7)
            {
                //Report 8
                // Total Number of Time Company's Visited Institute

                Query.CommandText = "sp_Report7_Visit_Count";
                Query.CommandType = CommandType.StoredProcedure;
            }
            else if (ddl_Report_List.SelectedIndex == 8)
            {
                //Report 9
                // Student-Company Ratio Of Each Year
                Query.CommandText = "Select Year as [Academic Year],Invitation_Sent as [No. of Companies Invited],Invitation_Accepted as [No. of Companies Involved in Placement], Student_Count as [Total Students] from tbl_Invitation_Status order by Year desc";
            }
            try
            {
                SqlDataAdapter Sda = new SqlDataAdapter(Query);
                DataSet Ds = new DataSet();
                Sda.Fill(Ds);
                DataSet NewDs = new DataSet();
                DataTable FinalTable = new DataTable();
                for (int i = 0; i < Ds.Tables.Count; i++)
                {
                    FinalTable.Merge(Ds.Tables[i]);
                }
                NewDs.Tables.Add(FinalTable);
                if (NewDs.Tables[0].Rows.Count != 0)
                {
                    lbl_No_Record.Visible = false;
                    gv_Report.Visible = true;
                    gv_Report.DataSource = NewDs.Tables[0];
                    gv_Report.DataBind();
                }
                else
                {
                    if (ddl_Report_List.SelectedIndex == 6)
                    {
                        lbl_No_Record.Text = ddl_Company_List.SelectedValue+" company did not visited the institute in year "+ddl_Year_List.SelectedValue;
                    }
                    lbl_No_Record.Visible = true;
                    gv_Report.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void ddl_Company_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Report_List_SelectedIndexChanged(sender,e);
        }

        protected void ddl_Year_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Report_List_SelectedIndexChanged(sender, e);
        }
    }
}