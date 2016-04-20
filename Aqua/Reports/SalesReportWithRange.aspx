<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="SalesReportWithRange.aspx.cs" Inherits="Aqua.Reports.SalesReportWithRange" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Sales Report with range
        </h1>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="From"></asp:Label>&nbsp
                        <asp:DropDownList ID="ddlFromMonth" runat="server" AutoPostBack="true">
                        </asp:DropDownList>
                        &nbsp
                        <asp:DropDownList ID="ddlFromYear" runat="server" AutoPostBack="true">
                            <asp:ListItem>2002</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp
                        <asp:Label ID="Label2" runat="server" Text="To"></asp:Label>&nbsp
                        <asp:DropDownList ID="ddlToMonth" runat="server" AutoPostBack="true">
                        </asp:DropDownList>
                        &nbsp
                        <asp:DropDownList ID="ddlToYear" runat="server" AutoPostBack="true">
                        </asp:DropDownList>
                        &nbsp
                        <%--                        <asp:LinkButton ID="lnkGenerateReport" OnClick="lnkGenerateReport_OnClick" runat="server"
                            CssClass="linkStyle">Generate</asp:LinkButton>--%>
                    </div>
                    <div>
                        <CR:CrystalReportViewer ID="rptSalesByDateRange" runat="server" AutoDataBind="true"
                            DisplayStatusbar="False" HasCrystalLogo="False" HasDrilldownTabs="False" HasDrillUpButton="False"
                            HasSearchButton="False" HasToggleGroupTreeButton="False" HasToggleParameterPanelButton="False"
                            HasZoomFactorList="False" ToolPanelView="None" ToolPanelWidth="200px" PageZoomFactor="80"
                            HasRefreshButton="False" PrintMode="ActiveX" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
