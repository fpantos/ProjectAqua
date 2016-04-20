<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="DeleteUser.aspx.cs" Inherits="Aqua.Admin.UserAndRoleManagement.DeleteUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
    <h1>Delete User</h1>
        <div class="mainContainer-innerSpacer">
            <asp:GridView ID="gviewUsers" runat="server" AutoGenerateColumns="false" Width="40%"
                OnRowDeleting="gviewUsers_RowDeleting" CssClass="gridviewBaseStyle">
                <AlternatingRowStyle  CssClass="gridviewAlternatingStyle"/>
                <RowStyle  CssClass="gridviewRowStyle"/>
                <HeaderStyle  CssClass="gridviewHeaderStyle"/>
                <Columns>
                    <asp:TemplateField HeaderText="Users">
                        <ItemTemplate>
                            <asp:Label ID="lblUser" runat="server" Text='<%# Container.DataItem %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDeleteUser" runat="server" CommandName="Delete" CausesValidation="false"
                                OnClientClick="javascript: return confirm('Are you sure you want to delete?');">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
