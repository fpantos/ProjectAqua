<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Aqua._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Water Store Milton</title>
    <link rel="shortcut icon" href="~/Images/favicon.ico" />
    <link href="Styles/LoginStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="loginWrapperShadow">
        <div id="divMain">
            <%--Store Logo--%>
            <div id="divStoreLogo">
                <img src="Images/logo1.jpg" class="img" alt="logo" />
            </div>
            <div>
                <%--Lock Image--%>
                <div id="divLockIcon">
                    <img src="Images/lock.png" alt="lock" />
                </div>
                <%--Log in Control--%>
                <div class="mainLoginBox">
                    <asp:Login ID="Login1" runat="server" BorderPadding="4" Font-Names="Verdana" Font-Size="0.8em"
                        ForeColor="#333333" DestinationPageUrl="~/Home/WaterStoreHome.aspx" PasswordRecoveryText="Forgot your password?"
                        PasswordRecoveryUrl="~/PasswordRecovery/ForgotPassword.aspx" Width="300">
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                        <LayoutTemplate>
                            <asp:Label ID="Label1" runat="server" Text="Log in" Style="background-color: #19558B;
                                font-weight: bold; font-size: 1.2em; color: White; display: block; width: 200px"></asp:Label>
                            <%--username--%>
                            <div>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="loginLabel">User Name</asp:Label><br />
                                <asp:TextBox ID="UserName" runat="server" CssClass="loginValue"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." Display="Dynamic" ToolTip="User Name is required."
                                    ValidationGroup="Login1" CssClass="loginRfv" SetFocusOnError="true" ForeColor="White">*</asp:RequiredFieldValidator>
                            </div>
                            <%--password--%>
                            <div>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="loginLabel">Password</asp:Label><br />
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="loginValue"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1"
                                    Display="Dynamic" SetFocusOnError="true" ForeColor="White">*</asp:RequiredFieldValidator>
                            </div>
                            <%--checkbox rememberme--%>
                            <div>
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." ForeColor="White" />
                            </div>
                            <%--login button--%>
                            <div>
                                <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC"
                                    BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana"
                                    Font-Size="1em" ForeColor="#284775" Text="Log In" ValidationGroup="Login1" Width="100" />
                            </div>
                            <%--failure text--%>
                            <div>
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </div>
                            <div>
                            </div>
                            <%--password recovery--%>
                            <div>
                                <asp:HyperLink ID="PasswordRecoveryLink" runat="server" NavigateUrl="~/PasswordRecovery/ForgotPassword.aspx"
                                    ForeColor="White">Forgot your password?</asp:HyperLink>
                            </div>
                        </LayoutTemplate>
                        <%--    <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
                            Font-Names="Verdana" Font-Size="1em" ForeColor="#284775" />
                        <TextBoxStyle Font-Size="0.8em" />
                        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />--%>
                    </asp:Login>
                </div>
                <%--spacer--%>
                <div style="clear: both; display: block;">
                </div>
            </div>
            <p  id="boltPlugin">
                &#169 2011 Bolt Software Solutions</p>
        </div>
    </div>
    </form>
</body>
</html>
