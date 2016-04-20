<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.Accounts.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="mainContentPlaceHolder">
    <div class="mainContainer">
        <div class="mainContainer-innerSpacer">
            <img src="../Images/scope.png" alt="search" />&nbsp
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Accounts/SearchAccount.aspx">Search</asp:LinkButton>
            <br />
            <br />
            <img src="../Images/new_user.png" alt="new" />
            &nbsp<asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Accounts/NewAccount.aspx"
                CssClass="linkbutton-no-line">Create a New Account</asp:LinkButton>
        </div>
    </div>
</asp:Content>
