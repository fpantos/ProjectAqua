<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Aqua.Admin.ProductManagement.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <div class="mainContainer-innerSpacer">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/ProductManagement/AddProduct.aspx">Add new Product</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton4" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/ProductManagement/SearchProduct.aspx">Search Product</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/ProductManagement/ShowAllProducts.aspx">Show All Products</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="linkbutton-no-line" PostBackUrl="~/Admin/ProductManagement/ManageProductCategory.aspx">Manage Product Category</asp:LinkButton>
        </div>
    </div>
</asp:Content>
