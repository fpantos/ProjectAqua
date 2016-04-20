<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masterpage/LoggedIn.Master"
    CodeBehind="ViewProduct.aspx.cs" Inherits="Aqua.Admin.ProductManagement.ViewProduct" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <title>View Product</title>
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer" >
        <h1>
            View Product</h1>
        <div class="mainContainer-innerSpacer">
            <%--edit product linkbuttons--%>
            <div style="text-align: left; padding-left: 30em;">
                <asp:LinkButton ID="lnkEditProductInformation" runat="server" CssClass="linkbutton"
                    OnCommand="lnkEditProductInformation_OnCommand" CausesValidation="false">Edit Product Information</asp:LinkButton><br />
                <asp:LinkButton ID="lnkEditSubProductInformation" runat="server" CssClass="linkbutton"
                    OnCommand="lnkEditSubProductInformation_OnCommand" CausesValidation="false">Edit Sub-Product Information</asp:LinkButton><br />
                <br />
            </div>
            <asp:DetailsView ID="dviewProductDetails" runat="server" Height="50%" Width="100%"
                AutoGenerateRows="false">
                <AlternatingRowStyle CssClass="dviewAlternatingStyle-basic" />
                <FieldHeaderStyle CssClass="dviewFieldHeaderStyle-basic" />
                <RowStyle CssClass="dviewRowStyle-basic" />
                <Fields>
                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<% # bind("productID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Code">
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<% # bind("productCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Description">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<% # bind("productDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Cost">
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<% # String.Format ("{0:c}", Eval("UnitCost") ) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Price">
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<% # String.Format ("{0:c}", Eval("UnitPrice") ) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manufacturer">
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<% # bind("manufacturerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Units On Hand">
                        <ItemTemplate>
                            <asp:Label ID="Label15" runat="server" Text='<% # PrepareNullValueForDisplay(String.Format("{0}",Eval("UnitsOnHand")))%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reorder Level">
                        <ItemTemplate>
                            <asp:Label ID="Label16" runat="server" Text='<% # PrepareNullValueForDisplay(String.Format("{0}",Eval("ReorderLevel")))%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Status">
                        <ItemTemplate>
                            <asp:Label ID="Label20" runat="server" Text='<% # GetProductStatus(Eval("IsDiscontinued").ToString() ) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Is Tax Exempt?">
                        <ItemTemplate>
                            <asp:Label ID="Label21" runat="server" Text='<% # bind("IsTaxExempt") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item URL">
                        <ItemTemplate>
                            <asp:Label ID="Label22" runat="server" Text='<% #  PrepareNullValueForDisplay(Eval("ItemUrl").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
        <div class="mainContainer-innerSpacer">
            <%--Gridview Sub Products--%>
            <asp:Panel ID="pnlSubProducts" runat="server" Visible="true">
                <br />
                <asp:Label ID="lblSubProductsHeader" runat="server" Font-Size="1em"></asp:Label>
                <asp:Label ID="lblSubProductMessage" runat="server" Font-Size="0.8em" ForeColor="Blue"></asp:Label>
                <asp:GridView ID="gviewSubProduct" runat="server" CssClass="gridviewBaseStyle" Visible="true"
                    AutoGenerateColumns="false">
                    <RowStyle CssClass="gridviewRowStyle" />
                    <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                    <HeaderStyle CssClass="gridviewHeaderStyle-min" />
                    <Columns>
                        <asp:TemplateField HeaderText="Product ID" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblSubProductID" runat="server" Text='<% #bind("SubProductID") %>'></asp:Label>
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
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDeleteSubProduct" runat="server" CommandArgument='<%# bind("SubProductID") %>'
                                    OnCommand="lnkDeleteSubProduct_OnCommand" OnClientClick="javascript: return confirm('Are you sure you want to delete this sub-part?')">Delete Sub-Part</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>
        <%-- modal popup for edit Product Information--%>
        <asp:Panel ID="pnlEditProductPopup" runat="server" Style="display: none; border: 0.2em solid gray;
            background: #FBFBFB">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnShowPopup" runat="server" Text="Button" Style="display: none" />
                    <asp:ModalPopupExtender ID="mPopupEdit_Product" runat="server" TargetControlID="btnShowPopup"
                        BackgroundCssClass="ModalPopupBackground" PopupControlID="pnlEditProductPopup"
                        CancelControlID="lnkCancelProductEdit">
                    </asp:ModalPopupExtender>
                    <asp:FormView ID="fviewEditProduct" runat="server" DefaultMode="Edit" CssClass="formviewEdit">
                        <EditItemTemplate>
                            <h1>
                                Update Product Information</h1>
                            <%--UnitCost--%>
                            <p>
                                <asp:Label ID="Label4" runat="server" Text="Unit Cost" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtUnitCost" runat="server" CssClass="propertyValue" Text='<% # bind("UnitCost") %>'></asp:TextBox>
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
                                    ID="txtUnitPrice" runat="server" CssClass="propertyValue" Text='<% # bind("UnitPrice") %>'></asp:TextBox>
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
                                <asp:TextBox ID="txtUnitsOnHand" runat="server" CssClass="propertyValue" Text='<% # bind("UnitsOnHand") %>'></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers"
                                    TargetControlID="txtUnitsOnHand">
                                </asp:FilteredTextBoxExtender>
                            </p>
                            <%--ReorderLevel--%>
                            <p>
                                <asp:Label ID="Label7" runat="server" Text="Reorder Level" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtReorderLevel" runat="server" CssClass="propertyValue" Text='<% # bind("ReorderLevel") %>'></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers"
                                    TargetControlID="txtReorderLevel">
                                </asp:FilteredTextBoxExtender>
                            </p>
                            <%--ItemUrl--%>
                            <p>
                                <asp:Label ID="Label9" runat="server" Text="Item URL" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtItemUrl" runat="server" CssClass="propertyValue" Text='<% # bind("ItemUrl") %>'
                                    CausesValidation="false"></asp:TextBox>
                            </p>
                        </EditItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--save cancel buttons--%>
            <div class="modalPopupLinkbutton-div">
                <asp:LinkButton ID="lnkSaveProductEdit" runat="server" OnCommand="lnkSaveProductEdit_OnCommand"
                    CausesValidation="true" CssClass="linkStyle">Save</asp:LinkButton>
                <asp:LinkButton ID="lnkCancelProductEdit" runat="server" CausesValidation="false"
                    CssClass="linkStyle">Cancel</asp:LinkButton>
            </div>
        </asp:Panel>
        <%-- modal popup for edit sub Product Information--%>
        <asp:Panel ID="pnlEditSubProducts" runat="server" Style="display: none; border: 0.2em solid gray;
            background: #FBFBFB;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnEditSubProducts" runat="server" Text="Button" Style="display: none" />
                    <asp:ModalPopupExtender ID="mPopupEdit_SubProduct" runat="server" TargetControlID="btnEditSubProducts"
                        BackgroundCssClass="ModalPopupBackground" PopupControlID="pnlEditSubProducts"
                        CancelControlID="lnkCancelSubProductEdit">
                    </asp:ModalPopupExtender>
                    <%--<asp:FormView ID="fviewEditSubProduct" runat="server" DefaultMode="Edit" CssClass="formviewEdit">
                        <EditItemTemplate>--%>
                    <h1>
                        Manage Sub-Products</h1>
                    <asp:Label ID="lblEditSubProductsHeader" runat="server" Font-Size="1.2em"></asp:Label>
                    <asp:Label ID="lblEditSubProductMessage" runat="server" Font-Size="0.8em" ForeColor="Blue"></asp:Label>
                    <div style="height: 400px; overflow-x: hidden; overflow-y: auto;">
                        <asp:GridView ID="geditSubProduct" runat="server" CssClass="gridviewBaseStyle" Visible="true"
                            AutoGenerateColumns="false">
                            <RowStyle CssClass="gridviewRowStyle" />
                            <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                            <HeaderStyle CssClass="gridviewHeaderStyle" />
                            <Columns>
                                <asp:TemplateField HeaderText="Check item(s) to associate" ItemStyle-Font-Bold="true"
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
                                        <asp:Label ID="lblProductCode" runat="server" Text='<% # bind("ProductCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductDescription" runat="server" Text='<% # bind("ProductDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Manufacturer">
                                    <ItemTemplate>
                                        <asp:Label ID="lblManufacturerName" runat="server" Text='<% # bind("ManufacturerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsDiscontinued" runat="server" Text='<% # bind("IsDiscontinued") %>'
                                            Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--save cancel buttons--%>
            <div class="modalPopupLinkbutton-div">
                <asp:LinkButton ID="lnkSaveSubProductEdit" runat="server" OnCommand="lnkSaveSubProductEdit_OnCommand"
                    CausesValidation="true" CssClass="linkStyle">Save</asp:LinkButton>
                <asp:LinkButton ID="lnkCancelSubProductEdit" runat="server" CausesValidation="false"
                    CssClass="linkStyle">Cancel</asp:LinkButton>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
