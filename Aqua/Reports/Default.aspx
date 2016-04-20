<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.Reports.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <div class="mainContainer-innerSpacer" style="background-image: url('../Images/chart_bar1.png');
            background-repeat: no-repeat; background-position: center;">
            <asp:Panel ID="Panel3" runat="server">
                <h2>
                    Accounts</h2>
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Reports/AccountWithNPB.aspx">Accounts with NPB</asp:LinkButton>
            </asp:Panel>
            <br />
            <asp:Panel ID="Panel2" runat="server">
                <h2>
                    Products</h2>
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Reports/LowInStock.aspx">Understock Products</asp:LinkButton>
            </asp:Panel>
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <h2>
                    Sales</h2>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Reports/SalesByMonth.aspx">Current Year Sales by Month</asp:LinkButton><br />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Reports/SalesReportWithRange.aspx">Sales by Date Range</asp:LinkButton>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
