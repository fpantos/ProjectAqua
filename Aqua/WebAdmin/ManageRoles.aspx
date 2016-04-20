<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="ManageRoles.aspx.cs" Inherits="Aqua.Admin.UserManagement.ManageRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
    <h1>Manage Roles</h1>
        <div class="mainContainer-innerSpacer">
            <asp:Label ID="Label1" runat="server" Text="Enter Role"></asp:Label>
            <asp:TextBox ID="txtNewRole" runat="server"></asp:TextBox>
            <asp:Button ID="btnCreateRole" runat="server" Text="Create Role" OnClick="btnCreateRole_Click" />
            <div ><br />
                <asp:GridView ID="gviewRoleList" runat="server" AutoGenerateColumns="false" Width="35%"
                    OnRowDeleting="gviewRoleList_RowDeleting" CssClass="gridviewBaseStyle" 
                    onrowdatabound="gviewRoleList_RowDataBound">
                    <HeaderStyle  CssClass="gridviewHeaderStyle"/>
                    <RowStyle CssClass="gridviewRowStyle" />
                    <AlternatingRowStyle  CssClass="gridviewAlternatingStyle"/>
                    <Columns>
                        <%-- Roles--%>
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label ID="lblRoleName" runat="server" Text='<% # Container.DataItem %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--delete--%>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" OnClientClick="javascript: return confirm('Are you sure you want to delete?');"
                                    CausesValidation="false">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
