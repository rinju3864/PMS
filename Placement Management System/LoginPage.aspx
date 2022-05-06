<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="LoginPage.aspx.cs" Inherits="Placement_Management_System.Company_Module.Company_LoginPage" %>

<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Login_Template/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Login_Template/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Login_Template/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Login_Template/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Login_Template/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Login_Template/css/util.css">
    <link rel="stylesheet" type="text/css" href="../Login_Template/css/main.css">
    <!--===============================================================================================-->

    <style>
        .Dropdownlist_Css {
            border: 0px !important;
            border-bottom: 2px solid black;
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
            $(".se-pre-con").fadeOut("slow");

        });
    </script>
</head>
<body>
    <div class="se-pre-con"></div>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div style="border: '0px black solid';">
                    <img src="../Login_Template/images/Logo.png" height="300px" width="320px" alt="IMG" style="border-radius: 50%">
                </div>

                <form id="form1" runat="server" class="login100-form validate-form">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                    <span class="login100-form-title">
                        <i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;Member Login
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Valid Email Id is Required: abc@gmail.com">
                        <asp:TextBox class="input100" ID="txt_EmailId" runat="server" placeholder="Email Id"
                            ToolTip="Email Id must be of proper format: abc@gmail.com"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>
                    <center><asp:RegularExpressionValidator CssClass="Regx_txt" ID="Regx_txt_EmailId" runat="server" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
                        ErrorMessage="Please Enter Valid Email Id" ControlToValidate="txt_EmailId" Display="Dynamic"></asp:RegularExpressionValidator>
                       </center>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <asp:TextBox class="input100" ID="txt_Password" runat="server" placeholder="Password" TextMode="Password"
                            ToolTip="Password must be between 8-16 characters, at least one uppercase letter, one lowercase letter, one number and one special character."></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>
                    <center><asp:RegularExpressionValidator CssClass="Regx_txt" ID="Regx_txt_Password" runat="server" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$"
                        ErrorMessage="Please Enter Valid Password" ControlToValidate="txt_Password" Display="Dynamic"></asp:RegularExpressionValidator>
                       </center>

                    <div style="padding: 10px 0px 10px 0px">
                        <center>
                            <span>Remember Me&nbsp;</span>
                            <asp:CheckBox ID="cbx_Remember_Me"  runat="server" OnCheckedChanged="cbx_Remember_Me_CheckedChanged"/>
                        </center>
                    </div>

                    <div class="container-login100-form-btn">
                        <asp:Button ID="btn_Login" runat="server" Text="Login" class="login100-form-btn" OnClick="btn_Login_Click" />
                    </div>

                    <div class="text-center p-t-12">
                        <a class="txt2" href="Forgot_Password.aspx" style="font-size: medium;">Forgot Password?
                        </a>
                    </div>

                    <div class="text-center p-t-136">
                        <a class="txt2" href="/Company Module/Company_Registration_Form.aspx" style="font-size: medium;">Create New Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--===============================================================================================-->
    <script src="../Login_Template/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Login_Template/vendor/bootstrap/js/popper.js"></script>
    <script src="../Login_Template/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Login_Template/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Login_Template/js/main.js"></script>

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
