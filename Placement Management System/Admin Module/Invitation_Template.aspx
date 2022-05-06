<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="Invitation_Template.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Invitation_Template" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Invitation Template Page</title>
    <style>
        .login100-form-btn {
            font-family: Montserrat-Bold;
            font-size: 20px;
            line-height: 1.5;
            color: #fff;
            width: 25%;
            height: 50px;
            border-radius: 25px;
            background: #57b846;
            display: flex;
            justify-content: center;
            padding: 0 25px;
            transition: all 0.4s;
        }

        .login100-form-btn:hover {
            background: #333333;
        }

        .invite-form {
            margin:30px 5px 30px 5px;
            width: 95%;
            text-align: justify;
            padding: 15px;
            background-color: #ffdf80 !important;
            font-family: Calibri;
            font-size: 1.5em;
            border:3px solid black;
            color:black;
        }
        p {
        color:black;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <center>
            <div class="invite-form">
            <b>Dear Sir/Ma'am,</b>
            <p>
                Greetings from Shrimad Rajchandra Institute of Management and Computer Applications(SRIMCA),UTU. We would like to take this opportunity to invite your esteemed organization for being
                empanelled for our campus placement activities. 
            </p>


            <p><b><u>Invitation for Campus Placement Process</u></b></p>
            
            <p>
                MCA programme is running since 2002 at SRIMCA. More than
                <asp:TextBox ID="txt_Students_Count" runat="server" BorderStyle="Inset" placeholder="Enter Passed Students" Font-Size="Medium" BorderWidth="2" BorderColor="#FF3300" Width="160"></asp:TextBox>                
                students from 
                <asp:TextBox ID="txt_Batches_Count" runat="server" BorderStyle="Inset" placeholder="Enter Batches Count" Font-Size="Medium" Width="160" BorderWidth="2"  BorderColor="#FF3300"></asp:TextBox>

                batches have successfully completed their Post Graduation. Our institute is a constitute institute
                of Uka Tarsadia University. 
            </p>
               <p>
                Our college has an active Placement Cell which looks into the placement for its students. 
                The objective of the college Placement Cell is to help students identify their career goals
                and provide an edge into the present day competitive job market.  The scope of work
                of Placement Cell extends from organizing workshops to providing internships to
                students in various organizations during summer break and preparing students for
                the final placements In the past, the placement cell has conducted similar events in
                which several companies participated and recruited bright talents.  We will
                be extremely obliged if you could be a part of our Endeavour of making the
                untapped talent shine.
            </p>
            <p>
                The M.C.A Course covers Web Development, Mobile Application Development, Internet Of Things, Big Data Analytics,
                Game Development, Database Management, Software Engineering and Testing, Open Source Technologies etc. Students are well 
                acquaintance will tools/ platforms like 
                <asp:Label ID="lbl_Technology_List" runat="server"></asp:Label>.
            </p>
            <p>
                We invite you for a Campus Placement Drive for final year students.  We are
                keen to organize a Campus Placement Drive during June to October at our
                institute for the Final Year students.  These students will be appearing in final year
                examination in
                <asp:TextBox ID="txt_Passing_Month" runat="server" BorderStyle="Inset" placeholder="Select Month and Year" Font-Size="Medium" Width="160" BorderWidth="2" BorderColor="#FF3300"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_Passing_Month"  FirstDayOfWeek="Monday" Format="MMM-yyy"></ajaxToolkit:CalendarExtender>
                . We will be providing you the supporting infrastructure
                facilities for conducting Tests, Interview, Presentation, and Group Discussion. 
               
            </p>
            <p>
                Looking forward to your participation in the recruitment drive. We would appreciate
                your kind consent to participate.    
            </p>
            <br/><p><b>NOTE : Registration Will Only Be Accepted Before The End Of June.!</b></p>
            <br/>
            <p>
                <b>Thank You</b>
                <br/>
                Shrimad Rajchandra Institute of Management and Computer Application<br />
                Maliba Campus,Gopal Vidyanagar,<br />
                Bardoli-Mahuva Road, TARSADI,<br />
                Dist: Surat - 394350,<br />
                Gujarat (INDIA)<br />
                <b>Contact Us : 91-2625-255389</b><br />
                <b>Email : director.srimca@utu.ac.in</b>
            </p>
                <center>
                    <asp:Button ID="btn_Send_Invite" runat="server" Text="SEND INVITE" class="login100-form-btn" OnClick="btn_Send_Invite_Click" />
                </center>
          </div>
            </center>

</asp:Content>
