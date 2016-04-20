<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchInvoice.aspx.cs" 
    MasterPageFile="~/Masterpage/LoggedIn.master" Inherits="Aqua.Sales.SearchInvoice" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
<div class="mainContainer">
    <h1>
        Search Invoice</h1>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p>
                <asp:DropDownList ID="ddlSearchCriteria" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchCriteria_SelectedIndexChanged">
                    <asp:ListItem Selected="true">Select a criteria</asp:ListItem>
                    <asp:ListItem Value="by_invoiceID">By Invoice ID</asp:ListItem>
                    <asp:ListItem Value="by_customer">By Last Name</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtSearchInput" runat="server" Width="300px"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="txtSearchInput_AutoCompleteExtender" runat="server"
                        TargetControlID="txtSearchInput" MinimumPrefixLength="1" ServiceMethod="GetInvoiceSearchItems"
                        UseContextKey="true" ContextKey="by_InvoiceID" ServicePath="~/WebService/AutoComplete.asmx"
                        CompletionSetCount="12" EnableCaching="true">
                    </asp:AutoCompleteExtender>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    
                </p>
                <br />
                <br />
                <br />
                <asp:Label ID="lblSearchResultCount" runat="server"></asp:Label>
                <div>
                    <asp:GridView ID="gviewInvoiceSearchResult" runat="server" AutoGenerateColumns="false"
                        CssClass="gridviewBaseStyle" >
                        <RowStyle CssClass="gridviewRowStyle" />
                        <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                        <HeaderStyle CssClass="gridviewHeaderStyle" />
                        <Columns>
                            <%--product ID--%>
                            <asp:TemplateField HeaderText="Invoice ID" SortExpression="InvoiceID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkInvoiceID" runat="server" Text='<%# bind("InvoiceID") %>'
                                        CommandArgument='<% # bind("InvoiceID") %>' OnCommand="lnkName_OnCommand"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--First Name--%>
                            <asp:TemplateField HeaderText="Customer Name" SortExpression="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<% # bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Last Name--%>
                            <%--<asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastName" runat="server" Text='<% # bind("LastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--Total Price--%>
                            <asp:TemplateField HeaderText="Total Amount" SortExpression="TotalAmount">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalAmount" runat="server" Text='<% # String.Format ("{0:c}", Eval("TotalAmount") ) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            </Columns>
                    </asp:GridView>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>                
</asp:Content>