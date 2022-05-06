<%@ Page Title="Report Analysis" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin_Report_Analysis.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Report_Analysis" %>
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
            width:100px;
            font-family: Montserrat !important;
            font-size: 22px;
            text-align: center !important;
        }
        .gridviewHeader th {
            width:100px;
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
        <asp:Label ID="lbl_Select" runat="server" Style="font-size: 18px; margin-left: 0%;  font-family: Montserrat !important;" CssClass=".lbl" Text="Select Report : "></asp:Label>
        <asp:DropDownList ID="ddl_Report_List" runat="server" Font-Size="18px" ForeColor="#1fc428" AutoPostBack="true"  AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_Report_List_SelectedIndexChanged" >
            <asp:ListItem>Current Year Statistics of Each Company</asp:ListItem>
            <asp:ListItem>Previous Years Statistics of Each Company</asp:ListItem>
            <asp:ListItem>Total Recruited Students By Each Company Uptill Now</asp:ListItem>
            <asp:ListItem>Previous Year's Highest Package Offered</asp:ListItem>        
            <asp:ListItem>Previous Year's Highest Stipend Offered</asp:ListItem> 
            <asp:ListItem>Current Year Attendance Report of Each Company</asp:ListItem>
            <asp:ListItem>Year Wise Reports of Individual Company's</asp:ListItem>
            <asp:ListItem>Total Number of Time Company's Visited Institute</asp:ListItem>
            <asp:ListItem>Student-Company Ratio Of Each Year</asp:ListItem>
        </asp:DropDownList>
        <asp:Panel ID="pnl_Select" Visible="false" runat="server">
            <br/><br/><br/>
            <asp:Label ID="lbl_Select_Company" runat="server" Style="font-size: 18px; margin-left: 0%;  font-family: Montserrat !important;" CssClass=".lbl" Text="Select Company : "></asp:Label>
            <asp:DropDownList ID="ddl_Company_List" runat="server" AutoPostBack="True" AppendDataBoundItems="true" Font-Size="18px" ForeColor="#1fc428" DataSourceID="SqlDataSource2" DataTextField="Company_Name" DataValueField="Company_Name" OnSelectedIndexChanged="ddl_Company_List_SelectedIndexChanged"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT tbl_Company_Basic_Details.Company_Name FROM tbl_Company_Basic_Details INNER JOIN tbl_Company_Past_Records ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Past_Records.Company_Id"></asp:SqlDataSource>

            <asp:Label ID="lbl_Select_Year" runat="server" Style="font-size: 18px;margin-left: 5%;  font-family: Montserrat !important;" CssClass=".lbl" Text="Select Year : "></asp:Label>
            <asp:DropDownList ID="ddl_Year_List" runat="server" AutoPostBack="True" Font-Size="18px" AppendDataBoundItems="true" ForeColor="#1fc428" DataSourceID="SqlDataSource3" DataTextField="Updation_Year" DataValueField="Updation_Year" OnSelectedIndexChanged="ddl_Year_List_SelectedIndexChanged"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [Updation_Year] FROM [tbl_Company_Past_Records] ORDER BY [Updation_Year] DESC"></asp:SqlDataSource>
        </asp:Panel>
    </center>

    <br />
    <br />  
    <br />
    <center>
        <asp:Label ID="lbl_No_Record" runat="server" Font-Size="XX-Large" Style="font-family:MontSerrat;" ForeColor="Red" Visible="false" Text="No Record Found"></asp:Label>
        <asp:GridView ID="gv_Report" runat="server" Visible="false" EnableViewState="false" BackColor="White" AutoGenerateColumns="true" BorderColor="#242c42" BorderStyle="Solid" BorderWidth="4px" Width="90%" GridLines="Both" >
     
        <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>        

         <HeaderStyle BackColor="#242c42" ForeColor="White" CssClass="gridviewHeader" HorizontalAlign="Center" Height="60px" VerticalAlign="Middle" ></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

        <RowStyle BackColor="#EEEEEE" Wrap="false" ForeColor="Black" CssClass="gridviewRow" Height="50px" ></RowStyle>

        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
        </asp:GridView>
    <br />
    <br />
    </center>
</asp:Content>
