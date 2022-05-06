using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Management_System.Admin_Module
{
    public partial class Admin_Schedule_Generation : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Id"] == null)
            {
                Response.Redirect("../LoginPage.aspx");
            }

            if (!Page.IsPostBack)
            {
                //Schedule Will Begin From 1st July
                DateTime ScheduleDate = new DateTime(DateTime.Now.Year, 07, 01);
                foreach (GridViewRow Row in GridView1.Rows)
                {
                    TextBox txt_Schedule_Date = (TextBox)Row.FindControl("txt_Schedule_Date");
                    DropDownList ddl_Interview_Venue = (DropDownList)Row.FindControl("ddl_Interview_Venue");
                    try
                    {
                        Con.Open();
                        SqlCommand Cmd = new SqlCommand("Select * from tbl_Generate_Schedule where Company_Id='"+Convert.ToInt32(Row.Cells[1].Text) +"'", Con);
                        SqlDataReader Dr = Cmd.ExecuteReader();
                        if (Dr.HasRows)
                        {
                            while (Dr.Read())
                            {
                                txt_Schedule_Date.Text = Convert.ToDateTime(Dr["Arrival_Date"].ToString()).ToString("dd/MM/yyyy");
                                ddl_Interview_Venue.SelectedValue = Dr["Interview_Venue"].ToString();
                            }
                        }
                        else
                        {
                            Dr.Close();
                            txt_Schedule_Date.Text = ScheduleDate.ToString("dd/MM/yyyy");
                            if (ScheduleDate.DayOfWeek.Equals(DayOfWeek.Thursday))
                            {
                                ScheduleDate = ScheduleDate.AddDays(4);
                            }
                            else
                            {
                                ScheduleDate = ScheduleDate.AddDays(3);
                            }
                            if (Row.Cells[3].Text.Equals("Off Campus"))
                            {
                                ddl_Interview_Venue.SelectedValue = "Off Campus";
                            }

                            // For Insert Action=0
                            // For Update Action=1

                            SqlCommand Cmd2 = new SqlCommand("sp_Generate_Schedule",Con);
                            Cmd2.CommandType = CommandType.StoredProcedure;
                            Cmd2.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(Row.Cells[1].Text));
                            Cmd2.Parameters.AddWithValue("@Interview_Mode",Row.Cells[3].Text);
                            Cmd2.Parameters.AddWithValue("@Interview_Venue", ddl_Interview_Venue.SelectedValue);
                            Cmd2.Parameters.AddWithValue("@Arrival_Date", Convert.ToDateTime(txt_Schedule_Date.Text));
                            Cmd2.Parameters.AddWithValue("@Action", 0);
                            if (Cmd2.ExecuteNonQuery() <=0)
                            {
                                Response.Write("<script>alert('"+Row.Cells[2].Text+"'s is not configured properly.!')</script>");
                            }
                        }
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

        }
        protected void cld_Schedule_Date_Change_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Now.Date || e.Day.Date.DayOfWeek.Equals(DayOfWeek.Sunday))
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.White;
            }

        }
        

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow Row in GridView1.Rows)
            {
                HyperLink Temp = (HyperLink)Row.FindControl("hyplink_Edit");
                Temp.Visible = false;
            }
            TextBox Schedule_Date = (TextBox)GridView1.SelectedRow.FindControl("txt_Schedule_Date");
            DropDownList ddl_Interview_Venue = (DropDownList)GridView1.SelectedRow.FindControl("ddl_Interview_Venue");
            HyperLink EditLink = (HyperLink)GridView1.SelectedRow.FindControl("hyplink_Edit");
            Schedule_Date.Enabled = true;
            ddl_Interview_Venue.Enabled = true;
            EditLink.Visible = true;
            cld_Schedule_Date_Change.SelectedDate = DateTime.Parse(Schedule_Date.Text);
            cld_Schedule_Date_Change.VisibleDate = DateTime.Parse(Schedule_Date.Text);

        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            TextBox Schedule_Date = (TextBox)GridView1.SelectedRow.FindControl("txt_Schedule_Date");
            DropDownList ddl_Interview_Venue = (DropDownList)GridView1.SelectedRow.FindControl("ddl_Interview_Venue");

            Schedule_Date.Text = cld_Schedule_Date_Change.SelectedDate.ToString("dd/MM/yyyy");

            try
            {
                // For Insert Action=0
                // For Update Action=1

                Con.Open();
                SqlCommand Cmd2 = new SqlCommand("sp_Generate_Schedule", Con);
                Cmd2.CommandType = CommandType.StoredProcedure;
                Cmd2.Parameters.AddWithValue("@Company_Id", Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text));
                Cmd2.Parameters.AddWithValue("@Interview_Mode", GridView1.SelectedRow.Cells[3].Text);
                Cmd2.Parameters.AddWithValue("@Interview_Venue", ddl_Interview_Venue.SelectedValue);
                Cmd2.Parameters.AddWithValue("@Arrival_Date", Convert.ToDateTime(Schedule_Date.Text));
                Cmd2.Parameters.AddWithValue("@Action", 1);
                if (Cmd2.ExecuteNonQuery() <= 0)
                {
                    Response.Write("<script>alert('" + GridView1.SelectedRow.Cells[2].Text + "'s is not configured properly.!')</script>");
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
            Response.Redirect("Admin_Schedule_Generation.aspx");
        }

        protected void btn_Close_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "PopUp_Close();", true);

        }

        protected void btn_New_Schedule_Click(object sender, EventArgs e)
        {
            try
            {
                // For Insert Action=0
                // For Update Action=1

                Con.Open();
                SqlCommand Cmd = new SqlCommand("Delete From tbl_Generate_Schedule", Con);
                if (Cmd.ExecuteNonQuery() <= 0)
                {
                    Response.Write("<script>alert('There was a problem in generating a new schedule.!')</script>");
                }
                Response.Redirect("Admin_Schedule_Generation.aspx");
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
        protected void btn_Download_PDF_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Interview_Schedule_("+DateTime.Now.ToString("dd/MM/yyyy")+").xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                
                GridView1.AllowPaging = false;
                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                    cell.CssClass = "textmode";
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                        List<Control> controls = new List<Control>();

                        //Add controls to be removed to Generic List
                        foreach (Control control in cell.Controls)
                        {
                            if (!control.GetType().Name.Equals("HyperLink"))
                            {
                                controls.Add(control);
                            }
                        }

                        //Loop through the controls to be removed and replace then with Literal
                        foreach (Control control in controls)
                        {
                            switch (control.GetType().Name)
                            {
                                case "TextBox":
                                    cell.Controls.Add(new Literal { Text = (control as TextBox).Text });
                                    break;
                                case "DropDownList":
                                    cell.Controls.Add(new Literal { Text = (control as DropDownList).Text });
                                    break;
                            }
                            cell.Controls.Remove(control);
                        }
                    }
                }
                GridView1.RenderControl(hw);

                string style = @"<style> .textmode { text-align:center;font-size:22px;border:1px solid black;} </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }

    }
}