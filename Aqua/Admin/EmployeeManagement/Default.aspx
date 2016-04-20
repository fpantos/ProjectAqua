<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.Admin.EmployeeManagement.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <div class="mainContainer-innerSpacer">
            
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/EmployeeManagement/SearchEmployee.aspx">Search Employee</asp:LinkButton><br />
            <br />
            <asp:LinkButton ID="LinkButton4" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/EmployeeManagement/ShowAllEmployees.aspx">Show All Employees</asp:LinkButton><br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/EmployeeManagement/NewEmployee.aspx">Create new Employee</asp:LinkButton><br />
            <br />
            <asp:LinkButton ID="LinkButton5" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/EmployeeManagement/ManageJobTitle.aspx">Manage Job Position</asp:LinkButton>
        </div>
    </div>
</asp:Content>
