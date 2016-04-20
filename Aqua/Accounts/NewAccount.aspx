<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" AutoEventWireup="true"
    CodeBehind="NewAccount.aspx.cs" Inherits="Aqua.Accounts.NewAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <title>Accounts</title>
    <style type="text/css">
        
    </style>
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Accounts</h1>
        <asp:Panel ID="Panel1" runat="server" Width="100%" CssClass="panel-formview">
            <asp:FormView ID="fViewCustomer" runat="server" CssClass="formView-input" DefaultMode="Insert">
                <InsertItemTemplate>
                    <h1>
                        Create New Account</h1>
                    <%--title--%>
                    <p>
                        <asp:Label ID="Label1" runat="server" Text="Title" CssClass="propertyLabel"></asp:Label>
                        <asp:DropDownList ID="ddlTitle" runat="server" CssClass="propertyValue">
                            <asp:ListItem Value="">- Select One -</asp:ListItem>
                            <asp:ListItem>Mr</asp:ListItem>
                            <asp:ListItem>Mrs</asp:ListItem>
                            <asp:ListItem>Ms</asp:ListItem>
                            <asp:ListItem>Miss</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <%--firstname--%>
                    <p>
                        <asp:Label ID="Label2" runat="server" Text="Firstname" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtFirstname" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label8" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstname"
                            ErrorMessage="Please enter First Name" InitialValue=" " Display="Static"></asp:RequiredFieldValidator>
                    </p>
                    <%--middlename--%>
                    <p>
                        <asp:Label ID="Label3" runat="server" Text="Middlename" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtMiddlename" runat="server" CssClass="propertyValue"></asp:TextBox>
                    </p>
                    <%--lastname--%>
                    <p>
                        <asp:Label ID="Label4" runat="server" Text="Lastname" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtLastname" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label28" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastname"
                            ErrorMessage="Please enter Last Name" Display="Static"></asp:RequiredFieldValidator>
                    </p>
                    <%--suffix--%>
                    <p>
                        <asp:Label ID="Label5" runat="server" Text="Suffix" CssClass="propertyLabel"></asp:Label>
                        <asp:DropDownList ID="ddlSuffix" runat="server" CssClass="propertyValue">
                            <asp:ListItem Value="">- Select One -</asp:ListItem>
                            <asp:ListItem Value=""> n/a </asp:ListItem>
                            <asp:ListItem>Sr </asp:ListItem>
                            <asp:ListItem>Jr </asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <%--email--%>
                    <p>
                        <asp:Label ID="Label10" runat="server" CssClass="propertyLabel" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="propertyValue" MaxLength="50"></asp:TextBox>
                        <asp:Label ID="Label33" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Please enter an email address"> </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid email address"
                            ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </p>
                    <%--homephone--%>
                    <p>
                        <asp:Label ID="Label16" runat="server" Text="Home Phone" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtHomePhone" runat="server" CssClass="propertyValue" MaxLength="10"
                            ToolTip="Home Phone must be 10 digits long"></asp:TextBox>
                        <asp:Label ID="Label17" runat="server" Text="*"></asp:Label>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHomePhone"
                            FilterType="Numbers">
                        </asp:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter a home phone"
                            Display="Dynamic" ControlToValidate="txtHomePhone"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Must be 10 digits"
                            Display="Dynamic" ControlToValidate="txtHomePhone" ValidationExpression="^(\d{10})$"></asp:RegularExpressionValidator>
                    </p>
                    <%--mobilephone--%>
                    <p>
                        <asp:Label ID="Label18" runat="server" Text="Mobile Phone" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtMobilePhone" runat="server" CssClass="propertyValue" MaxLength="10"
                            ToolTip="Mobile Phone must be 10 digits long"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtMobilePhone"
                            FilterType="Numbers">
                        </asp:FilteredTextBoxExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Must be 10 digits"
                            Display="Dynamic" ControlToValidate="txtMobilePhone" SetFocusOnError="true" ValidationExpression="^(\d{10})$">                     
                        </asp:RegularExpressionValidator>
                    </p>
                    <%-- work phone--%>
                    <p>
                        <asp:Label ID="Label20" runat="server" Text="Work Phone" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtWorkPhone" runat="server" MaxLength="10" CssClass="propertyValue"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtWorkPhone"
                            FilterType="Numbers">
                        </asp:FilteredTextBoxExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Must be 10 digits"
                            ControlToValidate="txtWorkPhone" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^(\d{10})$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <%--Customer since date--%>
                    <p>
                        <asp:Label ID="Label13" runat="server" Text="Customer Since" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtCustSinceDate" runat="server" CssClass="propertyValue" MaxLength="10"
                            CausesValidation="false"></asp:TextBox>
                        <asp:ImageButton ImageAlign="Top" ID="btnShowCalendar" runat="server" Width="20px"
                            Height="20px" ImageUrl="~/Images/calendar.gif" CausesValidation="false" />
                        <asp:Label ID="Label19" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter a date"
                            ControlToValidate="txtCustSinceDate" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="MM/dd/yyyy" TargetControlID="txtCustSinceDate"
                            PopupButtonID="btnShowCalendar">
                        </asp:CalendarExtender>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="txtCustSinceDate"
                            FilterType="Numbers,Custom" ValidChars="/">
                        </asp:FilteredTextBoxExtender>
                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtCustSinceDate"
                            WatermarkText="mm/dd/yyyy" WatermarkCssClass="watermarked">
                        </asp:TextBoxWatermarkExtender>
                    </p>
                    <%--water source location--%>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myConnection %>"
                        SelectCommand="SELECT [Description], [LocationID] FROM [Ref_WaterSourceLocation]">
                    </asp:SqlDataSource>
                    <p>
                        <asp:Label ID="Label14" runat="server" Text="Water Source Location" CssClass="propertyLabel"></asp:Label>
                        <asp:DropDownList ID="ddlWaterSourceLocation" runat="server" CssClass="propertyValue"
                            DataSourceID="SqlDataSource1" DataTextField="Description" DataValueField="LocationID">
                        </asp:DropDownList>
                    </p>
                    <%--contact frequency--%>
                    <p>
                        <asp:Label ID="Label15" runat="server" Text="Contact Frequency" CssClass="propertyLabel"></asp:Label>
                        <asp:DropDownList ID="ddlContactFrequency" runat="server" CssClass="propertyValue">
                            <asp:ListItem>Weekly</asp:ListItem>
                            <asp:ListItem>Bi-Weekly</asp:ListItem>
                            <asp:ListItem>Monthly</asp:ListItem>
                            <asp:ListItem>Annually</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <%--newsletters--%>
                    <p>
                        <asp:Label ID="Label12" runat="server" Text="Newsletters" CssClass="propertyLabel"></asp:Label>
                        <br />
                        <asp:CheckBox ID="chkNewsletterByEmail" runat="server" Text="Receive by Email?" CssClass="checkboxProperty" />
                        <asp:CheckBox ID="chkNewsletterByMail" runat="server" Text="Receive by mail?" CssClass="checkboxProperty" />
                    </p>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server" Width="100%" CssClass="panel-formview">
            <h3>
                Home Address</h3>
            <asp:FormView ID="fViewHomeAddress" runat="server" DefaultMode="Insert" CssClass="formView-input">
                <InsertItemTemplate>
                    <%--addressLine1--%>
                    <p>
                        <asp:Label ID="Label6" runat="server" Text="Address Line 1" CssClass="propertyLabel">
                        </asp:Label><asp:TextBox ID="txtAddressLine1" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label11" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter a home address"
                            ControlToValidate="txtAddressLine1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </p>
                    <%--addressLine2--%>
                    <p>
                        <asp:Label ID="Label7" runat="server" Text="Address Line 2" CssClass="propertyLabel"></asp:Label><asp:TextBox
                            ID="txtAddressLine2" runat="server" CssClass="propertyValue"></asp:TextBox>
                    </p>
                    <%--city/town--%>
                    <p>
                        <asp:Label ID="Label8" runat="server" Text="City / Town" CssClass="propertyLabel"></asp:Label><asp:TextBox
                            ID="txtCityTown" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label21" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter a City/Town"
                            ControlToValidate="txtCityTown" Display="Dynamic"></asp:RequiredFieldValidator>
                    </p>
                    <%--province--%>
                    <p>
                        <asp:Label ID="Label4" runat="server" Text="Province" CssClass="propertyLabel"></asp:Label>
                        <asp:DropDownList ID="ddlProvince" runat="server" CssClass="propertyValue" OnDataBound="ddlProvince_DataBound">
                            <asp:ListItem>AB</asp:ListItem>
                            <asp:ListItem>BC</asp:ListItem>
                            <asp:ListItem>MB</asp:ListItem>
                            <asp:ListItem>NB</asp:ListItem>
                            <asp:ListItem>NL</asp:ListItem>
                            <asp:ListItem>NT</asp:ListItem>
                            <asp:ListItem>NS</asp:ListItem>
                            <asp:ListItem>NU</asp:ListItem>
                            <asp:ListItem>ON</asp:ListItem>
                            <asp:ListItem>PE</asp:ListItem>
                            <asp:ListItem>QC</asp:ListItem>
                            <asp:ListItem>SK</asp:ListItem>
                            <asp:ListItem>YT</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label31" runat="server" Text="*"></asp:Label>
                    </p>
                    <%--postal code--%>
                    <p>
                        <asp:Label ID="Label9" runat="server" Text="Postal Code" CssClass=" propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtPostalCode_segment1" runat="server" CssClass="propertyValue"
                            MaxLength="3" Style="text-transform: uppercase" Width="40" Text="L9T"></asp:TextBox>
                        <asp:Label ID="Label" runat="server" Text=" - "></asp:Label>
                        <asp:TextBox ID="txtPostalCode_segment2" runat="server" CssClass="propertyValue"
                            MaxLength="3" Style="text-transform: uppercase" Width="40"></asp:TextBox>
                        <asp:Label ID="Label32" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPostalCode_segment2"
                            ErrorMessage="Please enter Postal Code."></asp:RequiredFieldValidator>
                        <p class="inputForm-errorMessage">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid format on Postal Code box 1. E.g L9T."
                                Display="Dynamic" ControlToValidate="txtPostalCode_segment1" ValidationExpression="^([ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]\d[ABCEGHJKLMNPRSTVWXYZabceghjklmnprstvxy])$">
                            </asp:RegularExpressionValidator>
                        </p>
                        <p class="inputForm-errorMessage">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid format on Postal Code box 2. E.g 6C1"
                                Display="Dynamic" ControlToValidate="txtPostalCode_segment2" ValidationExpression="^(\d[ABCEGHJKLMNPRSTVWXYZabceghjklmnprstvxy]\d)$">
                            </asp:RegularExpressionValidator>
                        </p>
                        <p>
                        </p>
                    </p>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel3" runat="server" Width="100%" CssClass="panel-formview">
            <h3>
                Mailing Address</h3>
            <asp:CheckBox ID="chkMailingAddressSameAsHomeAddress" runat="server" Text="Same as Home Address"
                CssClass="checkboxProperty" AutoPostBack="true" Checked="true" OnCheckedChanged="chkMailingAddressSameAsHomeAddress_CheckedChanged" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:FormView ID="fViewMailingAddress" runat="server" DefaultMode="Insert" CssClass="formView-input"
                        Visible="false">
                        <InsertItemTemplate>
                            <%--addressLine1--%>
                            <p>
                                <asp:Label ID="Label6" runat="server" Text="Address Line 1" CssClass="propertyLabel">
                                </asp:Label><asp:TextBox ID="txtAddressLine1" runat="server" CssClass="propertyValue"></asp:TextBox>
                                <asp:Label ID="Label22" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter a home address"
                                    ControlToValidate="txtAddressLine1" Display="Dynamic"></asp:RequiredFieldValidator>
                            </p>
                            <%--addressLine2--%>
                            <p>
                                <asp:Label ID="Label7" runat="server" Text="Address Line 2" CssClass="propertyLabel"></asp:Label><asp:TextBox
                                    ID="txtAddressLine2" runat="server" CssClass="propertyValue"></asp:TextBox>
                            </p>
                            <%--city/town--%>
                            <p>
                                <asp:Label ID="Label8" runat="server" Text="City / Town" CssClass="propertyLabel"></asp:Label><asp:TextBox
                                    ID="txtCityTown" runat="server" CssClass="propertyValue"></asp:TextBox>
                                <asp:Label ID="Label23" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please enter a City/Town"
                                    ControlToValidate="txtCityTown" Display="Dynamic"></asp:RequiredFieldValidator>
                            </p>
                            <%--province--%>
                            <p>
                                <asp:Label ID="Label4" runat="server" Text="Province" CssClass="propertyLabel"></asp:Label>
                                <asp:DropDownList ID="ddlProvince" runat="server" CssClass="propertyValue">
                                    <asp:ListItem>AB</asp:ListItem>
                                    <asp:ListItem>BC</asp:ListItem>
                                    <asp:ListItem>MB</asp:ListItem>
                                    <asp:ListItem>NB</asp:ListItem>
                                    <asp:ListItem>NL</asp:ListItem>
                                    <asp:ListItem>NT</asp:ListItem>
                                    <asp:ListItem>NS</asp:ListItem>
                                    <asp:ListItem>NU</asp:ListItem>
                                    <asp:ListItem Selected="True">ON</asp:ListItem>
                                    <asp:ListItem>PE</asp:ListItem>
                                    <asp:ListItem>QC</asp:ListItem>
                                    <asp:ListItem>SK</asp:ListItem>
                                    <asp:ListItem>YT</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="Label31" runat="server" Text="*"></asp:Label>
                            </p>
                            <%--postal code--%>
                            <p>
                                <asp:Label ID="Label9" runat="server" Text="Postal Code" CssClass=" propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtPostalCode_segment1" runat="server" CssClass="propertyValue"
                                    MaxLength="3" Style="text-transform: uppercase" Width="40" Text="L9T"></asp:TextBox>
                                <asp:Label ID="Label" runat="server" Text=" - "></asp:Label>
                                <asp:TextBox ID="txtPostalCode_segment2" runat="server" CssClass="propertyValue"
                                    MaxLength="3" Style="text-transform: uppercase" Width="40"></asp:TextBox>
                                <asp:Label ID="Label32" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPostalCode_segment2"
                                    ErrorMessage="Please enter Postal Code."></asp:RequiredFieldValidator>
                                <p class="inputForm-errorMessage">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid format on Postal Code box 1. E.g L9T."
                                        Display="Dynamic" ControlToValidate="txtPostalCode_segment1" ValidationExpression="^([ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]\d[ABCEGHJKLMNPRSTVWXYZabceghjklmnprstvxy])$">
                                    </asp:RegularExpressionValidator>
                                </p>
                                <p class="inputForm-errorMessage">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid format on Postal Code box 2. E.g 6C1"
                                        Display="Dynamic" ControlToValidate="txtPostalCode_segment2" ValidationExpression="^(\d[ABCEGHJKLMNPRSTVWXYZabceghjklmnprstvxy]\d)$">
                                    </asp:RegularExpressionValidator>
                                </p>
                            </p>
                        </InsertItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <%--New Account buttons--%>
        <div class="div-navigation-linkbutton">
            <p>
                <asp:LinkButton ID="lnkSave" runat="server" OnCommand="lnkSave_Command" CssClass="linkStyle">Save</asp:LinkButton>
                <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="false" CssClass="linkStyle"
                    PostBackUrl="~/Accounts/Default.aspx">Cancel</asp:LinkButton>
            </p>
        </div>
    </div>
    <%--end mainContainer--%>
</asp:Content>
