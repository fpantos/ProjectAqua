<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" AutoEventWireup="True"
    CodeBehind="ViewEmployee.aspx.cs" Inherits="Aqua.Admin.EmployeeManagement.ViewEmployee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <title>View Employee</title>
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            View Employee</h1>
        <%--Employee number and employee name--%>
        <div class="div-primaryIdentifiers">
            <span class="span-primaryIdentifier">
                <asp:Label ID="lblEmployeeNumber" runat="server"></asp:Label></span> <span class="span-primaryIdentifier">
                    <asp:Label ID="lblEmployeeName" runat="server"></asp:Label></span>
        </div>
        <%--edit personal info and home address linkbuttons--%>
        <div class="div-primaryOptions">
            <asp:LinkButton ID="lnkEditPersonalInformation" runat="server" CssClass="linkbutton"
                OnCommand="lnkEditPersonalInformation_OnCommand">Edit Employee Information</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbutton" OnCommand="lnkEditHomeAddress_OnCommand">Edit Home Address</asp:LinkButton>
        </div>
        <div class="divSpacer">
        </div>
        <%--Home Address--%>
        <div class="innerDiv">
            <asp:Label ID="Label29" runat="server" Text="Home Address" CssClass="innerDiv-HeaderLabel"></asp:Label>
            <p>
                <asp:Label ID="lblHomeAddressLine1" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblHomeAddressLine2" runat="server"  CssClass="innerDiv-propertyValue"></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblHomeCityTown" runat="server"  CssClass="innerDiv-propertyValue"></asp:Label>
                <asp:Label ID="lblHomeProvince" runat="server"  CssClass="innerDiv-propertyValue" ></asp:Label>
                <asp:Label ID="lblHomePostalCode" runat="server"  CssClass="innerDiv-propertyValue"></asp:Label>
            </p>
        </div>
        <%--Personal Information--%>
        <div class="innerDiv">
            <div class="row">
                <asp:Label ID="Label19" runat="server" Text="Personal Information" CssClass="innerDiv-HeaderLabel"></asp:Label><br />
                <asp:Label ID="Label7" runat="server" Text="Email:" CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblEmailAddress" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
            <div class="row">
                <asp:Label ID="Label9" runat="server" Text="Home Phone:" CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblHomephone" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
            <div class="row">
                <asp:Label ID="Label12" runat="server" Text="Mobile Phone:" CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblMobilephone" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
            <div class="row">
                <asp:Label ID="Label5" runat="server" Text="Gender:" CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblGender" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
        </div>
        <%--emergency contact information--%>
        <div class="innerDiv">
            <asp:Label ID="Label14" runat="server" Text="Emergency Information" CssClass="innerDiv-HeaderLabel"></asp:Label>
            <div class="row">
                <asp:Label ID="lbl1" runat="server" Text="Emergency Contact: " CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblEmergencyContact" runat="server" CssClass="innerDiv-propertyValue"></asp:Label></div>
            <div class="row">
                <asp:Label ID="lbl2" runat="server" Text="Emergency Phone 1: " CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblEmergencyPhone1" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
            <div class="row">
                <asp:Label ID="Label22" runat="server" Text="Emergency Phone 2: " CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblEmergencyPhone2" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
        </div>
        <%-- employment information --%>
        <div class="innerDiv">
            <asp:Label ID="Label23" runat="server" Text="Employment Information" CssClass="innerDiv-HeaderLabel"></asp:Label>
            <div class="row">
                <asp:Label ID="Label30" runat="server" Text="Job Position: " CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblJobPosition" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
            <div class="row">
                <asp:Label ID="Label2" runat="server" Text="Date Hired: " CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblHireDate" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
            <div class="row">
                <asp:Label ID="Label1" runat="server" Text="Termination Date: " CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblTerminatedDate" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
            <div class="row">
                <asp:Label ID="Label18" runat="server" Text="Notes: " CssClass="innerDiv-propertyLabel"></asp:Label>
                <asp:Label ID="lblNotes" runat="server" CssClass="innerDiv-propertyValue"></asp:Label>
            </div>
        </div>
        <%--modal popup for edit Home Address--%>
        <asp:Panel ID="pnlHomeAddressOnEdit" runat="server" Style="display: none; border: 0.2em solid gray;
            background: #FBFBFB">
            <asp:UpdatePanel ID="updPnlHomeAddressOnEdit" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnShowHomeAddress" runat="server" Text="Button" Style="display: none" />
                    <asp:ModalPopupExtender ID="mPopupEdit_HomeAddress" runat="server" PopupControlID="pnlHomeAddressOnEdit"
                        TargetControlID="btnShowHomeAddress" BackgroundCssClass="ModalPopupBackground"
                        CancelControlID="lnkCancelHomeAddressOnEdit">
                    </asp:ModalPopupExtender>
                    <asp:FormView ID="fview_EditHomeAddress" runat="server" DefaultMode="Edit" CssClass="formviewEdit"
                        DataKeyNames="addressID">
                        <EditItemTemplate>
                            <h1>
                                Update Home Address</h1>
                            <%--addressLine1--%>
                            <p>
                                <asp:Label ID="Label6" runat="server" Text="Address Line 1" CssClass="propertyLabel">
                                </asp:Label><asp:TextBox ID="txtAddressLine1" runat="server" CssClass="propertyValue"
                                    Text='<% # bind("addressLine1") %>'></asp:TextBox>
                                <asp:Label ID="Label24" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddressLine1"
                                    Display="Dynamic" ErrorMessage="Please enter an address"></asp:RequiredFieldValidator>
                            </p>
                            <%--addressLine2--%>
                            <p>
                                <asp:Label ID="Label7" runat="server" Text="Address Line 2" CssClass="propertyLabel"></asp:Label><asp:TextBox
                                    ID="txtAddressLine2" runat="server" CssClass="propertyValue" Text='<% # bind("addressLine2") %>'></asp:TextBox>
                            </p>
                            <%--city/town--%>
                            <p>
                                <asp:Label ID="Label8" runat="server" Text="City / Town" CssClass="propertyLabel"></asp:Label><asp:TextBox
                                    ID="txtCityTown" runat="server" CssClass="propertyValue" Text='<% # bind("cityTown") %>'></asp:TextBox>
                                <asp:Label ID="Label34" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCityTown"
                                    Display="Dynamic" ErrorMessage="Please enter City/Town"></asp:RequiredFieldValidator>
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
                                <%--postal code segment1 L0L--%>
                                <asp:TextBox ID="txtPostalCode_segment1" runat="server" CssClass="propertyValue"
                                    MaxLength="3" Style="text-transform: uppercase" Width="40" Text='<%# String.Format("{0}",Eval("postalCode") ).Substring(0,3) %>'></asp:TextBox>
                                <asp:Label ID="Label" runat="server" Text=" - "></asp:Label><%--postal code segment2 0L0--%><asp:TextBox
                                    ID="txtPostalCode_segment2" runat="server" CssClass="propertyValue" MaxLength="3"
                                    Style="text-transform: uppercase" Width="40" Text='<%# String.Format("{0}",Eval("postalCode") ).Substring(3,3) %>'></asp:TextBox>
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
                        </EditItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--save cancel buttons--%>
            <div class="modalPopupLinkbutton-div">
                <asp:LinkButton ID="lnkSaveHomeAddressOnEdit" runat="server" CausesValidation="true"
                    OnCommand="lnkSaveHomeAddressOnEdit_OnCommand" CssClass="linkStyle">Save</asp:LinkButton>
                <asp:LinkButton ID="lnkCancelHomeAddressOnEdit" runat="server" CausesValidation="false" CssClass="linkStyle">Cancel</asp:LinkButton>
            </div>
        </asp:Panel>
        <%-- modal popup for edit Personal Information--%>
        <asp:Panel ID="pnlPersonalInformationOnEdit" runat="server" Style="display: none;
            border: 0.2em solid gray; background: #FBFBFB">
            <asp:UpdatePanel ID="updPnlPersonalInformationOnEdit" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnShowPersonalInformation" runat="server" Text="Button" Style="display: none" />
                    <asp:ModalPopupExtender ID="mPopupEdit_PersonalInformation" runat="server" TargetControlID="btnShowPersonalInformation"
                        PopupControlID="pnlPersonalInformationOnEdit" BackgroundCssClass="ModalPopupBackground"
                        CancelControlID="lnkCancelPersonalInformatiOnEdit">
                    </asp:ModalPopupExtender>
                    <asp:FormView ID="fview_EditPersonalInformation" runat="server" DefaultMode="Edit"
                        CssClass="formviewEdit" Style="width: 100%">
                        <EditItemTemplate>
                            <h1>
                                Update Personal Information</h1>
                            <%--firstname--%>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text="Firstname" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtFirstname" runat="server" CssClass="propertyValue" Text='<% # bind("firstname") %>'></asp:TextBox>
                                <asp:Label ID="Label8" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstname"
                                    ErrorMessage="Please enter First Name" InitialValue=" " Display="Static"></asp:RequiredFieldValidator>
                            </p>
                            <%--lastname--%>
                            <p>
                                <asp:Label ID="Label4" runat="server" Text="Lastname" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtLastname" runat="server" CssClass="propertyValue" Text='<% # bind("lastname") %>'></asp:TextBox>
                                <asp:Label ID="Label28" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastname"
                                    ErrorMessage="Please enter Last Name" Display="Static"></asp:RequiredFieldValidator>
                            </p>
                            <%--Job Title--%>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myConnection %>"
                                SelectCommand="SELECT [PositionName], [PositionID] FROM [JobPosition]"></asp:SqlDataSource>
                            <p>
                                <asp:Label ID="Label30" runat="server" Text="Job Title" CssClass="propertyLabel"></asp:Label>
                                <asp:DropDownList ID="ddlJobTitle" runat="server" CssClass="propertyValue" SelectedValue='<%# bind("JobPositionID") %>'
                                    DataSourceID="SqlDataSource1" DataTextField="PositionName" DataValueField="PositionID">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlJobTitle"
                                    Display="Dynamic" ErrorMessage="Please choose a job description"> </asp:RequiredFieldValidator>
                            </p>
                            <%--email--%>
                            <p>
                                <asp:Label ID="Label10" runat="server" CssClass="propertyLabel" Text="Email"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="propertyValue" Text='<% # bind("email") %>'></asp:TextBox>
                                <asp:Label ID="Label33" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                                    Display="Dynamic" ErrorMessage="Please enter an email address"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Invalid email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </p>
                            <%--gender--%>
                            <p>
                                <asp:Label ID="Label13" runat="server" Text="Gender" CssClass="propertyLabel"></asp:Label>
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="propertyValue" Text='<% # bind("gender") %>'>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="Label20" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastname"
                                    ErrorMessage="Please enter Gender" Display="Dynamic"></asp:RequiredFieldValidator>
                            </p>
                            <%--homephone--%>
                            <p>
                                <asp:Label ID="Label7" runat="server" CssClass="propertyLabel" Text="Home Phone"></asp:Label>
                                <asp:TextBox ID="txtHomePhone" runat="server" CssClass="propertyValue" Text='<% # bind("homephone") %>'
                                    MaxLength="10"></asp:TextBox>
                                <asp:Label ID="Label16" runat="server" Text="*"></asp:Label>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHomePhone"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtHomePhone"
                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter a Home phone">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtHomePhone"
                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Must be 10 digits" ValidationExpression="^(\d{10})$">
                                </asp:RegularExpressionValidator>
                            </p>
                            <%--mobilephone--%>
                            <p>
                                <asp:Label ID="Label25" runat="server" CssClass="propertyLabel" Text="Mobile Phone"></asp:Label>
                                <asp:TextBox ID="txtMobilePhone" runat="server" CssClass="propertyValue" Text='<% # bind("MobilePhone") %>'
                                    MaxLength="10"></asp:TextBox>
                                <asp:Label ID="Label26" runat="server" Text=""></asp:Label>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtMobilePhone"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtMobilePhone"
                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Must be 10 digits" ValidationExpression="^(\d{10})$">
                                </asp:RegularExpressionValidator>
                            </p>
                            <%--emergency contact--%>
                            <p>
                                <asp:Label ID="Label15" runat="server" Text="Emergency Contact" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtEmergencyContact" runat="server" CssClass="propertyValue" Text='<% # bind("EmergencyContact") %>'></asp:TextBox>
                                <asp:Label ID="Label17" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmergencyContact"
                                    ErrorMessage="Please enter Emergency Contact Information" InitialValue=" " Display="Dynamic"></asp:RequiredFieldValidator>
                            </p>
                            <%-- Emergency phone 1--%>
                            <p>
                                <asp:Label ID="Label11" runat="server" CssClass="propertyLabel" Text="Emergency Phone 1"></asp:Label>
                                <asp:TextBox ID="txtEmergencyPhone1" runat="server" CssClass="propertyValue" Text='<% # bind("EmergencyPhone1") %>'
                                    MaxLength="10"></asp:TextBox>
                                <asp:Label ID="Label27" runat="server" Text="*"></asp:Label>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtEmergencyPhone1"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtEmergencyPhone1"
                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Must be 10 digits" ValidationExpression="^(\d{10})$">
                                </asp:RegularExpressionValidator>
                            </p>
                            <%-- Emergency phone 2--%>
                            <p>
                                <asp:Label ID="Label3" runat="server" CssClass="propertyLabel" Text="Emergency Phone 2"></asp:Label>
                                <asp:TextBox ID="txtEmergencyPhone2" runat="server" CssClass="propertyValue" Text='<% # bind("EmergencyPhone2") %>'
                                    MaxLength="10"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtEmergencyPhone2"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmergencyPhone2"
                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Must be 10 digits" ValidationExpression="^(\d{10})$">
                                </asp:RegularExpressionValidator>
                            </p>
                            <%--notes--%>
                            <p>
                                <asp:Label ID="Label21" runat="server" Text="Notes" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtNotes" runat="server" CssClass="propertyValue" Text='<% # bind("notes") %>'
                                    Height="50px" MaxLength="140" TextMode="MultiLine" Width="50%"></asp:TextBox>
                            </p>
                        </EditItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--save cancel buttons--%>
            <div class="modalPopupLinkbutton-div">
                <asp:LinkButton ID="lnkSavePersonalInformationOnEdit" runat="server" CausesValidation="true"
                    OnCommand="lnkSavePersonalInformationOnEdit_OnCommand" CssClass="linkStyle">Save</asp:LinkButton>
                <asp:LinkButton ID="lnkCancelPersonalInformatiOnEdit" runat="server" CausesValidation="false"
                    CssClass="linkStyle">Cancel</asp:LinkButton>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
