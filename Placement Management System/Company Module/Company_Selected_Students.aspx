<%@ Page Title="Selected Students" Language="C#" MasterPageFile="~/Company Module/Company_MasterPage.Master" AutoEventWireup="true" CodeBehind="Company_Selected_Students.aspx.cs" Inherits="Placement_Management_System.Company_Module.Company_Selected_Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
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

        .gridviewRow {
            font-family: Montserrat !important;
            font-size: 23px;
            text-align: center !important;
        }

        .Center {
            text-align: center !important;
        }

        .rbl input[type="radio"] {
            margin-left: 30px;
        }
        .datalistRow {
            font-family: Montserrat !important;
            font-size: 20px;
            text-align: center !important;
            height: 100%;
            width: auto;
            border: 2px solid black;
            padding: 25px;
            margin: 50px;
            border-radius: 30px;
            box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
        }

        .LogoImg {
            border-radius: 50%;
            box-shadow: 2px 8px 7px #2a3547;
            margin-bottom: 20px;
            transition: all 0.5s;
        }
        .LogoImg:hover
        {
          cursor:zoom-in;
          height:150px  !important;
          width:150px !important;
          transition: all 0.5s;
        }

        .datalistRow th {
            width:50% !important;
            text-align: center;
            padding: 5px;
            border: 1px solid black;
            color: #242c42;
        }

        .datalistRow td {
            width:50% !important;
            text-align: left;
            padding: 5px;
            border: 1px solid black;
            color: #242c42;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:Panel ID="pnl_Message" Visible="false" runat="server" Style="margin-top:20% !important;">
        <asp:Label ID="lbl_No_Record" runat="server" Font-Size="XX-Large" Style="font-family:MontSerrat;" Text="No Students Are Selected Yet." ForeColor="Red"></asp:Label>
    </asp:Panel>
    <asp:DataList ID="DataList_Student_Details" runat="server" DataKeyField="Student_Id"  RepeatDirection="Horizontal" RepeatColumns="2"  >
    <ItemTemplate>
        <div class="datalistRow" >
            <asp:Image ID="Student_Img"  Height="120px" Width="120px" CssClass="LogoImg" ImageAlign="Middle" ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Student_Photo")) %>' runat="server"></asp:Image><br/>                
            <table style="border:3px solid black;width:100%;">
                <tr>
                    <td>Student Name:</td>
                    <th>
                        <asp:Label Text='<%# Eval("Student_Name") %>' runat="server" id="Student_NameLabel"/>
                    </th>
                </tr>
                <tr>
                    <td>Student Id:</td>
                    <th>
                        <asp:Label Text='<%# Eval("Student_Id") %>' runat="server"  id="Student_Idlbl"/>
                    </th>
                </tr>
                <tr>
                    <td>Stipend:</td>
                    <th>
                            <asp:Label Text='<%# Eval("Final_Stipend")+" /-" %>' runat="server" id="Stipend_Label"/>
                    </th>
                </tr>
                <tr>
                    <td>Package:</td>
                    <th>
                        <asp:Label Text='<%# Eval("Final_Package")+" /-" %>' runat="server" id="Package_Label"/>
                    </th>
                </tr>
                <tr>
                    <td>Tenure:</td>
                    <th>
                        <asp:Label Text='<%# Eval("Final_Tenure") + " Year" %>' runat="server" id="Tenure_Label1"/>
                    </th>
                </tr>
            </table>
        </div>
    </ItemTemplate>   
            
</asp:DataList>
        </center>

<%--    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT tbl_Student_Basic_Details.Student_Photo,tbl_Student_Basic_Details.Student_Id, tbl_Student_Basic_Details.Student_Name, tbl_Interview_Results.Final_Stipend ,tbl_Interview_Results.Final_Package,tbl_Interview_Results.Final_Tenure FROM tbl_Student_Basic_Details INNER JOIN tbl_Interview_Results ON tbl_Student_Basic_Details.Student_Id = tbl_Interview_Results.Student_Id WHERE ([Company_Id] = @Company_Id) and Status='Select'">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbl_Company_Id" PropertyName="Text" Name="Company_Id" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>--%>
</asp:Content>
