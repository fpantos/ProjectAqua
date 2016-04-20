<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="LowStock.aspx.cs" Inherits="Aqua.Reports.LowStock" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <CR:CrystalReportViewer ID="rptLowStock" runat="server" AutoDataBind="true" />
    </div>
</asp:Content>
