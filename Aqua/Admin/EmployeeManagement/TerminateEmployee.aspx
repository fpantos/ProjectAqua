<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="True"
    CodeBehind="TerminateEmployee.aspx.cs" Inherits="Aqua.Admin.EmployeeManagement.TerminateEmployee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <asp:GridView ID="gviewEmployees" runat="server" AutoGenerateColumns="false" 
            Width="35%" onrowdeleting="gviewEmployee_RowDeleting">
            <Columns>
                        <%--employeeid--%>
                        <asp:TemplateField HeaderText="Acc#">
                            <ItemTemplate>
                                <asp:Label ID="lblEmployeeId" runat="server" Text='<%# bind("employeeID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--Name--%>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                    <asp:LinkButton id="lnkTerminateEmployee" runat="server" CommandArgument='<% # bind("employeeID") %>'
                    CommandName="Delete">Terminate</asp:LinkButton>
                    </ItemTemplate>
                    
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
