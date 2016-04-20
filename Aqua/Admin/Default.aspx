<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.Admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Administrator Only
        </h1>
        <div class="mainContainer-innerSpacer">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/EmployeeManagement/Default.aspx">Employee Management</asp:LinkButton><br />
            <br />
            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/ProductManagement/Default.aspx">Product Management</asp:LinkButton><br />
            <br />
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/UserManagement/Default.aspx"> User Management</asp:LinkButton><br />
            <br />
        </div>
    </div>
</asp:Content>
