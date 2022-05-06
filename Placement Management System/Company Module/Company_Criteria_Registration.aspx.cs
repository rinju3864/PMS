using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System
{
    public partial class Company_Criteria_Registration : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        //  Existing User = 1
        // New User = 0


        int SelectMode = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Company_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
            if (!IsPostBack)
            {
                ddl_Total_Rounds.SelectedValue = "0";

                cld_Estimate_ArrivalDate_From.SelectedDate = DateTime.Today;
                txt_Estimate_ArrivalDate_From.Text = cld_Estimate_ArrivalDate_From.SelectedDate.ToString("dd/MM/yyyy");

                cld_Estimate_ArrivalDate_To.SelectedDate = DateTime.Today.AddDays(14);
                txt_Estimate_ArrivalDate_To.Text = cld_Estimate_ArrivalDate_To.SelectedDate.ToString("dd/MM/yyyy");
            }

        }

        protected void cld_Estimate_ArrivalDate_From_SelectionChanged(object sender, EventArgs e)
        {
            cld_Estimate_ArrivalDate_To.SelectedDate = cld_Estimate_ArrivalDate_From.SelectedDate.AddDays(14);
            cld_Estimate_ArrivalDate_To.VisibleDate= cld_Estimate_ArrivalDate_From.SelectedDate.AddDays(14);
            txt_Estimate_ArrivalDate_From.Text = cld_Estimate_ArrivalDate_From.SelectedDate.ToString("dd/MM/yyyy");
        }

        protected void cld_Estimate_ArrivalDate_To_SelectionChanged(object sender, EventArgs e)
        {
            txt_Estimate_ArrivalDate_To.Text = cld_Estimate_ArrivalDate_To.SelectedDate.ToString("dd/MM/yyyy");
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (!ddl_PG_Type.SelectedValue.Equals(" ") && !ddl_UG_Type.SelectedValue.Equals(" "))
            {
                if (txt_Additional_Technology.Text.Equals(""))
                {
                    txt_Additional_Technology.Text = null;
                }

                try
                {
                    Con.Open();

                    SqlCommand Cmd = new SqlCommand("sp_Company_Criteria_Registration", Con);
                    Cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    int Update = Convert.ToInt32(Request.Cookies["Update"].Value.ToString());

                    Cmd.Parameters.AddWithValue("@UpdateOrNot", Update);
                    Cmd.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(Session["Company_Id"].ToString()));
                    Cmd.Parameters.AddWithValue("@Selection_Mode ", rbl_Selection_Mode.SelectedValue);
                    Cmd.Parameters.AddWithValue("@Stipend  ", float.Parse(txt_Stipend.Text));
                    Cmd.Parameters.AddWithValue("@Package  ", float.Parse(txt_Package.Text));
                    Cmd.Parameters.AddWithValue("@Tenure  ", Convert.ToInt32(txt_Tenure.Text));
                    Cmd.Parameters.AddWithValue("@Estimate_Arrival_Date_From  ", cld_Estimate_ArrivalDate_From.SelectedDate);
                    Cmd.Parameters.AddWithValue("@Estimate_Arrival_Date_To  ", cld_Estimate_ArrivalDate_To.SelectedDate);
                    Cmd.Parameters.AddWithValue("@Estimate_Required_Students   ", Convert.ToInt32(txt_Estimate_Required_Students.Text));
                    Cmd.Parameters.AddWithValue("@Company_Total_Rounds", Convert.ToInt32(ddl_Total_Rounds.SelectedValue));
                    Cmd.Parameters.AddWithValue("@Last_Updated_Year ", DateTime.Now.Year);

                    Cmd.Parameters.AddWithValue("@Under_Graduation_Degree_Type", ddl_UG_Type.SelectedValue);
                    Cmd.Parameters.AddWithValue("@Post_Graduation_Degree_Type", ddl_PG_Type.SelectedValue);
                    Cmd.Parameters.AddWithValue("@SSC_Percentage", float.Parse(txt_SSC_Percentage.Text));
                    Cmd.Parameters.AddWithValue("@HSC_Percentage", float.Parse(txt_HSC_Percentage.Text));
                    Cmd.Parameters.AddWithValue("@SGPA", float.Parse(txt_4Sem_SGPA.Text));
                    Cmd.Parameters.AddWithValue("@CGPA", float.Parse(txt_Current_CGPA.Text));
                    Cmd.Parameters.AddWithValue("@Additional_Technology", txt_Additional_Technology.Text);
                    Cmd.Parameters.AddWithValue("@Allow_KT", Convert.ToInt32(ddl_Allow_ATKT.SelectedValue));

                    if (Cmd.ExecuteNonQuery() > 0)
                    {
                        for (int i = 0; i < cbx_Required_Technology.Items.Count; i++)
                        {
                            if (cbx_Required_Technology.Items[i].Selected == true)
                            {
                                SqlCommand Cmd2 = new SqlCommand("Insert into tbl_Company_Required_Technology values (@Company_Id,@Technology_Name,@Updation_Time)", Con);
                                Cmd2.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(Session["Company_Id"].ToString()));
                                Cmd2.Parameters.AddWithValue("@Technology_Name", cbx_Required_Technology.Items[i].Text);
                                Cmd2.Parameters.AddWithValue("@Updation_Time", DateTime.Now);

                                if (Cmd2.ExecuteNonQuery() <= 0)
                                {
                                    Response.Write("<script>alert('Required Techology Details NOT Inserted Successfully.!');</script>");
                                }
                            }
                        }

                        SqlCommand Cmd3 = new SqlCommand("Insert into tbl_Company_Blacklist_Status values (@Company_Id,@Status)", Con);
                        Cmd3.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(Session["Company_Id"].ToString()));
                        Cmd3.Parameters.AddWithValue("@Status", "No");
                        if (Cmd3.ExecuteNonQuery() <= 0)
                        {
                            Response.Write("<script>alert('Blacklist Status NOT Inserted Successfully.!');</script>");
                        }

                        Response.Write("<script>alert('Criteria Details Inserted Successfull.!');window.location='Company_Dashboard.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Due to some technical glitch criteria details NOT inserted.\n\n Please Try Again.!');window.location='Company_Criteria_Registration.aspx';</script>");
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    Con.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('Under-Graduation and Post-Graduation Degree Type is Mandatory.!');</script>");
            }

        }

        protected void cld_Estimate_ArrivalDate_From_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.White;
            }
        }

        protected void cld_Estimate_ArrivalDate_To_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < cld_Estimate_ArrivalDate_From.SelectedDate.AddDays(14))
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.White;
            }
        }

        protected void rbl_Selection_Mode_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbl_Selection_Mode.SelectedValue.Equals("On Campus"))
            {
                SelectMode = 1;
            }
            else if (rbl_Selection_Mode.SelectedValue.Equals("Off Campus"))
            {
                SelectMode = 0;
            }
        }

        protected void rbl_Additional_Technology_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbl_Additional_Technology.SelectedValue.Equals("Yes"))
            {
                txt_Additional_Technology.Visible = true;
            }
            else
            {
                txt_Additional_Technology.Visible = false;
            }
        }

        protected void rbl_Allow_KT_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbl_Allow_KT.SelectedValue.Equals("Yes"))
            {
                lbl_Allow_ATKT_Upto.Visible = true;
                ddl_Allow_ATKT.Visible = true;
            }
            else
            {
                lbl_Allow_ATKT_Upto.Visible = false;
                ddl_Allow_ATKT.Visible = false;
            }
        }
    }
}