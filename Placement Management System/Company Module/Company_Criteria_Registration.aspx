<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Company_Criteria_Registration.aspx.cs" Inherits="Placement_Management_System.Company_Criteria_Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Company Criteria Registration</title>
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
    </style>
</head>
<body>
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <span class="login100-form-avatar">
                    <img src="../Registration_Template/images/logo.png" alt="Logo Not Found">
                </span>
                <span class="login100-form-title">Fill the neccessary details to proceed to your Dashboard.
                </span>

                <form id="form1" runat="server" class="login100-form validate-form">


                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                    <div class="wrap-input100 validate-input" data-validate="Select Mode">
                        <table>
                            <tr>
                                <td style="width: 30%;">
                                    <asp:Label ID="lbl_Selection_Mode" runat="server" Text="Selection Mode"></asp:Label>
                                </td>
                                <td style="width: 55%;">
                                    <asp:RadioButtonList ID="rbl_Selection_Mode" Width="100%" runat="server" Style="margin-top: 9px;" RepeatDirection="Horizontal" TextAlign="Right" CellPadding="10" CellSpacing="10" OnSelectedIndexChanged="rbl_Selection_Mode_SelectedIndexChanged">
                                        <asp:ListItem Value="On Campus">&nbsp;&nbsp;On Campus</asp:ListItem>
                                        <asp:ListItem Value="Off Campus">&nbsp;&nbsp;Off Campus</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <center>
                    <asp:RequiredFieldValidator ID="Selection_Mode_Validator" ControlToValidate="rbl_Selection_Mode" runat="server" ErrorMessage="Selection Mode is Mandatory" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </center>


                    <div class="wrap-input100 validate-input" data-validate="Stipend is Required">
                        <asp:TextBox ID="txt_Stipend" Width="100%" placeholder="Stipend" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <center>
                    <asp:RegularExpressionValidator  ID="Stipend_Validator" runat="server" ErrorMessage="Please Enter Valid Stipend" ControlToValidate="txt_Stipend" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9.]+$"></asp:RegularExpressionValidator>
                        </center>

                    <div class="wrap-input100 validate-input" data-validate="Package is Required">
                        <asp:TextBox ID="txt_Package" Width="100%" placeholder="Package" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>
                    <center>
                    <asp:RegularExpressionValidator ID="Package_Validator" runat="server" ErrorMessage="Please Enter Valid Package" ControlToValidate="txt_Package" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9.]+$"></asp:RegularExpressionValidator>
                    </center>

                    <div class="wrap-input100 validate-input" data-validate="Tenure is Required">
                        <asp:TextBox ID="txt_Tenure" Width="100%" placeholder="Tenure" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>
                    <center>
                       <asp:RegularExpressionValidator ID="Tenure_Validator" runat="server" ErrorMessage="Please Enter Valid Tenure Between 1-3 Year" ControlToValidate="txt_Tenure" Display="Dynamic" ForeColor="Red" ValidationExpression="^[1-3]"></asp:RegularExpressionValidator>
                    </center>
                    <br />


                    <div class="wrap-input100 validate-input" data-validate="Estimated Arrival Date (From) is Required">
                        <center><span style="">Estimated Arrival Date (From)</span>
                        <br/><br/>

                        <asp:Calendar ID="cld_Estimate_ArrivalDate_From" runat="server" DayHeaderStyle-BorderColor="#032152" DayHeaderStyle-BorderStyle="Solid" DayHeaderStyle-BorderWidth="2px"
                            DayStyle-BorderColor="#032152" DayStyle-BorderStyle="Solid" DayStyle-BorderWidth="2px" FirstDayOfWeek="Monday" SelectedDayStyle-ForeColor="Black" ShowGridLines="True"
                            TitleStyle-BackColor="#093051" TitleStyle-ForeColor="White" SelectionMode="Day" CellPadding="5" CellSpacing="5" OnSelectionChanged="cld_Estimate_ArrivalDate_From_SelectionChanged" OnDayRender="cld_Estimate_ArrivalDate_From_DayRender">
                            
                            <DayHeaderStyle BorderColor="#032152" BorderWidth="2px" BorderStyle="Solid"></DayHeaderStyle>
                            <DayStyle BorderColor="#032152" BorderWidth="2px" BorderStyle="Solid"></DayStyle>
                            <NextPrevStyle ForeColor="White"></NextPrevStyle>
                            <SelectedDayStyle ForeColor="Black"></SelectedDayStyle>
                            <TitleStyle BackColor="#093051" ForeColor="White"></TitleStyle>

                            </asp:Calendar>
                            <br/>
                        <asp:TextBox ID="txt_Estimate_ArrivalDate_From" Width="100%"  class="input100" runat="server" ReadOnly="True"></asp:TextBox>
                        <span class="focus-input100"></span>
                            </center>
                    </div>
                    <center>
                    <asp:RequiredFieldValidator ID="cld_Estimate_ArrivalDate_From_Validator" ControlToValidate="txt_Estimate_ArrivalDate_From" runat="server" ErrorMessage="Estimate Arrival Date (From) is Mandatory" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </center>
                    <br />
                    <center>
                        <asp:Label ID="lbl_Message"  runat="server" Text="NOTE : Time Duration Difference Between Arrival Date (From-To) Will Be Of Minimum 14 Days.!" Font-Size="Small" ForeColor="Red"></asp:Label>
                    </center>
                    <br/><br/>
                    <div class="wrap-input100 validate-input" data-validate="Estimated Arrival Date (To) is Required">
                        <center><span style="">Estimated Arrival Date (To)</span>
                        <br/><br/>

                        <asp:Calendar ID="cld_Estimate_ArrivalDate_To" runat="server" DayHeaderStyle-BorderColor="#032152" DayHeaderStyle-BorderStyle="Solid" DayHeaderStyle-BorderWidth="2px"
                            DayStyle-BorderColor="#032152" DayStyle-BorderStyle="Solid" DayStyle-BorderWidth="2px" FirstDayOfWeek="Monday" SelectedDayStyle-ForeColor="Black" ShowGridLines="True"
                            TitleStyle-BackColor="#093051" TitleStyle-ForeColor="White" SelectionMode="Day" CellPadding="5" CellSpacing="5"  OnSelectionChanged="cld_Estimate_ArrivalDate_To_SelectionChanged" OnDayRender="cld_Estimate_ArrivalDate_To_DayRender">

                            <DayHeaderStyle BorderColor="#032152" BorderWidth="2px" BorderStyle="Solid"></DayHeaderStyle>
                            <DayStyle BorderColor="#032152" BorderWidth="2px" BorderStyle="Solid"></DayStyle>
                            <NextPrevStyle ForeColor="White"></NextPrevStyle>
                            <SelectedDayStyle ForeColor="Black"></SelectedDayStyle>
                            <TitleStyle BackColor="#093051" ForeColor="White"></TitleStyle>

                        </asp:Calendar>
                            <br/>
                        <asp:TextBox ID="txt_Estimate_ArrivalDate_To" Width="100%" class="input100" runat="server" ReadOnly="True"></asp:TextBox>
                        <span class="focus-input100"></span>
                            </center>
                    </div>
                    <center>
                    <asp:RequiredFieldValidator ID="cld_Estimate_ArrivalDate_To_Validator" ControlToValidate="txt_Estimate_ArrivalDate_To" runat="server" ErrorMessage="Estimate Arrival Date (To) is Mandatory" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </center>

                    <center><span style="">Required Technologies</span></center>
                    <br />
                    <div class="wrap-input100 validate-input" data-validate="Estimated Arrival To is Required">

                        <asp:CheckBoxList ID="cbx_Required_Technology" runat="server" DataSourceID="SqlDataSource1" DataTextField="Technology_Name" DataValueField="Technology_Name" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%" CellPadding="1" CellSpacing="1"></asp:CheckBoxList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Technology_Name] FROM [tbl_Technology]"></asp:SqlDataSource>

                    </div>


                    <div class="wrap-input100 validate-input" data-validate="Estimate Number of Student is Required">
                        <asp:TextBox ID="txt_Estimate_Required_Students" Width="100%" placeholder="Estimate Number of Students Required" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>
                    <center>
                        <asp:RegularExpressionValidator ID="Est_Req_Students_Validator" runat="server" ErrorMessage="Please Enter Valid Number of Estimate Required Students" ControlToValidate="txt_Estimate_Required_Students" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                    </center>

                    <div class="wrap-input100 validate-input" data-validate="Total No. Rounds of Interview is Required">
                        <%--<asp:TextBox ID="txt_Total_Rounds" Width="100%" placeholder="Total Number of Rounds To Conduct" class="input100" runat="server"></asp:TextBox>--%>

                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_Total_rounds" runat="server" Text="Total Number of Rounds To Conduct : "></asp:Label>
                                </td>
                                <td style="width: 25%">
                                    
                                    <center>
                                        <asp:DropDownList ID="ddl_Total_Rounds" Width="100%" ToolTip="Total Number of Rounds To Conduct.\n Maximum 4 Rounds Allowed" runat="server" AutoPostBack="false">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                        </asp:DropDownList>
                                    </center>
                                </td>
                            </tr>
                        </table>

                        <span class="focus-input100"></span>

                    </div>
                    <%--<center>
                        <asp:RegularExpressionValidator ID="Total_Rounds_Validator" runat="server" ErrorMessage="Please Enter Valid Total No. of Rounds Of Interview" ControlToValidate="txt_Total_Rounds" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-4]+$"></asp:RegularExpressionValidator>
                    </center>--%>

                    <div class="wrap-input100 validate-input" data-validate="Select Under Graduation Dergee Type">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_UG_Type" runat="server" Text="Under Graduation Dergee Type : "></asp:Label>
                                </td>
                                <td style="width: 35%">
                                    <center>
                                    <asp:DropDownList ID="ddl_UG_Type" runat="server" AutoPostBack="false">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>B.C.A.</asp:ListItem>
                                        <asp:ListItem>B.Com</asp:ListItem>
                                        <asp:ListItem>B.B.A.</asp:ListItem>
                                    </asp:DropDownList>
                                    </center>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate="Select Mode">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_PG_Type" runat="server" Text="Post Graduation Dergee Type : "></asp:Label>
                                </td>
                                <td style="width: 40.5%">
                                    <center>                                    
                                    <asp:DropDownList ID="ddl_PG_Type" runat="server" AutoPostBack="false">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>M.C.A.</asp:ListItem>
                                        <asp:ListItem>M.B.A.</asp:ListItem>
                                    </asp:DropDownList>
                                        </center>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="SSC Percentage Required">
                        <asp:TextBox ID="txt_SSC_Percentage" Width="100%" placeholder="SSC Percentage" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>
                    <center>
                        <asp:RegularExpressionValidator ID="SSC_Per_Validator" runat="server" ControlToValidate="txt_SSC_Percentage" ErrorMessage="SSC Percentage Can Be In Range 0-100% and only till two decimal value." Display="Dynamic" ForeColor="Red" ValidationExpression="^100(\.0{0,2}?)?$|^\d{0,2}(\.\d{0,2})?$"></asp:RegularExpressionValidator>
                    </center>


                    <div class="wrap-input100 validate-input" data-validate="HSC Percentage Required">
                        <asp:TextBox ID="txt_HSC_Percentage" Width="100%" placeholder="HSC Percentage" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <center>
                        <asp:RegularExpressionValidator ID="HSC_Per_Validator" runat="server" ControlToValidate="txt_HSC_Percentage" ErrorMessage="HSC Percentage Can Be In Range 0-100% and only till two decimal value." Display="Dynamic" ForeColor="Red" ValidationExpression="^100(\.0{0,2}?)?$|^\d{0,2}(\.\d{0,2})?$"></asp:RegularExpressionValidator>
                    </center>

                    <div class="wrap-input100 validate-input" data-validate="4th Sem SGPA Required">
                        <asp:TextBox ID="txt_4Sem_SGPA" Width="100%" placeholder="4th Sem SGPA" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <center>
                        <asp:RegularExpressionValidator ID="SGPA_Validator" runat="server" ControlToValidate="txt_4Sem_SGPA" ErrorMessage="SGPA can only be in 0-10 range. Eg. 5.5" Display="Dynamic" ForeColor="Red" ValidationExpression="^(?:[1-9]|0[1-9]|10)((\.\d{1,2})? *)$"></asp:RegularExpressionValidator>
                    </center>

                    <div class="wrap-input100 validate-input" data-validate="Current CGPA Required">
                        <asp:TextBox ID="txt_Current_CGPA" Width="100%" placeholder="Current CGPA" class="input100" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <center>
                        <asp:RegularExpressionValidator ID="CGPA_Validator" runat="server" ControlToValidate="txt_Current_CGPA" ErrorMessage="CGPA can only be in 0-10 range. Eg. 5.5" Display="Dynamic" ForeColor="Red" ValidationExpression="^(?:[1-9]|0[1-9]|10)((\.\d{1,2})? *)$"></asp:RegularExpressionValidator>
                    </center>

                    <%--<div class="wrap-input100">
                        <asp:TextBox ID="txt_Representative_Name_2" Width="100%" placeholder="2nd Representative Name" Font-Size="13px" runat="server"></asp:TextBox>
                        <span class="focus-input100"></span>

                    </div>--%>

                    <div class="wrap-input100">
                        <table>
                            <tr>
                                <td style="width: 30%;">
                                    <asp:Label ID="lbl_Allow_KT" runat="server" Text="Allow KT"></asp:Label>
                                </td>
                                <td style="width: 40%;">
                                    <asp:RadioButtonList ID="rbl_Allow_KT" Width="100%" runat="server" Style="margin-top: 7px;"
                                        RepeatDirection="Horizontal" TextAlign="Right" CellPadding="10" CellSpacing="10"
                                        AutoPostBack="True" OnSelectedIndexChanged="rbl_Allow_KT_SelectedIndexChanged">

                                        <asp:ListItem Value="Yes">&nbsp;&nbsp;Yes</asp:ListItem>
                                        <asp:ListItem Value="No" Selected="True">&nbsp;&nbsp;No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lbl_Allow_ATKT_Upto" runat="server" Visible="false" Text="Allow ATKT Upto"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:DropDownList ID="ddl_Allow_ATKT" Width="70px" Visible="false" Style="margin-top: 10px; margin-left: 10px; margin-bottom: 10px;" runat="server">
                            <asp:ListItem Value="0" Selected="True">0</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                        </asp:DropDownList>
                    </div>


                    <div class="wrap-input100 validate-input" data-validate="Select Allow KT">
                        <table>
                            <tr>
                                <td style="width: 40%;">
                                    <asp:Label ID="lbl_Additional_Technology" runat="server" Text="Additional Technology"></asp:Label>
                                </td>
                                <td style="width: 50%;">
                                    <asp:RadioButtonList ID="rbl_Additional_Technology" Width="50%" runat="server" Style="margin-top: 9px;"
                                        RepeatDirection="Horizontal" TextAlign="Right" CellPadding="10" CellSpacing="10" OnSelectedIndexChanged="rbl_Additional_Technology_SelectedIndexChanged" AutoPostBack="True">

                                        <asp:ListItem Value="Yes">&nbsp;&nbsp;Yes</asp:ListItem>
                                        <asp:ListItem Value="No" Selected="True">&nbsp;&nbsp;No</asp:ListItem>
                                    </asp:RadioButtonList>

                                </td>
                            </tr>
                        </table>
                        <asp:TextBox ID="txt_Additional_Technology" Width="100%" runat="server" placeholder="Enter Technology" Style="margin-top: 10px;" Visible="false"></asp:TextBox>
                    </div>


                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <asp:Button ID="btn_Submit" runat="server" class="login100-form-btn" Text="Proceed To Dashboard" OnClick="btn_Submit_Click" />
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

</body>
</html>
