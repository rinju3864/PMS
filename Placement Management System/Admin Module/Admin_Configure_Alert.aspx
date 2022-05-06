<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin_Configure_Alert.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Configure_Alert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Configure Alert</title>
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

    <link rel="stylesheet" type="text/css" href="../Registration_Template/css/Company_Change_Password_CSS.css">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <style type="text/css">
        .btn-Password {
            font-family: Montserrat-Bold;
            font-size: 1.3em;
            line-height: 1.5;
            color: #fff;
            text-transform: uppercase;
            width: 100%;
            height: 50px;
            border-radius: 25px;
            background: #57b846;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            justify-content: center;
            margin-top: 0px;
            align-items: center;
            padding: 0 25px;
            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;
        }

            .btn-Password:hover {
                background: #333333;
            }

        .lbl {
            font-size: 1.4em;
            color: #595861;
        }

        .input100 {
            font-size: 1em;
        }

        .wrap-input100 {
            width: 100% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="border: 2px solid black; box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75); width: 60%; background-color: #eaf7f2; border-radius: 20px; padding: 5%; margin: 5% auto 5% auto">

        <div class="wrap-input100" data-validate="Company Name is Required">
            <asp:Label ID="lbl_Company_Name" runat="server" CssClass="lbl" Text="Company Name"></asp:Label>
            
            <asp:ListBox ID="lbx_Company_Name" Width="100%" Height="100px" Style="margin-top: 20px" runat="server" AutoPostBack="True"  Font-Size="21.5px" ForeColor="#242c42" SelectionMode="Multiple"  OnSelectedIndexChanged="lbx_Company_Name_SelectedIndexChanged"></asp:ListBox>
            <asp:ListBox ID="lbx_Company_Id" Visible="false"  runat="server" AutoPostBack="True" SelectionMode="Multiple"></asp:ListBox>
            
            <%--<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [Company_Name] FROM [tbl_Company_Basic_Details]"></asp:SqlDataSource>--%>
            <span class="focus-input100"></span>
        </div>
        <center>
            <asp:RequiredFieldValidator ID="Company_Name_Validator" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="lbx_Company_Name" ErrorMessage="Company Name is Mandatory"></asp:RequiredFieldValidator>
        </center>

        <div class="wrap-input100" data-validate="Company Name is Required">
            <asp:Label ID="lbl_Company_EmailId" runat="server" CssClass="lbl" Text="Company Email Id"></asp:Label>
            
            <asp:ListBox ID="lbx_Company_EmailId" Width="100%" Height="100px" Style="margin-top: 20px" runat="server" AutoPostBack="True" Font-Size="21.5px" ForeColor="#242c42" SelectionMode="Multiple" OnSelectedIndexChanged="lbx_Company_EmailId_SelectedIndexChanged"></asp:ListBox>            
            
            <%--<asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [Company_Email_Id] FROM [tbl_Company_Basic_Details]"></asp:SqlDataSource>--%>
            <span class="focus-input100"></span>
        </div>
        <center>
            <asp:RequiredFieldValidator ID="Company_EmailId_Validator" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="lbx_Company_EmailId" ErrorMessage="Company Email Id Is Mandatory"></asp:RequiredFieldValidator>
        </center>


        <div class="wrap-input100 validate-input" data-validate="Subject is Required">
            <asp:Label ID="lbl_Subject" runat="server" CssClass="lbl" Text="Subject of Alert"></asp:Label>
            <asp:TextBox ID="txt_Subject" Width="100%" Font-Size="X-Large" ForeColor="Black" Style="margin-top: 10px;" class="input100" runat="server" ToolTip="Subject of Alert"></asp:TextBox>
            <span class="focus-input100"></span>

        </div>
        <center style="font-size: 20px; margin-top: 0.5em; margin-bottom: 1em;">
            <asp:RequiredFieldValidator ID="Subject_Validator" runat="server" Display="Dynamic"  ForeColor="Red" ControlToValidate="txt_Subject" ErrorMessage="Subject of Alert is Mandatory"></asp:RequiredFieldValidator>
        </center>

        <div class="wrap-input100 validate-input" data-validate="Message Body is Required">
            <asp:Label ID="lbl_Body" runat="server" CssClass="lbl" Text="Message Body"></asp:Label>
            <asp:TextBox ID="txt_Body" Width="100%" Rows="5" Columns="5" Height="100%" Font-Size="X-Large" ForeColor="Black" Style="margin-top: 10px;" class="input100" runat="server" ToolTip="Message/Body" TextMode="MultiLine"></asp:TextBox>
            <span class="focus-input100"></span>

        </div>
        <center style="font-size: 20px; margin-top: 0.5em; margin-bottom: 1em;">
            <asp:RequiredFieldValidator ID="Body_Validator" runat="server" Display="Dynamic"  ForeColor="Red" ControlToValidate="txt_Body" ErrorMessage="Message Body is Mandatory"></asp:RequiredFieldValidator>
        </center>

        <div class="wrap-input100">
            <asp:Label ID="lbl_Attachment" runat="server" CssClass="lbl" Width="100%" Text="Attachment"></asp:Label></td> 
            <asp:FileUpload ID="fu_Attachment" Width="100%" class="input100" Style="margin-top: 5%;" runat="server" ToolTip="Attachment File" Font-Size="X-Large" /></td>
            <span class="focus-input100"></span>
        </div>


        <div class="container-login100-form-btn">
            <div class="wrap-login100-form-btn">
                <asp:Button ID="btn_Submit" runat="server" class="login100-form-btn" Text="Send Alert" OnClick="btn_Submit_Click" />
            </div>
        </div>
    </div>

    <!--===============================================================================================-->
    <script src="../Registration_Template/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Registration_Template/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Registration_Template/vendor/bootstrap/js/popper.js"></script>
    <script src="../Registration_Template/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Registration_Template/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Registration_Template/vendor/daterangepicker/moment.min.js"></script>
    <script src="../Registration_Template/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="../Registration_Template/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="../Registration_Template/js/main.js"></script>
</asp:Content>
