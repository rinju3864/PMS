using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Admin_Module
{
    public partial class Admin_Add_Company_Visit : System.Web.UI.Page
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
                if (Request.QueryString["Visit_Id"] != null)
                {
                    try
                    {
                        Con.Open();
                        SqlCommand Cmd = new SqlCommand("SELECT * FROM [tbl_Company_Visit] where Visit_Id='"+Convert.ToInt32(Request.QueryString["Visit_Id"].ToString()) +"'", Con);
                        SqlDataReader Dr = Cmd.ExecuteReader();
                        if (Dr.HasRows)
                        {
                            while (Dr.Read())
                            {
                                ddl_Company_List.SelectedValue = Dr["Company_Name"].ToString();
                                cld_Date_Of_Visit.SelectedDate = Convert.ToDateTime(Dr["Date_Of_Visit"].ToString());
                                cld_Date_Of_Visit.VisibleDate = Convert.ToDateTime(Dr["Date_Of_Visit"].ToString());
                                txt_Date_Of_Visit.Text = cld_Date_Of_Visit.SelectedDate.ToString("dd/MM/yyyy");
                                txt_Representative_Name.Text = Dr["Person_Interacted"].ToString();
                                txt_Email_Id.Text = Dr["Email_Id"].ToString();
                                txt_Contact_Number.Text = Dr["Contact_No"].ToString();
                                txt_Experience.Text = Dr["Experience"].ToString();
                                txt_Findings.Text =Dr["Findings"].ToString();
                                txt_Remark.Text = Dr["Remarks"].ToString();
                                rbl_Recommendation_Status.SelectedValue = Dr["Next_Year_Recommended"].ToString();
                                foreach (String Name in  Dr["Visit_Team"].ToString().Split(','))
                                {
                                    for (int i = 0; i < cbx_Visit_Team.Items.Count; i++)
                                    {
                                        if (cbx_Visit_Team.Items[i].Value.Equals(Name))
                                        {
                                            cbx_Visit_Team.Items[i].Selected = true;
                                        }
                                    }
                                }
                            }
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
                else
                {
                    cld_Date_Of_Visit.SelectedDate = DateTime.Today;
                    txt_Date_Of_Visit.Text = cld_Date_Of_Visit.SelectedDate.ToString("dd/MM/yyyy");
                }

            }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            //For Insert Action = 0
            //For Update Action = 1

            try
            {
                Con.Open();
                SqlCommand Cmd = new SqlCommand("sp_Company_Visit", Con);
                Cmd.CommandType = System.Data.CommandType.StoredProcedure;
                String Visit_Team = "";
                for (int i = 0; i < cbx_Visit_Team.Items.Count; i++)
                {
                    if (cbx_Visit_Team.Items[i].Selected)
                    {
                        Visit_Team += cbx_Visit_Team.Items[i].Value + ",";
                    }
                }
                if (!Visit_Team.Equals(""))
                {
                    if (txt_Remark.Text.Equals(""))
                    {
                        txt_Remark.Text = "None";
                    }
                    int Action = 0;
                    if (Request.QueryString["Visit_Id"] != null)
                    {
                        Action = 1;
                        Cmd.Parameters.AddWithValue("@Visit_Id",Convert.ToInt32(Request.QueryString["Visit_Id"].ToString()) );
                    }
                    Cmd.Parameters.AddWithValue("@Visit_Team", Visit_Team.Substring(0, Visit_Team.Length - 1));
                    Cmd.Parameters.AddWithValue("@Company_Name", ddl_Company_List.SelectedValue);
                    Cmd.Parameters.AddWithValue("@Date_Of_Visit", cld_Date_Of_Visit.SelectedDate);
                    Cmd.Parameters.AddWithValue("@Person_Interacted", txt_Representative_Name.Text);
                    Cmd.Parameters.AddWithValue("@Contact_No", txt_Contact_Number.Text);
                    Cmd.Parameters.AddWithValue("@Email_Id", txt_Email_Id.Text);
                    Cmd.Parameters.AddWithValue("@Experience", txt_Experience.Text);
                    Cmd.Parameters.AddWithValue("@Findings", txt_Findings.Text);
                    Cmd.Parameters.AddWithValue("@Remarks", txt_Remark.Text);
                    Cmd.Parameters.AddWithValue("@Next_Year_Recommended", rbl_Recommendation_Status.SelectedValue);
                    Cmd.Parameters.AddWithValue("@Action", Action);
                    if (Cmd.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('Company Visit Details Configured Successfully.!');window.location='Admin_View_Company_Visit.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Company Visit Details NOT Inserted Successfully.!');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please Select Visit Team Of The Company.!');</script>");
                }

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


        protected void cld_Date_Of_Visit_SelectionChanged(object sender, EventArgs e)
        {
            txt_Date_Of_Visit.Text = cld_Date_Of_Visit.SelectedDate.ToString("dd/MM/yyyy");
        }

        protected void cld_Date_Of_Visit_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Today.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.White;
            }
        }
    }
}