<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin_Company_ViewProfile.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Company_ViewProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Company's</title>
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
            font-family: Montserrat;
            font-size: 17px;
            line-height: 1.5;
            color: #fff;
            width: auto;
            height: auto;
            border-radius: 10px;
            background: #57b846;
            display: flex;
            justify-content: center;
            margin-top: 10px;
            margin-bottom:10px;
            padding: 10px;
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
            width: 30% !important;
        }

        .datalistRow {
            font-family: Montserrat !important;
            font-size: 20px;
            text-align: center !important;
            height: 100%;
            width: auto;
            border: 2px solid black;
            padding: 25px;
            margin: 30px;
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
          height:200px  !important;
          width:200px !important;
          transition: all 0.5s;
        }

        .datalistRow th {
            width:50% !important;
            text-align: left;
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
        <br/>
        <div class="wrap-input100 validate-input" >
            <asp:TextBox ID="txt_Search_Query" runat="server" AutoPostBack="true" placeholder="Search Company" OnTextChanged="txt_Search_Query_TextChanged" Font-Size="X-Large" ForeColor="Black" Style="margin-top: 10px;" class="input100" ToolTip="Enter Company Name"></asp:TextBox>
            <span class="focus-input100"></span>
        </div>
        <br/>
        <asp:DataList ID="DataList_Company_Details" runat="server"  DataKeyField="Company_Id" EnableViewState="true" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" RepeatColumns="2" OnItemCommand="DataList_Company_Details_ItemCommand"  >
            <ItemTemplate>
                <div class="datalistRow" >
                    <asp:Image ID="Company_Logo_Img"  Height="150px" Width="150px" CssClass="LogoImg" ImageAlign="Middle" ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Company_Logo")) %>' runat="server"></asp:Image><br/>                
                    <table style="border:3px solid black;width:100%;">
                        <tr>
                            <td>Company Name:</td>
                            <th>
                                <asp:Label Text='<%# Eval("Company_Id") %>' runat="server" Visible="false" id="Company_IdLabel"/>
                                <asp:Label Text='<%# Eval("Company_Name") %>' runat="server" id="Company_NameLabel"/>
                            </th>
                        </tr>
                        <tr>
                            <td>Email Id:</td>
                            <th>
                                 <asp:Label Text='<%# Eval("Company_Email_Id") %>' runat="server" id="Company_Email_IdLabel"/>
                            </th>
                        </tr>
                        <tr>
                            <td>Contact No:</td>
                            <th>
                                <asp:Label Text='<%# Eval("Company_Contact_No") %>' runat="server" id="Company_Contact_NoLabel"/>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                    <asp:Button ID="btn_Update_Profile" CommandName="Update Profile" CssClass="btn-Password" runat="server" Style="margin-right:2%;display:inline-block" Text="Update Profile"  ></asp:Button>
                                    <asp:Button ID="btn_Delete_Profile" OnClientClick="return ConfirmOnDelete();" CommandName="Delete Profile" CssClass="btn-Password" runat="server" Style="margin-left:2%; display:inline-block" Text="Delete Profile"  ></asp:Button>                                
                                </center>
                             </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>   
            
</asp:DataList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Company_Id], [Company_Name], [Company_Logo], [Company_Email_Id], [Company_Contact_No] FROM [tbl_Company_Basic_Details]"></asp:SqlDataSource>
</center>

    <script type="text/javascript">
        function ConfirmOnDelete()
        {
          if (confirm("Are You Sure You Want To Delete Company Details?")==true)
            return true;
          else
            return false;
        }
    </script>
</asp:Content>
