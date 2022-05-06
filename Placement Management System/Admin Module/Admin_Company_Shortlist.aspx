<%@ Page Title="Company Shortlist" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin_Company_Shortlist.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Company_Shortlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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

        .gridviewRow td{
            font-family: Montserrat !important;
            font-size: 22px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <center>
     <%--Technology--%>
        <asp:Label ID="lbl_Select_Technology" runat="server" Style="font-size: 18px; margin-left: 0%;  font-family: Montserrat !important;" CssClass=".lbl" Text="Technology : "></asp:Label>
        <asp:DropDownList ID="ddl_Technology_Name" runat="server" Font-Size="18px" ForeColor="#1fc428" AutoPostBack="true" OnSelectedIndexChanged="ddl_Technology_Name_SelectedIndexChanged1" AppendDataBoundItems="true">
            
        </asp:DropDownList>

        <%--City--%>
        <asp:Label ID="lbl_Select_City" runat="server" Style="font-size: 18px; margin-left: 10%; font-family: Montserrat !important;" CssClass=".lbl" Text="City : " Visible="true"></asp:Label>
        <asp:DropDownList ID="ddl_City" runat="server" Font-Size="18px" ForeColor="#1fc428" AutoPostBack="true" Visible="true" OnSelectedIndexChanged="ddl_City_SelectedIndexChanged" AppendDataBoundItems="true">
            
        </asp:DropDownList>

        <%--Stipend--%>
        <asp:Label ID="lbl_Select_Sipend" runat="server" Style="font-size: 18px; margin-left: 10%; font-family: Montserrat !important;" CssClass=".lbl" Text="Stipend Range : " Visible="true"></asp:Label>
        <asp:DropDownList ID="ddl_Stipend" runat="server" Font-Size="18px" ForeColor="#1fc428" AutoPostBack="true" Visible="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_Stipend_SelectedIndexChanged1">
            
        </asp:DropDownList>
        <br/><br/><br/>
        <%--Package--%>
        <asp:Label ID="lbl_Select_Package" runat="server" Style="font-size: 18px; font-family: Montserrat !important;" CssClass=".lbl" Text="Package Range : " Visible="true"></asp:Label>
        <asp:DropDownList ID="ddl_Package" runat="server" Font-Size="18px" Style="margin-right: 5%;" ForeColor="#1fc428" AutoPostBack="true"  Visible="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_Package_SelectedIndexChanged">
            
        </asp:DropDownList>

        <%--Tenure--%>
        <asp:Label ID="lbl_Select_Tenure" runat="server" Style="font-size: 18px; margin-left: 7%; font-family: Montserrat !important;" CssClass=".lbl" Text="Tenure : " Visible="true"></asp:Label>
        <asp:DropDownList ID="ddl_Tenure" runat="server" Font-Size="18px" ForeColor="#1fc428" AutoPostBack="true" Visible="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_Tenure_SelectedIndexChanged">
            
        </asp:DropDownList>
     </center>

    <br />
    <br />  
    <br />
    <center>
        <asp:Label ID="lbl_No_Record" runat="server" Font-Size="XX-Large" Style="font-family:MontSerrat;" ForeColor="Red" Visible="false"></asp:Label>
        <asp:GridView ID="gv_Company_List" runat="server" BackColor="White" BorderColor="#242c42" BorderStyle="Solid" BorderWidth="4px" Width="90%" GridLines="Both" >
     
        <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>        

         <HeaderStyle BackColor="#242c42" Wrap="false" ForeColor="White" CssClass="gridviewHeader" HorizontalAlign="Center" Height="60px" VerticalAlign="Middle" ></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

        <RowStyle BackColor="#EEEEEE" Wrap="false" ForeColor="Black" CssClass="gridviewRow" Height="50px" ></RowStyle>

        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
    </asp:GridView>
    <br />
    <br />
    <br />
 
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <asp:Button ID="btn_Download_PDF" runat="server" class="login100-form-btn" Text="Download Short-List" OnClick="btn_Download_PDF_Click"></asp:Button>
        
    </div>
    </div>
        </center>
    <br />
    <br />
    <center>
        <span style="font-size:medium; font-weight:600;">NOTE :- </span>
        <asp:Label ID="lbl_Message" runat="server"  Text="Company's Under BlackList Can't Participate In Short-List.!" Font-Size="Medium" ForeColor="Red"></asp:Label>
    </center>
</asp:Content>
