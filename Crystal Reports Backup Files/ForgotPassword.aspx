<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="ForgotPassword.aspx.cs" Inherits="Aqua.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavigationPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainContainer">
        <h1>
            Forgot password?</h1>
        <div class="mainContainer-innerSpacer">
            <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" OnSendingMail="PasswordRecovery1_SendingMail">
                <MailDefinition From="bata.reiner@gmail.com" Priority="High" Subject="Your password has been reset">
                </MailDefinition>
            </asp:PasswordRecovery>
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CssClass="div-navigation-linkbutton"
                PostBackUrl="~/Default.aspx">Cancel and return to Log In</asp:LinkButton>
        </div>
    </div>
</asp:Content>
