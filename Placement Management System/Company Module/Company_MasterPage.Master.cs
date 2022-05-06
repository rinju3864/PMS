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
    public partial class Company_MasterPage : System.Web.UI.MasterPage
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Init(object Sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Company_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
            lbl_Username.Text = Session["Company_Name"].ToString();

            try
            {
                Con.Open();
                SqlCommand Cmd = new SqlCommand("Select Company_Logo from tbl_Company_Basic_Details where Company_Id='" + Convert.ToInt32(Session["Company_Id"].ToString()) + "'", Con);
                SqlDataReader Dr = Cmd.ExecuteReader();
                while (Dr.Read())
                {
                    byte[] imgbytes = (byte[])Dr["Company_Logo"];
                    img_Profile_Pic.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(imgbytes, 0, imgbytes.Length); ;
                }
                Dr.Close();

                SqlCommand Cmd2 = new SqlCommand("Select * from tbl_Generate_Schedule where Company_Id='"+Convert.ToInt32(Session["Company_Id"].ToString())+"'",Con);
                SqlDataReader Dr2 = Cmd2.ExecuteReader();
                if (Dr2.HasRows)
                {
                    pnl_Generated.Visible = true;
                    pnl_Not_Generated.Visible = false;
                    while (Dr2.Read())
                    {
                        lbl_Date.Text = Convert.ToDateTime(Dr2["Arrival_Date"].ToString()).ToString("dd-MM-yyyy");
                        lbl_Venue.Text = Dr2["Interview_Venue"].ToString();
                    }
                }
                else
                {
                    pnl_Generated.Visible = false;
                    pnl_Not_Generated.Visible = true;
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

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Session.Remove("Company_Id");
            Session.Remove("Company_Email_Id");
            Session.Remove("Company_Name");
            Response.Redirect("../LoginPage.aspx");
        }
        protected void btn_Close_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "PopUp_Close();", true);

        }
    }
}