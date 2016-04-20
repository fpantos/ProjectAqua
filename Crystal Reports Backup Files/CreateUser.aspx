<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" AutoEventWireup="true"
    CodeBehind="CreateUser.aspx.cs" Inherits="Aqua.Admin.CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Create User</h1>
        <div class="mainContainer-innerSpacer">
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/Admin/UserManagement/Default.aspx"
                LoginCreatedUser="False" CancelDestinationPageUrl="~/Admin/UserManagement/Default.aspx"
                DisplayCancelButton="True" OnCreatedUser="CreateUserWizard1_CreatedUser" CompleteSuccessText="The user has been successfully created."
                UnknownErrorMessage="The user was not created. Please try again." DuplicateUserNameErrorMessage="User name is already in use. Please enter a different user name."
                Width="100%">
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                        <ContentTemplate>
                            <%--username--%>
                            <p>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="propertyLabel">User Name:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="propertyValue"></asp:TextBox>
                                <asp:Label ID="Label1" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            </p>
                            <%--password--%>
                            <p>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="propertyLabel">Password:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="propertyValue"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            </p>
                            <%--confirm password--%>
                            <p>
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword"
                                    CssClass="propertyLabel">Confirm Password:</asp:Label>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="propertyValue"></asp:TextBox>
                                <asp:Label ID="Label3" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                    ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                                    ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            </p>
                            <%--email--%>
                            <p>
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" CssClass="propertyLabel">E-mail:</asp:Label>
                                <asp:TextBox ID="Email" runat="server" CssClass="propertyValue"></asp:TextBox>
                                <asp:Label ID="Label4" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                    Display="Dynamic" ErrorMessage="E-mail is required." ToolTip="E-mail is required."
                                    ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid email address"
                                    ControlToValidate="Email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic" ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                            </p>
                            <p>
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                    ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </p>
                        </ContentTemplate>
                        <CustomNavigationTemplate>
                            <div class="div-workOrder" style="padding-top: 2em">
                                <asp:LinkButton ID="StepNextButton" runat="server" CssClass="linkStyle" CommandName="MoveNext"
                                    ValidationGroup="CreateUserWizard1">Create User</asp:LinkButton>
                                &nbsp
                                <asp:LinkButton ID="CancelButton" runat="server" CssClass="linkStyle" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel" ValidationGroup="CreateUserWizard1">Cancel</asp:LinkButton>
                            </div>
                        </CustomNavigationTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:WizardStep runat="server" ID="SelectRoleWizardStep" Title="Select Roles" OnActivate="SelectRoleWizardStep_OnActivate"
                        OnDeactivate="SelectRoleWizardStep_OnDeactivate">

                        Select Role:<br />
                        <asp:ListBox ID="lstRoles" runat="server" OnSelectedIndexChanged="lstRoles_SelectedIndexChanged">
                        </asp:ListBox>
                   
                    </asp:WizardStep>
                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td align="center">
                                        Complete
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        The user has been successfully created.
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                            Text="Continue" ValidationGroup="CreateUserWizard1" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CompleteWizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
        </div>
    </div>
</asp:Content>
