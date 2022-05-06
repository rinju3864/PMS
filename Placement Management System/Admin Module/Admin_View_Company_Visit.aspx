<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin_View_Company_Visit.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_View_Company_Visit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Company's Visit List</title>
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
            margin-bottom: 10px;
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
            height: 100%;
            width: 70%;
            border: 2px solid black;
            padding: 25px;
            margin: 30px auto 30px auto;
            border-radius: 30px;
            box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
        }

        .datalistRow th {
            width: 70% !important;
            text-align: left;
            padding: 5px;
            border: 1px solid black;
            color: #242c42;
        }

        .datalistRow td {
            width: 30% !important;
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
        <asp:DataList ID="DataList_Company_Details" runat="server"  DataKeyField="Visit_Id" EnableViewState="true" RepeatDirection="Horizontal" RepeatColumns="1" OnItemCommand="DataList_Company_Details_ItemCommand"  >
            <ItemTemplate>
                <div class="datalistRow" >
                    <table style="border:3px solid black;width:100%;">
                        <tr>
                            <td>Company Name:</td>
                            <th>
                                <asp:Label Text='<%# Eval("Visit_Id") %>' runat="server" id="Visit_IdLabel" Visible="false"/> 
                                <asp:Label Text='<%# Eval("Company_Name") %>' runat="server" id="Company_NameLabel"/>
                            </th>
                        </tr>
                        <tr>
                            <td>Visit Team Members:</td>
                            <th>
                                 <asp:Label Text='<%# Eval("Visit_Team") %>' runat="server" id="Visit_TeamLabel"/>
                            </th>
                        </tr>
                        <tr>
                            <td>Date Of Visit:</td>
                            <th>

                                <asp:Label Text='<%# Convert.ToDateTime(Eval("Date_Of_Visit")).ToString("dd/MM/yyyy") %>' runat="server" ID="Date_Of_VisitLabel" />
                            </th>
                        </tr>
                        <tr>
                            <td>Person Interacted With:</td>
                            <th>
                                <asp:Label Text='<%# Eval("Person_Interacted") %>' runat="server" ID="Person_InteractedLabel" />
                            </th>
                        </tr>
                        <tr>
                            <td>Email Id:</td>
                            <th>
                                <asp:Label Text='<%# Eval("Email_Id") %>' runat="server" ID="Email_IdLabel" />
                            </th>
                        </tr>
                        <tr>
                            <td>Contact No:</td>
                            <th>
                                <asp:Label Text='<%# Eval("Contact_No") %>' runat="server" ID="Contact_NoLabel" />
                            </th>
                        </tr>
                        <tr>
                            <td>Your Experience:</td>
                            <th>
                                
                                <asp:Label Text='<%# Eval("Experience") %>' runat="server" ID="ExperienceLabel" />
                            </th>
                        </tr>
                        <tr>
                            <td>Your Findings:</td>
                            <th>
                                <asp:Label Text='<%# Eval("Findings") %>' runat="server" ID="FindingsLabel" />
                            </th>
                        </tr>
                        <tr>
                            <td>Special Remarks:</td>
                            <th>
                                <asp:Label Text='<%# Eval("Remarks") %>' runat="server" ID="RemarksLabel" />
                            </th>
                        </tr>
                        <tr>
                            <td>Is Company Recommended For Next Year Placement/Internship:</td>
                            <th>
                                <asp:Label Text='<%# Eval("Next_Year_Recommended") %>' runat="server" ID="Next_Year_RecommendedLabel" />
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                    <asp:Button ID="btn_Update_Visit" CommandName="Update Visit" CssClass="btn-Password" runat="server" Style="margin-right:2%;display:inline-block" Text="Update Company Visit"  ></asp:Button>
                                    <asp:Button ID="btn_Delete_Visit" OnClientClick="return ConfirmOnDelete();" CommandName="Delete Visit" CssClass="btn-Password" runat="server" Style="margin-left:2%; display:inline-block" Text="Delete Company Visit"  ></asp:Button>                                
                                </center>
                             </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>   
            
    </asp:DataList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' ></asp:SqlDataSource>
    <center>
        <div style="margin-top:20% !important;">
            <asp:Label ID="lbl_Message" runat="server" Style="font-family: Montserrat;" Text="" Visible="false" Font-Bold="True" ForeColor="#1F1847" Font-Size="XX-Large"></asp:Label>
        </div>
     </center>
</center>
    
    <script type="text/javascript">
        function ConfirmOnDelete() {
            if (confirm("Are You Sure You Want To Delete Company Visit Details?") == true)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
