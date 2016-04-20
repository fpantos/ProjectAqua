<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="SearchProduct.aspx.cs" Inherits="Aqua.Admin.ProductManagement.SearchProduct" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Search product here</h1>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <p>
                    <asp:DropDownList ID="ddlSearchCriteria" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchCriteria_SelectedIndexChanged">
                        <asp:ListItem Selected="true">Select a criteria</asp:ListItem>
                        <asp:ListItem Value="by_productCode">By Product Code</asp:ListItem>
                        <%--<asp:ListItem Value="by_productID">By Product ID</asp:ListItem>--%>
                        <asp:ListItem Value="by_desc">By Description</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtSearchInput" runat="server" Width="300px"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="txtSearchInput_AutoCompleteExtender1" runat="server"
                        TargetControlID="txtSearchInput" MinimumPrefixLength="1" ServiceMethod="GetProductSearchItems"
                        UseContextKey="true" ContextKey="by_productID" ServicePath="~/WebService/AutoComplete.asmx"
                        CompletionSetCount="12" EnableCaching="true">
                    </asp:AutoCompleteExtender>
                    <asp:Button ID="btnSearchProduct" runat="server" Text="Search" OnClick="btnSearchProduct_Click" />
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </p>
                <br />
                <br />
                <br />
                <div>
                    <asp:GridView ID="gviewProductSearchResult" runat="server" AutoGenerateColumns="false"
                        AllowPaging="true" AllowSorting="true" CssClass="gridviewBaseStyle" PageSize="20"
                        OnPageIndexChanging="gridView_PageIndexChanging" OnSorting="gViewProducts_Sorting"
                        OnRowDataBound="gViewSearchResults_RowDataBound">
                        <RowStyle CssClass="gridviewRowStyle" />
                        <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                        <HeaderStyle CssClass="gridviewHeaderStyle-withSorting" />
                        <Columns>
                            <%--product ID--%>
<%--                            <asp:TemplateField HeaderText="Product ID" SortExpression="ProductID">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<% # bind("ProductID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--product category--%>
                            <%--                            <asp:TemplateField HeaderText="Product Category" SortExpression="ProductCategory">
                                <ItemTemplate>
                                    <asp:Label ID="Label22" runat="server" Text='<% # bind("ProductCategory") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--product code--%>
                            <asp:TemplateField HeaderText="Product Code" SortExpression="ProductCode">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkProductCode" runat="server" Text='<%# bind("ProductCode") %>'
                                        CommandArgument='<% # bind("ProductID") %>' OnCommand="lnkName_OnCommand"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--product description--%>
                            <asp:TemplateField HeaderText="Product Description" SortExpression="ProductDescription">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<% # bind("ProductDescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Unit Cost--%>
                            <asp:TemplateField HeaderText="Unit Cost" SortExpression="UnitCost">
                                <ItemTemplate>
                                    <asp:Label ID="Label44" runat="server" Text='<% # String.Format ("{0:c}", Eval("UnitCost") ) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Unit Price--%>
                            <asp:TemplateField HeaderText="Unit Price" SortExpression="UnitPrice">
                                <ItemTemplate>
                                    <asp:Label ID="Label45" runat="server" Text='<% # String.Format ("{0:c}", Eval("UnitPrice") ) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Units On Hand--%>
                            <asp:TemplateField HeaderText="Units On Hand" SortExpression="UnitsOnHand">
                                <ItemTemplate>
                                    <asp:Label ID="lblUnitsOnHand" runat="server" Text='<% # PrepareNullForDisplay( Eval("UnitsOnHand").ToString() ) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--manufacturer--%>
                            <asp:TemplateField HeaderText="Manufacturer" SortExpression="ManufacturerName">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<% # bind("ManufacturerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--Re-order level--%>
                            <%--                            <asp:TemplateField HeaderText="Re-Order level" SortExpression="ReorderLevel">
                                <ItemTemplate>
                                    <asp:Label ID="Label55" runat="server" Text='<% # bind("ReorderLevel") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--product code--%>
                            <%--<asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<% # bind("ProductCategory") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--Is discontinued--%>
                            <asp:TemplateField HeaderText="Status" SortExpression="IsDiscontinued">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsActive" runat="server" Text='<% # GetProductStatus(Eval("IsDiscontinued").ToString() ) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkProductStatusChanger" runat="server" CommandArgument='<%# bind("ProductID") %>'
                                        OnCommand="lnkProductStatusChanger_OnCommand" OnClientClick="javascript: return confirm('Are you sure you want to proceed?')">LinkButton</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
