<%@ Page Title="Company Dashboard" Language="C#" MasterPageFile="~/Company Module/Company_MasterPage.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Company_Dashboard.aspx.cs" Inherits="Placement_Management_System.Company_Module.Company_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Company Dashboard</title>

    <style>
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">Company Dashboard</li>
        </ol>
    </div>
    <!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Company Dashboard</h1>
        </div>
    </div>
    <!--/.row-->

    <div class="panel panel-container">
        <div class="row">
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-teal panel-widget border-right">
                    <div class="row no-padding">
                        <em class="fa fa-xl fa-cogs color-blue"></em>
                        <div class="large">
                            <asp:Label ID="lbl_Required_Technology" runat="server" Text="0"></asp:Label>
                        </div>
                        <div class="text-muted">Required Technology(2020)</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-blue panel-widget border-right">
                    <div class="row no-padding">
                        <em class="fa fa-xl fa-address-card color-orange"></em>
                        <div class="large">
                            <asp:Label ID="lbl_Interested_Student" runat="server" Text="0"></asp:Label>
                        </div>
                        <div class="text-muted">Interested Student(2020)</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-orange panel-widget border-right">
                    <div class="row no-padding">
                        <em class="fa fa-xl fa-graduation-cap color-teal"></em>
                        <div class="large">
                            <asp:Label ID="lbl_Student_Selected_Till_Date" runat="server" Text="0"></asp:Label>
                        </div>
                        <div class="text-muted">Students Selected Till Date</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-red panel-widget ">
                    <div class="row no-padding">
                        <em class="fa fa-xl fa-calendar color-red"></em>
                        <div class="large">
                            <asp:Label ID="lbl_Interview_Schedule_date" runat="server" Text="-"></asp:Label>
                        </div>
                        <div class="text-muted">Interview Schedule Date</div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Placement Analysis of Student's Recruited in Previous Year

                        <ul class="pull-right panel-settings panel-button-tab-right">
                            <li class="dropdown"><a class="pull-right dropdown-toggle" data-toggle="dropdown" href="#">
                                <em class="fa fa-cogs"></em>
                            </a>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li>
                                        <ul class="dropdown-settings">
                                            <li><a href="#">
                                                <em class="fa fa-cog"></em>Report 1
                                            </a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">
                                                <em class="fa fa-cog"></em>Report 2
                                            </a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">
                                                <em class="fa fa-cog"></em>Report 3
                                            </a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    <span class="pull-right clickable panel-toggle panel-button-tab-left"><em
                        class="fa fa-toggle-up"></em></span>
                </div>
                <div class="panel-body">
                    <div class="canvas-wrapper">
                        <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/.row-->


    <div class="row">
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>Invitation Accepted</h4>
                    <div class="easypiechart" id="easypiechart-blue" data-percent="92">
                        <span
                            class="percent">92%</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>Students Got Placed</h4>
                    <div class="easypiechart" id="easypiechart-orange" data-percent="65">
                        <span
                            class="percent">65%</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>Placement Drive Completed</h4>
                    <div class="easypiechart" id="easypiechart-teal" data-percent="56">
                        <span
                            class="percent">56%</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>Total Feedback Procured</h4>
                    <div class="easypiechart" id="easypiechart-red" data-percent="27">
                        <span
                            class="percent">27%</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/.row-->

    <%-- Footer --%>
    <div class="col-sm-12">
        <p class="back-link">Developed By <a href="//srimca.edu.in">SRIMCA</a></p>
    </div>
    <%-- Footer --%>

    <script>
        var randomScalingFactor = function () { return Math.round(Math.random() * 10000) };

           var Years = '<%=ViewState["Years"]%>'.split(",");
           var Student_Count = '<%=ViewState["Student_Count"]%>'.split(",");

        var lineChartData =
        {
            labels: Years,
            datasets: [
                {
                    fillColor: "rgba(48, 164, 255, 0.2)",
                    strokeColor: "rgba(48, 164, 255, 1)",
                    pointColor: "rgba(48, 164, 255, 1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(48, 164, 255, 1)",
                    data: Student_Count
                }
            ]
        }

    </script>

</asp:Content>
