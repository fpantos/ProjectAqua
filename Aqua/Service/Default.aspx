<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.Service.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <div class="mainContainer-innerSpacer">
            <img src="../Images/tools.png" alt="new service work" width="40" height="40" />&nbsp
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Accounts/SearchAccount.aspx">Create New Service Work</asp:LinkButton>
        </div>
    </div>
</asp:Content>
