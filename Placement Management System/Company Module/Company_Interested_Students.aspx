<%@ Page Title="Interested Students" Language="C#" MasterPageFile="~/Company Module/Company_MasterPage.Master" AutoEventWireup="true" CodeBehind="Company_Interested_Students.aspx.cs" Inherits="Placement_Management_System.Company_Module.Company_Interested_Students" %>
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
            font-size: 16px;
            text-align: center !important;
            height: 25.5em !important;
            width: auto;
            border: 2px solid black;
            padding: 25px;
            margin: 40px;
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
            /*width:55% !important;*/
            text-align: left;
            padding: 5px;
            border: 1px solid black;
            color: #242c42;
        }

        .datalistRow td {
            /*width:45% !important;*/
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
        <asp:Label ID="lbl_No_Record" runat="server" Font-Size="XX-Large" Style="font-family:MontSerrat;" Text="Students Have Not Yet Selected Companies.!" ForeColor="Red"></asp:Label>
    </asp:Panel>
    <asp:DataList ID="DataList_Student_Details" runat="server" DataKeyField="Student_Id" EnableViewState="false" RepeatDirection="Horizontal" RepeatColumns="2"  >
    <ItemTemplate>
        <div class="datalistRow" >
            <asp:Image ID="Student_Img"  Height="120px" Width="120px" CssClass="LogoImg" ImageAlign="Middle" ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Student_Photo")) %>' runat="server"></asp:Image><br/>                
            <table style="border:2px solid black;width:100%;">
                <tr>
                    <td>Student Name :</td>
                    <th>
                        <asp:Label Text='<%# Eval("Student_Name") %>' runat="server" id="Student_NameLabel"/>
                    </th>
                </tr>
                <tr>
                    <td>Student Id :</td>
                    <th>
                        <asp:Label Text='<%# Eval("Student_Id") %>' runat="server"  id="Student_Idlbl"/>
                    </th>
                </tr>
                <tr>
                    <td>Phone No :</td>
                    <th>
                            <asp:Label Text='<%# Eval("Student_Phone_No") %>' runat="server" id="Stipend_Label"/>
                    </th>
                </tr>
                <tr>
                    <td>Email Id :</td>
                    <th>
                        <asp:Label Text='<%# Eval("Student_Email_Id") %>' runat="server" id="Package_Label"/>
                    </th>
                </tr>
                <tr>
                    <td>Under Graduation :</td>
                    <th>
                        <asp:Label Text='<%# Eval("Student_UG_Course") %>' runat="server" id="Label1"/>
                    </th>
                </tr>
                <tr>
                    <td>Post Graduation:</td>
                    <th>
                        <asp:Label Text='<%# Eval("Student_PG_Course") %>' runat="server" id="Tenure_Label1"/>
                    </th>
                </tr>
            </table>
        </div>
    </ItemTemplate>   
            
</asp:DataList>
        </center>

<%--    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT tbl_Student_Basic_Details.Student_Photo, tbl_Student_Basic_Details.Student_Id, tbl_Student_Basic_Details.Student_Name, tbl_Student_Basic_Details.Student_Phone_No, tbl_Student_Basic_Details.Student_Email_Id, tbl_Student_Basic_Details.Student_UG_Course, tbl_Student_Basic_Details.Student_PG_Course FROM tbl_Company_Basic_Details INNER JOIN tbl_Interested_Student ON tbl_Company_Basic_Details.Company_Id = tbl_Interested_Student.Company_Id INNER JOIN tbl_Student_Basic_Details ON tbl_Interested_Student.Student_Id = tbl_Student_Basic_Details.Student_Id WHERE (tbl_Company_Basic_Details.Company_Id = @Company_Id)">
    <SelectParameters>
        <asp:SessionParameter Name="Company_Id" SessionField="Company_Id" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>--%>
</asp:Content>