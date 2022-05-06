<%@ Page Title="" Language="C#" MasterPageFile="~/Company Module/Company_MasterPage.Master" AutoEventWireup="true" CodeBehind="Company_About_Us.aspx.cs" Inherits="Placement_Management_System.Company_Module.Company_About_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        

        body {
            background: #ffffff;
            margin: 2% 8% 2% 10%;
        }

        p {
            color:black;
            font-size: 20px;
            font-family: 'Montserrat';
            margin-top: 40px;
            margin: 25px auto;
            text-align: justify;
            text-justify: inter-word;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main">
        <div>
            <center><img src="../Registration_Template/images/logo.png" height="200px" width="200px" style="margin-top:30px;" /></center>

        </div>
         <br/><br/>
        <div>
            <p>
                "At SRIMCA, our endeavor is to mould our students into professionals with positive attitude and thorough knowledge who can take their place in any world-class work culture and organization. We strive to ensure that every student, graduating from our institute, is well prepared for the future. Well entrenched in our rich Indian ethos and values, our institute is a modern learning institution, equipped with world-class facilities and cutting-edge IT Infrastructure."
            </p>
            <p>


"We believe learning should be challenging and enjoyable, and we strive to maintain that balance to ensure that our students face the challenges of the future confidently and successfully. Our institute aims to provide a mature environment to fostered sound work ethics, self-discipline and learning skills. I am proud of our students who embody Indian values and ethics that one rarely finds now days."
            </p>
        </div>
    </div>
</asp:Content>
