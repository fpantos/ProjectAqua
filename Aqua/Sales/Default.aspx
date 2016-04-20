<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.Sales.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <div class="mainContainer-innerSpacer">
            <img src="../Images/scope.png" alt="search" />&nbsp
            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Sales/SearchInvoice.aspx"
                CssClass="linkbutton-no-line">Search</asp:LinkButton>
            <br />
            <br />
            <img src="../Images/new.png" alt="new" />&nbsp
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Sales/New.aspx" CssClass="linkbutton-no-line">Create New</asp:LinkButton>
        </div>
    </div>
</asp:Content>
