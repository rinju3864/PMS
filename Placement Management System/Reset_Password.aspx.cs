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
    public partial class Reset_Password : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email_To_Change_Password"] == null)
            {
                Response.Redirect("LoginPage.aspx");
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

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (txt_New_Password.Text.Equals(txt_Reenter_Password.Text))
            {
                String EmailId = Session["Email_To_Change_Password"].ToString();
                try
                {
                    // For Admin User Type = 0
                    // For Company User type = 1

                    String NewPassword = "";
                    int UserType=1;

                    EmailId = EmailId.Substring(EmailId.IndexOf('@') + 1, EmailId.Length - (EmailId.IndexOf('@') + 1));
                    if (EmailId.Equals("gmail.com") || EmailId.Equals("yahoo.com") || EmailId.Equals("gmail.in") || EmailId.Equals("yahoo.in"))
                    {
                        NewPassword = this.getMd5(txt_New_Password.Text.ToString());
                        UserType = 1;

                    }
                    else if (EmailId.Equals("utu.ac.in"))
                    {
                        NewPassword = txt_New_Password.Text;
                        UserType = 0;
                    }
               
                    Con.Open();
                    SqlCommand Cmd = new SqlCommand("sp_Reset_Password", Con);
                    Cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@ResetPassword", NewPassword);
                    Cmd.Parameters.AddWithValue("@EmailID", Session["Email_To_Change_Password"].ToString());
                    Cmd.Parameters.AddWithValue("@UserType", UserType);
                    int result = Cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Session.Remove("Email_To_Change_Password");
                        Response.Write("<script>alert('Password Changed Successfully');window.location='LoginPage.aspx';</script>");
                        
                    }
                    else
                    {
                        Response.Write("<script>alert('Password not Changed Successfully')</script>");

                    }
                }
                catch(Exception exp)
                {
                    Response.Write(exp.Message);
                }
                finally
                {
                    Con.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('Your Password dont match')</script>");

            }


        }
    }
}