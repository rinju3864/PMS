<%@ Page Title="" Language="C#" MasterPageFile="~/Company Module/Company_MasterPage.Master" AutoEventWireup="true" CodeBehind="Company_Update_Password.aspx.cs" Inherits="Placement_Management_System.Company_Module.Company_Update_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Company Update Password</title>
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
            font-size:1em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border: 2px solid black; box-shadow: 2px 3px 7px 8px #423811; width: 60%; background-color: #eaf7f2; border-radius: 20px; padding: 5%; margin: 15% auto 15% auto;">
       
        <center>
            <asp:Panel ID="pnl_Request_OTP" runat="server">
            <table>
                <tr>
                    <td>
                        <div class="wrap-input100 validate-input" style="width:100%;" data-validate="Company Name is Required">
                            <asp:Label ID="lbl_OTP" runat="server" CssClass="lbl" Text="Enter One Time Password"></asp:Label>
                            
                            <asp:TextBox ID="txt_OTP" Width="100%" Style="margin-top:15px;padding-left:40px;" class="input100" runat="server" ReadOnly="True" TextMode="Password"></asp:TextBox>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                            

                        </div>
                        <asp:Button ID="btn_Send_OTP" Width="100%" runat="server" class="btn-Password"  Text="Request OTP" OnClick="btn_Send_OTP_Click" />
                        <asp:Button ID="btn_Verify_OTP" Width="100%" runat="server" class="btn-Password"  Text="Verify OTP" OnClick="btn_Verify_OTP_Click" Visible="false" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnl_New_Password" runat="server" Visible="false">
            <table>
                <tr>

                    <td>
                        <div class="wrap-input100 validate-input" data-validate="Company Name is Required">
                            <asp:Label ID="lbl_New_Password" runat="server" CssClass="lbl" Text="Enter New Password"></asp:Label>
                            <asp:TextBox ID="txt_New_Password" Width="100%" class="input100" runat="server" TextMode="Password"></asp:TextBox>
                            <span class="focus-input100"></span>
                            
                        </div>
                        <center>
                        <asp:RegularExpressionValidator ID="New_Password_Validator" runat="server" ErrorMessage="Please Enter Valid Password" ControlToValidate="txt_New_Password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$" Display="Dynamic" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="Red"></asp:RegularExpressionValidator>
                     </center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="wrap-input100" data-validate="Company Name is Required">
                            <asp:Label ID="lbl_Reenter_Password" runat="server" CssClass="lbl" Text="Re-Enter Password"></asp:Label>
                            <asp:TextBox ID="txt_ReEnter_Password" Width="100%" class="input100" runat="server" TextMode="Password"></asp:TextBox>
                            <span class="focus-input100"></span>
                                                   
                        </div>
                        <center>
                        <asp:CompareValidator ID="Compare_Password_Validator" runat="server" ErrorMessage="Password doesn't match with above." ControlToCompare="txt_New_Password" ControlToValidate="txt_ReEnter_Password" Display="Dynamic" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:CompareValidator>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_Submit" Width="100%" runat="server" Text="Submit" CssClass="btn-Password" OnClick="btn_Submit_Click"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>
            </center>
    </div>
</asp:Content>
