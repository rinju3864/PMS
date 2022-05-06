using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Admin_Module
{
    public partial class Invitation_Template : System.Web.UI.Page
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
                    Con.Open();
                    SqlCommand Cmd = new SqlCommand("Select Technology_Name from tbl_Technology", Con);
                    SqlDataReader Dr = Cmd.ExecuteReader();
                    while (Dr.Read())
                    {
                        lbl_Technology_List.Text += Dr["Technology_Name"].ToString() + ", ";
                    }
                    lbl_Technology_List.Text = lbl_Technology_List.Text.ToString().Remove(lbl_Technology_List.Text.ToString().LastIndexOf(','));
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

        protected void btn_Send_Invite_Click(object sender, EventArgs e)
        {
            if (!txt_Batches_Count.Text.Equals("") && !txt_Passing_Month.Text.Equals("") && !txt_Students_Count.Text.Equals(""))
            {

                int result1 = 0;
                int result2 = 0;
                if (int.TryParse(txt_Batches_Count.Text, out result1) && int.TryParse(txt_Batches_Count.Text, out result2))
                {
                    try
                    {
                        int count = 0;
                        Con.Open();
                        MailMessage Msg = new MailMessage();
                        SqlCommand cmd = new SqlCommand("select Company_Email_Id from tbl_Invitation", Con);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            count++;
                            Msg.To.Add(dr["Company_Email_Id"].ToString());
                            Msg.From = new MailAddress("pmsproject69@gmail.com");
                            Msg.IsBodyHtml = true;
                            Msg.Subject = "Invitation letter for Placement Process.";
                            Msg.Body = "<b>Dear Sir/Ma'am,</b>" +
                                "<p>" +
                                "Greetings from Shrimad Rajchandra Institute of Management and Computer" +
                                " Applications(SRIMCA),UTU.We would like to take this opportunity to invite your " +
                                "esteemed organization for being empanelled for our campus placement activities." +
                                "</p >" +
                                "<p>" +
                                "<p><b><u>Invitation for Campus Placement Process</u></b></p>" +
                                "</p>" +
                                "<p>MCA programme is running since 2002 at SRIMCA. More than " + Convert.ToInt32(txt_Batches_Count.Text) +
                                " students from " + Convert.ToInt32(txt_Students_Count.Text) +
                                " batches have successfully completed their Post Graduation. Our institute is a constitute institute" +
                                " of Uka Tarsadia University." +
                                "</p>" +
                                "<p>" +
                                "Our college has an active Placement Cell which looks into the placement for its students." +
                                " The objective of the college Placement Cell is to help students identify their career goals" +
                                " and provide an edge into the present day competitive job market.The scope of work of Placement " +
                                " Cell extends from organizing workshops to providing internships to students in various " +
                                " organizations during summer break and preparing students for the final placements In the past, " +
                                " the placement cell has conducted similar events in which several companies participated and recruited " +
                                " bright talents.We will be extremely obliged if you could be a part of our Endeavour of making the " +
                                " untapped talent shine." +
                                "</p>" +
                                "<p>"+
                                "The M.C.A Course covers Web Development, Mobile Application Development, Internet Of Things, Big Data Analytics," +
                                "Game Development, Database Management, Software Engineering and Testing, Open Source Technologies etc. Students are well" +
                                "acquaintance will tools/ platforms like "+
                                lbl_Technology_List.Text +
                                "."+
                                "</p>" +
                                "<p>" +
                                "We invite you for a Campus Placement Drive for final year students.  We are " +
                                "keen to organize a Campus Placement Drive during June to October at our " +
                                "institute for the Final Year students.These students will be appearing in final year " +
                                "examination in " + txt_Passing_Month.Text +
                                ". We will be providing you the supporting infrastructure facilities for conducting Tests, Interview," +
                                " Presentation, and Group Discussion. " +
                                "</p>" +
                                "<p>" +
                                "Looking forward to your participation in the recruitment drive. We would appreciate " +
                                "your kind consent to participate." +
                                "</p><br/>" +
                                "<p><b>NOTE : Registration Will Only Be Accepted Before The End Of June.!</b></p><br/>" +
                                "<p><b>Thank You</b><br/>" +
                                "Shrimad Rajchandra Institute of Management and Computer Application<br />" +
                                "Maliba Campus, Gopal Vidyanagar,<br />" +
                                "Bardoli - Mahuva Road, TARSADI,<br />" +
                                "Dist: Surat - 394350,<br />" +
                                "Gujarat(INDIA) <br />" +
                                "<b> Contact Us: 91 - 2625 - 255389 </b><br />" +
                                "<b> Email : director.srimca @utu.ac.in</b> " +
                                "</p><br/><br/>" +
                                "<a href='http://localhost:50072/Company%20Module/Company_Registration_Form.aspx'>Click Here To Register.!</a> ";

                            SmtpClient Smtp = new SmtpClient();
                            Smtp.Host = "smtp.gmail.com";
                            Smtp.Port = 587;
                            Smtp.EnableSsl = true;
                            Smtp.Credentials = new System.Net.NetworkCredential("pmsproject69@gmail.com", "pms@6969");
                            Smtp.Send(Msg);
                            Msg.To.RemoveAt(0);
                        }
                        dr.Close();
                        SqlCommand Cmd5 = new SqlCommand("Select * from tbl_Invitation_Status where Year='" + DateTime.Now.Year + "'", Con);
                        SqlDataReader Dr3 = Cmd5.ExecuteReader();
                        if (Dr3.HasRows)
                        {
                            Dr3.Close();
                            SqlCommand Cmd6 = new SqlCommand("Update tbl_Invitation_Status set Invitation_Sent='" + Convert.ToInt32(count) + "' where Year='" + DateTime.Now.Year + "'", Con);
                            if (Cmd6.ExecuteNonQuery() <= 0)
                            {
                                Response.Write("<script>alert('Invitation Count Not Updated..!!');</script>");
                            }
                        }
                        else
                        {
                            Dr3.Close();
                            SqlCommand Cmd6 = new SqlCommand("Insert into tbl_Invitation_Status(Year,Invitation_Sent) values ('" + DateTime.Now.Year + "','" + Convert.ToInt32(count) + "')", Con);

                            if (Cmd6.ExecuteNonQuery() <= 0)
                            {
                                Response.Write("<script>alert('Invitation Count Not Inserted..!!');</script>");
                            }
                        }
                        Response.Write("<script>alert('Mail Sent Successfully.!!');window.location='Admin_Dashboard.aspx';</script>");

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
                else
                {
                    Response.Write("<script>alert('Please Enter only Numeric Value for Batch Count And Passed Out Students.!!')</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Please Fill All The Fields..!!')</script>");
            }

        }
    }
}