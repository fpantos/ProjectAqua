<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="Whoops.aspx.cs" Inherits="Aqua.Error.Whoops" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Uh-oh . . .
        </h1>
        <div class="mainContainer-innerSpacer">
            <div>
                <p>
                    An error has occurred. Please contact the Administrator.</p>
            </div>
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Home/WaterStoreHome.aspx"
                CssClass="linkbutton-no-line">Back to Home</asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton ID="lnkViewLogs" runat="server" PostBackUrl="elmah.axd" CssClass="linkbutton-no-line"
                Visible="false">View Error Logs</asp:LinkButton>
        </div>
    </div>
</asp:Content>
