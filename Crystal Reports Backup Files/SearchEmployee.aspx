<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="True" 
CodeBehind="SearchEmployee.aspx.cs" Inherits="Aqua.Admin.EmployeeManagement.SearchEmployee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Search Employee</h1>
        <asp:UpdatePanel ID="panelSearch" runat="server">
            <ContentTemplate>
                <p>
                    <asp:DropDownList ID="ddlSearchEmployee" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSearchEmployee_SelectedIndexChanged">
                        <asp:ListItem>Select a criteria</asp:ListItem>
                        <asp:ListItem Value="By_Lastname">By Last Name</asp:ListItem>
                        <asp:ListItem Value="By_EmployeeID">By Employee ID</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtInput" runat="server" Width="200px"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txtInput" WatermarkText="Enter Keywords here . . . ">
                    </asp:TextBoxWatermarkExtender>

                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    <asp:Label ID="lblMessage" runat="server" ></asp:Label>
                </p>
                <p>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="lblSearchResultCount" runat="server"></asp:Label>
                </p>
                <br />
                <asp:GridView ID="gViewSearchResults" runat="server" AutoGenerateColumns="false" 
                    AllowSorting="true" CssClass="gridviewBaseStyle" 
                    onrowdatabound="gViewSearchResults_RowDataBound">
                    <RowStyle  CssClass="gridviewRowStyle"/>
                    <AlternatingRowStyle  CssClass="gridviewAlternatingStyle"/>
                    <HeaderStyle CssClass="gridviewHeaderStyle" />

                    <Columns>
                        <%--EmployeeID--%>
                        <asp:TemplateField HeaderText="Emp#" >
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# bind("EmployeeID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Name--%>
                        <asp:TemplateField HeaderText="Name" >
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkName" runat="server" Text='<%# bind("Name") %>' 
                                    CommandArgument='<% # bind("EmployeeID") %>' OnCommand="lnkName_OnCommand" 
                                     CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--Job Title--%>
                        <asp:TemplateField HeaderText="Job Title" >
                            <ItemTemplate>
                                <asp:Label ID="lnkJobTitle" runat="server" Text='<% # bind("PositionName") %>'  ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--Gender--%>
                        <%--<asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Label ID="lblGender" runat="server" Text='<% # bind("gender") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--email--%>
                        <asp:TemplateField HeaderText="Email" >
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# bind("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--home address--%>
                        <asp:TemplateField HeaderText="Home Address" >
                            <ItemTemplate>
                                <asp:Label ID="lblHomeAddress" runat="server" Text='<%# bind("[home address]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--HomePhone--%>
                        <asp:TemplateField HeaderText="Home Phone" >
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# bind("HomePhone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--is employed--%>
                        <asp:TemplateField HeaderText="Status" >
                            <ItemTemplate>
                                <asp:Label ID="lblIsActive" runat="server" Text='<% # GetEmployeeStatus(Eval("isEmployed").ToString() ) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEmployeeStatusChanger" runat="server" CommandArgument='<%# bind("EmployeeID") %>' 
                                OnCommand="lnkEmployeeStatusChanger_OnCommand"  OnClientClick="javascript: return confirm('Are you sure you want to proceed?')">LinkButton</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
