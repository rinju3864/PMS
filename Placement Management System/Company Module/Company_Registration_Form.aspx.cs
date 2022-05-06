using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System_Final
{
    public partial class Registration_Form : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        byte[] imgbyte;
        BinaryReader Br;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Registration Cannnot be proceeded after july month.
            //if (DateTime.Now.Month > 7)
            //{
            //    Response.Write("<script>alert('Registration Period Has Lapsed.!');window.location='../LoginPage.aspx';</script>");
            //}
            if (!IsPostBack)
            {
                ddl_State_SelectedIndexChanged(sender, e);
            }
        }

        //MD5 Encryption Method
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
            String Filetype="";

            if (fu_Company_Logo.HasFile)
            {
                Br = new BinaryReader(fu_Company_Logo.PostedFile.InputStream);
                imgbyte = Br.ReadBytes(fu_Company_Logo.PostedFile.ContentLength);
                Filetype = System.IO.Path.GetExtension(fu_Company_Logo.FileName).ToString();
            }
            else
            {
                String Filelocation = Server.MapPath("Company_Images");
                Filelocation = Filelocation + "\\UserLogo.jpg";
                FileStream Fs = new FileStream(Filelocation, FileMode.Open, FileAccess.Read);
                Br = new BinaryReader(Fs);
                imgbyte = Br.ReadBytes(Convert.ToInt32(Fs.Length));
                Filetype = System.IO.Path.GetExtension(Filelocation).ToString();
            }

            if (Filetype.Equals(".jpg"))
            {
                //string Str = Server.MapPath("Company Images");
                //if (fu_Company_Logo.HasFile == true)
                //{
                //    Str = Str + "\\" + fu_Company_Logo.FileName;
                //    fu_Company_Logo.SaveAs(Str);
                //}

                try
                {
                    String Company_Password = this.getMd5(txt_Pass.Text.ToString());

                    if (txt_Representative_Name_2.Text == "")
                    {
                        txt_Representative_Name_2.Text = null;
                    }

                    try
                    {
                        Con.Open();

                        SqlCommand Cmd1 = new SqlCommand("Select * from tbl_Company_Basic_Details where Company_Email_Id='"+txt_Email_Id.Text+"'",Con);
                        SqlDataReader Dr = Cmd1.ExecuteReader();
                        
                        if (Dr.HasRows == false)
                        {
                            Dr.Close();
                            SqlCommand Cmd2 = new SqlCommand("sp_Company_Basic_Registration", Con);

                            Cmd2.Parameters.AddWithValue("@cName", txt_Company_Name.Text);
                            Cmd2.Parameters.AddWithValue("@cEmail", txt_Email_Id.Text);
                            Cmd2.Parameters.AddWithValue("@cContact", txt_Contact_Number.Text);
                            Cmd2.Parameters.AddWithValue("@cState", ddl_State.SelectedValue);
                            Cmd2.Parameters.AddWithValue("@cCity", ddl_City.SelectedValue);
                            Cmd2.Parameters.AddWithValue("@cAddress", txt_Address.Text);
                            Cmd2.Parameters.AddWithValue("@cRepresentative1", txt_Representative_Name_1.Text);
                            Cmd2.Parameters.AddWithValue("@cRepresentative2", txt_Representative_Name_2.Text);
                            Cmd2.Parameters.AddWithValue("cPasssword", Company_Password);
                            Cmd2.Parameters.AddWithValue("@cWebsite", txt_Website_Name.Text);
                            Cmd2.Parameters.AddWithValue("@cLogo", imgbyte);
                            Cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                            int Check_Result = Cmd2.ExecuteNonQuery();
                            if (Check_Result > 0)
                            {
                                // Invitation Accepted :- Status = 1
                                // Invitation NOT Accepted :- Status = 0

                                SqlCommand Cmd3 = new SqlCommand("Select * from tbl_Invitation where Company_Email_Id='"+ txt_Email_Id.Text+ "'",Con);
                                SqlDataReader Dr2 = Cmd3.ExecuteReader();
                                if (Dr2.HasRows)
                                {
                                    Dr2.Close();
                                    SqlCommand Cmd4 = new SqlCommand("Update tbl_Invitation set Status='1' where Company_Email_Id='"+txt_Email_Id.Text+"'",Con);
                                    if (Cmd4.ExecuteNonQuery() <= 0)
                                    {
                                        Response.Write("<script>alert('Status Not Updated..!!');</script>");
                                    }
                                    else
                                    {
                                        SqlCommand Cmd5 = new SqlCommand("Select * from tbl_Invitation_Status where Year='"+DateTime.Now.Year+"'",Con);
                                        SqlDataReader Dr3 = Cmd5.ExecuteReader();
                                        if (Dr3.HasRows)
                                        {
                                            Dr3.Close();
                                            SqlCommand Cmd6 = new SqlCommand("Update tbl_Invitation_Status set Invitation_Accepted=Invitation_Accepted+1 where Year='" + DateTime.Now.Year + "'", Con);
                                            if (Cmd6.ExecuteNonQuery() <= 0)
                                            {
                                                Response.Write("<script>alert('Invitation Count Not Updated..!!');</script>");
                                            }
                                        }
                                        else
                                        {
                                            Dr3.Close();
                                            SqlCommand Cmd6 = new SqlCommand("Insert into tbl_Invitation_Status(Year,Invitation_Accepted) values ('" + DateTime.Now.Year+"',1)", Con);
                                            if (Cmd6.ExecuteNonQuery() <= 0)
                                            {
                                                Response.Write("<script>alert('Invitation Count Not Inserted..!!');</script>");
                                            }
                                        }
                                    }
                                }
                                Response.Write("<script>alert('Registration Done Successfully');window.location='../LoginPage.aspx'</script>");


                            }
                            else
                            {
                                Response.Write("<script>alert('Could not complete the registration.\n Sorry for the inconvenience.\n Please Try Again.!')</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Company is already registered with the provided Email Id.!');window.location='Company_Registration_Form.aspx'</script>");
                        }
                        

                    }
                    catch (SqlException ex)
                    {
                        Response.Write(ex.Message);
                    }
                    finally
                    {
                        Con.Close();
                    }

                }
                catch (Exception E)
                {
                    Response.Write(E.Message);
                }
            }
            else
            {
                 Response.Write("<script>alert('Image Type Should only be .jpg')</script>");

            }


        }

        protected void ddl_State_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_City.Items.Clear();
            if (ddl_State.SelectedValue.Equals("Gujarat"))
            {
                ddl_City.Items.Add("Surat");
                ddl_City.Items.Add("Ahmedabad");
                ddl_City.Items.Add("Vadodara");
                ddl_City.Items.Add("Vapi");
                ddl_City.Items.Add("Navsari");
                ddl_City.Items.Add("Valsad");
            }
            else if (ddl_State.SelectedValue.Equals("Maharashtra"))
            {
                ddl_City.Items.Add("Mumbai");
                ddl_City.Items.Add("Pune");
            }
        }
    }
}