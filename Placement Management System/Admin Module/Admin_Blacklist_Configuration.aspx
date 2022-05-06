<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin_Blacklist_Configuration.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Blacklist_Configuration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Blacklist Configuration</title>
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

        .gridviewRow {
            font-family: Montserrat !important;
            font-size: 25px;
            text-align: center !important;
        } 

        .Center {
            text-align: center !important;
        }

        .rbl input[type="radio"] {
            margin-left: 30px;
            
        }
        .CompanyListHide {
            display:none !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:GridView ID="GridView1" Style="margin-top:5%;" runat="server" AutoGenerateColumns="False" DataKeyNames="Company_Id" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#242c42" BorderStyle="Solid" BorderWidth="4px"  GridLines="Both" Font-Size="X-Large" Width="70%"  >
        <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Company_Id" HeaderText="Company Id" ReadOnly="True" HeaderStyle-CssClass="CompanyListHide" ItemStyle-CssClass="CompanyListHide"   SortExpression="Company_Id" ></asp:BoundField>
            <asp:BoundField DataField="Company_Name" HeaderText="Company Name" SortExpression="Company_Name" HeaderStyle-CssClass="Center"></asp:BoundField>
            
            <asp:TemplateField HeaderText="Black Listed" >
                <HeaderStyle Width="50%" CssClass="Center" />
                <ItemStyle Wrap="false" HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:RadioButtonList ID="rbl_Status"  runat="server" CssClass="rbl" SelectedValue='<%# Bind("Company_BlackList_Status") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    <HeaderStyle BackColor="#242c42" CssClass="gridviewRow" ForeColor="White"  Height="60" Font-Size="Larger" ></HeaderStyle>

    <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

    <RowStyle BackColor="#EEEEEE" ForeColor="Black" CssClass="gridviewRow" Height="80px" ></RowStyle>

    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

    </asp:GridView>
        </center>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT tbl_Company_Basic_Details.Company_Id, tbl_Company_Basic_Details.Company_Name, tbl_Company_Blacklist_Status.Company_BlackList_Status FROM tbl_Company_Basic_Details INNER JOIN tbl_Company_Blacklist_Status ON tbl_Company_Basic_Details.Company_Id = tbl_Company_Blacklist_Status.Company_Id"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <asp:Button ID="btn_Submit" runat="server" class="login100-form-btn" Text="Submit" OnClick="btn_Submit_Click" />
        </div>
    </div>
    <br/><br/><br/>
</asp:Content>
