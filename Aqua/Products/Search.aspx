<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="Aqua.Products.Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Search product</h1>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <p>
                    <asp:DropDownList ID="ddlSearchCriteria" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchCriteria_SelectedIndexChanged">
                        <asp:ListItem Selected="true">Select a criteria</asp:ListItem>
                        <%--  <asp:ListItem Value="by_productID">By Product ID</asp:ListItem>--%>
                        <asp:ListItem Value="by_productCode">By Product Code</asp:ListItem>
                        <asp:ListItem Value="by_desc">By Description</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtSearchInput" runat="server" Width="300px"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="txtSearchInput_AutoCompleteExtender" runat="server"
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
                        CssClass="gridviewBaseStyle" OnRowDataBound="gviewProductSearchResult_RowDataBound">
                        <RowStyle CssClass="gridviewRowStyle" />
                        <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                        <HeaderStyle CssClass="gridviewHeaderStyle" />
                        <Columns>
                            <%--product ID--%>
                            <%--                            <asp:TemplateField HeaderText="Product ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<% # bind("ProductID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--product code--%>
                            <asp:TemplateField HeaderText="Product Code">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<% # bind("ProductCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--product description--%>
                            <asp:TemplateField HeaderText=" Description">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<% # bind("ProductDescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--manufacturer--%>
                            <asp:TemplateField HeaderText="Manufacturer">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<% # bind("ManufacturerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--product code--%>
                            <%--                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<% # bind("ProductCategory") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--units in stock--%>
                            <asp:TemplateField HeaderText="In Stock">
                                <ItemTemplate>
                                    <asp:Label ID="lblUnitsOnHand" runat="server" Text='<% # PrepareNullForDisplay( Eval("UnitsOnHand").ToString() ) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--unit price--%>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<% # String.Format ("{0:c}", Eval("UnitPrice") ) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--add to order--%>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkAddProductToOrder" runat="server" OnCommand="lnkAddProductToOrder_OnCommand"
                                        CommandArgument='<% # bind("ProductID") %>'>Add Product</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--view more product details--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkGoToViewProductDetails" runat="server" OnCommand="lnkGoToViewProductDetails_OnCommand"
                                        CommandArgument='<% # bind("ProductID") %>'>More Details</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
