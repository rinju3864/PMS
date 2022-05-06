<%@ Page Title="" Language="C#" MasterPageFile="~/Company Module/Company_MasterPage.Master" AutoEventWireup="true" CodeBehind="Company_Alerts.aspx.cs" Inherits="Placement_Management_System.Company_Module.Company_Alerts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Message {
            font-family: Montserrat !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div style="margin-top:24% !important;">
            <asp:Label ID="lbl_Message" runat="server" CssClass="Message" Text="" Visible="false" Font-Bold="True" ForeColor="#1F1847" Font-Size="XX-Large"></asp:Label>
        </div>
     </center>

    <div style="margin-top:-21% !important;">
        <asp:Repeater ID="rpt_Alerts" runat="server">

            <ItemTemplate>
                <div style="border: 3px solid black !important; padding: 20px; margin: 40px; border-radius: 30px; box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75); font-size: 22px; font-family: Montserrat !important;">
                    <b style="color: red;">Subject : &nbsp;&nbsp;</b>
                    <asp:Label ID="lbl_Alert_Subject" runat="server" Text='<%#Eval("Subject") %>'></asp:Label>
                    <br />
                    <br />
                    <b style="color: red;">Message : &nbsp;</b>
                    <div style="height: auto; width: 88%; padding: 0px; display: inline-flex; text-align: justify;">

                        <asp:Label ID="lbl_Alert_Body" runat="server" Text='<%#Eval("Message") %>'></asp:Label>
                    </div>
                    <br />
                    <br />
                    <b style="color: red;">Alert Time : &nbsp;</b>
                    <asp:Label ID="lbl_Alert_Time" runat="server" Text='<%# Convert.ToDateTime(Eval("Alert_Time")).ToString("dd-MM-yyyy   hh:mm:ss") %>'></asp:Label>

                </div>
            </ItemTemplate>
            <SeparatorTemplate>
            </SeparatorTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
