<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Plain.Master" AutoEventWireup="true"
    CodeBehind="uh-oh.aspx.cs" Inherits="Aqua.Error.uh_oh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="mainContainer">
        <h1>
            Uh-oh</h1>
        <div class="mainContainer-innerSpacer">
        <asp:Label ID="errorText" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
</asp:Content>
