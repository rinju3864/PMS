<%@ Page Title="" Language="C#" MasterPageFile="~/Company Module/Company_MasterPage.Master" AutoEventWireup="true" CodeBehind="Company_Post_Results.aspx.cs" Inherits="Placement_Management_System.Company_Module.Company_Post_Results" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Interview Attendance
    </title>
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
            margin-left: 12px;
            margin-right:4px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <center>
        <br/><br/>
        <asp:Label ID="lbl_Current_Year" runat="server" CssClass="lbl" Visible="False" ></asp:Label>
        <asp:Label ID="lbl_Company_Id" runat="server" CssClass="lbl" Visible="False" ></asp:Label>
        <br/><br/>

    <asp:GridView ID="GridView1" Style="margin-top:5%;" runat="server"  AutoGenerateColumns="False" DataKeyNames="Student_Id" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#242c42" BorderStyle="Solid" BorderWidth="4px"  GridLines="Both" Font-Size="X-Small" Width="95%"  OnDataBound="GridView1_DataBound"  >
    <AlternatingRowStyle BackColor="#DCDCDC"></AlternatingRowStyle>
    <Columns>

        <asp:TemplateField HeaderText="Student Photo" >
            <HeaderStyle Width="10%" CssClass="Center" />
            <ItemStyle Wrap="false" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                    <asp:Image Style="padding:15px;" ID="img_Student_Photo" Height="100" Width="100" ImageAlign="Middle" ImageUrl='<%# "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Student_Photo")) %>' runat="server"></asp:Image>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Student_Id" ControlStyle-Width="10%" HeaderText="Student Id" ReadOnly="True" SortExpression="Student_Id" HeaderStyle-CssClass="Center"></asp:BoundField>
        <asp:BoundField DataField="Student_Name" ControlStyle-Width="10%" HeaderText="Student Name" SortExpression="Student_Name" HeaderStyle-CssClass="Center"></asp:BoundField>
            
        <asp:TemplateField HeaderText="Final Stipend" >
            <HeaderStyle Width="10%" CssClass="Center" />
            <ItemStyle Wrap="false" HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:TextBox ID="Final_Stipend" Width="90%"  runat="server"></asp:TextBox>
            </ItemTemplate>
            
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Final Package" >
            <HeaderStyle Width="10%" CssClass="Center" />
            <ItemStyle Wrap="false" HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:TextBox ID="Final_Package" Width="90%"  runat="server"></asp:TextBox>
           
                </ItemTemplate>
            
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Final Tenure" >
            <HeaderStyle Width="10%" CssClass="Center" />
            <ItemStyle Wrap="false" HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:TextBox ID="Final_Tenure"   Width="90%" runat="server"></asp:TextBox>

            </ItemTemplate>
            
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Status" >
            <HeaderStyle Width="20%" CssClass="Center" />
            <ItemStyle Wrap="false" HorizontalAlign="Center" />
            <ItemTemplate>
                 <asp:RadioButtonList ID="rbl_Status"  runat="server" CssClass="rbl"  RepeatDirection="Horizontal">
                    <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                    <asp:ListItem Text="Reject" Value="Reject"></asp:ListItem>
                </asp:RadioButtonList>
            </ItemTemplate>
            
        </asp:TemplateField>
        </Columns>

    <HeaderStyle BackColor="#242c42" CssClass="gridviewRow" ForeColor="White"  Height="60" Font-Size="X-Large" ></HeaderStyle>

    <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

    <RowStyle BackColor="#EEEEEE" ForeColor="Black" CssClass="gridviewRow" Height="80px" ></RowStyle>

    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT tbl_Student_Basic_Details.Student_Photo, tbl_Student_Basic_Details.Student_Name, tbl_Student_Basic_Details.Student_Id FROM tbl_Student_Basic_Details INNER JOIN tbl_Student_Shortlist ON tbl_Student_Basic_Details.Student_Id = tbl_Student_Shortlist.Student_Id WHERE ([Company_Id] = @Company_Id) and Year(tbl_Student_Shortlist.Shortlisted_Date)=@Current_Year">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbl_Company_Id" PropertyName="Text" Name="Company_Id" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="lbl_Current_Year" PropertyName="Text" Name="Current_Year" Type="Int32"></asp:ControlParameter>        
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
            <asp:Button ID="btn_Submit" runat="server" class="login100-form-btn" OnClick="btn_Submit_Click" Text="Submit"  />
        </div>
    </div>
</center>

</asp:Content>
