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
    public partial class Admin_Student_Marks_Entry : System.Web.UI.Page
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
                try
                {
                    SqlDataAdapter Da = new SqlDataAdapter("SELECT tbl_Company_Basic_Details.Company_Id, tbl_Company_Basic_Details.Company_Name, tbl_Company_Offerings.Company_Total_Rounds FROM tbl_Company_Basic_Details INNER JOIN tbl_Company_Offerings ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Offerings.Company_Id", Con);
                    DataSet Ds = new DataSet();
                    Da.Fill(Ds, "tbl_Company_Basic_Details,tbl_Company_Offerings");
                    ddl_Company_Name_List.DataSource = Ds.Tables[0];
                    ddl_Company_Name_List.DataTextField = "Company_Name";
                    ddl_Company_Name_List.DataValueField = "Company_Name";
                    ddl_Company_Name_List.DataBind();

                    ddl_Company_Id_List.DataSource = Ds.Tables[0];
                    ddl_Company_Id_List.DataTextField = "Company_Id";
                    ddl_Company_Id_List.DataValueField = "Company_Id";
                    ddl_Company_Id_List.DataBind();

                    ddl_Company_Rounds_List.DataSource = Ds.Tables[0];
                    ddl_Company_Rounds_List.DataTextField = "Company_Total_Rounds";
                    ddl_Company_Rounds_List.DataValueField = "Company_Total_Rounds";
                    ddl_Company_Rounds_List.DataBind();

                    Student_List();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }


        }

        protected void Student_List()
        {
            SqlDataAdapter Da = new SqlDataAdapter("Select tbl_Student_Basic_Details.Student_Id,tbl_Student_Basic_Details.Student_Name from tbl_Student_Basic_Details,tbl_Student_Shortlist where tbl_Student_Basic_Details.Student_Id=tbl_Student_Shortlist.Student_Id and Company_Id='" + ddl_Company_Id_List.SelectedValue + "'", Con);
            DataSet ds = new DataSet();
            Da.Fill(ds, "tbl_Student_Basic_Details,tbl_Student_Shortlist");
            ddl_Students_List.DataSource = ds.Tables[0];
            ddl_Students_List.DataTextField = "Student_Name";
            ddl_Students_List.DataValueField = "Student_Name";
            ddl_Students_List.DataBind();

            ddl_Students_Id_List.DataSource = ds.Tables[0];
            ddl_Students_Id_List.DataTextField = "Student_Id";
            ddl_Students_Id_List.DataValueField = "Student_Id";
            ddl_Students_Id_List.DataBind();
            
        }

        protected void ddl_Company_Name_List_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddl_Company_Rounds_List.SelectedIndex = ddl_Company_Name_List.SelectedIndex;
            ddl_Company_Id_List.SelectedIndex = ddl_Company_Name_List.SelectedIndex;
            Student_List();
            for (int i = 1; i <= 4; i++)
            {
                this.Master.FindControl("ContentPlaceHolder1").FindControl("pnl_Round" + i).Visible = false;
            }
            btn_Submit.Visible = false;
            ddl_Students_List_SelectedIndexChanged(sender, e);
        }
        
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            // Action '0' for Update
            // Action '1' for Insert
            try
            {
                Con.Open();
                SqlCommand Cmd1 = new SqlCommand("Select Round_Id from tbl_Student_Round_Details where Student_Id=@Student_Id and Company_Id=@Company_Id", Con);
                Cmd1.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(ddl_Company_Id_List.SelectedValue));
                Cmd1.Parameters.AddWithValue("@Student_Id", Convert.ToInt64(ddl_Students_Id_List.SelectedValue));
                SqlDataReader Sdr = Cmd1.ExecuteReader();
                if (Sdr.HasRows)
                {
                    // Update Record
                    Sdr.Close();
                    Con.Close();
                    Marks_Entry(0);
                }
                else
                {
                    // Insert Record
                    Sdr.Close();
                    Con.Close();
                    Marks_Entry(1);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"')</script>");
            }
            finally
            {
                Con.Close();
            }
        }

        protected void Marks_Entry(int Action)
        {
            try
            {
                Con.Open();
                SqlCommand Cmd = new SqlCommand("sp_Admin_Round_Marks_Entry", Con);
                Cmd.CommandType = System.Data.CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(ddl_Company_Id_List.SelectedValue));
                Cmd.Parameters.AddWithValue("@Student_Id", Convert.ToInt64(ddl_Students_Id_List.SelectedValue));

                for (int i = 1; i <= Convert.ToInt32(ddl_Company_Rounds_List.SelectedValue); i++)
                {
                    TextBox Mark = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl("txt_Round" + i + "_Mark");
                    if (!Mark.Text.Equals(""))
                    {
                        Cmd.Parameters.AddWithValue("@Round" + i + "_Marks", float.Parse(Mark.Text));
                        Cmd.Parameters.AddWithValue("@Round" + i + "_Status", "Completed");
                    }
                    else
                    {
                        Cmd.Parameters.AddWithValue("@Round" + i + "_Status", "Pending");
                    }
                }
                Cmd.Parameters.AddWithValue("@Action", Action);
                if (Cmd.ExecuteNonQuery() > 0)
                {
                    if (Action==0)
                    {
                        Response.Write("<script>alert('Students Round Details Updated Successfully')</script>");
                    }
                    else if (Action == 1)
                    {
                        Response.Write("<script>alert('Students Round Details Inserted Successfully')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Due to some glich the action could not be performed.!!\nSorry For Inconvenience.!')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }
            finally
            {
                Con.Close();
            }
        }

        protected void ddl_Students_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Students_Id_List.SelectedIndex = ddl_Students_List.SelectedIndex;
            if (!ddl_Students_List.SelectedValue.Equals(""))
            {
                for (int i = 1; i <= Convert.ToInt32(ddl_Company_Rounds_List.SelectedValue); i++)
                {
                    this.Master.FindControl("ContentPlaceHolder1").FindControl("pnl_Round" + i).Visible = true;
                    TextBox Temp=(TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl("txt_Round"+i+"_Mark");
                    Temp.Text = null;
                }
                btn_Submit.Visible = true;

                try
                {
                    Con.Open();
                    SqlCommand Cmd1 = new SqlCommand("Select * from tbl_Student_Round_Details where Student_Id=@Student_Id and Company_Id=@Company_Id", Con);
                    Cmd1.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(ddl_Company_Id_List.SelectedValue));
                    Cmd1.Parameters.AddWithValue("@Student_Id", Convert.ToInt64(ddl_Students_Id_List.SelectedValue));
                    SqlDataReader Sdr = Cmd1.ExecuteReader();
                    if (Sdr.HasRows)
                    {
                        while (Sdr.Read())
                        {
                            for (int i = 1; i <= Convert.ToInt32(ddl_Company_Rounds_List.SelectedValue); i++)
                            {
                                TextBox Mark = (TextBox)this.Master.FindControl("ContentPlaceHolder1").FindControl("txt_Round" + i + "_Mark");
                                Mark.Text = Sdr["Round" + i + "_Marks"].ToString();
                               
                            }
                        }
                    }
                    Sdr.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");

                }
                finally
                {
                    Con.Close();
                }
            }

        }
    }
}