<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Plain.Master" AutoEventWireup="true"
    CodeBehind="err.aspx.cs" Inherits="Aqua.Error.err" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h1>
        err</h1>
    <asp:Label ID="errorText" runat="server" Text="Label"></asp:Label>
</asp:Content>
