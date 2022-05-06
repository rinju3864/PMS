<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Admin_Add_Company_Visit.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Add_Company_Visit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add Company Visit</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
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
        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 14px 28px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
            margin-top: 1%;
            margin-bottom: 2%;
            border: 2px solid #4CAF50;
            border-radius: 4px;
        }

            .button:hover {
                background-color: #fff;
                color: black;
            }

        .lbl {
            color: #595861 !important;
            opacity: 1 !important;
            font-family: Montserrat !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="alignment">

        <div class="login100-form-avatar" style="padding: 0px; box-shadow: 2px 8px 7px #2a3547;">
            <asp:Image ID="img_main_logo" runat="server" Height="150px" Width="100%" ImageUrl="~\\Login_Template\\images\\Logo.png" ImageAlign="Middle" />
        </div>
        <br/>
        <br/>
        <br />

        <div class="wrap-input100 validate-input" data-validate="Company Name is Required">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lbl_Company_Name" runat="server" ForeColor="#999999" CssClass="lbl" Text="Company Name"></asp:Label>
                    </td>
                    <td style="width: 45%">

                        <asp:DropDownList ID="ddl_Company_List" runat="server" DataSourceID="SqlDataSource1" DataTextField="Company_Name" DataValueField="Company_Name" Height="30" Width="150" Style="border: 0px !important;" Font-Size="Larger">
                        </asp:DropDownList>

                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [Company_Name] FROM [tbl_Company_Basic_Details]"></asp:SqlDataSource>
        <br />
        <center><span style="font-size:18px" CssClass="lbl">Company Visit Team</span></center>
        <br />
        
        <div class="wrap-input100 validate-input" data-validate="Visit Team is Required">
            <asp:CheckBoxList ID="cbx_Visit_Team" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" Width="121%" Height="269px">

                <asp:ListItem>Dr. Kalpesh Lad</asp:ListItem>
                <asp:ListItem>Dr. Jikitsha Sheth</asp:ListItem>
                <asp:ListItem>Ms. Chetana M. Tailor</asp:ListItem>
                <asp:ListItem>Dr.Jaishree Tailor</asp:ListItem>
                <asp:ListItem>Mr. Jitendra Upadhyay</asp:ListItem>
                <asp:ListItem>Ms. Puja Sharma 	</asp:ListItem>
                <asp:ListItem>Ms. Poonam Godhwani</asp:ListItem>
                <asp:ListItem>Ms. Khushbu Patel 	</asp:ListItem>
                <asp:ListItem>Mr. Vivek Fumakia</asp:ListItem>
                <asp:ListItem>Ms. Jenisha Tailor</asp:ListItem>
                <asp:ListItem>Mr. Pratik Nayak</asp:ListItem>
                <asp:ListItem>Ms. Unnati Shah</asp:ListItem>
                <asp:ListItem>Mr. Kevin Bhavsar</asp:ListItem>
                <asp:ListItem>Ms. Zarana Kanani</asp:ListItem>
            </asp:CheckBoxList>
        </div>


            <div class="wrap-input100 validate-input" data-validate="Date Of Company Visit is Required">
                <center><span style="font-size:18px" CssClass="lbl">Date Of Company Visited</span>
                        <br/><br/>

                        <asp:Calendar ID="cld_Date_Of_Visit" runat="server" DayHeaderStyle-BorderColor="#032152" DayHeaderStyle-BorderStyle="Solid" DayHeaderStyle-BorderWidth="2px"
                            DayStyle-BorderColor="#032152" DayStyle-BorderStyle="Solid" DayStyle-BorderWidth="2px" FirstDayOfWeek="Monday" SelectedDayStyle-ForeColor="Black" ShowGridLines="True"
                            TitleStyle-BackColor="#093051" TitleStyle-ForeColor="White" SelectionMode="Day" CellPadding="5" CellSpacing="5" OnDayRender="cld_Date_Of_Visit_DayRender" OnSelectionChanged="cld_Date_Of_Visit_SelectionChanged" >

                            <DayHeaderStyle BorderColor="#032152" BorderWidth="2px" BorderStyle="Solid"></DayHeaderStyle>
                            <DayStyle BorderColor="#032152" BorderWidth="2px" BorderStyle="Solid"></DayStyle>
                            <NextPrevStyle ForeColor="White"></NextPrevStyle>
                            <SelectedDayStyle ForeColor="Black"></SelectedDayStyle>
                            <TitleStyle BackColor="#093051" ForeColor="White"></TitleStyle>

                        </asp:Calendar>
                            <br/>
                        <asp:TextBox ID="txt_Date_Of_Visit" Width="100%" class="input100" runat="server" ReadOnly="True"></asp:TextBox>
                        <span class="focus-input100"></span>
                            </center>
            </div>
            <center>
                <asp:RequiredFieldValidator ID="cld_Date_Of_Visit_Validator" ControlToValidate="txt_Date_Of_Visit" runat="server" ErrorMessage="Date OF Company Visit is Mandatory" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </center>

        <div class="wrap-input100 validate-input" data-validate="Name of Person Interacted is Required">
            <asp:Label ID="lbl_Representative1" runat="server" ForeColor="#999999" CssClass="lbl" Text="Name of Person Interacted With"></asp:Label>

            <asp:TextBox ID="txt_Representative_Name" Width="100%" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>
        </div>
        <center>
            <asp:RegularExpressionValidator ID="Representative_Validator" runat="server" ErrorMessage="Please Enter Valid Representative Name" ControlToValidate="txt_Representative_Name" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-z A-Z .]+$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Valid Representative Name" ControlToValidate="txt_Representative_Name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </center>


        <div class="wrap-input100 validate-input" data-validate="Email ID is Required">
            <asp:Label ID="lbl_Email" runat="server" CssClass="lbl" ForeColor="#999999" Text="Company Email Id"></asp:Label>
            <asp:TextBox ID="txt_Email_Id" Width="100%" ToolTip="Email Id must be of proper format: abc@gmail.com" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>
        </div>
        <center>
            <asp:RegularExpressionValidator ID="Email_Validator" runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="txt_Email_Id" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="txt_Email_Id" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </center>

        <div class="wrap-input100 validate-input" data-validate="Contact Number is Required">
            <asp:Label ID="lbl_Contact" runat="server" ForeColor="#999999" CssClass="lbl" Text="Contact No."></asp:Label>
            <asp:TextBox ID="txt_Contact_Number" ToolTip="Contact No. must be of proper format: 9512136600" Width="100%" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>

        </div>
        <center>
            <asp:RegularExpressionValidator ID="Contact_Validator" runat="server" ErrorMessage="Please Enter Valid Contact Number" ControlToValidate="txt_Contact_Number" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Valid Contact Number" ControlToValidate="txt_Contact_Number" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </center>


        <div class="wrap-input100 validate-input" data-validate="Your Experience is Required">
            <asp:Label ID="lbl_Experience" ForeColor="#999999" runat="server" CssClass="lbl" Text="Your Experience"></asp:Label>

            <asp:TextBox ID="txt_Experience" Width="100%" Rows="5" Columns="5" Height="100%" Font-Size="20px" ForeColor="Black" Style="margin-top: 15px;" class="input100" runat="server" ToolTip="Your Experience" TextMode="MultiLine"></asp:TextBox>
            <span class="focus-input100"></span>
        </div>
        <center>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Valid Experience Details" ControlToValidate="txt_Experience" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </center>

        <div class="wrap-input100 validate-input" data-validate="Your Findings is Required">
            <asp:Label ID="lbl_Findings" ForeColor="#999999" runat="server" CssClass="lbl" Text="Your Findings"></asp:Label>

            <asp:TextBox ID="txt_Findings" Width="100%" Rows="5" Columns="5" Height="100%" Font-Size="20px" ForeColor="Black" Style="margin-top: 15px;" class="input100" runat="server" ToolTip="Your Findings" TextMode="MultiLine"></asp:TextBox>
            <span class="focus-input100"></span>
        </div>
        <center>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Valid Findings Details" ControlToValidate="txt_Findings" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </center>

        <div class="wrap-input100 validate-input">
            <asp:Label ID="lbl_Remark" runat="server" ForeColor="#999999" CssClass="lbl" Text="Special Remarks"></asp:Label>

            <asp:TextBox ID="txt_Remark" Width="100%" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>

        </div>

        <div class="wrap-input100 validate-input" data-validate="Company Blacklist Status">
            <table>
                <tr>
                    <td style="width: 50%;">
                        <asp:Label ID="lbl_Recommendation" ForeColor="Red" Font-Bold="True" Font-Size="Larger" runat="server" Text="Is Company Recommended for next year Placement/Internship.?"></asp:Label>
                    </td>
                    <td style="width: 30%;">
                        <asp:RadioButtonList ID="rbl_Recommendation_Status" Width="100%" runat="server" Style="margin-top: 9px;" RepeatDirection="Horizontal" TextAlign="Right" CellPadding="10" CellSpacing="10">
                            <asp:ListItem Value="Yes" Selected="True">&nbsp;&nbsp;YES</asp:ListItem>
                            <asp:ListItem Value="No">&nbsp;&nbsp;NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </div>

        <div class="container-login100-form-btn">
            <div class="wrap-login100-form-btn">
                <center>
                    <asp:Button ID="btn_Submit" Style="margin-right:2%;" runat="server" class=" button btn_left" Text="Submit Company Visit Details" OnClick="btn_Submit_Click" />
                </center>
            </div>
        </div>
    </div>
</asp:Content>
