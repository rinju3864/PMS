<%@ Page Title="Interview Schedule Generation" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin_Schedule_Generation.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Schedule_Generation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- jQuery Modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>



    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Registration_Template/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Registration_Template/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Registration_Template/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Registration_Template/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Registration_Template/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Registration_Template/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Registration_Template/vendor/daterangepicker/daterangepicker.css">

    <link rel="stylesheet" type="text/css" href="../Registration_Template/css/Company_Update_Profile_CSS.css">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <style type="text/css">
        .lbl {
            font-size: 1.4em;
            color: #595861;
        }

        .input100 {
            font-size: 1em;
        }

        .wrap-input100 {
            width: 40% !important;
        }

        .Validator {
            color: red;
            font-size: larger;
        }

        .gridviewRow td {
            font-family: Montserrat !important;
            font-size: 20px;
            text-align: center !important;
        }

        .gridviewHeader th {
            font-family: Montserrat !important;
            font-size: 20px;
            text-align: center !important;
        }

        .Center {
            text-align: center !important;
        }

        .rbl input[type="radio"] {
            margin-left: 30px;
        }

        .CompanyListHide {
            display: none !important;
        }

        .MainGrid td a {
            background-color: #242c42 !important;
            color: white !important;
            font-size: 18px;
            padding: 5px;
            margin: 10px;
            border: 1px solid black;
            font-weight: bold !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <center>
      
    <asp:GridView ID="GridView1" CssClass="MainGrid" runat="server" BackColor="White" DataKeyNames="Company_Id" AutoGenerateColumns="false" BorderColor="#242c42" BorderStyle="Solid" BorderWidth="4px" Width="90%" GridLines="Both" DataSourceID="SqlDataSource1" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Company_Id" HeaderText="Company Id" ReadOnly="true" HeaderStyle-CssClass="CompanyListHide" ItemStyle-CssClass="CompanyListHide"  SortExpression="Company_Id"></asp:BoundField>
            <asp:BoundField DataField="Company_Name" HeaderText="Company Name" ReadOnly="true" SortExpression="Company_Name"></asp:BoundField>
            <asp:BoundField DataField="Selection_Mode" HeaderText="Selection Mode" ReadOnly="true" SortExpression="Selection_Mode"></asp:BoundField>
            <asp:BoundField DataField="Stipend" HeaderText="Stipend" ReadOnly="true" SortExpression="Stipend"></asp:BoundField>
            <asp:BoundField DataField="Package" HeaderText="Package" ReadOnly="true" SortExpression="Package"></asp:BoundField>
            <asp:BoundField DataField="Tenure" HeaderText="Tenure" ReadOnly="true" SortExpression="Tenure"></asp:BoundField>

            <asp:TemplateField HeaderText="Interview Venue">
                <HeaderStyle CssClass="Center" />
                <ItemStyle Wrap="false" HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:DropDownList ID="ddl_Interview_Venue" Enabled="false" AutoPostBack="false" runat="server">
                        <asp:ListItem>Shrimad Hall</asp:ListItem>
                        <asp:ListItem>Pushpam Hall</asp:ListItem>
                        <asp:ListItem>Manjula Hall</asp:ListItem>
                        <asp:ListItem>Off Campus</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Scheduled Date">
                <HeaderStyle CssClass="Center" />
                <ItemStyle Wrap="false" HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:TextBox ID="txt_Schedule_Date" Enabled="false" Width="120px" runat="server"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="">
                <HeaderStyle CssClass="Center" />
                <ItemStyle Wrap="false" HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:HyperLink ID="hyplink_Edit" runat="server" Visible="false" NavigateUrl="#ex1" rel="modal:open">Edit</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>        
        
        <HeaderStyle BackColor="#242c42" Wrap="false" ForeColor="White" CssClass="gridviewHeader" HorizontalAlign="Center" Height="60px" VerticalAlign="Middle"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

        <RowStyle BackColor="#EEEEEE" Wrap="false" ForeColor="Black" CssClass="gridviewRow" Height="50px"></RowStyle>

        <SelectedRowStyle BackColor="#008A8C" ForeColor="Black"></SelectedRowStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT tbl_Company_Basic_Details.Company_Id,tbl_Company_Basic_Details.Company_Name, tbl_Company_Offerings.Selection_Mode, tbl_Company_Offerings.Stipend, tbl_Company_Offerings.Package, tbl_Company_Offerings.Tenure FROM tbl_Company_Basic_Details INNER JOIN tbl_Company_Blacklist_Status ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Blacklist_Status.Company_Id INNER JOIN tbl_Company_Offerings ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Offerings.Company_Id WHERE (tbl_Company_Blacklist_Status.Company_BlackList_Status <> 'Yes') ORDER BY tbl_Company_Offerings.Stipend DESC, tbl_Company_Offerings.Package DESC, tbl_Company_Offerings.Tenure"></asp:SqlDataSource>
    <br />
    <br />
 
        <table>
            <tr>
                <td>
                    <asp:Button ID="btn_Download_PDF" runat="server" class="login100-form-btn" Text="Download Schedule" OnClick="btn_Download_PDF_Click"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="btn_New_Schedule" runat="server"  OnClientClick="return ConfirmOnDelete();" class="login100-form-btn"  style="margin-left:2em;" Text="Regenerate New Schedule" OnClick="btn_New_Schedule_Click"></asp:Button>
                </td>
            </tr>
        </table>
    <br />
    <br />
    
    <asp:Label ID="lbl_Note" runat="server" Text="NOTE 1 : Sunday's are not Included in the Schedule.!<br/><br/>NOTE 2 : To Change Schedule Date of Company Please Select the Respective Row.!" ForeColor="Red" Font-Size="Medium"></asp:Label>
    </center>


    <div id="ex1" class="modal">
        <center>
            <div class="modal-header">
                <h4 class="modal-title">Select a New Date for Interview Schedule</h4>
            </div>
            <div class="modal-body" style="font-size: 15px;">
                <br/>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Calendar ID="cld_Schedule_Date_Change"  runat="server" DayHeaderStyle-BorderColor="#032152" DayHeaderStyle-BorderStyle="Solid" DayHeaderStyle-BorderWidth="2px"
                                DayStyle-BorderColor="#032152" DayStyle-BorderStyle="Solid" DayStyle-BorderWidth="2px" FirstDayOfWeek="Sunday" SelectedDayStyle-ForeColor="Black" ShowGridLines="True"
                                TitleStyle-BackColor="#093051" TitleStyle-ForeColor="White" SelectionMode="Day" CellPadding="5" CellSpacing="5" OnDayRender="cld_Schedule_Date_Change_DayRender">
                            
                                <DayHeaderStyle BorderColor="#032152" BorderWidth="2px" BorderStyle="Solid"></DayHeaderStyle>
                                <DayStyle BorderColor="#032152" BorderWidth="2px" BorderStyle="Solid"></DayStyle>
                                <NextPrevStyle ForeColor="White"></NextPrevStyle>
                                <SelectedDayStyle ForeColor="Black"></SelectedDayStyle>
                                <TitleStyle BackColor="#093051" ForeColor="White"></TitleStyle>
                            </asp:Calendar>
                        </ContentTemplate>
                    </asp:UpdatePanel>
            </div>
            <div class="modal-footer">
                <center>
                    <asp:LinkButton ID="btn_Update"  runat="server" Text="Update" Font-Size="Medium" ForeColor="#00cc00" OnClick="btn_Update_Click" Style="margin-right:7%;"></asp:LinkButton>
                    <asp:LinkButton ID="btn_Close" OnClick="btn_Close_Click" Font-Size="Medium" runat="server" ForeColor="#00cc00" Text="Cancel"></asp:LinkButton>
                </center>
            </div>
        </center>
    </div>
    <br />
    <%--    <p><a href="#ex1" rel="modal:open">Open Modal</a></p>--%>

    <script type="text/javascript">  
        function PopUp_Close() {
            $("#ex1").modal("hide");
        }
    </script>

    <script type="text/javascript">
        function ConfirmOnDelete() {
            if (confirm("Are You Sure You Want To Generate A New Schedule?") == true)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
