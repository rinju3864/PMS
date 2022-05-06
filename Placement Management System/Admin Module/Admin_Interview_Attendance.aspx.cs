using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Admin_Module
{
    public partial class Admin_Interview_Attendance : System.Web.UI.Page
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
                    SqlDataAdapter Da = new SqlDataAdapter("SELECT tbl_Generate_Schedule.Company_Id, tbl_Company_Basic_Details.Company_Name FROM tbl_Company_Basic_Details INNER JOIN tbl_Generate_Schedule ON tbl_Company_Basic_Details.Company_Id = tbl_Generate_Schedule.Company_Id", Con);
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

                    Status_Set();
                    //String Filelocation = Server.MapPath("~\\Company Module\\Company_Images");
                    //Filelocation = Filelocation + "\\UserLogo.jpg";
                    //FileStream Fs = new FileStream(Filelocation, FileMode.Open, FileAccess.Read);
                    //BinaryReader Br = new BinaryReader(Fs);
                    //byte[] imgbyte = Br.ReadBytes(Convert.ToInt32(Fs.Length));

                    //Con.Open();
                    //SqlCommand Cmd = new SqlCommand("Update tbl_Student_Basic_Details set Student_Photo=@Img", Con);
                    //Cmd.Parameters.AddWithValue("@Img",imgbyte);

                    //int temp = Cmd.ExecuteNonQuery();
                    //Con.Close();
                    
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }


            }
        }

        protected void Status_Set()
        {
            foreach (GridViewRow Row in GridView1.Rows)
            {
                RadioButtonList Status = (RadioButtonList)Row.FindControl("rbl_Status");
                //Status.ClearSelection();
                String Student_Id = Row.Cells[1].Text;
                try
                {
                    Con.Open();
                    SqlCommand Cmd1 = new SqlCommand("Select Status from tbl_Interview_Attendance where Company_Id=@Company_Id and Student_Id=@Student_Id", Con);
                    Cmd1.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(ddl_Company_Id_List.SelectedValue));
                    Cmd1.Parameters.AddWithValue("@Student_Id", Convert.ToInt64(Student_Id));
                    SqlDataReader Dr = Cmd1.ExecuteReader();
                    if (Dr.HasRows)
                    {
                        while (Dr.Read())
                        {
                            Status.SelectedValue = Dr["Status"].ToString(); 
                        }
                    }
                    Dr.Close();
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
        }
        protected void ddl_Company_Name_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Company_Id_List.SelectedIndex = ddl_Company_Name_List.SelectedIndex;


        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            int Complete = 0;
            foreach (GridViewRow Row in GridView1.Rows)
            {
                RadioButtonList Status = (RadioButtonList)Row.FindControl("rbl_Status");
                String Student_Id = Row.Cells[1].Text;

                // Action 0 - For Insert
                // Action 1 - For Update
                int Action = 0;
                if(Status.Items[0].Selected || Status.Items[1].Selected)
                {
                    try
                    {
                        Con.Open();
                        SqlCommand Cmd1 = new SqlCommand("Select Status from tbl_Interview_Attendance where Company_Id=@Company_Id and Student_Id=@Student_Id", Con);
                        Cmd1.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(ddl_Company_Id_List.SelectedValue));
                        Cmd1.Parameters.AddWithValue("@Student_Id", Convert.ToInt64(Student_Id));
                        SqlDataReader Dr = Cmd1.ExecuteReader();
                        if (Dr.HasRows)
                        {
                            Action = 1;
                        }
                        else
                        {
                            Action = 0;
                        }
                        Dr.Close();
                        SqlCommand Cmd = new SqlCommand("sp_Interview_Attendance", Con);
                        Cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        Cmd.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(ddl_Company_Id_List.SelectedValue));
                        Cmd.Parameters.AddWithValue("@Student_Id", Convert.ToInt64(Student_Id));
                        Cmd.Parameters.AddWithValue("@Status", Status.SelectedValue);
                        Cmd.Parameters.AddWithValue("@Action", Action);

                        if (Cmd.ExecuteNonQuery() <= 0)
                        {
                            Response.Write("<script>alert('Interview Attendance NOT Configured Successfully..!!');</script>");
                            Complete = 0;
                        }
                        else
                        {
                            Complete = 1;
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
                    Response.Write("<script>alert('Please Select The Attendance Status..!!');</script>");

                }

            }
            if (Complete !=0)
            {
                Response.Write("<script>alert('Interview Attendance Configured Successfully..!!');window.location='Admin_Interview_Attendance.aspx'</script>");
            }


        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            Status_Set();
        }
    }
}