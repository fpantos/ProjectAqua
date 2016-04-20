<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="SalesByMonth.aspx.cs" Inherits="Aqua.Reports.SalesByMonth" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            YTD Sales</h1>
        <CR:CrystalReportViewer ID="rptVwrSalesByCurrentYear" runat="server" AutoDataBind="true"
            DisplayStatusbar="False" HasCrystalLogo="False" HasDrilldownTabs="False" HasDrillUpButton="False"
            HasSearchButton="False" HasToggleGroupTreeButton="False" HasToggleParameterPanelButton="False"
            HasZoomFactorList="True" ToolPanelView="None" ToolPanelWidth="200px" HasRefreshButton="True"
            PageZoomFactor="80"  PrintMode="ActiveX" />
    </div>
</asp:Content>
