<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/Masterpage/LoggedIn.Master"
    CodeBehind="ShowAllProducts.aspx.cs" Inherits="Aqua.Admin.ProductManagement.ShowAllProducts" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            All Products</h1>
        <asp:UpdatePanel ID="panelSearch" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gShowProducts" runat="server" AutoGenerateColumns="false" OnSorting="gViewProducts_Sorting"
                    AllowSorting="true" CssClass="gridviewBaseStyle" OnRowDataBound="gViewSearchResults_RowDataBound"
                    AllowPaging="true" PageSize="20" OnPageIndexChanging="gridView_PageIndexChanging">
                    <RowStyle CssClass="gridviewRowStyle" />
                    <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                    <HeaderStyle CssClass="gridviewHeaderStyle-withSorting" />
                    <Columns>
                        <%--Product category--%>
                        <asp:TemplateField HeaderText="Category" SortExpression="ProductCategory">
                            <ItemTemplate>
                                <asp:Label ID="lblProductCategory" runat="server" Text='<%# bind("ProductCategory") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Product Code--%>
                        <asp:TemplateField HeaderText="Product Code" SortExpression="ProductCode">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkProductCode" runat="server" Text='<%# bind("ProductCode") %>'
                                    CommandArgument='<% # bind("ProductID") %>' OnCommand="lnkName_OnCommand"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--Product Description--%>
                        <asp:TemplateField HeaderText="Product Description" SortExpression="ProductDescription">
                            <ItemTemplate>
                                <asp:Label ID="lblProdDescription" runat="server" Text='<%# bind("ProductDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--Unit Cost--%>
                        <%--<asp:TemplateField HeaderText="Unit Cost" SortExpression="UnitCost">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitCost" runat="server" Text='<% # String.Format ("{0:c}", Eval("UnitCost") ) %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--unit price--%>
                        <%--<asp:TemplateField HeaderText="Unit Price" SortExpression="UnitPrice">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitPrice" runat="server"  Text='<% # String.Format ("{0:c}", Eval("UnitPrice") ) %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--Units On Hand--%>
                        <%--<asp:TemplateField HeaderText="Units On Hand" SortExpression="UnitsOnHand">
                            <ItemTemplate>
                                <asp:Label ID="lblUnitsOnHand" runat="server" Text='<%# bind("UnitsOnHand") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--Reorder Level--%>
                       <%-- <asp:TemplateField HeaderText="Re-Order Level" SortExpression="ReorderLevel">
                            <ItemTemplate>
                                <asp:Label ID="lblReorderLevel" runat="server" Text='<%# bind("ReorderLevel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--Manufacturer Name--%>
                        <asp:TemplateField HeaderText="Manufacturer Name" SortExpression="ManufacturerName">
                            <ItemTemplate>
                                <asp:Label ID="lblManufacturerName" runat="server" Text='<%# bind("ManufacturerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="IsDiscontinued">
                            <ItemTemplate>
                                <asp:Label ID="lblIsActive" runat="server" Text='<% # GetProductStatus(Eval("IsDiscontinued").ToString() ) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkProductStatusChanger" runat="server" CommandArgument='<%# bind("ProductID") %>'
                                    OnCommand="lnkProductStatusChanger_OnCommand" 
                                    OnClientClick="javascript: return confirm('Are you sure you want to proceed?')">link</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
