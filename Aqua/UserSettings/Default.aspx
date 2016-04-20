<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.UserSettings.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            User settings</h1>
        <div class="mainContainer-innerSpacer">
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/UserSettings/ChangePassword.aspx">Change password</asp:LinkButton>
        </div>
    </div>
</asp:Content>
