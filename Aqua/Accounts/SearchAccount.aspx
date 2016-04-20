<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" AutoEventWireup="true"
    CodeBehind="SearchAccount.aspx.cs" Inherits="Aqua.Accounts.SearchAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Search Account</h1>
            <asp:UpdatePanel ID="panelSearch" runat="server">
                <ContentTemplate>
                    <p>
                        <asp:DropDownList ID="ddlSearchAccount" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSearchAccount_SelectedIndexChanged">
                            <asp:ListItem>Select a criteria</asp:ListItem>
                            <asp:ListItem Value="By_Lastname">By Last Name</asp:ListItem>
                            <asp:ListItem Value="By_Firstname">By First Name</asp:ListItem>
                            <asp:ListItem Value="By_Homephone">By Home Phone</asp:ListItem>
                            <asp:ListItem Value="By_Address">By Address</asp:ListItem>
                            <asp:ListItem Value="By_AccountID">By AccountID</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtInput" runat="server" Width="300px" MaxLength="40"></asp:TextBox>
                        <asp:AutoCompleteExtender ID="txtInput_AutoCompleteExtender" runat="server" TargetControlID="txtInput"
                            MinimumPrefixLength="1" ServiceMethod="GetSearchItems" UseContextKey="true" ContextKey="by_accountID"
                            ServicePath="~/WebService/AutoComplete.asmx" CompletionSetCount="8" EnableCaching="true">
                        </asp:AutoCompleteExtender>
                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtInput"
                            WatermarkText="Enter keywords here . . ." WatermarkCssClass="watermarked">
                        </asp:TextBoxWatermarkExtender>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </p>
                    <p>
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="lblSearchResultCount" runat="server"></asp:Label>
                    </p>
                    <br />
                    <asp:GridView ID="gViewSearchResults" runat="server" AutoGenerateColumns="false"
                        AllowSorting="true" CssClass="gridviewBaseStyle" OnRowDataBound="gViewSearchResults_RowDataBound">
                        <HeaderStyle CssClass="gridviewHeaderStyle" />
                        <RowStyle CssClass="gridviewRowStyle" />
                        <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                        <Columns>
                            <%--accountid--%>
                            <asp:TemplateField HeaderText="Account#">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# bind("accountID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Name--%>
                            <asp:TemplateField HeaderText="Last Name">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkName" runat="server" Text='<%# bind("lastname") %>' CommandArgument='<% # bind("accountID") %>'
                                        OnCommand="lnkName_OnCommand" CssClass="linkbutton-no-line"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Firstname--%>
                            <asp:TemplateField HeaderText="First Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblFirstname" runat="server" Text='<% # bind("firstname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--home address--%>
                            <asp:TemplateField HeaderText="Home Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblHomeAddress" runat="server" Text='<%# bind("[home address]") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--homephone--%>
                            <asp:TemplateField HeaderText="Home Phone">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# FormatPhonenumber( Eval("homephone").ToString() )  %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--is active--%>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccountStatus" runat="server" Text='<% # GetAccountStatus(Eval("isactive").ToString() ) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Deactivate/Activate--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkAccountStatusChanger" runat="server" CommandArgument='<%# bind("accountID") %>'
                                        OnCommand="lnkAccountStatusChanger_OnCommand" OnClientClick="javascript: return confirm('Are you sure you want to proceed?')">LinkButton</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
</asp:Content>
