<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="ShowAllAccount.aspx.cs" Inherits="Aqua.Accounts.ShowAllAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Show all accounts with sorting function</h1>
        <asp:GridView ID="gviewAccounts" runat="server" OnSorting="gviewAccounts_Sorting"
            AutoGenerateColumns="false" HorizontalAlign="Justify" AllowSorting="true" Width="100%" 
            HeaderStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="true">
            <Columns>
                <%--account ID--%>
                <asp:TemplateField HeaderText="Account#" SortExpression="AccountID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<% # bind("AccountID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--name--%>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<% # bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Home address--%>
                <asp:TemplateField HeaderText="Home Address">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<% # bind("[home address]") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Homephone--%>
                <asp:TemplateField HeaderText="Homephone">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<% # bind("Homephone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--email--%>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# bind("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--is active--%>
                <asp:TemplateField HeaderText="Is Active">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkIsActive" Checked='<%# bind("isactive") %>' Enabled="false"
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
