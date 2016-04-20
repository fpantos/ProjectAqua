<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.WebAdmin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <div class="mainContainer-innerSpacer">
            <h2>Manage Roles</h2>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/WebAdmin/ManageRoles.aspx">Create/Delete Roles</asp:LinkButton>
        
        </div>
    </div>
</asp:Content>
