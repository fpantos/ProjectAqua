<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="LowInStock.aspx.cs" Inherits="Aqua.Reports.LowInStock" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Sort by" Font-Bold="true"></asp:Label>&nbsp
                    <asp:DropDownList ID="ddlSortExpression" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSortExpression_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="unitsonhand">Units on hand</asp:ListItem>
                        <asp:ListItem Value="productcode">Product Code</asp:ListItem>
                        <asp:ListItem Value="unitcost">Unit Cost</asp:ListItem>
                        <asp:ListItem Value="unitprice">Unit Price</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp
                    <asp:Label ID="Label3" runat="server" Text="Sort Direction" Font-Bold="true"></asp:Label>
                    &nbsp
                    <asp:DropDownList ID="ddlDirection" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDirection_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="asc">Ascending</asp:ListItem>
                        <asp:ListItem Value="desc">Descending</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <CR:CrystalReportViewer ID="rptProductsUnderStock" runat="server" AutoDataBind="true"
                        DisplayStatusbar="False" HasCrystalLogo="False" HasDrilldownTabs="False" HasDrillUpButton="False"
                        HasSearchButton="False" HasToggleGroupTreeButton="False" HasToggleParameterPanelButton="False"
                        HasZoomFactorList="False" ToolPanelView="None" ToolPanelWidth="200px" HasRefreshButton="True"
                        PageZoomFactor="80" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
