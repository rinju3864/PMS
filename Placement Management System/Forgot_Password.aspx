<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="~/Company Module/Forgot_Password.aspx.cs" Inherits="Placement_Management_System.Company_Module.Company_Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company Forgot Password</title>
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
        .otp_timer {
            margin-left: 43%;
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
            <div class="wrap-login100" style="padding-top: 100px; padding-bottom: 100px;">
                <div style="border: '0px black solid';">
                    <img src="../Login_Template/images/Logo.png" height="300px" width="350px" alt="IMG" style="border-radius: 50%; margin-top: -30px !important;">
                </div>

                <form id="form1" runat="server" class="login100-form validate-form">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <span class="login100-form-title">Forgot Password
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                        <asp:TextBox class="input100" ID="txt_Email" runat="server" placeholder="Email Id" ToolTip="Email Id must be of proper format : abc@gmail.com"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>

                    </div>
                    <center>
                        <asp:RegularExpressionValidator ID="Email_Validator" runat="server" ErrorMessage="Please Enter Valid Email Id" ControlToValidate="txt_Email" ValidationExpression="[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" Display="Dynamic" Font-Size="Medium" Font-Underline="False" ForeColor="Red"></asp:RegularExpressionValidator>
                        </center>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <asp:TextBox class="input100" ID="txt_OTP" TextMode="Password" Visible="false" runat="server" ToolTip="Password should be 8-16 characters long.Atleast one Uppercase letter,one lowercase letter,one special character,one digit." placeholder="OTP"></asp:TextBox>

                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <asp:Panel ID="pnl_Icon" Visible="false" runat="server"><i class="fa fa-lock" aria-hidden="true"></i></asp:Panel>
                        </span>


                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" Visible="false" UpdateMode="Conditional"
                        ViewStateMode="Enabled">
                        <ContentTemplate>
                            <asp:Label ID="lbl_OTP_Timer" runat="server" Font-Size="15pt" CssClass="otp_timer"></asp:Label>

                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000" Enabled="false" OnTick="Timer1_Tick">
                    </asp:Timer>

                    <div class="container-login100-form-btn">
                        <asp:Button ID="btn_GenerateOTP" runat="server" Text="Generate OTP" class="login100-form-btn" OnClick="btn_GenerateOTP_Click" />


                    </div>
                    <div class="container-login100-form-btn">
                        <asp:Button ID="btn_Submit" runat="server" Visible="false" Text="Submit" class="login100-form-btn" OnClick="btn_Submit_Click" />

                    </div>
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
