<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Admin_Manage_Profile.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Manage_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Company Update Profile</title>
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
        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 14px 28px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
            margin-top: 1%;
            margin-bottom: 2%;
            border: 2px solid #4CAF50;
            border-radius: 4px;
        }

            .button:hover {
                background-color: #fff;
                color: black;
            }

        .lbl {
            color: #595861 !important;
            opacity: 1 !important;
            font-family: Montserrat !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="alignment">
        <center>
        <div>
<%--        <span style="font-size:21.5px;margin-right:20px;font-family:Montserrat !important;" class=".lbl">Select Company</span> --%>
            <asp:DropDownList ID="ddl_Company_Name_List" Visible="false"  runat="server" Font-Size="21.5px" ForeColor="#1fc428" OnSelectedIndexChanged="ddl_Company_Name_List_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            <asp:DropDownList ID="ddl_Company_Id_List" Visible="false" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_Company_Id_List_SelectedIndexChanged"></asp:DropDownList>
        </div>
       </center>

        <div class="login100-form-avatar" style="padding: 0px; box-shadow: 2px 8px 7px #2a3547;">

            <asp:Image ID="img_main_logo" runat="server" Height="150px" Width="100%" ImageUrl="~/Company Module/Company_Images/UserLogo.png" ImageAlign="Middle" />

        </div>

        <div>
            <center>
            <asp:Button ID="btn_Company_Basic_Details_View" Style="margin-right:1%;" runat="server" Text="Company Basic Details" class=" button btn_left" OnClick="btn_Submit_Click_Basic" CausesValidation="False" />
            <asp:Button ID="btn_Company_Offering_Details_View" Style="margin-left:1%;" runat="server" Text="Company Offering Details" class="button" OnClick="btn_Submit_Click_Offerings" CausesValidation="False" />
        </center>
        </div>

        </br>
    <asp:Panel ID="pnl_Basic_Details" runat="server">

        <div class="wrap-input100 validate-input" data-validate="Company Name is Required">
            <asp:Label ID="lbl_Company_Name" runat="server" ForeColor="#999999" CssClass="lbl" Text="Company Name"></asp:Label>
            <asp:TextBox ID="txt_Company_Name" Width="100%" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>
        </div>
        <center>
            <asp:RegularExpressionValidator  ID="Name_Validator" runat="server" ErrorMessage="Please Enter Valid Name" ControlToValidate="txt_Company_Name" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-z A-Z]+$"></asp:RegularExpressionValidator>
        </center>

        <div class="wrap-input100 validate-input" data-validate="Email ID is Required">
            <asp:Label ID="lbl_Email" runat="server" CssClass="lbl" ForeColor="#999999" Text="Company Email Id"></asp:Label>
            <asp:TextBox ID="txt_Email_Id" Width="100%" ToolTip="Email Id must be of proper format: abc@gmail.com" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>

        </div>
        <center>
                    <asp:RegularExpressionValidator ID="Email_Validator" runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="txt_Email_Id" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"></asp:RegularExpressionValidator>
                    </center>

        <div class="wrap-input100 validate-input" data-validate="Contact Number is Required">
            <asp:Label ID="lbl_Contact" runat="server" ForeColor="#999999" CssClass="lbl" Text="Contact No."></asp:Label>
            <asp:TextBox ID="txt_Contact_Number" ToolTip="Contact No. must be of proper format: 9512136600" Width="100%" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>

        </div>
        <center>
                       <asp:RegularExpressionValidator ID="Contact_Validator" runat="server" ErrorMessage="Please Enter Valid Contact Number" ControlToValidate="txt_Contact_Number" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                    </center>


        <div class="wrap-input100 validate-input" data-validate="State is Required">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lbl_State" runat="server" Text="State : " ForeColor="#999999" CssClass="lbl"></asp:Label>
                    </td>
                    <td style="width: 60%">

                        <asp:DropDownList ID="ddl_State" runat="server" AutoPostBack="True" Height="30" Width="150" Style="border: 0px !important;" Font-Size="Larger" OnSelectedIndexChanged="ddl_State_SelectedIndexChanged">
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
                        <asp:Label ID="lbl_City" runat="server" Text="City : " ForeColor="#999999" CssClass="lbl"></asp:Label>
                    </td>
                    <td style="width: 60%">

                        <asp:DropDownList ID="ddl_City" runat="server" Height="30" Width="150" Style="border: 0px !important" Font-Size="Larger">
                        </asp:DropDownList>

                    </td>
                </tr>
            </table>
        </div>

        <div class="wrap-input100 validate-input" data-validate="Address is Required">
            <asp:Label ID="lbl_Address" ForeColor="#999999" runat="server" CssClass="lbl" Text="Address"></asp:Label>

            <asp:TextBox ID="txt_Address" Width="100%" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>
        </div>

        <div class="wrap-input100 validate-input" data-validate="Representative Name is Required">
            <asp:Label ID="lbl_Representative1" runat="server" ForeColor="#999999" CssClass="lbl" Text="1st Representative Name"></asp:Label>

            <asp:TextBox ID="txt_Representative_Name_1" Width="100%" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>
        </div>
        <center>
                      <asp:RegularExpressionValidator ID="Representative_Validator" runat="server" ErrorMessage="Please Enter Valid Representative Name 1" ControlToValidate="txt_Representative_Name_1" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-z A-Z]+$"></asp:RegularExpressionValidator>
                    </center>

        <div class="wrap-input100 validate-input">
            <asp:Label ID="lbl_Representative2" runat="server" ForeColor="#999999" CssClass="lbl" Text="2nd Representative Name"></asp:Label>

            <asp:TextBox ID="txt_Representative_Name_2" Width="100%" class="input100" runat="server"></asp:TextBox>
            <span class="focus-input100"></span>

        </div>
        <center>
                      <asp:RegularExpressionValidator ID="Representative2_Validator" runat="server" ErrorMessage="Please Enter Valid Representative Name 2" ControlToValidate="txt_Representative_Name_2" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-z A-Z]+"></asp:RegularExpressionValidator>
                    </center>

        <div class="wrap-input100 validate-input" data-validate="Website Name  is Required">
            <asp:Label ID="lbl_Website_Name" runat="server" ForeColor="#999999" CssClass="lbl" Text="Website Name"></asp:Label>
            <asp:TextBox ID="txt_Website_Name" Width="100%" class="input100" runat="server"></asp:TextBox>

            <span class="focus-input100"></span>
        </div>
        <center>
                      <asp:RegularExpressionValidator ID="URL_Validator" runat="server" ErrorMessage="Please Enter Valid Website URL" ControlToValidate="txt_Website_Name" Display="Dynamic" ForeColor="Red" ValidationExpression="^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$"></asp:RegularExpressionValidator>
                    </center>

        <div class="wrap-input100">

            <asp:Label ID="txt_logo_Name" runat="server" CssClass="lbl" Width="100%" Text="Website Logo" ForeColor="#999999"></asp:Label></td> 
                        <asp:FileUpload ID="fu_Company_Logo" Width="100%" class="input100" Style="margin-top: 5%;" runat="server" ToolTip="Image Type Should only be .jpg" /></td>
                
            <span class="focus-input100"></span>
        </div>

        <div class="wrap-input100 validate-input" data-validate="Company Blacklist Status">
            <table>
                <tr>
                    <td style="width: 50%;">
                        <asp:Label ID="lbl_Blacklist_Status" ForeColor="Red" Font-Bold="True" Font-Size="Larger" runat="server" Text="Is Company In Blacklist.?"></asp:Label>
                    </td>
                    <td style="width: 30%;">
                        <asp:RadioButtonList ID="rbl_Blacklist_Status" Width="100%" runat="server" Style="margin-top: 9px;" RepeatDirection="Horizontal" TextAlign="Right" CellPadding="10" CellSpacing="10">
                            <asp:ListItem Value="Yes">&nbsp;&nbsp;YES</asp:ListItem>
                            <asp:ListItem Value="No">&nbsp;&nbsp;NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </div>

    </asp:Panel>

        <asp:Panel ID="pnl_Company_Offerings" Visible="false" runat="server">

            <div class="wrap-input100 validate-input" data-validate="Select Mode">
                <table>
                    <tr>
                        <td style="width: 30%;">
                            <asp:Label ID="lbl_Selection_Mode" ForeColor="#999999" CssClass="lbl" runat="server" Text="Selection Mode"></asp:Label>
                        </td>
                        <td style="width: 50%;">
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
                <asp:Label ID="lbl_Stipend" runat="server" CssClass="lbl" Text="Stipend"></asp:Label>
                <asp:TextBox ID="txt_Stipend" Width="100%" class="input100" runat="server"></asp:TextBox>
                <span class="focus-input100"></span>
            </div>
            <center>
                    <asp:RegularExpressionValidator  ID="Stipend_Validator" runat="server" ErrorMessage="Please Enter Valid Stipend" ControlToValidate="txt_Stipend" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9.]+$"></asp:RegularExpressionValidator>
                        </center>

            <div class="wrap-input100 validate-input" data-validate="Package is Required">
                <asp:Label ID="lbl_Package" runat="server" CssClass="lbl" Text="Package"></asp:Label>
                <asp:TextBox ID="txt_Package" Width="100%" class="input100" runat="server"></asp:TextBox>
                <span class="focus-input100"></span>

            </div>
            <center>
                    <asp:RegularExpressionValidator ID="Package_Validator" runat="server" ErrorMessage="Please Enter Valid Package" ControlToValidate="txt_Package" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9.]+$"></asp:RegularExpressionValidator>
                    </center>

            <div class="wrap-input100 validate-input" data-validate="Tenure is Required">
                <asp:Label ID="lbl_Tenure" runat="server" CssClass="lbl" Text="Tenure"></asp:Label>
                <asp:TextBox ID="txt_Tenure" Width="100%" class="input100" runat="server"></asp:TextBox>
                <span class="focus-input100"></span>

            </div>
            <center>
                <asp:RegularExpressionValidator ID="Tenure_Validator" runat="server" ErrorMessage="Please Enter Valid Tenure Between 1-3 Years" ControlToValidate="txt_Tenure" Display="Dynamic" ForeColor="Red" ValidationExpression="^[1-3]"></asp:RegularExpressionValidator>
            </center>
            <br />


            <div class="wrap-input100 validate-input" data-validate="Estimated Arrival Date (From) is Required">
                <center><span style="" CssClass="lbl">Estimated Arrival Date (From)</span>
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
                <asp:Label ID="lbl_Message"  runat="server" Text="NOTE : Time Duration Difference Between Arrival Date (From-To) Will Be Of Minimum 14 Days.!" Font-Size="Medium" ForeColor="Red"></asp:Label>
            </center>
            <br/><br/>

            <div class="wrap-input100 validate-input" data-validate="Estimated Arrival Date (To) is Required">
                <center><span style="" CssClass="lbl">Estimated Arrival Date (To)</span>
                        <br/><br/>

                        <asp:Calendar ID="cld_Estimate_ArrivalDate_To" runat="server" DayHeaderStyle-BorderColor="#032152" DayHeaderStyle-BorderStyle="Solid" DayHeaderStyle-BorderWidth="2px"
                            DayStyle-BorderColor="#032152" DayStyle-BorderStyle="Solid" DayStyle-BorderWidth="2px" FirstDayOfWeek="Monday" SelectedDayStyle-ForeColor="Black" ShowGridLines="True"
                            TitleStyle-BackColor="#093051" TitleStyle-ForeColor="White" SelectionMode="Day" CellPadding="5" CellSpacing="5" OnSelectionChanged="cld_Estimate_ArrivalDate_To_SelectionChanged" OnDayRender="cld_Estimate_ArrivalDate_To_DayRender">

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

            <center><span style="" CssClass="lbl">Required Technologies</span></center>
            <br />
            <div class="wrap-input100 validate-input" data-validate="Technology is Required">

                <asp:CheckBoxList ID="cbx_Required_Technology" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%" CellPadding="1" CellSpacing="1"></asp:CheckBoxList>

                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Technology_Name] FROM [tbl_Technology]"></asp:SqlDataSource>--%>
            </div>


            <div class="wrap-input100 validate-input" data-validate="Estimate Number of Student is Required">
                <asp:Label ID="lbl_Estimate_Required_Students" runat="server" CssClass="lbl" Text="Estimate Required Students"></asp:Label>
                <asp:TextBox ID="txt_Estimate_Required_Students" Width="100%" class="input100" runat="server"></asp:TextBox>
                <span class="focus-input100"></span>

            </div>
            <center>
                        <asp:RegularExpressionValidator ID="Est_Req_Students_Validator" runat="server" ErrorMessage="Please Enter Valid Number of Estimate Required Students" ControlToValidate="txt_Estimate_Required_Students" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                    </center>

            <div class="wrap-input100 validate-input" data-validate="Total No. Rounds of Interview is Required">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_Total_round" CssClass="lbl" runat="server" Text="Total Number of Rounds To Conduct : "></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <center>
                                <asp:DropDownList ID="ddl_Total_Rounds" Width="70%" Height="30%" ToolTip="Total Number of Rounds To Conduct.\n Maximum 4 Rounds Allowed" runat="server" AutoPostBack="True">
                                    <asp:ListItem>0</asp:ListItem>
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

            <div class="wrap-input100 validate-input" data-validate="Select Under Graduation Dergee Type">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_UG_Type" runat="server" CssClass="lbl" Text="Under Graduation Dergee Type : "></asp:Label>
                        </td>
                        <td style="width: 30%">
                            <center>
                                    <asp:DropDownList ID="ddl_UG_Type" runat="server" AutoPostBack="True">
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

            <div class="wrap-input100 validate-input" data-validate="Select Post Graduation Dergee Type" style="margin-top: 50px; margin-bottom: 50px;">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_PG_Type" CssClass="lbl" runat="server" Text="Post Graduation Dergee Type : "></asp:Label>
                        </td>
                        <td style="width: 36%">
                            <center>                                    
                                    <asp:DropDownList ID="ddl_PG_Type" runat="server" AutoPostBack="True">
                                        <asp:ListItem ></asp:ListItem>
                                        <asp:ListItem>M.C.A.</asp:ListItem>
                                        <asp:ListItem>M.B.A.</asp:ListItem>
                                    </asp:DropDownList>
                                        </center>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="wrap-input100 validate-input" data-validate="SSC Percentage Required">
                <asp:Label ID="lbl_SSC_Percentage" runat="server" CssClass="lbl" Text="SSC Percentage"></asp:Label>

                <asp:TextBox ID="txt_SSC_Percentage" Width="100%" class="input100" runat="server"></asp:TextBox>
                <span class="focus-input100"></span>

            </div>
            <center>
                        <asp:RegularExpressionValidator ID="SSC_Per_Validator" runat="server" ControlToValidate="txt_SSC_Percentage" ErrorMessage="SSC Percentage Can Be In Range 0-100% and only till two decimal value." Display="Dynamic" ForeColor="Red" ValidationExpression="^100(\.0{0,2}?)?$|^\d{0,2}(\.\d{0,2})?$"></asp:RegularExpressionValidator>
                    </center>


            <div class="wrap-input100 validate-input" data-validate="HSC Percentage Required">
                <asp:Label ID="lbl_HSC_Percentage" runat="server" CssClass="lbl" Text="HSC Percentage"></asp:Label>

                <asp:TextBox ID="txt_HSC_Percentage" Width="100%" class="input100" runat="server"></asp:TextBox>
                <span class="focus-input100"></span>
            </div>
            <center>
                        <asp:RegularExpressionValidator ID="HSC_Per_Validator" runat="server" ControlToValidate="txt_HSC_Percentage" ErrorMessage="HSC Percentage Can Be In Range 0-100% and only till two decimal value." Display="Dynamic" ForeColor="Red" ValidationExpression="^100(\.0{0,2}?)?$|^\d{0,2}(\.\d{0,2})?$"></asp:RegularExpressionValidator>
                    </center>

            <div class="wrap-input100 validate-input" data-validate="4th Sem SGPA Required">
                <asp:Label ID="lbl_4Sem_SGPA" runat="server" CssClass="lbl" Text="4th Semester SGPA"></asp:Label>

                <asp:TextBox ID="txt_4Sem_SGPA" Width="100%" class="input100" runat="server"></asp:TextBox>
                <span class="focus-input100"></span>
            </div>
            <center>
                        <asp:RegularExpressionValidator ID="SGPA_Validator" runat="server" ControlToValidate="txt_4Sem_SGPA" ErrorMessage="SGPA can only be in 0-10 range. Eg. 5.5" Display="Dynamic" ForeColor="Red" ValidationExpression="^(?:[1-9]|0[1-9]|10)((\.\d{1,2})? *)$"></asp:RegularExpressionValidator>
                    </center>

            <div class="wrap-input100 validate-input" data-validate="Current CGPA Required">
                <asp:Label ID="lbl_Current_CGPA" runat="server" CssClass="lbl" Text="Current CGPA"></asp:Label>

                <asp:TextBox ID="txt_Current_CGPA" Width="100%" class="input100" runat="server"></asp:TextBox>
                <span class="focus-input100"></span>
            </div>
            <center>
                        <asp:RegularExpressionValidator ID="CGPA_Validator" runat="server" ControlToValidate="txt_Current_CGPA" ErrorMessage="CGPA can only be in 0-10 range. Eg. 5.5" Display="Dynamic" ForeColor="Red" ValidationExpression="^(?:[1-9]|0[1-9]|10)((\.\d{1,2})? *)$"></asp:RegularExpressionValidator>
                    </center>

            <div class="wrap-input100" style="margin-top: 60px; margin-bottom: 50px;">
                <%--<table>
                    <tr>
                        <td style="width: 10%;">
                            <asp:Label ID="lbl_Allow_KT" CssClass="lbl" runat="server" Text="Allow KT"></asp:Label>
                        </td>
                        <td style="width: 10%;">
                            <asp:RadioButtonList ID="rbl_Allow_KT" Width="70%" runat="server" Style="margin-top: 7px;"
                                RepeatDirection="Horizontal" TextAlign="Right" CellPadding="10" CellSpacing="10"
                                AutoPostBack="True" OnSelectedIndexChanged="rbl_Allow_KT_SelectedIndexChanged">

                                <asp:ListItem Value="Yes">&nbsp;&nbsp;Yes</asp:ListItem>
                                <asp:ListItem Value="No" Selected="True">&nbsp;&nbsp;No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>--%>
                <asp:Label ID="lbl_Allow_ATKT_Upto" CssClass="lbl" runat="server" Text="Allow ATKT Upto"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddl_Allow_ATKT" Width="70px" runat="server">
                            <asp:ListItem Value="0" Selected="True">0</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                        </asp:DropDownList>
            </div>


            <div class="wrap-input100">
                <%--<table>
                    <tr>
                        <td style="width: 10%;">
                            <asp:Label ID="lbl_Additional_Technology" CssClass="lbl" runat="server" Text="Additional Technology"></asp:Label>
                        </td>
                        <td style="width: 15%;">
                            <asp:RadioButtonList ID="rbl_Additional_Technology" Width="70%" runat="server" Style="margin-top: 9px;"
                                RepeatDirection="Horizontal" TextAlign="Right" CellPadding="10" CellSpacing="10" OnSelectedIndexChanged="rbl_Additional_Technology_SelectedIndexChanged" AutoPostBack="True">

                                <asp:ListItem Value="Yes">&nbsp;&nbsp;Yes</asp:ListItem>
                                <asp:ListItem Value="No" Selected="True">&nbsp;&nbsp;No</asp:ListItem>
                            </asp:RadioButtonList>

                        </td>
                    </tr>
                </table>--%>
                <asp:Label ID="lbl_Additional_Technology" CssClass="lbl" runat="server" Text="Additional Technology"></asp:Label>

                <asp:TextBox ID="txt_Additional_Technology" Width="100%" class="input100" runat="server"></asp:TextBox>
                <span class="focus-input100"></span>

            </div>
        </asp:Panel>

        <div class="container-login100-form-btn">
            <div class="wrap-login100-form-btn">
                <center>
                <asp:Button ID="btn_Submit" Style="margin-right:2%;" runat="server" class=" button btn_left" Text="Update Details" OnClick="btn_Submit_Click" />
                <asp:Button ID="btn_Delete" OnClientClick="return ConfirmOnDelete();" Style="margin-left:2%;" runat="server" class="button" Text="Delete Details" OnClick="btn_Delete_Click" />
                    </center>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function ConfirmOnDelete() {
            if (confirm("Are You Sure You Want To Delete Company Details?") == true)
                return true;
            else
                return false;
        }
    </script>

    <%--    <script>
        $(document).ready(function () {
            swal("Good job!", "You clicked the button!", "success");
        });
    </script>--%>
</asp:Content>
