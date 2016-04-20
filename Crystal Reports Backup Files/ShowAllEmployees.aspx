<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" CodeBehind="ShowAllEmployees.aspx.cs"
    Inherits="Aqua.Admin.EmployeeManagement.ShowAllEmployees" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Search All Employee With Sorting Function</h1>
        <asp:UpdatePanel ID="panelSearch" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gViewEmployees" runat="server" AutoGenerateColumns="false" OnSorting="gViewEmployees_Sorting"
                    AllowSorting="true" CssClass="gridviewBaseStyle" OnRowDataBound="gViewSearchResults_RowDataBound">
                    <RowStyle CssClass="gridviewRowStyle" />
                    <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                    <HeaderStyle  CssClass="gridviewHeaderStyle-withSorting"/>
                    <Columns>
                        <%--accountid--%>
                        <asp:TemplateField HeaderText="Emp#" SortExpression="EmployeeID">
                            <ItemTemplate>
                                <asp:Label ID="lblEmployeeID" runat="server" Text='<%# bind("EmployeeID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Name--%>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# bind("Name") %>' CommandArgument='<% # bind("EmployeeID") %>'
                                    OnCommand="lnkName_OnCommand"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--Job Title--%>
                        <asp:TemplateField HeaderText="Job Title" SortExpression="PositionName">
                            <ItemTemplate>
                                <asp:Label ID="lblJobTitle" runat="server" Text='<%# bind("PositionName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--email--%>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# bind("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--home address--%>
                        <asp:TemplateField HeaderText="Home Address" SortExpression="[home address]">
                            <ItemTemplate>
                                <asp:Label ID="lblHomeAddress" runat="server" Text='<%# bind("[home address]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--HomePhone--%>
                        <asp:TemplateField HeaderText="HomePhone" SortExpression="HomePhone">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# bind("HomePhone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="IsEmployed">
                            <ItemTemplate>
                                <asp:Label ID="lblIsActive" runat="server" Text='<% # GetEmployeeStatus(Eval("isEmployed").ToString() ) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEmployeeStatusChanger" runat="server" CommandArgument='<%# bind("EmployeeID") %>'
                                    OnCommand="lnkEmployeeStatusChanger_OnCommand" OnClientClick="javascript: return confirm('Are you sure you want to proceed?')">LinkButton</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
