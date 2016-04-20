<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="WebForm1.aspx.cs" Inherits="Aqua.Reports.WebForm1" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            hi</h1>
        <div class="mainContainer-innerSpacer">
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
                DisplayStatusbar="False" HasCrystalLogo="False" HasDrilldownTabs="False" HasDrillUpButton="False"
                HasSearchButton="False" HasToggleGroupTreeButton="False" HasToggleParameterPanelButton="False"
                HasZoomFactorList="False" ToolPanelView="None" ToolPanelWidth="200px" HasRefreshButton="True" />
        </div>
    </div>
</asp:Content>
