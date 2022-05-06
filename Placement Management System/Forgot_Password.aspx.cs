using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Company_Module
{
    public partial class Company_Forgot_Password : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        public static int time;
        public static int otp;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                time = 120;
            }
        }

        protected void btn_GenerateOTP_Click(object sender, EventArgs e)
        {
            try
            {
                Con.Open();
                String Query = "";

                String EmailId = txt_Email.Text;
                EmailId = EmailId.Substring(EmailId.IndexOf('@') + 1, EmailId.Length - (EmailId.IndexOf('@') + 1));

                if (EmailId.Equals("gmail.com") || EmailId.Equals("yahoo.com") || EmailId.Equals("gmail.in") || EmailId.Equals("yahoo.in"))
                {
                    Query = "Select * from tbl_Company_Basic_Details where Company_Email_Id=@EmailId";
                    
                }
                else if (EmailId.Equals("utu.ac.in"))
                {
                    Query = "Select * from tbl_Admin_login where Email_Id=@EmailId";
                    
                }
                SqlCommand Cmd = new SqlCommand(Query, Con);
                Cmd.Parameters.AddWithValue("@EmailId", txt_Email.Text);
                SqlDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows)
                {
                    try
                    {
                        Session["Email_To_Change_Password"] = txt_Email.Text;
                        txt_OTP.Visible = true;
                        pnl_Icon.Visible = true;
                        UpdatePanel1.Visible = true;
                        Timer1.Enabled = true;
                        btn_GenerateOTP.Visible = false;
                        btn_Submit.Visible = true;
                        Random random = new Random();
                        ViewState["otp"] = Convert.ToString(random.Next(100000, 999999));

                        MailMessage Msg = new MailMessage();
                        Msg.To.Add(txt_Email.Text);
                        Msg.From = new MailAddress("pmsproject69@gmail.com");
                        Msg.Subject = "Reset Password";
                        Msg.Body = "OTP to Reset your Password is : " + ViewState["otp"].ToString();
                        SmtpClient Smtp = new SmtpClient();
                        Smtp.Host = "smtp.gmail.com";
                        Smtp.Port = 587;
                        Smtp.EnableSsl = true;
                        Smtp.Credentials = new System.Net.NetworkCredential("pmsproject69@gmail.com", "pms@6969");
                        Smtp.Send(Msg);
                        Response.Write("<script>alert('Mail Sent Successfully.!!')</script>");

                    }
                    catch (Exception ex)
                    {
                        Response.Write("Could not send the Email - error: " + ex.Message);
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email ID.!!')</script>");

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

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (time == 0)
            {
                Response.Redirect("Forgot_Password.aspx");
            }
            lbl_OTP_Timer.Text = ((time / 60) + " : " + (time - (time / 60) * 60)).ToString();
            time = time - 1;

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (txt_OTP.Text == (ViewState["otp"].ToString()))
            {
                Response.Redirect("Reset_Password.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid OTP.!!')</script>");
            }
        }
    }
}