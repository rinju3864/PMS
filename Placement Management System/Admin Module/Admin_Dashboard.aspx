<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Module/Admin_MasterPage.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="Placement_Management_System.Admin_Module.Admin_Dashboard" %>

<%@ OutputCache Location="None" VaryByParam="None" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Admin Dashboard</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">--%>
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#">
                <em class="fa fa-home"></em>
            </a></li>
            <li class="active">Dashboard</li>
        </ol>
    </div>
    <!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Dashboard</h1>
        </div>
    </div>
    <!--/.row-->

    <div class="panel panel-container">
        <div class="row">
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-teal panel-widget border-right">
                    <div class="row no-padding">
                        <em class="fa fa-xl fa-address-card-o color-blue"></em>
                        <div class="large">
                            <asp:Label ID="lbl_Total_Company" Font-Size="0.9em" runat="server" Text="0"></asp:Label></div>
                        <div class="text-muted">Companies Registered</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-blue panel-widget border-right">
                    <div class="row no-padding">
                        <em class="fa fa-xl fa-user-o color-orange"></em>
                        <div class="large">
                            <asp:Label ID="lbl_Total_Student" Font-Size="0.9em" runat="server" Text="0"></asp:Label></div>
                        <div class="text-muted">Students Registered</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-orange panel-widget border-right">
                    <div class="row no-padding">
                        <em class="fa fa-xl fa-users color-teal"></em>
                        <div class="large">
                            <asp:Label ID="lbl_Total_Selected_Students" Font-Size="0.9em" runat="server" Text="0"></asp:Label></div>
                        <div class="text-muted">Total Selected Students</div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-3 col-lg-3 no-padding">
                <div class="panel panel-red panel-widget ">
                    <div class="row no-padding">
                        <em class="fa fa-xl fa-exclamation-triangle color-red"></em>
                        <div class="large">
                            <asp:Label ID="lbl_Blacklisted_Company" Font-Size="0.9em" runat="server" Text="0"></asp:Label></div>
                        <div class="text-muted">Total Bllacklisted Company</div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->
    </div>

    <%-- Chart Report --%>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Previous Years Placement Analysis of Student's Recruited

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
                    <div class="easypiechart" id="easypiechart-blue" data-percent="<%= int.Parse(lbl_Invitation_Ratio.Text.ToString()) %>">
                        <span class="percent">
                            <asp:Label ID="lbl_Invitation_Ratio" runat="server" Text="-"></asp:Label></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>Students Got Placed</h4>
                    <div class="easypiechart" id="easypiechart-orange" data-percent="<%= int.Parse(lbl_Student_Got_Placed.Text) %>">
                        <span
                            class="percent">
                            <asp:Label ID="lbl_Student_Got_Placed" runat="server" Text="-"></asp:Label></span>
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


    <script>
        var randomScalingFactor = function () { return Math.round(Math.random() * 50) };

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
