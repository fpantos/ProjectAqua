<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="View.aspx.cs" Inherits="Aqua.Products.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Product Details</h1>
        <div class="mainContainer-innerSpacer">
            <asp:DetailsView ID="dviewProduct" runat="server" Height="80%" Width="90%" AutoGenerateRows="false"
                DefaultMode="ReadOnly">
                <FieldHeaderStyle CssClass="dviewFieldHeaderStyle-basic" />
                <RowStyle CssClass="dviewRowStyle-basic" />
                <AlternatingRowStyle CssClass="dviewAlternatingStyle-basic" />
                <Fields>
                    <%--                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<% # bind("productID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Product Code">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<% # bind("productCode") %>' Font-Bold="true"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Description">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<% # bind("productDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--category--%>
                    <asp:TemplateField HeaderText="Product Category">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<% # bind("productCategory") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<% # String.Format ("{0:c}", Eval("UnitPrice") ) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manufacturer">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<% # bind("manufacturerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--on hand--%>
                    <asp:TemplateField HeaderText="In Stock">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<% # bind("unitsOnHand") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
        <br />
        <br />
        <br />
        <div class="mainContainer-innerSpacer">
            <h2>
                Related Products</h2>
            <asp:GridView ID="gviewRelatedProducts" runat="server" AutoGenerateColumns="false"
                CssClass="gridviewBaseStyle">
                <HeaderStyle CssClass="gridviewHeaderStyle" />
                <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                <RowStyle CssClass="gridviewRowStyle" />
                <Columns>
                    <asp:TemplateField HeaderText="Product Code">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<% # bind("productCode")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<% # bind("productDescription")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manufacturer">
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<% # bind("manufacturerName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkViewSubProduct"  CausesValidation="false" OnCommand="lnkViewSubProduct_OnCommand" 
                            CommandArgument='<% # bind("productID")%>' runat="server">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="div-navigation-linkbutton">
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Products/Search.aspx"
                CssClass="linkStyle">Back</asp:LinkButton>
        </div>
    </div>
</asp:Content>
