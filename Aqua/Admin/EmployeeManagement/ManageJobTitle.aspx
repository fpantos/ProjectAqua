<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="True"
    CodeBehind="ManageJobTitle.aspx.cs" Inherits="Aqua.Admin.EmployeeManagement.ManageJobTitle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Job Position</h1>
        <asp:Panel ID="Panel1" runat="server" Width="100%">
            <asp:Label ID="Label1" runat="server" Text="Enter Position Name"></asp:Label>
            <asp:TextBox ID="txtNewPosition" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                ControlToValidate="txtNewPosition" SetFocusOnError="true" ErrorMessage="*"></asp:RequiredFieldValidator>
            <asp:LinkButton ID="lnkSave" runat="server" OnCommand="lnkSave_OnCommand" CausesValidation="true">Save</asp:LinkButton>
        </asp:Panel>
        <br />
        <br />
        <asp:Label ID="lblJobPositionMessage" runat="server"></asp:Label>
        <asp:GridView ID="gviewPositions" runat="server" AutoGenerateColumns="false" Width="50%"
            OnRowDeleting="gviewJobPosition_RowDeleting" CssClass="gridviewBaseStyle" OnRowDataBound="gviewPositions_RowDataBound">
            <HeaderStyle CssClass="gridviewHeaderStyle" />
            <RowStyle CssClass="gridviewRowStyle" />
            <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
            <Columns>
                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:HiddenField ID="hdnPositionID" runat="server" Value='<% # bind("PositionID") %>' Visible="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Job Title--%>
                <asp:TemplateField HeaderText="Position">
                    <ItemTemplate>
                        <asp:Label ID="lblJobTitle" runat="server" Text='<%# bind("PositionName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDeletePosition" runat="server" CommandArgument='<% # bind("PositionID") %>'
                            CommandName="Delete" CausesValidation="false">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
