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
    public partial class Admin_Company_ViewProfile : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
        }

        protected void DataList_Company_Details_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label Company_ID = (Label)e.Item.FindControl("Company_IdLabel");

            if (e.CommandName.Equals("Update Profile"))
            {
                Response.Write("<script>alert('" + Company_ID.Text + "')</script>");
                Response.Redirect("Admin_Manage_Profile.aspx?Company_Id=" + Company_ID.Text);
            }
            else if (e.CommandName.Equals("Delete Profile"))
            {
                try
                {
                    Con.Open();
                    SqlCommand Cmd2 = new SqlCommand("sp_Delete_Company_Details", Con);
                    Cmd2.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(Company_ID.Text));
                    Cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                    if (Cmd2.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('Company Details Deleted Successfully');window.location='Admin_Company_ViewProfile.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Could not complete the Deletion.\n Sorry for the inconvenience.\n Please Try Again.!')</script>");

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


        }

        protected void txt_Search_Query_TextChanged(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT [Company_Id], [Company_Name], [Company_Logo], [Company_Email_Id], [Company_Contact_No] FROM [tbl_Company_Basic_Details] where Company_Name like '"+txt_Search_Query.Text+"%'";
            SqlDataSource1.DataBind();
            DataList_Company_Details.DataBind();
        }
    }   
}