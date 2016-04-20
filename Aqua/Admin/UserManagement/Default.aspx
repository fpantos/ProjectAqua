<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.Admin.UserManagement.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <div class="mainContainer-innerSpacer">
            <h2>
                Manage Users</h2>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/UserManagement/CreateUser.aspx">Create new User (With Roles)</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/UserManagement/DeleteUser.aspx">Delete User</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/UserManagement/EditRolesAssignedToUsers.aspx">Edit User and assigned Roles</asp:LinkButton><br /><br />
            <br />
        </div>
    </div>
</asp:Content>
