<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="View.aspx.cs" Inherits="Aqua.Service.View" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Service Work Details</h1>
        <div class="mainContainer-innerSpacer">
            <asp:DetailsView ID="dviewServiceWorkDetails" runat="server" Height="80%" Width="100%"
                DefaultMode="ReadOnly" AutoGenerateRows="false">
                <AlternatingRowStyle CssClass="dviewAlternatingStyle-basic" />
                <RowStyle CssClass="dviewRowStyle-basic" />
                <FieldHeaderStyle CssClass="dviewFieldHeaderStyle-basic" />
                <Fields>
                    <asp:TemplateField HeaderText="Service ID">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<% # bind("ServiceWorkID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Invoice ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<% # bind("InvoiceID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Account Name">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkGoToAccount" runat="server" CssClass="linkbutton-no-line"
                                CommandArgument='<% # bind("AccountID") %>' OnCommand="lnkGoToAccount_OnCommand"
                                Text='<% # bind("[Account Name]") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Home Address">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<% # bind("[Home Address]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<% # String.Format("{0:MM/dd/yyyy}" ,Eval("ServiceDate") )  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Time">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<% # FormatShortTimeString( Eval("ServiceStartTime").ToString()  ) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
        <%--Gridview--%>
        <div class="mainContainer-innerSpacer">
            <h2>
                Work Items</h2>
            <asp:GridView ID="gviewWorkItems" runat="server" AutoGenerateColumns="false" Width="100%"
                CssClass="gridviewBaseStyle">
                <RowStyle CssClass="gridviewRowStyle" />
                <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                <HeaderStyle CssClass="gridviewHeaderStyle" />
                <Columns>
                    <asp:TemplateField HeaderText="Work Type">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<% # bind("WorkType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Work Notes">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<% # bind("WorkNotes") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="div-navigation-linkbutton">
            <asp:LinkButton ID="LinkButton1" runat="server"  CssClass="linkStyle" PostBackUrl="~/Home/WaterStoreHome.aspx">Back to Home</asp:LinkButton>
        </div>
    </div>
</asp:Content>
