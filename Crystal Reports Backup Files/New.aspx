<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="New.aspx.cs" Inherits="Aqua.New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            New Sale</h1>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <%--Multiview--%>
                <asp:MultiView ID="mViewNewSale" runat="server" ActiveViewIndex="0" OnActiveViewChanged="mViewNewSale_ActiveViewChanged">
                    <%--vwNewSale--%>
                    <asp:View ID="vwNewSale" runat="server">
                        <asp:Panel ID="Panel1" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <div>
                                    <asp:Label ID="Label5" runat="server" Text="Step 1 - Add an Account (optional)" 
                                        Style="width: 300px; display: inline-block;"></asp:Label>&nbsp&nbsp
                                    <asp:LinkButton ID="lnkSearchAccount" OnCommand="lnkSearchAccount_OnCommand" runat="server"
                                        CssClass="linkbutton-no-line" ToolTip="Click to add an account">> > Search</asp:LinkButton>
                                </div>
                                <asp:DetailsView ID="dViewAccountInfo" DefaultMode="ReadOnly" runat="server" Height="100%"
                                    EmptyDataText="No Account Selected" EmptyDataRowStyle-Font-Size=".8em" Width="100%"
                                    AutoGenerateRows="false">
                                    <RowStyle CssClass="dviewRowStyle-basic" />
                                    <AlternatingRowStyle CssClass="dviewAlternatingStyle-basic" />
                                    <FieldHeaderStyle CssClass="dviewFieldHeaderStyle-basic" />
                                    <Fields>
                                        <asp:TemplateField HeaderText="Account ID">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<% # bind("accountID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account Holder">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<% # bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Home Address">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<% # bind("[Home address]") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Home Phone">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# FormatPhonenumber( Eval("homephone").ToString() )  %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                </asp:DetailsView>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <div>
                                    <asp:Label ID="Label6" runat="server" Text="Step 2 - Add Product" 
                                        Style="width: 300px; display: inline-block"></asp:Label>&nbsp&nbsp
                                    <asp:LinkButton ID="lnkSearchProduct" runat="server" CssClass="linkbutton-no-line"
                                        OnCommand="lnkSearchProduct_OnCommand" ToolTip="Click to add a product">> > Search</asp:LinkButton>
                                </div>
                                <asp:Label ID="lblMessage" runat="server" ForeColor="red" Font-Size="0.85em"></asp:Label>
                                <asp:GridView ID="gviewProductsOrdered" runat="server" AutoGenerateColumns="false"
                                    CssClass="gridviewBaseStyle" ShowFooter="true" OnDataBound="gviewProductsOrdered_DataBound"
                                    OnRowDataBound="gviewProductsOrdered_RowDataBound" OnRowDeleting="gviewProductsOrdered_RowDeleting"
                                    OnSelectedIndexChanging="gviewProductsOrdered_SelectedIndexChanging" OnRowUpdating="gviewProductsOrdered_RowUpdating"
                                    OnRowCreated="gviewProductsOrdered_RowCreated">
                                    <HeaderStyle CssClass="gridviewHeaderStyle" />
                                    <RowStyle CssClass="gridviewRowStyle" />
                                    <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                                    <FooterStyle CssClass="gridviewFooterStyle" />
                                    <Columns>
                                        <%--quantity--%>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtItemQuantity" runat="server" Text='<% # bind("Quantity") %>'
                                                    Width="3em"></asp:TextBox><br />
                                                <asp:LinkButton ID="lnkUpdateQuantity" runat="server" CssClass="linkbutton-no-line"
                                                    CommandName="Update">update</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--remove item--%>
                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" CssClass="linkbutton-no-line"
                                                    CausesValidation="false">Remove</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--item code--%>
                                        <asp:TemplateField HeaderText="Item Code">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdnProductID" runat="server" Value='<% # bind("productID") %>' />
                                                <asp:Label ID="Label7" runat="server" Text='<% # bind("productCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--item desc--%>
                                        <asp:TemplateField HeaderText="Item Description">
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<% # bind("productDescription") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--item price--%>
                                        <asp:TemplateField HeaderText="Item Price">
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" Text='<% # String.Format ("{0:c}", Eval("UnitPriceCharged") ) %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="Label13" runat="server" Text="Sub Total"></asp:Label><br />
                                                <asp:Label ID="Label14" runat="server" Text="Taxes"></asp:Label><br />
                                                <asp:Label ID="Label15" runat="server" Text="Total Amount"></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <%--item total--%>
                                        <asp:TemplateField HeaderText="Item Total" ItemStyle-CssClass=" gridviewItemStyle-Currency"
                                            HeaderStyle-HorizontalAlign="Right" ItemStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItemTotal" runat="server" Text='<% # String.Format ("{0:c}", Eval("ItemTotal") ) %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lblSubTotal" runat="server"></asp:Label><br />
                                                <asp:Label ID="lblTotalTax" runat="server"></asp:Label><br />
                                                <asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTotalTaxCharged" runat="server" Text='<% # String.Format ("{0:c}", Eval("TaxCharged") ) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                        <br />
                        <%--navigation button--%>
                        <div class="div-navigation-linkbutton">
                            <asp:LinkButton ID="lnkCompleteSale" runat="server" OnClick="lnkCompleteSale_Click" CssClass="linkDeactivatedStyle"
                                CommandName="NextView" CausesValidation="true" Enabled="false">Complete Sale</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton4" runat="server" CssClass="linkStyle" PostBackUrl="~/Home/WaterStoreHome.aspx">Cancel</asp:LinkButton>
                        </div>
                    </asp:View>
                    <%--vwPrintNewSale--%>
                    <asp:View ID="vwPrintNewSale" runat="server">
                        <asp:Panel ID="Panel3" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                The sale has been successfully completed.
                            </div>
                        </asp:Panel>
                        <br />
                        <div class="div-navigation-linkbutton">
                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="linkStyle">Print Invoice</asp:LinkButton>
                            <asp:LinkButton ID="lnkCreateAnotherSale" runat="server" OnClick="lnkCreateAnotherSale_OnClick"
                                CssClass="linkStyle" CausesValidation="false">Create another Sale</asp:LinkButton>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
