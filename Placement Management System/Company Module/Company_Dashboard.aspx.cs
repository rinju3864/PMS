
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Company_Module
{
    public partial class Company_Dashboard : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand Cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Company_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
            try
            {
                Con.Open();
                SqlCommand Cmd = new SqlCommand("select count(*) from tbl_Company_Required_Technology where Company_Id=@cId", Con);
                Cmd.Parameters.AddWithValue("@cId", Session["Company_Id"]);
                object Count_Required_Technology = Cmd.ExecuteScalar();
                if (Count_Required_Technology != DBNull.Value)
                {
                    lbl_Required_Technology.Text = Count_Required_Technology.ToString();
                }
                else
                {
                    lbl_Required_Technology.Text = "0";

                }

                //Count Interested Student
                SqlCommand Cmd1 = new SqlCommand("select count(*) from tbl_Student_Shortlist where Company_Id=@cId", Con);
                Cmd1.Parameters.AddWithValue("@cId", Session["Company_Id"]);
                object Count_Interested_Student = Cmd1.ExecuteScalar();
                if (Count_Interested_Student != DBNull.Value)
                {
                    lbl_Interested_Student.Text = Count_Interested_Student.ToString();
                }
                else
                {
                    lbl_Interested_Student.Text = "0";

                }


                //Count Total Selected Student Till Date
                SqlCommand Cmd2 = new SqlCommand("select sum(No_Of_Recruited_Students) from tbl_Company_Past_Records where Company_Id=@cId", Con);
                Cmd2.Parameters.AddWithValue("@cId", Session["Company_Id"]);
                object Count_Student_Selected_Till_Date = Cmd2.ExecuteScalar();
                if (Count_Student_Selected_Till_Date != DBNull.Value)
                {
                    lbl_Student_Selected_Till_Date.Text = Count_Student_Selected_Till_Date.ToString();
                }
                else
                {
                    lbl_Student_Selected_Till_Date.Text = "0";
                }

                //Interview Schedule Date
                SqlCommand Cmd3 = new SqlCommand("select Arrival_Date from tbl_Generate_Schedule where Company_Id=@cId ", Con);
                Cmd3.Parameters.AddWithValue("@cId", Session["Company_Id"]);
                SqlDataReader Sdr = Cmd3.ExecuteReader();
                if (Sdr.Read())
                {
                    DateTime dt = (DateTime)Sdr["Arrival_Date"];
                    lbl_Interview_Schedule_date.Text = dt.ToString("dd-MM-yyyy");
                }
                Sdr.Close();

                //Chart Report

                SqlCommand Cmd4 = new SqlCommand("SELECT Updation_Year, SUM(No_Of_Recruited_Students) AS [Recruited Students] FROM tbl_Company_Past_Records where Company_Id='"+Convert.ToInt32(Session["Company_Id"]) +"' GROUP BY Updation_Year", Con);
                String Years = "";
                String Student_Count = "";
                SqlDataReader Dr = Cmd4.ExecuteReader();
                if (Dr.HasRows)
                {
                    while (Dr.Read())
                    {
                        Years += Dr["Updation_Year"].ToString() + ",";
                        Student_Count += Dr["Recruited Students"].ToString() + ",";
                    }
                }
                Dr.Close();
                if (!Years.Equals("") && !Student_Count.Equals(""))
                {
                    ViewState["Years"] = Years.Substring(0, Years.Length - 1);
                    ViewState["Student_Count"] = Student_Count.Substring(0, Student_Count.Length - 1);
                }
                else
                {
                    ViewState["Years"] = "2015,2016,2017,2018,2019,2020";
                    ViewState["Student_Count"] = "0,0,0,0,0,0";
                }

            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {

            }

        }


    }
}