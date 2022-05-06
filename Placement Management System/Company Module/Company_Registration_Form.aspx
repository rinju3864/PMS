<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Company_Registration_Form.aspx.cs" Inherits="Placement_Management_System_Final.Registration_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company Registration Form</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Registration_Template/vendor/bootstrap/css/bootstrap.min.css">
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
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Registration_Template/css/util.css">
    <link rel="stylesheet" type="text/css" href="../Registration_Template/css/main.css">

    <style>
        .RegExp_Css {
            align-content: center !important;
            margin-top: 50px !important;
        }

        .no-js #loader {
            display: none;
        }

        .js #loader {
            display: block;
            position: absolute;
            left: 100px;
            top: 0;
        }

        .se-pre-con {
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background: url("../Dashboard Template/images/loader-64x/Preloader_2.gif") center no-repeat #fff;
        }
    </style>
    <%-- Page Loader GIF --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"></script>
    <script>
        $(window).load(function () {
            $(".se-pre-con").fadeOut("50000");

        });
    </script>
</head>
<body>
    <div class="se-pre-con"></div>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <span class="login100-form-avatar">
                    <img src="../Registration_Template/images/logo.png" alt="Img Not Found">
                </span>
                <span class="login100-form-title">Registration Form
                </span>

                <form id="form1" runat="server" class="login100-form validate-form" autocomplete="off">

                    <div class="wrap-input100 validate-input" data-validate="Company Name is Required">
                        <asp:TextBox ID="txt_Company_Name" Width="100%" placeholder="Company Name" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <center>
                    <asp:RegularExpressionValidator  ID="Name_Validator" runat="server" ErrorMessage="Please Enter Valid Name" ControlToValidate="txt_Company_Name" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-z A-Z]+$"></asp:RegularExpressionValidator>
                        </center>

                    <div class="wrap-input100 validate-input" data-validate="Email ID is Required">
                        <asp:TextBox ID="txt_Email_Id" Width="100%" ToolTip="Email Id must be of proper format: abc@gmail.com" placeholder="Company Email ID" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>
                    <center>
                    <asp:RegularExpressionValidator ID="Email_Validator" runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="txt_Email_Id" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"></asp:RegularExpressionValidator>
                    </center>

                    <div class="wrap-input100 validate-input" data-validate="Contact Number is Required">
                        <asp:TextBox ID="txt_Contact_Number" ToolTip="Contact No. must be of proper format: 9512136600" Width="100%" placeholder="Contact No." class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>
                    <center>
                       <asp:RegularExpressionValidator ID="Contact_Validator" runat="server" ErrorMessage="Please Enter Valid Contact Number" ControlToValidate="txt_Contact_Number" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                    </center>

                    <%--<div class="wrap-input100 validate-input" data-validate="State is Required">
                        <asp:TextBox ID="txt_State" Width="100%" placeholder="State" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>
                    <center>
                           <asp:RegularExpressionValidator ID="State_Validator" runat="server" ErrorMessage="Please Enter Valid State" ControlToValidate="txt_State" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-z A-Z]+$"></asp:RegularExpressionValidator>
                    </center>--%>

                    <div class="wrap-input100 validate-input" data-validate="State is Required">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_State" runat="server" Text="State : " ForeColor="#6e7480"></asp:Label>
                                </td>
                                <td style="width: 60%">

                                    <asp:DropDownList ID="ddl_State" runat="server" AutoPostBack="True" Height="30" Width="150" Style="border: 0px !important" OnSelectedIndexChanged="ddl_State_SelectedIndexChanged">
                                        <asp:ListItem>Gujarat</asp:ListItem>
                                        <asp:ListItem>Maharashtra</asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="City is Required">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_City" runat="server" Text="City : " ForeColor="#6e7480"></asp:Label>
                                </td>
                                <td style="width: 60%">

                                    <asp:DropDownList ID="ddl_City" runat="server" Height="30" Width="150" Style="border: 0px !important">
                                    </asp:DropDownList>

                                </td>
                            </tr>
                        </table>
                    </div>

                    <%--<div class="wrap-input100 validate-input" data-validate="City is Required">
                        <asp:TextBox ID="txt_City" Width="100%" placeholder="City" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>
                    <center>
                         <asp:RegularExpressionValidator ID="City_Validator" runat="server" ErrorMessage="Please Enter Valid City" ControlToValidate="txt_City" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-z A-Z]+$"></asp:RegularExpressionValidator>
                    </center>--%>


                    <div class="wrap-input100 validate-input" data-validate="Address is Required">
                        <asp:TextBox ID="txt_Address" Width="100%" placeholder="Address" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Representative Name is Required">
                        <asp:TextBox ID="txt_Representative_Name_1" Width="100%" placeholder="1st Representative Name" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <center>
                      <asp:RegularExpressionValidator ID="Representative_Validator" runat="server" ErrorMessage="Please Enter Valid Representative Name 1" ControlToValidate="txt_Representative_Name_1" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-z A-Z]+$"></asp:RegularExpressionValidator>
                    </center>

                    <div class="wrap-input100">
                        <asp:TextBox ID="txt_Representative_Name_2" Width="100%" placeholder="2nd Representative Name" Font-Size="13px" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>
                    <center>
                      <asp:RegularExpressionValidator ID="Representative2_Validator" runat="server" ErrorMessage="Please Enter Valid Representative Name 2" ControlToValidate="txt_Representative_Name_2" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-z A-Z]+"></asp:RegularExpressionValidator>
                    </center>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <asp:TextBox ID="txt_Pass" class="input100" Width="100%" placeholder="Password" autocomplete="off" TextMode="Password" runat="server"
                            ToolTip="Password must be between 8-16 characters, at least one uppercase letter, one lowercase letter, one number and one special character."></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <center>
                         <asp:RegularExpressionValidator ID="Password_Validator" runat="server" ErrorMessage="Please Enter Valid Password" ControlToValidate="txt_Pass" Display="Dynamic" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$"></asp:RegularExpressionValidator>
                    </center>

                    <div class="wrap-input100 validate-input" data-validate="Website Name  is Required">
                        <asp:TextBox ID="txt_Website_Name" Width="100%" placeholder="Company's Website URL" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <center>
                      <asp:RegularExpressionValidator ID="URL_Validator" runat="server" ErrorMessage="Please Enter Valid Website URL" ControlToValidate="txt_Website_Name" Display="Dynamic" ForeColor="Red" ValidationExpression="^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$"></asp:RegularExpressionValidator>
                    </center>

                    <div class="wrap-input100">
                        <table>
                            <tr>
                                <td style="width: 30%">
                                    <asp:Label ID="txt_logo_Name" runat="server" Width="100%" Text="Website Logo" ForeColor="#999999"></asp:Label></td>
                                <td style="width: 70%;">
                                    <br />
                                    <asp:FileUpload ID="fu_Company_Logo" Width="100%" class="input100" runat="server" ToolTip="Image Type Should only be .jpg" /></td>
                            </tr>
                        </table>
                        <span class="focus-input100"></span>
                    </div>


                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">

                            <asp:Button ID="btn_Submit" runat="server" class="login100-form-btn" Text="Submit" OnClick="btn_Submit_Click" />
                        </div>
                    </div>
                </form>

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

    <script language="JavaScript"> 

        var message = 'Right Click Is Disabled';
        function clickIE() { if (event.button == 2) { alert(message); return false; } }
        function clickNS(e) {
            if (document.layers || (document.getElementById && !document.all)) {
                if (e.which == 2 || e.which == 3) { alert(message); return false; }
            }
        }
        if (document.layers) { document.captureEvents(Event.MOUSEDOWN); document.onmousedown = clickNS; }
        else if (document.all && !document.getElementById) { document.onmousedown = clickIE; }
        document.oncontextmenu = new Function('alert(message);return false')

        window.onload = function () {
            document.addEventListener("contextmenu", function (e) {
                e.preventDefault();
            }, false);
            document.addEventListener("keydown", function (e) {
                //document.onkeydown = function(e) {
                // "I" key
                if (e.ctrlKey && e.shiftKey && e.keyCode == 73) {
                    disabledEvent(e);
                }
                // "J" key
                if (e.ctrlKey && e.shiftKey && e.keyCode == 74) {
                    disabledEvent(e);
                }
                // "S" key + macOS
                if (e.keyCode == 83 && (navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey)) {
                    disabledEvent(e);
                }
                // "U" key
                if (e.ctrlKey && e.keyCode == 85) {
                    disabledEvent(e);
                }
                // "F12" key
                if (event.keyCode == 123) {
                    disabledEvent(e);
                }
            }, false);
            function disabledEvent(e) {
                if (e.stopPropagation) {
                    e.stopPropagation();
                } else if (window.event) {
                    window.event.cancelBubble = true;
                }
                e.preventDefault();
                return false;
            }
        };
    </script>
</body>
</html>
