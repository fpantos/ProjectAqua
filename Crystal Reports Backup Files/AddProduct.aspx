<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="AddProduct.aspx.cs" Inherits="Aqua.Admin.ProductManagement.AddProduct" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Add Product</h1>
        <asp:Panel ID="Panel1" runat="server" CssClass="panel-formview">
            <asp:Label ID="lblMainProductMessage" runat="server"></asp:Label>
            <asp:FormView ID="fviewProduct" runat="server" DefaultMode="Insert" CssClass="formView-input"
                OnPageIndexChanging="fviewProduct_PageIndexChanging">
                <InsertItemTemplate>
                    <%--category--%>
                    <p>
                        <asp:Label ID="Label3" runat="server" Text="Product Category" CssClass="propertyLabel"></asp:Label>
                        <asp:SqlDataSource ID="dsProdCategory" runat="server" ConnectionString="<%$ ConnectionStrings:myConnection %>"
                            SelectCommand="SELECT [CategoryName] FROM [ProductCategory] order by [CategoryName]">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="ddlProductCategory" runat="server" DataSourceID="dsProdCategory"
                            DataTextField="CategoryName" DataValueField="CategoryName" CssClass="propertyValue" 
                             AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:Label ID="Label14" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlProductCategory"
                            ErrorMessage="Please enter the Product Category" Display="Dynamic"></asp:RequiredFieldValidator>
                    </p>
                    <%--Product Code--%>
                    <p>
                        <asp:Label ID="Label12" runat="server" Text="Product Code" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtProductCode" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label15" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductCode"
                            ErrorMessage="Please enter the Product Code" Display="Static"></asp:RequiredFieldValidator>
                    </p>
                    <%--Description--%>
                    <p>
                        <asp:Label ID="Label2" runat="server" Text="Product Description" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtProdDescription" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label16" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProdDescription"
                            ErrorMessage="Please enter the Product Description" Display="Dynamic"></asp:RequiredFieldValidator>
                    </p>
                    <%--UnitCost--%>
                    <p>
                        <asp:Label ID="Label4" runat="server" Text="Unit Cost" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtUnitCost" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label17" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUnitCost"
                            ErrorMessage="Please enter the Unit Cost" Display="Dynamic"> </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUnitCost"
                            ErrorMessage="You must enter a valid Unit Cost" Display="Dynamic" ValidationExpression="^\d+(\.\d\d)?$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <%--UnitPrice--%>
                    <p>
                        <asp:Label ID="Label5" runat="server" Text="Unit Price" CssClass="propertyLabel"></asp:Label><asp:TextBox
                            ID="txtUnitPrice" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label18" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUnitPrice"
                            ErrorMessage="Please enter the Unit Price" Display="Dynamic"> </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtUnitPrice"
                            ErrorMessage="You must enter a valid Unit Price" Display="Dynamic" ValidationExpression="^\d+(\.\d\d)?$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <%--UnitsOnHand--%>
                    <p>
                        <asp:Label ID="Label6" runat="server" Text="Units on hand" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtUnitsOnHand" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers"
                            TargetControlID="txtUnitsOnHand">
                        </asp:FilteredTextBoxExtender>
                    </p>
                    <%--ReorderLevel--%>
                    <p>
                        <asp:Label ID="Label7" runat="server" Text="Reorder Level" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtReorderLevel" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers"
                            TargetControlID="txtReorderLevel">
                        </asp:FilteredTextBoxExtender>
                    </p>
                    <%--ManufacturerName--%>
                    <p>
                        <asp:Label ID="Label8" runat="server" Text="Manufacturer" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtManufacturerName" runat="server" CssClass="propertyValue"></asp:TextBox>
                    </p>
                    <%--ItemUrl--%>
                    <p>
                        <asp:Label ID="Label9" runat="server" Text="Item URL" CssClass="propertyLabel"></asp:Label><asp:TextBox
                            ID="txtItemUrl" runat="server" CssClass="propertyValue"></asp:TextBox>
                    </p>
                    <%--tax exempt--%>
                    <p>
                        <asp:Label ID="Label20" runat="server" Text="Is Tax exempt?" CssClass="propertyLabel"></asp:Label>
                        <asp:RadioButtonList ID="RadioButtonList1" Font-Size="0.8em" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="true" runat="server" Text="Yes"></asp:ListItem>
                            <asp:ListItem Selected="True" runat="server" Value="false" Text="No"></asp:ListItem>
                        </asp:RadioButtonList>
                    </p>
                    <%--is sub product--%>
                    <p>
                        <asp:Label ID="Label19" runat="server" Text="Is this part a sub-product?" CssClass="propertyLabel"></asp:Label>
                        <asp:RadioButtonList ID="rbtnIsSubProduct" Font-Size="0.8em" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="true" runat="server" Text="Yes"></asp:ListItem>
                            <asp:ListItem Selected="True" runat="server" Value="false" Text="No"></asp:ListItem>
                        </asp:RadioButtonList>
                    </p>
                    <%--contain replacement parts--%>
                    <p>
                        <asp:Label ID="Label13" runat="server" Text="Do you want to associate replacement Parts on this product?"
                            CssClass="propertyLabel"></asp:Label>
                        <asp:RadioButtonList ID="rbtnContainSubProduct" OnSelectedIndexChanged="rbtnContainSubProduct_OnSelectedIndexChanged"
                            Font-Size="0.8em" AutoPostBack="true" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="yes">Yes</asp:ListItem>
                            <asp:ListItem Selected="True" Value="no">No</asp:ListItem>
                        </asp:RadioButtonList>
                    </p>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:Panel>
        <%--Gridview Sub Products--%><hr />
        <asp:Panel ID="pnlSubProducts" runat="server" Visible="false" Style="margin: 1em 2em 1em 2em;">
            <asp:Label ID="lblSubProductsHeader" runat="server" Font-Size="1.2em"></asp:Label>
            <asp:Label ID="lblSubProductMessage" runat="server" Font-Size="0.8em" ForeColor="Blue"></asp:Label>
            <div style="height: 250px; overflow-x: hidden; overflow-y: auto;">
            <asp:GridView ID="gviewSubProduct" runat="server" CssClass="gridviewBaseStyle" Visible="true"
                AutoGenerateColumns="false">
                <RowStyle CssClass="gridviewRowStyle" />
                <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                <HeaderStyle CssClass="gridviewHeaderStyle-min" />
                <Columns>
                    <asp:TemplateField HeaderText="Check item(s) that apply" ItemStyle-Font-Bold="true"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSubProduct" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product ID" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblProductID" runat="server" Text='<% #bind("ProductID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Code">
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<% # bind("ProductCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Description">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<% # bind("ProductDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manufacturer">
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<% # bind("ManufacturerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
        </asp:Panel>
        <br />
        <br />
        <%--Save Cancel buttons--%>
        <div class="div-navigation-linkbutton">
            <p>
                <asp:LinkButton ID="lnkSave" runat="server" CssClass="linkStyle" OnCommand="lnkSave_OnCommand">Save</asp:LinkButton>
                <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="false" CssClass="linkStyle"
                    PostBackUrl="~/Admin/ProductManagement/Default.aspx">Cancel</asp:LinkButton>
            </p>
        </div>
    </div>
</asp:Content>
