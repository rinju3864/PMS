using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Company_Module
{

    public partial class Company_Update_Password : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Company_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }
        }

        protected void btn_Send_OTP_Click(object sender, EventArgs e)
        {
            btn_Verify_OTP.Visible = true;
            btn_Send_OTP.Visible = false;
            txt_OTP.ReadOnly = false;
            Random random = new Random();
            ViewState["otp"] = Convert.ToString(random.Next(100000, 999999));
            MailMessage Msg = new MailMessage();
            Msg.To.Add(Session["Company_Email_Id"].ToString());
            Msg.From = new MailAddress("pmsproject69@gmail.com");
            Msg.Subject = "Reset Password";
            Msg.Body = "OTP to Update your Password is : " + ViewState["otp"].ToString();
            SmtpClient Smtp = new SmtpClient();
            Smtp.Host = "smtp.gmail.com";
            Smtp.Port = 587;
            Smtp.EnableSsl = true;
            Smtp.Credentials = new System.Net.NetworkCredential("pmsproject69@gmail.com", "pms@6969");
            Smtp.Send(Msg);
            Response.Write("<script>alert('Mail Sent Successfully.!!')</script>");

        }

        protected void btn_Verify_OTP_Click(object sender, EventArgs e)
        {
            
            if (txt_OTP.Text.Equals(ViewState["otp"].ToString()))
            {
                pnl_New_Password.Visible = true;
                pnl_Request_OTP.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('Invalid OTP!!Please Check Again.!')</script>");
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
            String EmailId = Session["Company_Email_Id"].ToString();
            try
            {
                // For Admin User Type = 0
                // For Company User type = 1

                String NewPassword = "";
                int UserType = 1;
                
                NewPassword = this.getMd5(txt_New_Password.Text.ToString());
                
                Con.Open();
                SqlCommand Cmd = new SqlCommand("sp_Reset_Password", Con);
                Cmd.CommandType = System.Data.CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@ResetPassword", NewPassword);
                Cmd.Parameters.AddWithValue("@EmailID", EmailId);
                Cmd.Parameters.AddWithValue("@UserType", UserType);
                int result = Cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    Response.Write("<script>alert('Password Changed Successfully');window.location='Company_Dashboard.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Password Not Changed Successfully')</script>");

                }
            }
            catch (Exception exp)
            {
                Response.Write(exp.Message);
            }
            finally
            {
                Con.Close();
            }
        }

        
    }
}