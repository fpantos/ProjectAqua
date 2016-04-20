<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="EditRolesAssignedToUsers.aspx.cs" Inherits="Aqua.Admin.UserAndRoleManagement.EditRolesAssignedToUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Roles by User</h1>
        <div class="mainContainer-innerSpacer">
            <asp:Label ID="Label1" runat="server" Text="Select user: "></asp:Label>
            <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUsers_OnSelectedIndexChanged"
                DataTextField="UserName" DataValueField="UserName">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Roles"></asp:Label><br />
            <asp:Repeater ID="rptrRoles" runat="server">
                <ItemTemplate>
                    <asp:CheckBox ID="chkRole" runat="server" AutoPostBack="true" Text='<% # Container.DataItem %>'
                        OnCheckedChanged="chkRole_OnCheckedChanged" />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </div>
</asp:Content>
