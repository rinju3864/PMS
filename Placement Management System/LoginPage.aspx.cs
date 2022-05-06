using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Company_Module
{
    public partial class Company_LoginPage : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["EmailId"] != null)
                {
                    txt_EmailId.Text = Request.Cookies["EmailId"].Value.ToString();
                }
            }


        }

        public String getMd5(String Password)
        {
            MD5CryptoServiceProvider MD5 = new MD5CryptoServiceProvider();
            MD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(Password));
            byte[] result = MD5.Hash;
            StringBuilder final_result = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                final_result.Append(result[i].ToString("x2"));
            }
            return final_result.ToString();
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            String EmailId = txt_EmailId.Text;
            EmailId = EmailId.Substring(EmailId.IndexOf('@') + 1, EmailId.Length - (EmailId.IndexOf('@') + 1));

            //Company Email ID Check
            if (EmailId.Equals("gmail.com") || EmailId.Equals("yahoo.com") || EmailId.Equals("gmail.in") || EmailId.Equals("yahoo.in"))
            {
                try
                {
                    String Password = this.getMd5(txt_Password.Text.ToString());

                    Con.Open();
                    SqlCommand Cmd = new SqlCommand("sp_Company_Login", Con);
                    Cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("EmailId", txt_EmailId.Text);
                    Cmd.Parameters.AddWithValue("Password", Password);
                    SqlDataReader Dr = Cmd.ExecuteReader();
                    if (Dr.HasRows)
                    {
                        while (Dr.Read())
                        {
                            Session["Company_Id"] = Dr["Company_Id"].ToString();
                            Session["Company_Email_Id"] = Dr["Company_Email_Id"].ToString();
                            Session["Company_Name"] = Dr["Company_Name"].ToString();

                            Dr.Close();

                            SqlCommand Cmd2 = new SqlCommand("Select Last_Updated_Year from tbl_Company_Offerings where Company_Id='" + Convert.ToInt32(Session["Company_Id"].ToString()) + "'", Con);

                            SqlDataReader DR2 = Cmd2.ExecuteReader();
                            if (DR2.HasRows)
                            {
                                while (DR2.Read())
                                {
                                    int last_Updated_Year = Convert.ToInt32(DR2["Last_Updated_Year"].ToString());
                                    if (last_Updated_Year < DateTime.Now.Year)
                                    {
                                        Response.Cookies["Update"].Value = "1";
                                        Response.Redirect("/Company Module/Company_Criteria_Registration.aspx");
                                    }
                                    else
                                    {
                                        // Response.Write("<script>alert('Login Successfull.!');window.location='Company_Dashboard.aspx';</script>");
                                        Response.Redirect("/Company Module/Company_Dashboard.aspx");
                                    }
                                }
                            }
                            else
                            {
                                Response.Cookies["Update"].Value = "0";
                                Response.Redirect("/Company Module/Company_Criteria_Registration.aspx");
                            }
                            DR2.Close();
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Username or Password.!')</script>");
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
            //Admin Email ID Check
            else if (EmailId.Equals("utu.ac.in"))
            {
                try
                {
                    Con.Open();
                    SqlCommand Cmd = new SqlCommand("sp_Admin_Login", Con);
                    Cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@EmailId", txt_EmailId.Text);
                    Cmd.Parameters.AddWithValue("@Password", txt_Password.Text);
                    SqlDataReader Dr = Cmd.ExecuteReader();
                    if (Dr.HasRows)
                    {
                        while (Dr.Read())
                        {
                            Session["Admin_Id"] = Dr["Admin_Id"].ToString();
                            Session["Admin_Email_Id"] = Dr["Email_Id"].ToString();
                            Session["Admin_Name"] = Dr["Admin_Name"].ToString();

                            Response.Redirect("/Admin Module/Admin_Dashboard.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Administrator Username or Password.!')</script>");
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

        }
        protected void cbx_Remember_Me_CheckedChanged(object sender, EventArgs e)
        {
            if (cbx_Remember_Me.Checked==true)
            {
                Response.Cookies["EmailId"].Value = txt_EmailId.Text;

                Response.Cookies["EmailId"].Expires = DateTime.Now.AddDays(2);
            }
        }
    }
}