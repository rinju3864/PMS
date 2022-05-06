using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections;

namespace Placement_Management_System.Admin_Module
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
            try
            {
                Con.Open();

                //Company Count
                SqlCommand Cmd = new SqlCommand("select count(*) from tbl_Company_Basic_Details", Con);
                object Total_Company = Cmd.ExecuteScalar();
                if (Total_Company != DBNull.Value)
                {
                    lbl_Total_Company.Text = Total_Company.ToString();
                }
                else
                {
                    lbl_Total_Company.Text = "0";

                }

                //Student Count
                SqlCommand Cmd1 = new SqlCommand("select count(*) from tbl_Student_Basic_Details", Con);
                object Total_Students = Cmd1.ExecuteScalar();
                if (Total_Students != DBNull.Value)
                {
                    lbl_Total_Student.Text = Total_Students.ToString();
                }
                else
                {
                    lbl_Total_Student.Text = "0";

                }

                //Total Selected Students
                SqlCommand Cmd2 = new SqlCommand("select count(Student_Id) from tbl_Interview_Results", Con);
                object Total_Selected_Students = Cmd2.ExecuteScalar();
                if (Total_Selected_Students != DBNull.Value)
                {
                    lbl_Total_Selected_Students.Text = Total_Selected_Students.ToString();
                }
                else
                {
                    lbl_Total_Selected_Students.Text = "0";

                }

                //Total Blacklisted Company
                SqlCommand Cmd3 = new SqlCommand("select count(*) from tbl_Company_Blacklist_Status where Company_BlackList_Status='Yes'", Con);
                object Total_Blacklisted_Company = Cmd3.ExecuteScalar();
                if (Total_Blacklisted_Company != DBNull.Value)
                {
                    lbl_Blacklisted_Company.Text = Total_Blacklisted_Company.ToString();
                }
                else
                {
                    lbl_Blacklisted_Company.Text = "0";

                }

                //Invitation Ratio
                SqlCommand Cmd4 = new SqlCommand("sp_Invitation_Ratio", Con);
                Cmd4.CommandType = System.Data.CommandType.StoredProcedure;
                Cmd4.Parameters.Add("@Invitation_Ratio", SqlDbType.Int).Direction = ParameterDirection.Output;
                int Result_Check = Cmd4.ExecuteNonQuery();
                int Invitation_Ratio = Convert.ToInt32(Cmd4.Parameters["@Invitation_Ratio"].Value.ToString());
                lbl_Invitation_Ratio.Text = Invitation_Ratio.ToString();

                //Student Got Placed

                SqlCommand Cmd5 = new SqlCommand("sp_Student_Got_Placed", Con);
                Cmd5.CommandType = System.Data.CommandType.StoredProcedure;
                Cmd5.Parameters.Add("@Student_Placed", SqlDbType.Int).Direction = ParameterDirection.Output;
                int Result_Check_1 = Cmd5.ExecuteNonQuery();
                int Student_Placed = Convert.ToInt32(Cmd5.Parameters["@Student_Placed"].Value.ToString());
                lbl_Student_Got_Placed.Text = Student_Placed.ToString();

                //Chart Report

                SqlCommand Cmd6 = new SqlCommand("SELECT Updation_Year, SUM(No_Of_Recruited_Students) AS [Recruited Students] FROM tbl_Company_Past_Records GROUP BY Updation_Year", Con);
                String Years = "";
                String Student_Count ="";
                SqlDataReader Dr = Cmd6.ExecuteReader();
                if (Dr.HasRows)
                {
                    while (Dr.Read())
                    {
                        Years+=Dr["Updation_Year"].ToString()+",";
                        Student_Count+=Dr["Recruited Students"].ToString()+",";
                    }
                }
                Dr.Close();
                ViewState["Years"] = Years.Substring(0,Years.Length-1);
                ViewState["Student_Count"] = Student_Count.Substring(0,Student_Count.Length-1);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
            finally {
                Con.Close();
            }

           
        }
    }
}