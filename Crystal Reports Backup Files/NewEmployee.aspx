<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" AutoEventWireup="true"
    CodeBehind="NewEmployee.aspx.cs" Inherits="Aqua.Employees.NewEmployee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <title>Employees</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Employees</h1>
        <asp:Panel ID="Panel1" runat="server" Width="100%"  CssClass="panel-formview">
            <asp:FormView ID="fViewEmployee" runat="server" CssClass="formView-input" DefaultMode="Insert">
                <InsertItemTemplate>
                    <h2>
                        Create New Employee</h2>
                    <%--firstname--%>
                    <p>
                        <asp:Label ID="Label2" runat="server" Text="Firstname" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtFirstname" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label8" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstname"
                            ErrorMessage="Please enter First Name" InitialValue=" " Display="Static"></asp:RequiredFieldValidator>
                    </p>
                    <%--lastname--%>
                    <p>
                        <asp:Label ID="Label4" runat="server" Text="Lastname" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtLastname" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label28" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastname"
                            ErrorMessage="Please enter Last Name" Display="Static"></asp:RequiredFieldValidator>
                    </p>
                    <%--Job Title--%>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myConnection %>"
                        SelectCommand="SELECT [PositionName], [PositionID] FROM [JobPosition]"></asp:SqlDataSource>
                    <p>
                        <asp:Label ID="Label30" runat="server" Text="Job Title" CssClass="propertyLabel"></asp:Label>
                        <asp:DropDownList ID="ddlJobTitle" runat="server" CssClass="propertyValue" DataSourceID="SqlDataSource1"
                            DataTextField="PositionName" DataValueField="PositionID">
                        </asp:DropDownList>
                        <asp:Label ID="Label34" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlJobTitle"
                            Display="Dynamic" ErrorMessage="Please choose a job description"> </asp:RequiredFieldValidator>
                    </p>
                    <%--Gender--%>
                    <p>
                        <asp:Label ID="Label16" runat="server" Text="Gender" CssClass="propertyLabel"></asp:Label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="propertyValue">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label31" runat="server" Text="*"></asp:Label>
                    </p>
                    <%--email--%>
                    <p>
                        <asp:Label ID="Label10" runat="server" CssClass="propertyLabel" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label33" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Please enter an email address"> </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="You must enter an email address" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                    </p>
                    <%--homephone--%>
                    <p>
                        <asp:Label ID="Label7" runat="server" CssClass="propertyLabel" Text="Home Phone"></asp:Label>
                        <asp:TextBox ID="txtHomePhone" runat="server" CssClass="propertyValue" MaxLength="10"></asp:TextBox>
                        <asp:Label ID="Label12" runat="server" Text="*"></asp:Label>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHomePhone"
                            FilterType="Numbers">
                        </asp:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtHomePhone"
                            Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter a Home phone">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtHomePhone"
                            Display="Dynamic" SetFocusOnError="true" ErrorMessage="Must be 10 digits" ValidationExpression="^(\d{10})$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <%--mobilephone--%>
                    <p>
                        <asp:Label ID="Label19" runat="server" CssClass="propertyLabel" Text="Mobile Phone"></asp:Label>
                        <asp:TextBox ID="txtMobilePhone" runat="server" CssClass="propertyValue" MaxLength="10"></asp:TextBox>
                        <asp:Label ID="Label20" runat="server" Text=""></asp:Label>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtMobilePhone"
                            FilterType="Numbers">
                        </asp:FilteredTextBoxExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtMobilePhone"
                            Display="Dynamic" SetFocusOnError="true" ErrorMessage="Must be 10 digits" ValidationExpression="^(\d{10})$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <%--emergency contact--%>
                    <p>
                        <asp:Label ID="Label3" runat="server" Text="Emergency Contact" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtEmergencyContact" runat="server" CssClass="propertyValue"></asp:TextBox>
                        <asp:Label ID="Label14" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmergencyContact"
                            ErrorMessage="Please enter Emergency Contact Name" InitialValue="" Display="Dynamic"></asp:RequiredFieldValidator>
                    </p>
                    <%-- Emergency Phone 1--%>
                    <p>
                        <asp:Label ID="Label21" runat="server" CssClass="propertyLabel" Text="Emergency Phone 1"></asp:Label>
                        <asp:TextBox ID="txtEmergencyPhone1" runat="server" CssClass="propertyValue" MaxLength="10"></asp:TextBox>
                        <asp:Label ID="Label22" runat="server" Text="*"></asp:Label>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtEmergencyPhone1"
                            FilterType="Numbers">
                        </asp:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter an Emergeny Phone Number" 
                         ControlToValidate="txtEmergencyPhone1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtEmergencyPhone1"
                            Display="Dynamic" SetFocusOnError="true" ErrorMessage="Must be 10 digits" ValidationExpression="^(\d{10})$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <%-- Emergency Phone 2--%>
                    <p>
                        <asp:Label ID="Label23" runat="server" CssClass="propertyLabel" Text="Emergency Phone 2"></asp:Label>
                        <asp:TextBox ID="txtEmergencyPhone2" runat="server" CssClass="propertyValue" MaxLength="10"></asp:TextBox>
                        <asp:Label ID="Label24" runat="server" Text=""></asp:Label>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtEmergencyPhone2"
                            FilterType="Numbers">
                        </asp:FilteredTextBoxExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmergencyPhone2"
                            Display="Dynamic" SetFocusOnError="true" ErrorMessage="Must be 10 digits" ValidationExpression="^(\d{10})$">
                        </asp:RegularExpressionValidator>
                    </p>

                    <%--Hire Date--%>
                    <p>
                        <asp:Label ID="Label13" runat="server" Text="Hire Date" CssClass="propertyLabel"></asp:Label>
                        <asp:TextBox ID="txtHireDate" runat="server" CssClass="propertyValue" MaxLength="10"
                            CausesValidation="false"></asp:TextBox>
                        <asp:ImageButton ImageAlign="Top" ID="btnShowCalendar" runat="server" Width="20px"
                            Height="20px" ImageUrl="~/Images/calendar.gif" CausesValidation="false" />
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="MM/dd/yyyy" TargetControlID="txtHireDate"
                            PopupButtonID="btnShowCalendar">
                        </asp:CalendarExtender>
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="txtHireDate"
                            FilterType="Numbers,Custom" ValidChars="/">
                        </asp:FilteredTextBoxExtender>
                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtHireDate"
                            WatermarkText="mm/dd/yyyy" WatermarkCssClass="watermarked">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtHireDate"
                            ErrorMessage="Please enter Hire Date" InitialValue=" " Display="Static"></asp:RequiredFieldValidator>
                    </p>
                    <%--Notes--%>
                    <p>
                        <asp:Label ID="Label5" runat="server" CssClass="propertyLabel" Text="Notes"></asp:Label>
                        <asp:TextBox ID="txtNotes" runat="server" CausesValidation="false" CssClass="propertyValue"
                           Height="50px" MaxLength="140" TextMode="MultiLine" Width="50%"></asp:TextBox>
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
                        <asp:Label ID="Label1" runat="server" Text="*"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"  
                        ControlToValidate="txtAddressLine1"  Display="Dynamic" ErrorMessage="Please enter an address"></asp:RequiredFieldValidator>
                   
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
                        <asp:Label ID="Label11" runat="server" Text="*"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"  
                        ControlToValidate="txtCityTown"  Display="Dynamic" ErrorMessage="Please enter City/Town"></asp:RequiredFieldValidator>
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
        <%--button div--%>
        <div class="div-navigation-linkbutton">
            <p>
                <asp:LinkButton ID="btnSave" runat="server" OnCommand="btnSave_Command">Save</asp:LinkButton>
                &nbsp
                <asp:LinkButton ID="btnCancel" runat="server" CausesValidation="false" PostBackUrl="~/Admin/EmployeeManagement/Default.aspx">Cancel</asp:LinkButton>
            </p>
        </div>
    </div>
    <%--end mainContainer--%>
</asp:Content>
