<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="ManageProductCategory.aspx.cs" Inherits="Aqua.Admin.ProductManagement.ManageProductCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <h1>
                    Product Category</h1>
                <div class="mainContainer-innerSpacer">
                    <asp:Panel ID="Panel1" runat="server" CssClass="panel-formview">
                        <asp:FormView ID="fviewProdCategory" runat="server" CssClass="formView-input" DefaultMode="Insert">
                            <InsertItemTemplate>
                                <h2>
                                    To add a new category, enter details below</h2>
                                <br />
                                <p>
                                    <asp:Label ID="Label2" runat="server" Text="Category Name" CssClass="propertyLabel"></asp:Label>
                                    <asp:TextBox ID="txtProductCategoryName" runat="server" CssClass="propertyValue"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="*"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductCategoryName"
                                        ValidationGroup="valGroup_addProductCategory"></asp:RequiredFieldValidator>
                                </p>
                                <p>
                                    <asp:Label ID="Label3" runat="server" Text="Description" CssClass="propertyLabel"></asp:Label>
                                    <asp:TextBox ID="txtProductCategoryDescription" runat="server" CssClass="propertyValue"></asp:TextBox>
                                </p>
                            </InsertItemTemplate>
                        </asp:FormView>
                        <div class="div-workOrder">
                            <asp:LinkButton ID="lnkSaveProductCategory" OnCommand="lnkSaveProductCategory_OnCommand"
                                runat="server" CausesValidation="true" CssClass="linkStyle" ValidationGroup="valGroup_addProductCategory">Save</asp:LinkButton>
                        </div><br />
                    </asp:Panel>
                </div>

                <div class="mainContainer-innerSpacer">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    <asp:GridView ID="gviewProductCategory" runat="server" AutoGenerateColumns="false"
                        CssClass="gridviewBaseStyle" OnRowDeleting="gviewProductCategory_RowDeleting"
                        OnSelectedIndexChanging="gviewProductCategory_SelectedIndexChanging" OnRowEditing="gviewProductCategory_RowEditing"
                        OnRowUpdating="gviewProductCategory_RowUpdating" OnRowCancelingEdit="gviewProductCategory_RowCancelingEdit"
                        OnRowDataBound="gviewProductCategory_RowDataBound">
                        <HeaderStyle CssClass="gridviewHeaderStyle" />
                        <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                        <RowStyle CssClass="gridviewRowStyle" />
                        <Columns>
                            <%--hidden field--%>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hdnCategoryID" Value='<% # bind("categoryId") %>'
                                        Visible="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--category name--%>
                            <asp:TemplateField HeaderText="Category Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<% # bind("categoryName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCategoryName" runat="server" Text='<% # bind("categoryName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                        Display="Dynamic" ControlToValidate="txtCategoryName" ValidationGroup="valGroup_updateProductCategory"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <%--description--%>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<% # bind("description") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescription" runat="server" Text='<% # bind("description") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <%--edit--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Edit"
                                        ValidationGroup="valGroup_updateProductCategory">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--delete--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Delete"
                                        ValidationGroup="valGroup_updateProductCategory">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--update--%>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="true" CommandName="Update"
                                        ValidationGroup="valGroup_updateProductCategory" Visible="false">Update</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--cancel edit--%>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkCancelEdit" runat="server" CausesValidation="false" CommandName="Cancel"
                                        ValidationGroup="valGroup_updateProductCategory" Visible="false">Cancel</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
