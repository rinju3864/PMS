<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin_Contact_Us.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Contact_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        *, *:after, *:before {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            -o-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            background: #ffffff;
        }

        .mapouter {
            position: relative;
            text-align: right;
            height: 492px;
            width: 522px;
            margin-top: 30px;
        }

        .gmap_canvas {
            overflow: hidden;
            background: none !important;
            height: 100%;
            width: 100%;
            box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
        }


        .section2 {
            width: 1200px;
            margin: 15px auto;
            font-size: 20px;
            text-align: justify;
            display: block;
            padding: 10px 20px 40px 20px;
        }

        .section2 .col2 {
            width: 53%;
        }

        .section2 .col2.last {
            float: right;
            margin-top: -500px;
        }

        p {
            font-family: Montserrat !important;
            font-size:23px;
            text-align:justify;
            color:black;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section class="section2">
        <br/>
        <div class="col2 column1">
            <div class="mapouter">
                <div class="gmap_canvas">
                    <iframe width="520" height="492" id="gmap_canvas"
                        src="https://maps.google.com/maps?q=uka%20tarsadia%20university&t=&z=13&ie=utf8&iwloc=&output=embed"></iframe>


                </div>
            </div>

        </div>
        <div class="col2 column2 last">
            <center><img src="../Registration_Template/images/logo.png" height="170px" width="170px" /></center>
            
            <br/><p>
                Shrimad Rajchandra Institute of Management and Computer Application
                               Maliba Campus Gopal Vidyanagar, Bardoli Mahuva Road, TARSADI
                               Dist: Surat - 394 350,Gujarat (INDIA)
            </p>
            <p><span class="collig">Phone :</span> +91 976885083</p>
            <p><span class="collig">Email :</span> director.srimca@utu.ac.in</p>
            <p><span class="collig">Fax :</span> +91 9768850839</p>
        </div>
    </section>
</asp:Content>

