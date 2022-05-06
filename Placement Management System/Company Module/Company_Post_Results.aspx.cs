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
    public partial class Company_Post_Results : System.Web.UI.Page
    {

        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Company_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
            lbl_Company_Id.Text = Session["Company_Id"].ToString();
            lbl_Current_Year.Text = DateTime.Now.Year.ToString();
            if (!IsPostBack)
            {
                //Status_Set();
            }
        }

        protected void Status_Set()
        {
            foreach (GridViewRow Row in GridView1.Rows)
            {
                RadioButtonList Status = (RadioButtonList)Row.FindControl("rbl_Status");

                TextBox Final_Stipend = (TextBox)Row.FindControl("Final_Stipend");
                TextBox Final_Package = (TextBox)Row.FindControl("Final_Package");
                TextBox Final_Tenure = (TextBox)Row.FindControl("Final_Tenure");

                String Student_Id = Row.Cells[1].Text;

                try
                {
                    Con.Open();
                    SqlCommand Cmd = new SqlCommand("Select Status,Final_Stipend,Final_Package,Final_Tenure from tbl_Interview_Results where Student_Id='" + Convert.ToInt64(Student_Id) + "' and Company_Id='" + Convert.ToInt32(lbl_Company_Id.Text) + "'", Con);
                    SqlDataReader Dr = Cmd.ExecuteReader();
                    if (Dr.HasRows)
                    {
                        while (Dr.Read())
                        {
                            Final_Stipend.Text = Dr["Final_Stipend"].ToString();
                            Final_Package.Text = Dr["Final_Package"].ToString();
                            Final_Tenure.Text = Dr["Final_Tenure"].ToString();
                            Status.SelectedValue = Dr["Status"].ToString();
                        }
                    }
                    else
                    {
                        Dr.Close();
                        SqlCommand Cmd2 = new SqlCommand("Select Stipend,Package,Tenure from tbl_Company_Offerings where Company_Id='" + Convert.ToInt32(lbl_Company_Id.Text) + "'", Con);
                        SqlDataReader Dr2 = Cmd2.ExecuteReader();
                        while (Dr2.Read())
                        {
                            Final_Stipend.Text = Dr2["Stipend"].ToString();
                            Final_Package.Text = Dr2["Package"].ToString();
                            Final_Tenure.Text = Dr2["Tenure"].ToString();
                        }
                        Dr2.Close();
                    }
                    Dr.Close();
                }
                catch (SqlException Ex)
                {
                    Response.Write(Ex.Message);
                }
                finally
                {
                    Con.Close();
                }
                
            }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            int Act = 0;
            int Complete = 0;
            foreach (GridViewRow Row in GridView1.Rows)
            {
                RadioButtonList Status = (RadioButtonList)Row.FindControl("rbl_Status");
                String Student_Id = Row.Cells[1].Text;
                TextBox Final_Stipend = (TextBox)Row.FindControl("Final_Stipend");
                TextBox Final_Package = (TextBox)Row.FindControl("Final_Package");
                TextBox Final_Tenure = (TextBox)Row.FindControl("Final_Tenure");

                if (Status.SelectedIndex != -1)
                {
                    try
                    {
                        if (Status.SelectedValue.Equals("Reject"))
                        {
                            Final_Stipend.Text = "0";
                            Final_Package.Text = "0";
                            Final_Tenure.Text = "0";
                        }
                        Con.Open();
                        SqlCommand Cmd1 = new SqlCommand("sp_Company_Post_Results", Con);
                        Cmd1.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(lbl_Company_Id.Text));
                        Cmd1.Parameters.AddWithValue("@Student_Id", Convert.ToInt64(Student_Id));
                        Cmd1.Parameters.AddWithValue("@Status", Status.SelectedValue);
                        if (Final_Stipend.Text.Equals(""))
                        {
                            Cmd1.Parameters.AddWithValue("@Final_Stipend", float.Parse("0"));
                        }
                        else
                        {
                            Cmd1.Parameters.AddWithValue("@Final_Stipend", float.Parse(Final_Stipend.Text));
                        }
                        if (Final_Package.Text.Equals(""))
                        {
                            Cmd1.Parameters.AddWithValue("@Final_Package", float.Parse("0"));

                        }
                        else
                        {
                            Cmd1.Parameters.AddWithValue("@Final_Package", float.Parse(Final_Package.Text));
                        }
                        if (Final_Tenure.Text.Equals(""))
                        {
                            Cmd1.Parameters.AddWithValue("@Final_Tenure", Convert.ToInt16("0"));
                        }
                        else
                        {
                            Cmd1.Parameters.AddWithValue("@Final_Tenure", Convert.ToInt16(Final_Tenure.Text));
                        }

                        Cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                        if (Cmd1.ExecuteNonQuery() <= 0)
                        {
                            Response.Write("<script>alert('Results NOT Configured Successfully.!!')</script>");
                        }
                        else
                        {
                            Complete++;
                        }
                    }
                    catch (SqlException E)
                    {
                        Response.Write(E.Message);
                    }
                    finally
                    {
                        Con.Close();
                    }
                }
                else
                {
                    Act++;
                }

            }
            if (Act > 0)
            {
                Response.Write("<script>alert('Please Select All The Status Carefully..!!');</script>");
            }
            if (Complete > 0)
            {
                Response.Write("<script>alert('Results Configured Successfully.!!')</script>");
                try
                {
                    // For Insert Action=0
                    // For Update Action=1

                    Con.Open();
                    SqlCommand Cmd = new SqlCommand("Select * from tbl_Company_Past_Records where Company_Id='"+Convert.ToInt32(Session["Company_Id"].ToString())+"' and Updation_Year='"+DateTime.Now.Year+"'",Con);
                    SqlDataReader Dr = Cmd.ExecuteReader();
                    int Action = 0;
                    if (Dr.HasRows)
                    {
                        Action = 1;    
                    }
                    else
                    {
                        Action = 0;
                    }
                    Dr.Close();
                    SqlCommand Cmd2 = new SqlCommand("Select MAX(Final_Stipend) as Stipend,MAX(Final_Package) as Package,MIN(Final_Tenure) as Tenure,Count(Student_Id) as CountNo from tbl_Interview_Results where Company_Id='"+ Convert.ToInt32(Session["Company_Id"].ToString()) + "'", Con);
                    SqlDataReader Dr2 = Cmd2.ExecuteReader();
                    while (Dr2.Read())
                    {
                        SqlCommand Cmd3 = new SqlCommand("sp_Company_Past_Record",Con);
                        Cmd3.CommandType = CommandType.StoredProcedure;
                        Cmd3.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(Session["Company_Id"].ToString()));
                        Cmd3.Parameters.AddWithValue("@Updation_Year", Convert.ToInt32(DateTime.Now.Year));
                        Cmd3.Parameters.AddWithValue("@Highest_Stipend", float.Parse(Dr2["Stipend"].ToString()));
                        Cmd3.Parameters.AddWithValue("@Highest_Package", float.Parse(Dr2["Package"].ToString()));
                        Cmd3.Parameters.AddWithValue("@Lowest_Tenure", Convert.ToInt16(Dr2["Tenure"].ToString()));
                        Cmd3.Parameters.AddWithValue("@No_Of_Recruited_Students", Convert.ToInt32(Dr2["CountNo"].ToString()));
                        Cmd3.Parameters.AddWithValue("@Action", Action);
                        Dr2.Close();
                        if (Cmd3.ExecuteNonQuery() <=0)
                        {
                            Response.Write("<script>alert('Past Records NOT Configured Successfully.!!')</script>");

                        }
                        break;
                    }
                    Dr2.Close();
                }
                catch (SqlException Ex)
                {
                    Response.Write(Ex.Message);
                }
                finally
                {
                    Con.Close();
                }
            }
            Status_Set();

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            try
            {
                //Con.Open();
                //SqlCommand Cmd = new SqlCommand("Select Status,Final_Stipend,Final_Package,Final_Tenure from tbl_Interview_Results where Student_Id='" + Convert.ToInt64(Student_Id) + "' and Company_Id='" + Convert.ToInt32(lbl_Company_Id.Text) + "'", Con);
                //SqlDataReader Dr = Cmd.ExecuteReader();
                
            }
            catch (SqlException Ex)
            {
                Response.Write(Ex.Message);
            }
            finally
            {
                Con.Close();
            }
            Status_Set();
        }


    }
}