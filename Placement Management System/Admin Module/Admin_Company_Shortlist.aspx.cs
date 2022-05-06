using System;
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
    public partial class Admin_Company_Shortlist : System.Web.UI.Page
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
                    SqlDataAdapter Da = new SqlDataAdapter("Select count(*),Technology_Name from tbl_Student_Required_Technology group by Technology_Name order by count(*) desc", Con);
                    DataSet Ds = new DataSet();
                    Da.Fill(Ds, "tbl_Student_Required_Technology");
                    ddl_Technology_Name.DataSource = Ds.Tables[0];
                    ddl_Technology_Name.DataTextField = "Technology_Name";
                    ddl_Technology_Name.DataValueField = "Technology_Name";
                    ddl_Technology_Name.DataBind();
                    ddl_Technology_Name.Items.Insert(0, new ListItem("-Select-", "-1"));
                    ddl_Technology_Name.SelectedIndex = 1;

                    Display_Company(ddl_Technology_Name.SelectedValue);

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }

        }
        protected void Display_Company(String TechName="", String Pref_City="", String Stipend="", String Package = "", String Tenure = "")
        {
            try
            {
                String Query = "SELECT tbl_Company_Basic_Details.Company_Name As 'Company Name'," +
                            " tbl_Company_Basic_Details.Company_City as 'City', tbl_Company_Basic_Details.Company_Logo, " +
                            "tbl_Company_Offerings.Selection_Mode as 'Selection Mode'," +
                            "tbl_Company_Offerings.Stipend as 'Stipend', tbl_Company_Offerings.Package as 'Package', tbl_Company_Offerings.Tenure as 'Tenure'," +
                            " tbl_Company_Required_Technology.Technology_Name as 'Technology' FROM tbl_Company_Basic_Details INNER JOIN" +
                            " tbl_Company_Blacklist_Status ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Blacklist_Status.Company_Id" +
                            " INNER JOIN tbl_Company_Offerings ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Offerings.Company_Id" +
                            " INNER JOIN tbl_Company_Required_Technology ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Required_Technology.Company_Id" +
                            " WHERE(tbl_Company_Blacklist_Status.Company_BlackList_Status <> 'Yes')";
                
                if (!TechName.Equals(""))
                {
                    Query += " AND(tbl_Company_Required_Technology.Technology_Name = '" + TechName + "')";
                }
                if (!Pref_City.Equals(""))
                {
                    Query += " AND(tbl_Company_Basic_Details.Company_City = '" + Pref_City + "')";
                }
                if (!Stipend.Equals(""))
                {
                    if (Stipend.Equals("10000"))
                    {
                        Query += " AND(tbl_Company_Offerings.Stipend > '" + float.Parse(Stipend) + "')";
                    }
                    else
                    {
                        Query += " AND(tbl_Company_Offerings.Stipend BETWEEN '" + float.Parse(Stipend.Substring(0, 4).ToString()) + "' AND '"+ float.Parse(Stipend.Substring(5, Stipend.Length - 5).ToString()) + "')";
                    }
                }

                if (!Package.Equals(""))
                {
                    if (Package.Equals("1000000"))
                    {
                        Query += " AND(tbl_Company_Offerings.Package > '" + float.Parse(Package) + "')";
                    }
                    else
                    {
                        Query += " AND(tbl_Company_Offerings.Package BETWEEN '" + float.Parse(Package.Substring(0, 6).ToString()) + "' AND '" + float.Parse(Package.Substring(7, Package.Length - 7).ToString()) + "')";
                    }
                }
                if (!Tenure.Equals(""))
                {
                    Query += " AND(tbl_Company_Offerings.Tenure = '" + Tenure + "')";
                }

                Query += " ORDER BY tbl_Company_Offerings.Stipend DESC, tbl_Company_Offerings.Package DESC, tbl_Company_Offerings.Tenure";

                SqlDataAdapter Sda = new SqlDataAdapter(Query, Con);
                DataSet Ds = new DataSet();
                Sda.Fill(Ds);
                if (Ds.Tables[0].Rows.Count != 0)
                {
                    lbl_No_Record.Visible = false;
                    gv_Company_List.Visible = true;
                    gv_Company_List.DataSource = Ds.Tables[0];
                    gv_Company_List.DataBind();
                    btn_Download_PDF.Visible = true;

                }
                else
                {
                    lbl_No_Record.Visible = true;
                    gv_Company_List.Visible = false;
                    lbl_No_Record.Text = "No Records Found.";
                    btn_Download_PDF.Visible = false;
                }

                
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        
        

        protected void ddl_Technology_Name_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (!ddl_Technology_Name.SelectedValue.Equals("-1"))
            {
                ddl_City.Items.Clear();
                ddl_Stipend.Items.Clear();
                ddl_Package.Items.Clear();
                ddl_Tenure.Items.Clear();
                try
                {
                    SqlDataAdapter Da = new SqlDataAdapter("Select count(*),Prefered_City from tbl_Student_Prefered_City group by Prefered_City order by count(*) desc", Con);
                    DataSet Ds = new DataSet();
                    Da.Fill(Ds, "tbl_Student_Prefered_City");
                    ddl_City.DataSource = Ds.Tables[0];
                    ddl_City.DataTextField = "Prefered_City";
                    ddl_City.DataValueField = "Prefered_City";
                    ddl_City.DataBind();
                    ddl_City.Items.Insert(0, new ListItem("-Select-", "-1"));
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else
            {
                ddl_City.Items.Clear();
                ddl_Stipend.Items.Clear();
                ddl_Package.Items.Clear();
                ddl_Tenure.Items.Clear();
            }
            Display_Company(ddl_Technology_Name.SelectedValue);
        }

        protected void ddl_City_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddl_City.SelectedValue.Equals("-1"))
            {
                ddl_Stipend.Items.Clear();
                ddl_Package.Items.Clear();
                ddl_Tenure.Items.Clear();
                Display_Company(ddl_Technology_Name.SelectedValue, ddl_City.SelectedValue);
                ddl_Stipend.Items.Insert(0, new ListItem("-Select-", "-1"));
                ddl_Stipend.Items.Insert(1, new ListItem("1000-5000", "1000-5000"));
                ddl_Stipend.Items.Insert(2, new ListItem("5001-10000", "5001-10000"));
                ddl_Stipend.Items.Insert(3, new ListItem("Above 10000", "10000"));
            }
            else
            {
                ddl_Stipend.Items.Clear();
                ddl_Package.Items.Clear();
                ddl_Tenure.Items.Clear();
                Display_Company(ddl_Technology_Name.SelectedValue);
            }
        }

        protected void ddl_Stipend_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (!ddl_Stipend.SelectedValue.Equals("-1"))
            {
                ddl_Package.Items.Clear();
                ddl_Tenure.Items.Clear();
                Display_Company(ddl_Technology_Name.SelectedValue, ddl_City.SelectedValue, ddl_Stipend.SelectedValue);
                ddl_Package.Items.Insert(0, new ListItem("-Select-", "-1"));
                ddl_Package.Items.Insert(1, new ListItem("100000-500000", "100000-500000"));
                ddl_Package.Items.Insert(2, new ListItem("500001-1000000", "500001-1000000"));
                ddl_Package.Items.Insert(3, new ListItem("Above 1000000", "1000000"));
            }
            else
            {
                ddl_Package.Items.Clear();
                ddl_Tenure.Items.Clear();
                Display_Company(ddl_Technology_Name.SelectedValue, ddl_City.SelectedValue);
            }
        }
        protected void ddl_Package_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddl_Package.SelectedValue.Equals("-1"))
            {
                ddl_Tenure.Items.Clear();
                Display_Company(ddl_Technology_Name.SelectedValue, ddl_City.SelectedValue, ddl_Stipend.SelectedValue,ddl_Package.SelectedValue);
                ddl_Tenure.Items.Insert(0, new ListItem("-Select-", "-1"));
                ddl_Tenure.Items.Insert(1, new ListItem("1", "1"));
                ddl_Tenure.Items.Insert(2, new ListItem("2", "2"));
                ddl_Tenure.Items.Insert(3, new ListItem("3", "3"));
            }
            else
            {
                ddl_Tenure.Items.Clear();
                Display_Company(ddl_Technology_Name.SelectedValue, ddl_City.SelectedValue,ddl_Stipend.SelectedValue);
            }
        }

        protected void ddl_Tenure_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddl_Tenure.SelectedValue.Equals("-1"))
            {
                Display_Company(ddl_Technology_Name.SelectedValue, ddl_City.SelectedValue, ddl_Stipend.SelectedValue, ddl_Package.SelectedValue,ddl_Tenure.SelectedValue);
            }
            else
            {
                Display_Company(ddl_Technology_Name.SelectedValue, ddl_City.SelectedValue, ddl_Stipend.SelectedValue,ddl_Package.SelectedValue);
            }
        }

        protected void btn_Download_PDF_Click(object sender, EventArgs e)
        {
            //Response.Clear();
            //Response.Buffer = true;
            //Response.ClearContent();
            //Response.ClearHeaders();
            //Response.Charset = "";
            //string FileName = "Company_Shortlist_(" + DateTime.Now.ToString("dd/MM/yyyy") + ").xls";
            //StringWriter strwritter = new StringWriter();
            //HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.ContentType = "application/vnd.ms-excel";
            //Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            //gv_Company_List.GridLines = GridLines.Both;
            //gv_Company_List.HeaderStyle.Font.Bold = true;
            //for (int i = 0; i < gv_Company_List.HeaderRow.Cells.Count; i++)
            //{
            //    gv_Company_List.HeaderRow.Cells[i].Style.Add("width", "200");
            //    gv_Company_List.HeaderRow.Cells[i].Style.Add("height", "50");
            //    gv_Company_List.HeaderRow.Cells[i].Style.Add("text-align", "center");
            //    gv_Company_List.HeaderRow.Cells[i].Style.Add("font-size", "23px");
            //    gv_Company_List.HeaderRow.Cells[i].Style.Add("border", "1px solid black");

            //}
            //for (int i = 0; i < gv_Company_List.Rows.Count; i++)
            //{
            //    for (int j = 0; j < gv_Company_List.Rows[0].Cells.Count; j++)
            //    {
            //        gv_Company_List.Rows[i].Cells[j].Style.Add("text-align", "center");
            //        gv_Company_List.Rows[i].Cells[j].Style.Add("font-size", "20px");
            //        gv_Company_List.Rows[i].Cells[j].Style.Add("border", "1px solid black");

            //    }
            //}
            //gv_Company_List.RenderControl(htmltextwrtter);
            //Response.Write(strwritter.ToString());
            //Response.End();

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Company_ShortList_(" + DateTime.Now.ToString("dd/MM/yyyy") + ").xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                gv_Company_List.AllowPaging = false;
                gv_Company_List.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in gv_Company_List.HeaderRow.Cells)
                {
                    cell.BackColor = gv_Company_List.HeaderStyle.BackColor;
                    cell.CssClass = "textmode";
                }
                foreach (GridViewRow row in gv_Company_List.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gv_Company_List.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gv_Company_List.RowStyle.BackColor;
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
                gv_Company_List.RenderControl(hw);

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