<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="Aqua.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Change password here</h1>
        <p>
            <asp:ChangePassword ID="changeUserPassword" runat="server" 
                CancelDestinationPageUrl="~/UserSettings/Default.aspx" 
                ContinueDestinationPageUrl="~/UserSettings/Default.aspx" 
                PasswordLabelText="Current Password:">
            </asp:ChangePassword>
        </p>
      
    </div>
</asp:Content>
