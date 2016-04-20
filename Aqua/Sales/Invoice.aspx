<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Aqua.Sales.Invoice" 
    MasterPageFile="~/Masterpage/LoggedIn.master" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <CR:CrystalReportViewer ID="rptInvoice" runat="server" AutoDataBind="true"
            DisplayStatusbar="False" HasCrystalLogo="False" HasDrilldownTabs="False" HasDrillUpButton="False"
            HasSearchButton="False" HasToggleGroupTreeButton="False" HasToggleParameterPanelButton="False"
            HasZoomFactorList="False" ToolPanelView="None" ToolPanelWidth="200px" HasRefreshButton="True"
            PageZoomFactor="80" />
    </div>
    <br /><br />
    <%--<div class="div-navigation-linkbutton">
        <asp:LinkButton ID="lnkCreateAnotherSale" runat="server" OnClick="lnkCreateAnotherSale_OnClick"
            CssClass="linkStyle" CausesValidation="false">Create another Sale</asp:LinkButton>
    </div>--%>
</asp:Content>