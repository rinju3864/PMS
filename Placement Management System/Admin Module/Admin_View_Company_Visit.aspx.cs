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
    public partial class Admin_View_Company_Visit : System.Web.UI.Page
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
                SqlDataSource1.SelectCommand = "SELECT * FROM [tbl_Company_Visit]";
                DataView Dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (Dv.Count<=0)
                {
                    DataList_Company_Details.Visible = false;
                    lbl_Message.Text = "No Company Visit is Registered Uptill Now.!";
                    lbl_Message.Visible = true;
                }
                else
                {
                    lbl_Message.Visible = false;
                    DataList_Company_Details.Visible = true;
                    DataList_Company_Details.DataSource = SqlDataSource1;
                    DataList_Company_Details.DataBind();
                }
            }
        }
        protected void DataList_Company_Details_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label Visit_ID = (Label)e.Item.FindControl("Visit_IdLabel");

            if (e.CommandName.Equals("Update Visit"))
            {
                Response.Redirect("Admin_Add_Company_Visit.aspx?Visit_Id=" + Visit_ID.Text);
            }
            else if (e.CommandName.Equals("Delete Visit"))
            {
                try
                {
                    Con.Open();
                    SqlCommand Cmd2 = new SqlCommand("Delete from tbl_Company_Visit where Visit_Id=@Visit_Id", Con);
                    Cmd2.Parameters.AddWithValue("@Visit_Id", Convert.ToInt32(Visit_ID.Text));
                    if (Cmd2.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('Company Visit Details Deleted Successfully');window.location='Admin_Company_ViewProfile.aspx';</script>");
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
            SqlDataSource1.SelectCommand = "SELECT * FROM [tbl_Company_Visit] where Company_Name like '" + txt_Search_Query.Text + "%'";
            DataView Dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (Dv.Count <= 0)
            {
                DataList_Company_Details.Visible = false;
                lbl_Message.Text = "No Company Visit Record Found For Given Search Query.!";
                lbl_Message.Visible = true;
            }
            else
            {
                lbl_Message.Visible = false;
                DataList_Company_Details.Visible = true;
                DataList_Company_Details.DataSource = SqlDataSource1;
                DataList_Company_Details.DataBind();
            }
        }
    }
}