<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Admin_Student_Marks_Entry.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Student_Marks_Entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Rounds Marks Entry
    </title>
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="alignment">
        <center>
            <asp:Label ID="lbl_Select_Company" runat="server" style="font-size:21.5px;margin-left:0%; font-family:Montserrat !important;" class=".lbl" Text="Select Company" ></asp:Label>
            <asp:DropDownList ID="ddl_Company_Name_List"  runat="server" Font-Size="21.5px" ForeColor="#1fc428" OnSelectedIndexChanged="ddl_Company_Name_List_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            <asp:DropDownList ID="ddl_Company_Id_List" Visible="false" runat="server" AutoPostBack="true"></asp:DropDownList>            
            <asp:DropDownList ID="ddl_Company_Rounds_List" Visible="false" runat="server" AutoPostBack="true"></asp:DropDownList>
            <asp:Label ID="lbl_Select_Student" runat="server" style="font-size:21.5px;margin-left:3%; font-family:Montserrat !important;" class=".lbl" Text="Select Student" ></asp:Label>
            <asp:DropDownList ID="ddl_Students_List" Visible="true" runat="server" Font-Size="21.5px" Style="margin-left:1.5%;" ForeColor="#1fc428" AutoPostBack="True" OnSelectedIndexChanged="ddl_Students_List_SelectedIndexChanged"></asp:DropDownList>
            <asp:DropDownList ID="ddl_Students_Id_List" Visible="false" runat="server" Font-Size="21.5px" Style="margin-left:1.5%;" ForeColor="#1fc428"></asp:DropDownList>
        <br/><br/><br/><br/>

        <asp:Panel ID="pnl_Round1" runat="server" Visible="false">
            <div class="wrap-input100 validate-input" >
                <asp:Label ID="lbl_Round1_Mark" runat="server" CssClass="lbl" Text="Round 1 Mark"></asp:Label>
                <asp:TextBox ID="txt_Round1_Mark" Width="100%" Font-Size="X-Large" ForeColor="Black" Style="margin-top: 10px;" class="input100" runat="server" ToolTip="Round 1 Mark"></asp:TextBox>
                <span class="focus-input100"></span>
            </div>
            <asp:RegularExpressionValidator ID="Round1_Validator" runat="server" Display="Dynamic" CssClass="Validator" Style="margin-bottom:1em !important;" ControlToValidate="txt_Round1_Mark" ErrorMessage="Marks should only be between 1-100" ValidationExpression="^[0-9][0-9]?$|^100$"></asp:RegularExpressionValidator>
            
        </asp:Panel>

        <asp:Panel ID="pnl_Round2" runat="server" Visible="false">
            <div class="wrap-input100 validate-input" >
                <asp:Label ID="lbl_Round2_Mark" runat="server" CssClass="lbl" Text="Round 2 Mark"></asp:Label>
                <asp:TextBox ID="txt_Round2_Mark" Width="100%" Font-Size="X-Large" ForeColor="Black" Style="margin-top: 10px;" class="input100" runat="server" ToolTip="Round 2 Mark"></asp:TextBox>
                <span class="focus-input100"></span>
            </div>
            <asp:RegularExpressionValidator ID="Round2_Validator" runat="server" Display="Dynamic" CssClass="Validator" Style="margin-bottom:1em !important;" ControlToValidate="txt_Round2_Mark" ErrorMessage="Marks should only be between 1-100" ValidationExpression="^[0-9][0-9]?$|^100$"></asp:RegularExpressionValidator>
        </asp:Panel>

        <asp:Panel ID="pnl_Round3" runat="server" Visible="false">
            <div class="wrap-input100 validate-input" >
                <asp:Label ID="lbl_Round3_Mark" runat="server" CssClass="lbl" Text="Round 3 Mark"></asp:Label>
                <asp:TextBox ID="txt_Round3_Mark" Width="100%" Font-Size="X-Large" ForeColor="Black" Style="margin-top: 10px;" class="input100" runat="server" ToolTip="Round 3 Mark"></asp:TextBox>
                <span class="focus-input100"></span>
            </div>
            <asp:RegularExpressionValidator ID="Round3_Validator" runat="server" Display="Dynamic" CssClass="Validator" Style="margin-bottom:1em !important;" ControlToValidate="txt_Round3_Mark" ErrorMessage="Marks should only be between 1-100" ValidationExpression="^[0-9][0-9]?$|^100$"></asp:RegularExpressionValidator>
        </asp:Panel>
        
        <asp:Panel ID="pnl_Round4" runat="server" Visible="false">
            <div class="wrap-input100 validate-input" >
                <asp:Label ID="lbl_Round4_Mark" runat="server" CssClass="lbl" Text="Round 4 Mark"></asp:Label>
                <asp:TextBox ID="txt_Round4_Mark" Width="100%" Font-Size="X-Large" ForeColor="Black" Style="margin-top: 10px;" class="input100" runat="server" ToolTip="Round 4 Mark"></asp:TextBox>
                <span class="focus-input100"></span>
            </div>
            <asp:RegularExpressionValidator ID="Round4_Validator" runat="server" Display="Dynamic" CssClass="Validator" Style="margin-bottom:1em !important;" ControlToValidate="txt_Round4_Mark" ErrorMessage="Marks should only be between 1-100" ValidationExpression="^[0-9][0-9]?$|^100$"></asp:RegularExpressionValidator>
        </asp:Panel>

        <br/>
        <div class="container-login100-form-btn">
            <div class="wrap-login100-form-btn">
                <asp:Button ID="btn_Submit" runat="server" Visible="false" class="login100-form-btn" Text="Save Marks" OnClick="btn_Submit_Click"  />
            </div>
        </div>
       </center>
    </div>
</asp:Content>
