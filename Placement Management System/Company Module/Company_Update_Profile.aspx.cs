using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Company_Module
{
    public partial class Company_Update_Profile : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        int Select_Mode = 0;

        byte[] Image_Byte_Data;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Company_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }

            if (!IsPostBack)
            {
                cld_Estimate_ArrivalDate_From.SelectedDate = DateTime.Today;
                txt_Estimate_ArrivalDate_From.Text = cld_Estimate_ArrivalDate_From.SelectedDate.ToString("dd/MM/yyyy");

                cld_Estimate_ArrivalDate_To.SelectedDate = DateTime.Today.AddDays(1);
                txt_Estimate_ArrivalDate_To.Text = cld_Estimate_ArrivalDate_To.SelectedDate.ToString("dd/MM/yyyy");

                try
                {
                    Con.Open();

                    SqlDataAdapter Da = new SqlDataAdapter("SELECT DISTINCT [Technology_Name] FROM [tbl_Technology]", Con);
                    DataSet Ds = new DataSet();
                    Da.Fill(Ds, "tbl_Technology");
                    cbx_Required_Technology.DataSource = Ds.Tables[0];
                    cbx_Required_Technology.DataTextField = "Technology_Name";
                    cbx_Required_Technology.DataValueField = "Technology_Name";
                    cbx_Required_Technology.DataBind();

                    SqlCommand Cmd1 = new SqlCommand("select * from tbl_Company_Basic_Details,tbl_Company_Offerings,tbl_Shortlist_Criteria" +
                        " where tbl_Company_Basic_Details.Company_Id=tbl_Company_Offerings.Company_Id and " +
                        "tbl_Company_Basic_Details.Company_Id=tbl_Shortlist_Criteria.Company_Id and tbl_Company_Basic_Details.Company_Id=@cId", Con);
                    Cmd1.Parameters.AddWithValue("@cId", int.Parse(Session["Company_Id"].ToString()));
                    SqlDataReader Sdr = Cmd1.ExecuteReader();
                    if (Sdr.Read())
                    {
                        txt_Company_Name.Text = Sdr.GetString(1);
                        txt_Email_Id.Text = Sdr.GetString(2);
                        txt_Contact_Number.Text = Sdr.GetString(3);
                        ddl_State.SelectedValue = Sdr.GetString(4);
                        ddl_State_SelectedIndexChanged(sender,e);
                        ddl_City.SelectedValue = Sdr.GetString(5);
                        txt_Address.Text = Sdr.GetString(6);
                        txt_Representative_Name_1.Text = Sdr.GetString(7);
                        txt_Representative_Name_2.Text = Sdr.GetString(8);
                        txt_Website_Name.Text = Sdr.GetString(10);
                        Image_Byte_Data = (byte[])Sdr["Company_Logo"];
                        ViewState["Img_Data"] = (byte[])Sdr["Company_Logo"];
                        img_main_logo.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(Image_Byte_Data);
                        rbl_Selection_Mode.SelectedValue = Sdr["Selection_Mode"].ToString();
                        txt_Stipend.Text = Sdr["Stipend"].ToString();
                        txt_Package.Text = Sdr["Package"].ToString();
                        txt_Tenure.Text = Sdr["Tenure"].ToString();
                        cld_Estimate_ArrivalDate_From.SelectedDate = Convert.ToDateTime(Sdr["Estimate_Arrival_Date_From"].ToString());
                        cld_Estimate_ArrivalDate_From.VisibleDate = Convert.ToDateTime(Sdr["Estimate_Arrival_Date_From"].ToString());
                        txt_Estimate_ArrivalDate_From.Text = cld_Estimate_ArrivalDate_From.SelectedDate.ToString("dd-MM-yyyy");

                        cld_Estimate_ArrivalDate_To.SelectedDate = Convert.ToDateTime(Sdr["Estimate_Arrival_Date_To"].ToString());
                        cld_Estimate_ArrivalDate_To.VisibleDate = Convert.ToDateTime(Sdr["Estimate_Arrival_Date_To"].ToString());
                        txt_Estimate_ArrivalDate_To.Text = cld_Estimate_ArrivalDate_To.SelectedDate.ToString("dd-MM-yyyy");

                        txt_Estimate_Required_Students.Text = Sdr["Estimate_Required_Students"].ToString();
                        ddl_Total_Rounds.SelectedValue = Sdr["Company_Total_Rounds"].ToString();

                        ddl_UG_Type.SelectedValue = Sdr["Under_Graduation_Degree_Type "].ToString();
                        ddl_PG_Type.SelectedValue = Sdr["Post_Graduation_Degree_Type"].ToString();

                        txt_SSC_Percentage.Text = Sdr["SSC_Percentage"].ToString();
                        txt_HSC_Percentage.Text = Sdr["HSC_Percentage"].ToString();
                        txt_4Sem_SGPA.Text = Sdr["SGPA"].ToString();
                        txt_Current_CGPA.Text = Sdr["CGPA"].ToString();

                        ddl_Allow_ATKT.SelectedValue = Sdr["Allow_KT"].ToString();
                        txt_Additional_Technology.Text = Sdr["Additional_Technology"].ToString();

                    }
                    Sdr.Close();

                    //cbx_Required_Technology.Items[2].Selected = true;

                    ArrayList Technology_List = new ArrayList();
                    SqlCommand Cmd2 = new SqlCommand("SELECT DISTINCT * FROM tbl_Company_Required_Technology WHERE Company_Id = @Company_Id", Con);
                    Cmd2.Parameters.AddWithValue("@Company_Id", int.Parse(Session["Company_Id"].ToString()));
                    SqlDataReader Dr = Cmd2.ExecuteReader();
                    while (Dr.Read())
                    {
                        if (DateTime.Now.Year.Equals(Convert.ToDateTime(Dr["Updation_Time"].ToString()).Year))
                        {
                            for (int i = 0; i < cbx_Required_Technology.Items.Count; i++)
                            {
                                if (cbx_Required_Technology.Items[i].Value.Equals(Dr["Technology_name"].ToString()))
                                {
                                    cbx_Required_Technology.Items.FindByValue(Dr["Technology_name"].ToString()).Selected = true;
                                    Technology_List.Add(cbx_Required_Technology.Items[i].Value);
                                }
                            }
                        }

                    }
                    Dr.Close();
                    ViewState["Technology_List"] = Technology_List;
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
        }
        protected void cld_Estimate_ArrivalDate_From_SelectionChanged(object sender, EventArgs e)
        {
            cld_Estimate_ArrivalDate_To.SelectedDate = cld_Estimate_ArrivalDate_From.SelectedDate.AddDays(14);
            cld_Estimate_ArrivalDate_To.VisibleDate = cld_Estimate_ArrivalDate_From.SelectedDate.AddDays(14);
            txt_Estimate_ArrivalDate_From.Text = cld_Estimate_ArrivalDate_From.SelectedDate.ToString("dd/MM/yyyy");
            txt_Estimate_ArrivalDate_To.Text = cld_Estimate_ArrivalDate_To.SelectedDate.ToString("dd/MM/yyyy");
        }

        protected void cld_Estimate_ArrivalDate_To_SelectionChanged(object sender, EventArgs e)
        {
            txt_Estimate_ArrivalDate_To.Text = cld_Estimate_ArrivalDate_To.SelectedDate.ToString("dd/MM/yyyy");
        }
        protected void cld_Estimate_ArrivalDate_From_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Today.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.White;
            }
        }

        protected void cld_Estimate_ArrivalDate_To_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < cld_Estimate_ArrivalDate_From.SelectedDate.AddDays(14))
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.White;
            }
        }

        protected void rbl_Selection_Mode_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbl_Selection_Mode.SelectedValue.Equals("On Campus"))
            {
                Select_Mode = 1;
            }
            else if (rbl_Selection_Mode.SelectedValue.Equals("Off Campus"))
            {
                Select_Mode = 0;
            }
        }


        protected void btn_Submit_Click(object sender, EventArgs e)
        {

            if (fu_Company_Logo.HasFile)
            {
                String Filetype = System.IO.Path.GetExtension(fu_Company_Logo.FileName).ToString();
                if (!Filetype.Equals(".jpg"))
                {
                    Response.Write("<script>alert('Image Type Should only be .jpg');window.location='Company_Update_Profile.aspx';</script>");
                }

                BinaryReader Br = new BinaryReader(fu_Company_Logo.PostedFile.InputStream);
                Image_Byte_Data = Br.ReadBytes(fu_Company_Logo.PostedFile.ContentLength);
            }

            if (txt_Representative_Name_2.Text.Equals(" "))
            {
                txt_Representative_Name_2 = null;
            }
            try
            {
                Con.Open();
                SqlCommand Cmd2 = new SqlCommand("sp_Company_Update_Profile", Con);
                Cmd2.Parameters.AddWithValue("@Company_Name", txt_Company_Name.Text);
                Session["Company_Name"] = txt_Company_Name.Text;
                Cmd2.Parameters.AddWithValue("@Company_Email_Id", txt_Email_Id.Text);
                Cmd2.Parameters.AddWithValue("@Company_Contact_No", txt_Contact_Number.Text);
                Cmd2.Parameters.AddWithValue("@Company_State", ddl_State.SelectedValue);
                Cmd2.Parameters.AddWithValue("@Company_City", ddl_City.SelectedValue);
                Cmd2.Parameters.AddWithValue("@Company_Address", txt_Address.Text);
                Cmd2.Parameters.AddWithValue("@Company_Representative1_Name", txt_Representative_Name_1.Text);
                Cmd2.Parameters.AddWithValue("@Company_Representative2_Name", txt_Representative_Name_2.Text);
                Cmd2.Parameters.AddWithValue("@Company_Website", txt_Website_Name.Text);

                if (fu_Company_Logo.HasFile)
                {
                    Cmd2.Parameters.AddWithValue("@Company_Logo", Image_Byte_Data);
                }
                else
                {
                    Cmd2.Parameters.AddWithValue("@Company_Logo", (byte[])(ViewState["Img_Data"]));
                }
                Cmd2.Parameters.AddWithValue("@Company_Id", int.Parse(Session["Company_Id"].ToString()));

                Cmd2.Parameters.AddWithValue("@Selection_Mode", rbl_Selection_Mode.SelectedValue);
                
                Cmd2.Parameters.AddWithValue("@Stipend", float.Parse(txt_Stipend.Text));
                Cmd2.Parameters.AddWithValue("@Package", float.Parse(txt_Package.Text));
                Cmd2.Parameters.AddWithValue("@Tenure", Convert.ToInt16(txt_Tenure.Text));
                Cmd2.Parameters.AddWithValue("@Estimate_Arrival_Date_From", cld_Estimate_ArrivalDate_From.SelectedDate);
                Cmd2.Parameters.AddWithValue("@Estimate_Arrival_Date_To", cld_Estimate_ArrivalDate_To.SelectedDate);
                Cmd2.Parameters.AddWithValue("@Estimate_Required_Students", Convert.ToInt16(txt_Estimate_Required_Students.Text));
                Cmd2.Parameters.AddWithValue("@Company_Total_Rounds", Convert.ToInt32(ddl_Total_Rounds.SelectedValue));

                Cmd2.Parameters.AddWithValue("@Under_Graduation_Degree_Type", ddl_UG_Type.SelectedValue);
                Cmd2.Parameters.AddWithValue("@Post_Graduation_Degree_Type", ddl_PG_Type.SelectedValue);
                Cmd2.Parameters.AddWithValue("@SSC_Percentage", float.Parse(txt_SSC_Percentage.Text));
                Cmd2.Parameters.AddWithValue("@HSC_Percentage", float.Parse(txt_HSC_Percentage.Text));
                Cmd2.Parameters.AddWithValue("@SGPA", float.Parse(txt_4Sem_SGPA.Text));
                Cmd2.Parameters.AddWithValue("@CGPA", float.Parse(txt_Current_CGPA.Text));
                Cmd2.Parameters.AddWithValue("@Additional_Technology", txt_Additional_Technology.Text);
                Cmd2.Parameters.AddWithValue("@Allow_KT", Convert.ToInt16(ddl_Allow_ATKT.SelectedValue));

                Cmd2.CommandType = System.Data.CommandType.StoredProcedure;

                ArrayList Technology_List = (ArrayList)ViewState["Technology_List"];
                int Check_Result = Cmd2.ExecuteNonQuery();
                if (Check_Result > 0)
                {
                    //      Technology Update, Insert and Delete
                    for (int i = 0; i < cbx_Required_Technology.Items.Count; i++)
                    {
                        if (cbx_Required_Technology.Items[i].Selected)
                        {
                            // Insert 
                            if (!Technology_List.Contains((cbx_Required_Technology.Items[i].Value)))
                            {
                                SqlCommand Cmd3 = new SqlCommand("Insert into tbl_Company_Required_Technology values (@Company_Id,@Technology_Name,@Updation_Time)", Con);
                                Cmd3.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(Session["Company_Id"].ToString()));
                                Cmd3.Parameters.AddWithValue("@Technology_Name", cbx_Required_Technology.Items[i].Value);
                                Cmd3.Parameters.AddWithValue("@Updation_Time", DateTime.Now);

                                if (Cmd3.ExecuteNonQuery() <= 0)
                                {
                                    Response.Write("<script>alert('Required Techology Details NOT Inserted Successfully.!');</script>");
                                }
                            }
                        }
                        else
                        {
                            // Delete
                            if (Technology_List.Contains((cbx_Required_Technology.Items[i].Value)))
                            {
                                SqlCommand Cmd4 = new SqlCommand("delete from tbl_Company_Required_Technology where Company_Id=@Company_Id and Technology_Name=@Technology_Name and SUBSTRING(CONVERT(varchar(20),Updation_Time),8,4)=@Current_Year", Con);
                                Cmd4.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(Session["Company_Id"].ToString()));
                                Cmd4.Parameters.AddWithValue("@Technology_Name", cbx_Required_Technology.Items[i].Value);
                                Cmd4.Parameters.AddWithValue("@Current_Year", DateTime.Now.Year);

                                if (Cmd4.ExecuteNonQuery() <= 0)
                                {
                                    Response.Write("<script>alert('Required Techology Details NOT Deleted Successfully.!');</script>");
                                }
                            }
                        }

                    }
                    Response.Write("<script>alert('Update Profile Done Successfully');window.location='Company_Update_Profile.aspx';</script>");

                }
                else
                {
                    Response.Write("<script>alert('Could not complete the Update Profile.\n Sorry for the inconvenience.\n Please Try Again.!')</script>");
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
        protected void btn_Submit_Click_Basic(object sender, EventArgs e)
        {
            pnl_Basic_Details.Visible = true;
            pnl_Company_Offerings.Visible = false;
        }
        protected void btn_Submit_Click_Offerings(object sender, EventArgs e)
        {
            pnl_Basic_Details.Visible = false;
            pnl_Company_Offerings.Visible = true;
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