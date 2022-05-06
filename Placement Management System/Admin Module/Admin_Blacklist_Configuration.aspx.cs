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
    public partial class Admin_Blacklist_Configuration : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow Row in GridView1.Rows)
            {
                RadioButtonList Status = (RadioButtonList)Row.FindControl("rbl_Status");
                String Company_Id = Row.Cells[0].Text;
                
                try
                {
                    Con.Open();
                    SqlCommand Cmd = new SqlCommand("sp_Company_Blacklist_Configuration", Con);
                    Cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(Company_Id));
                    Cmd.Parameters.AddWithValue("@Status", Status.SelectedValue);
                    if (Cmd.ExecuteNonQuery()<=0)
                    {
                        Response.Write("<script>alert('Company Blacklist Status Could Not be Updated Successfully..!!');</script>");
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
            Response.Write("<script>alert('Company Blacklist Status Updated Successfully..!!');window.location='Admin_Blacklist_Configuration.aspx'</script>");

        }
    }
}