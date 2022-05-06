using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Admin_Module
{
    public partial class Admin_Configure_Alert : System.Web.UI.Page
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
                    SqlDataAdapter Da = new SqlDataAdapter("SELECT [Company_Id],[Company_Name],[Company_Email_Id] FROM [tbl_Company_Basic_Details]", Con);
                    DataSet Ds = new DataSet();
                       
                    Da.Fill(Ds, "tbl_Company_Basic_Details");
                    lbx_Company_Name.DataSource = Ds.Tables[0];
                    lbx_Company_Name.DataTextField = "Company_Name";
                    lbx_Company_Name.DataValueField = "Company_Name";
                    lbx_Company_Name.DataBind();

                    lbx_Company_EmailId.DataSource = Ds.Tables[0];
                    lbx_Company_EmailId.DataTextField = "Company_Email_Id";
                    lbx_Company_EmailId.DataValueField = "Company_Email_Id";
                    lbx_Company_EmailId.DataBind();

                    lbx_Company_Id.DataSource = Ds.Tables[0];
                    lbx_Company_Id.DataTextField = "Company_Id";
                    lbx_Company_Id.DataValueField = "Company_Id";
                    lbx_Company_Id.DataBind();
                }
                catch (SqlException Ex)
                {
                    Response.Write(Ex.Message);
                }
                lbx_Company_Name.Items[0].Selected = true;
                lbx_Company_EmailId.Items[0].Selected = true;
                lbx_Company_Id.Items[0].Selected = true;
            }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage Msg = new MailMessage();

                foreach (ListItem Item in lbx_Company_EmailId.Items)
                {
                    if (Item.Selected)
                    {
                        // Response.Write("<br/>" + Item.Value.ToString());

                        Msg.To.Add(Item.Value.ToString());
                    }
                }

                Msg.From = new MailAddress("pmsproject69@gmail.com");
                Msg.Subject = txt_Subject.Text;
                Msg.Body = txt_Body.Text;

                //Msg.CC.Add(CarbonCopy.Text);
                //Msg.Bcc.Add(BCC.Text);

                if (fu_Attachment.HasFile)
                {
                    String filename = Path.GetFileName(fu_Attachment.PostedFile.FileName);
                    Msg.Attachments.Add(new Attachment(fu_Attachment.PostedFile.InputStream, filename));
                }

                SmtpClient Smtp = new SmtpClient();
                Smtp.Host = "smtp.gmail.com";
                Smtp.Port = 587;
                Smtp.EnableSsl = true;
                Smtp.Credentials = new System.Net.NetworkCredential("pmsproject69@gmail.com", "pms@6969");
                Smtp.Send(Msg);

                try
                {
                    Con.Open();
                    for (int i = 0; i < lbx_Company_EmailId.Items.Count; i++)
                    {
                        SqlCommand Cmd = new SqlCommand("sp_Company_Alert", Con);
                        Cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        if (lbx_Company_Id.Items[i].Selected)
                        {
                            if (lbx_Company_EmailId.Items[i].Selected)
                            {
                                Cmd.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(lbx_Company_Id.Items[i].Value));
                                Cmd.Parameters.AddWithValue("@Company_Email_Id", lbx_Company_EmailId.Items[i].Value);

                                Cmd.Parameters.AddWithValue("@Subject", txt_Subject.Text);
                                Cmd.Parameters.AddWithValue("@Message", txt_Body.Text);
                                Cmd.Parameters.AddWithValue("@Alert_Time", DateTime.Now);

                                if (Cmd.ExecuteNonQuery() <= 0)
                                {
                                    Response.Write("<script>alert('Company Alert Details NOT Inserted Successfully.!');</script>");
                                }
                            }
                        }
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

                Response.Write("<script>alert('Mail Sent Successfully.!!');window.location='Admin_Dashboard.aspx'</script>");
                Msg.To.Clear();
            }
            catch (Exception E)
            {
                Response.Write(E.Message);

            }
        }

        protected void lbx_Company_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbx_Company_EmailId.ClearSelection();
            lbx_Company_Id.ClearSelection();

            for (int i = 0; i < lbx_Company_Name.Items.Count; i++)
            {
                if (lbx_Company_Name.Items[i].Selected)
                {
                    lbx_Company_EmailId.Items[i].Selected = true;
                    lbx_Company_Id.Items[i].Selected = true;

                }
            }
        }

        protected void lbx_Company_EmailId_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbx_Company_Name.ClearSelection();
            lbx_Company_Id.ClearSelection();

            for (int i = 0; i < lbx_Company_EmailId.Items.Count; i++)
            {
                if (lbx_Company_EmailId.Items[i].Selected)
                {
                    lbx_Company_Name.Items[i].Selected = true;
                    lbx_Company_Id.Items[i].Selected = true;

                }
            }
        }
    }
}