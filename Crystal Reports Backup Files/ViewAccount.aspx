<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.Master" AutoEventWireup="true"
    CodeBehind="ViewAccount.aspx.cs" Inherits="Aqua.Accounts.ViewAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <title>View Account</title>
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/tabContainerStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            View Account</h1>
        <div class="div-primaryIdentifiers">
            <span class="span-primaryIdentifier">
                <asp:Label ID="lblAccountNumber" runat="server">
                </asp:Label>
            </span><span class="span-primaryIdentifier">
                <asp:Label ID="lblPrimaryAccountHolder" runat="server"></asp:Label></span>
        </div>
        <div class="div-primaryOptions">
        </div>
        <div class="divSpacer">
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%"
                        CssClass="AccountTab">
                        <%--Account Tab--%>
                        <asp:TabPanel runat="server" ID="AccountsTabPanel" HeaderText="Account Details" Height="100%">
                            <ContentTemplate>
                                <div>
                                    <div style="float: left; width: 44%; height: auto; border: 1px solid gray">
                                        <asp:Label ID="Label25" runat="server" Text="Primary Information" Font-Size="Large"></asp:Label>
                                        <asp:LinkButton ID="lnkEditPersonalInformation" runat="server" CssClass="linkbutton"
                                            OnCommand="lnkEditPersonalInformation_OnCommand">Edit</asp:LinkButton>
                                        <%--home phone--%>
                                        <div class="innerDiv">
                                            <span class="span-innerDiv-detailsHeader">Home Phone</span> <span class="span-innerDiv-details">
                                                <asp:Label ID="lblHomephone" runat="server"></asp:Label></span>
                                        </div>
                                        <%--mobile phone--%>
                                        <div class="innerDiv">
                                            <span class="span-innerDiv-detailsHeader">Mobile Phone</span> <span class="span-innerDiv-details">
                                                <asp:Label ID="lblMobilephone" runat="server"></asp:Label></span>
                                        </div>
                                        <%--work phone--%>
                                        <div class="innerDiv">
                                            <span class="span-innerDiv-detailsHeader">Work Phone </span><span class="span-innerDiv-details">
                                                <asp:Label ID="lblWorkphone" runat="server"></asp:Label></span>
                                        </div>
                                        <%--email--%>
                                        <div class="innerDiv">
                                            <span class="span-innerDiv-detailsHeader">Email</span> <span class="span-innerDiv-details">
                                                <asp:Label ID="lblEmailAddress" runat="server"></asp:Label></span>
                                        </div>
                                        <%--Newsletters--%>
                                        <div class="innerDiv">
                                            <span class="span-innerDiv-detailsHeader">Newsletter Options</span> <span class="span-innerDiv-details">
                                                Receive by Email?
                                                <asp:Label ID="lblENewsletter" runat="server"></asp:Label>
                                                <%--<asp:CheckBox ID="chkEnewsletter" runat="server" Enabled="false" />--%>
                                            </span><span class="span-innerDiv-details">Receive by Traditional Mail?
                                                <asp:Label ID="lblNewsletter" runat="server"></asp:Label>
                                                <%--<asp:CheckBox ID="chkstandardNewsletter" runat="server" Enabled="false" />--%>
                                            </span>
                                        </div>
                                        <%--Customer since--%>
                                        <div class="innerDiv">
                                            <span class="span-innerDiv-detailsHeader">Customer Since</span> <span class="span-innerDiv-details">
                                                <asp:Label ID="lblCustomerSince" runat="server"></asp:Label></span>
                                        </div>
                                        <%--contact Frequency--%>
                                        <div class="innerDiv">
                                            <span class="span-innerDiv-detailsHeader">Contact Frequency</span> <span class="span-innerDiv-details">
                                                <asp:Label ID="lblContactFrequency" runat="server"></asp:Label></span>
                                        </div>
                                        <%--water source location--%>
                                        <div class="innerDiv">
                                            <span class="span-innerDiv-detailsHeader">Water Source Location</span> <span class="span-innerDiv-details">
                                                <asp:Label ID="lblWaterSourceLocation" runat="server"></asp:Label>
                                            </span>
                                        </div>
                                    </div>
                                    <div style="float: right; width: 55%; height: auto; border: 1px solid gray">
                                        <asp:Label ID="Label24" runat="server" Text="Addresses" Font-Size="Large"></asp:Label>
                                        <%--Home Address--%>
                                        <div class="innerDiv">
                                            <div style="border: 1px solid gray;">
                                                <span class="span-innerDiv-detailsHeader">Home Address </span><span>
                                                    <asp:LinkButton ID="lnkEditHomeAddress" runat="server" CssClass="linkbutton" OnCommand="lnkEditHomeAddress_OnCommand">Edit</asp:LinkButton>
                                                </span>
                                            </div>
                                            <span class="span-innerDiv-details">
                                                <asp:Label ID="lblHomeAddressLine1" runat="server"></asp:Label>
                                            </span><span class="span-innerDiv-details">
                                                <asp:Label ID="lblHomeAddressLine2" runat="server"></asp:Label>
                                            </span><span class="span-innerDiv-details">
                                                <asp:Label ID="lblHomeCityTown" runat="server"></asp:Label>
                                                <asp:Label ID="lblHomeProvince" runat="server" Text="Label"></asp:Label>
                                                <asp:Label ID="lblHomePostalCode" runat="server"></asp:Label>
                                            </span>
                                        </div>
                                        <%-- Mailing address--%>
                                        <div class="innerDiv">
                                            <div style="border: 1px solid gray">
                                                <span class="span-innerDiv-detailsHeader">Mailing Address </span>
                                                <asp:LinkButton ID="lnkEditMailingAddress" runat="server" CssClass="linkbutton" OnCommand="lnkEditMailingAddress_OnCommand">Edit</asp:LinkButton>
                                            </div>
                                            <span class="span-innerDiv-details">
                                                <asp:Label ID="lblMailingAddressLine1" runat="server"></asp:Label></span> <span class="span-innerDiv-details">
                                                    <asp:Label ID="lblMailingAddressLine2" runat="server"></asp:Label></span>
                                            <span class="span-innerDiv-details">
                                                <asp:Label ID="lblMailingCityTown" runat="server"></asp:Label>
                                                <asp:Label ID="lblMailingProvince" runat="server"></asp:Label>
                                                <asp:Label ID="lblMailingPostalCode" runat="server"></asp:Label></span>
                                        </div>
                                    </div>
                                    <div style="display: block; clear: both">
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <%--Equipment Tab--%>
                        <asp:TabPanel ID="WTETabPanel" runat="server" HeaderText="Equipments">
                            <ContentTemplate>
                                <div>
                                    <div class="mainContainer-innerSpacer">
                                        <h2>
                                            Enter details or <span>
                                                <asp:LinkButton ID="lnkLookupWTE" runat="server" CssClass="linkbutton-no-line" OnCommand="lnkLookupWTE_OnCommand"
                                                    ToolTip="Click to search equipment in Inventory">Lookup</asp:LinkButton></span>
                                            to add Water Treatment Equipment</h2>
                                        <hr />
                                        <asp:FormView ID="fviewWTE" runat="server" DefaultMode="Insert">
                                            <InsertItemTemplate>
                                                <div class="div-requiredFieldMessage">
                                                    <asp:Label ID="Label64" runat="server" Text="Note: All fields are required" CssClass="requiredFieldLabelMessage"></asp:Label>
                                                </div>
                                                </p>
                                                <%--product code--%>
                                                <p>
                                                    <asp:Label ID="Label59" runat="server" Text="Product Code" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtProductCode" runat="server" CssClass="propertyValue" ValidationGroup="valAddWTE"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txtProductCode" Display="Dynamic" ValidationGroup="valAddWTE"></asp:RequiredFieldValidator>
                                                </p>
                                                <%--description--%>
                                                <p>
                                                    <asp:Label ID="Label61" runat="server" Text="Description" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="propertyValue" ValidationGroup="valAddWTE"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" Display="Dynamic"
                                                        ControlToValidate="txtDescription" ErrorMessage="*" ValidationGroup="valAddWTE"></asp:RequiredFieldValidator>
                                                </p>
                                                <%--manufacturer--%>
                                                <p>
                                                    <asp:Label ID="Label62" runat="server" Text="Manufacturer" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtManufacturer" runat="server" CssClass="propertyValue" ValidationGroup="valAddWTE"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" Display="Dynamic"
                                                        ControlToValidate="txtManufacturer" ErrorMessage="*" ValidationGroup="valAddWTE"></asp:RequiredFieldValidator>
                                                </p>
                                                <%--date obtained--%>
                                                <p>
                                                    <asp:Label ID="Label63" runat="server" Text="Date Obtained" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtDateObtained" runat="server" CssClass="propertyValue" CausesValidation="false"
                                                        ValidationGroup="valAddWTE"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txtDateObtained" Display="Dynamic" ValidationGroup="valAddWTE">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="MM/dd/yyyy" TargetControlID="txtDateObtained"
                                                        PopupButtonID="btnShowCal">
                                                    </asp:CalendarExtender>
                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" TargetControlID="txtDateObtained"
                                                        FilterType="Numbers,Custom" ValidChars="/">
                                                    </asp:FilteredTextBoxExtender>
                                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtDateObtained"
                                                        WatermarkText="mm/dd/yyyy" WatermarkCssClass="watermarked">
                                                    </asp:TextBoxWatermarkExtender>
                                                    <%--                                                    <asp:ImageButton ID="btnShowCal" runat="server"  ImageUrl="~/Images/calendar.gif" Width="20px" Height="20px" 
                                                    />--%>
                                                    <img src="../Images/calendar.gif" id="btnShowCal" alt="Icon" width="20px" height="20px" />
                                                </p>
                                                <%--allow reminder--%>
                                                <p>
                                                    <asp:Label ID="Label68" runat="server" Text="Filter change reminders" CssClass="propertyLabel"></asp:Label>
                                                    <asp:DropDownList ID="ddlSetReminder" OnSelectedIndexChanged="ddlSetReminder_OnSelectedIndexChanged"
                                                        runat="server" CssClass="propertyValue" AutoPostBack="true" ValidationGroup="valAddWTE">
                                                        <asp:ListItem Selected="True">Please Select</asp:ListItem>
                                                        <asp:ListItem Value="true">Yes, contact for reminders</asp:ListItem>
                                                        <asp:ListItem Value="false">No, do not contact</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="*"
                                                        ControlToValidate="ddlSetReminder" Display="Dynamic" InitialValue="Please Select"
                                                        ValidationGroup="valAddWTE"></asp:RequiredFieldValidator>
                                                </p>
                                                <asp:Panel ID="pnlReminders" runat="server" Visible="false">
                                                    <%--next reminder date--%>
                                                    <p>
                                                        <asp:Label ID="Label69" runat="server" Text="Next Reminder Date" CssClass="propertyLabel"></asp:Label>
                                                        <asp:TextBox ID="txtNextReminderDate" runat="server" CssClass="propertyValue" ValidationGroup="valAddWTE"></asp:TextBox>
                                                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" Format="MM/dd/yyyy" TargetControlID="txtNextReminderDate"
                                                            PopupButtonID="btnShowNextReminderCal">
                                                        </asp:CalendarExtender>
                                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtNextReminderDate"
                                                            FilterType="Numbers,Custom" ValidChars="/">
                                                        </asp:FilteredTextBoxExtender>
                                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txtNextReminderDate"
                                                            WatermarkText="mm/dd/yyyy" WatermarkCssClass="watermarked">
                                                        </asp:TextBoxWatermarkExtender>
                                                        <asp:RequiredFieldValidator ID="rfv" runat="server" ErrorMessage="*" ControlToValidate="txtNextReminderDate"
                                                            ValidationGroup="valAddWTE" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <img src="../Images/calendar.gif" id="btnShowNextReminderCal" alt="Icon" width="20px"
                                                            height="20px" />
                                                    </p>
                                                    <%--reminder frequency--%>
                                                    <p>
                                                        <asp:Label ID="Label42" runat="server" Text="Reminder Frequency" CssClass="propertyLabel"></asp:Label>
                                                        <asp:DropDownList ID="ddlReminderFreq" runat="server" CssClass="propertyValue" AutoPostBack="true"
                                                            ValidationGroup="valAddWTE">
                                                            <asp:ListItem Selected="True">Please Select</asp:ListItem>
                                                            <asp:ListItem Value="12">Annually</asp:ListItem>
                                                            <asp:ListItem Value="6">Semi-Annually</asp:ListItem>
                                                            <asp:ListItem Value="3">Quarterly</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="*"
                                                            ControlToValidate="ddlReminderFreq" Display="Dynamic" InitialValue="Please Select"
                                                            ValidationGroup="valAddWTE"></asp:RequiredFieldValidator>
                                                    </p>
                                                </asp:Panel>
                                            </InsertItemTemplate>
                                        </asp:FormView>
                                        <%--add button--%>
                                        <div style="padding: 2em 0 2em 30em">
                                            <asp:LinkButton ID="lnkAddWTE" runat="server" CssClass="linkStyle" CausesValidation="True"
                                                ValidationGroup="valAddWTE" OnCommand="lnkAddWTE_OnCommand">Add</asp:LinkButton>
                                            &nbsp
                                            <asp:LinkButton ID="lnkResetWTEFields" runat="server" OnCommand="lnkResetWTEFields_OnCommand"
                                                ValidationGroup="valAddWTE" CssClass="linkStyle" CausesValidation="false">Reset</asp:LinkButton>
                                        </div>
                                    </div>
                                    <%--Gridview WTE List--%>
                                    <div class="mainContainer-innerSpacer">
                                        <h2>
                                            Equipment List</h2>
                                        <hr />
                                        <asp:GridView ID="gviewWTE" runat="server" CssClass="gridviewBaseStyle" Width="100%"
                                            EmptyDataText="No records found. . ." AutoGenerateColumns="false">
                                            <HeaderStyle CssClass="gridviewHeaderStyle-min" />
                                            <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                                            <RowStyle CssClass="gridviewRowStyle" />
                                            <Columns>
                                                <%--product code--%>
                                                <asp:TemplateField HeaderText="Product Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label43" runat="server" Text='<% # bind("productCode") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--desc--%>
                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label44" runat="server" Text='<% # bind("description") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--manufacturer--%>
                                                <asp:TemplateField HeaderText="Manufacturer">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label45" runat="server" Text='<% # bind("manufacturer") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--date obtained--%>
                                                <asp:TemplateField HeaderText="Date Obtained">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label46" runat="server" Text='<% #  String.Format("{0:MM/dd/yyyy}", Eval("dateObtained") )  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--reminder freq--%>
                                                <asp:TemplateField HeaderText="Reminder Frequency">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label50" runat="server" Text='<% # GetReminderFrequencyValue(Eval("reminderFrequencyInMonths").ToString() )  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--last reminder date--%>
                                                <asp:TemplateField HeaderText="Last reminder Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label51" runat="server" Text='<% #  String.Format("{0:MM/dd/yyyy}", Eval("lastReminderDate") )  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--next reminder date--%>
                                                <asp:TemplateField HeaderText="Next Reminder Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label52" runat="server" Text='<% #  String.Format("{0:MM/dd/yyyy}", Eval("nextReminderDate") )  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--edit--%>
                                                <%--delete--%>
                                                <%--update--%>
                                                <%--cancel--%>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <%--Authorized Members Tab--%>
                        <asp:TabPanel runat="server" ID="MembersTabPanel" HeaderText="Members">
                            <ContentTemplate>
                                <div>
                                    <div class="mainContainer-innerSpacer">
                                        <h2>
                                            Enter details below to add member</h2>
                                        <hr />
                                        <asp:FormView ID="fviewAuthorizedMember" runat="server" DefaultMode="Insert">
                                            <InsertItemTemplate>
                                                <div class="div-requiredFieldMessage">
                                                    <asp:Label ID="Label120" runat="server" Text="Note: All fields are required" CssClass="requiredFieldLabelMessage"></asp:Label>
                                                </div>
                                                <%--firstname--%>
                                                <p>
                                                    <asp:Label ID="Label47" runat="server" Text="Firstname" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtFname" runat="server" CssClass="propertyValue" ValidationGroup="valAddAuthMember"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*"
                                                        Display="Dynamic" ControlToValidate="txtFname" ValidationGroup="valAddAuthMember"></asp:RequiredFieldValidator>
                                                </p>
                                                <%--lastname--%>
                                                <p>
                                                    <asp:Label ID="Label48" runat="server" Text="Lastname" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtLname" runat="server" CssClass="propertyValue" ValidationGroup="valAddAuthMember"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*"
                                                        Display="Dynamic" ControlToValidate="txtLname" ValidationGroup="valAddAuthMember"></asp:RequiredFieldValidator>
                                                </p>
                                                <%--relation to primary account holder--%>
                                                <p>
                                                    <asp:Label ID="Label49" runat="server" Text="Relation to account holder" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtRelation" runat="server" CssClass="propertyValue" ValidationGroup="valAddAuthMember"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*"
                                                        Display="Dynamic" ControlToValidate="txtRelation" ValidationGroup="valAddAuthMember"></asp:RequiredFieldValidator>
                                                </p>
                                            </InsertItemTemplate>
                                        </asp:FormView>
                                        <%--add button--%>
                                        <div style="padding: 2em 0 2em 30em">
                                            <asp:LinkButton ID="lnkAddAuthMember" runat="server" CssClass="linkStyle" CausesValidation="true"
                                                OnCommand="lnkAddAuthMember_OnCommand" ValidationGroup="valAddAuthMember">Add</asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="mainContainer-innerSpacer">
                                        <h2>
                                            Authorized Members:</h2>
                                        <hr />
                                        <asp:GridView ID="gViewMembers" runat="server" AutoGenerateColumns="false" Width="80%"
                                            EmptyDataText="No members." OnRowEditing="gViewMembers_OnRowEditing" OnRowCancelingEdit="gViewMembers_OnRowCancelingEdit"
                                            OnRowUpdating="gViewMembers_RowUpdating" DataKeyNames="AuthMemberID" CssClass="gridviewBaseStyle">
                                            <HeaderStyle CssClass="gridviewHeaderStyle-min" />
                                            <RowStyle CssClass="gridviewRowStyle" />
                                            <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                                            <Columns>
                                                <asp:TemplateField Visible="false">
                                                    <EditItemTemplate>
                                                        <asp:HiddenField ID="hdnAccountID" runat="server" Value='<% # bind("AccountID") %>'
                                                            Visible="false" />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <%--firstname--%>
                                                <asp:TemplateField HeaderText="Firstname">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label17" runat="server" Text='<% # bind("Firstname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtFirstname" runat="server" Text='<% # bind("Firstname") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <%--lastname--%>
                                                <asp:TemplateField HeaderText="Lastname">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label10" runat="server" Text='<% # bind("Lastname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtLastname" runat="server" Text='<% # bind("Lastname") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <%--relationship--%>
                                                <asp:TemplateField HeaderText="Relationship">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label18" runat="server" Text='<% # bind("RelationToAccountOwner") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtRelationToAccountOwner" runat="server" Text='<% # bind("RelationToAccountOwner") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <%--edit--%>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEditMember" runat="server" CommandName="Edit" CausesValidation="false">Edit</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--delete--%>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkRemoveMember" runat="server" CommandName="Delete" CommandArgument='<% # bind("AuthMemberID") %>'
                                                            OnCommand="lnkRemoveMember_OnCommand" CausesValidation="false">Delete</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--update--%>
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkUpdateMember" runat="server" CommandName="Update" Visible="false">Update</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--cancel--%>
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkCancelMember" runat="server" CommandName="Cancel" CausesValidation="false"
                                                            Visible="false">Cancel</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <%-- Service Work Tab--%>
                        <asp:TabPanel ID="tbService" runat="server" HeaderText="Service Work">
                            <ContentTemplate>
                                <div>
                                    <div class="mainContainer-innerSpacer">
                                        <asp:LinkButton ID="lnkGoToServiceWorkOrder" OnCommand="lnkGoToServiceWorkOrder_OnCommand"
                                            runat="server">Add new Service</asp:LinkButton>
                                        <br />
                                        <br />
                                        <h2>
                                            Service Work History</h2>
                                        <hr />
                                        <asp:GridView ID="gviewServiceHistory" runat="server" AutoGenerateColumns="false"
                                            CssClass="gridviewBaseStyle" EmptyDataText="No records found. . .">
                                            <HeaderStyle CssClass="gridviewHeaderStyle-min" />
                                            <RowStyle CssClass="gridviewRowStyle" />
                                            <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Service ID">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkViewServiceWorkDetails" runat="server" OnCommand="lnkViewServiceWorkDetails_OnCommand"
                                                            CommandArgument='<% # bind("ServiceWorkID") %>' CssClass="linkbutton-no-line"
                                                            Text='<% # bind("ServiceWorkID") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Service Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label26" runat="server" Text='<% # String.Format("{0:MM/dd/yyyy}" ,Eval("ServiceDate") )  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <%--U-Fill Prepaid Tab--%>
                        <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="U-Fill Prepaid">
                            <ContentTemplate>
                                <div>
                                    <div class="mainContainer-innerSpacer">
                                        <h2>
                                            U-Fill Prepaid Water Packages</h2>
                                        <hr />
                                        <asp:GridView ID="gviewPrepaidPackage" runat="server" EmptyDataText="No Prepaid Water Package found. . ."
                                            Width="80%" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Left" CssClass="gridviewBaseStyle-wat">
                                            <AlternatingRowStyle CssClass="gridviewAlternatingStyle-wat" />
                                            <RowStyle CssClass="gridviewRowStyle-wat" />
                                            <HeaderStyle CssClass="gridviewHeaderStyle-wat" />
                                            <Columns>
                                                <%--prepaid bottle id--%>
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:HiddenField ID="hdnPrepaidBottleID" runat="server" Visible="false" Value='<% # bind("prepaidBottleID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--bottle type--%>
                                                <asp:TemplateField HeaderText="Bottle Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label54" runat="server" Text='<% # bind("bottleType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--balance--%>
                                                <asp:TemplateField HeaderText="Balance">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBalance" runat="server" Text='<% # bind("balance") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--balance as of--%>
                                                <asp:TemplateField HeaderText="Last Updated">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label57" runat="server" Text='<% #  String.Format("{0:ddd MM/dd/yyyy hh:mm tt}", Eval("lastUpdatedDate") )  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--deduct--%>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgBtnShowDeductBalance" runat="server" ImageUrl="~/Images/Minus-icon.png"
                                                            CausesValidation="false" Height="35px" Width="35px" ToolTip="Deduct Balance"
                                                            ImageAlign="AbsMiddle" AlternateText="Deduct" CommandArgument='<% # bind("prepaidBottleID") %>'
                                                            OnCommand="imgBtnShowDeductBalance_OnCommand" />
                                                        <%--                                                        <asp:LinkButton ID="LinkButton1" runat="server" >Deduct</asp:LinkButton>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--topup--%>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgBtnGoToSale" runat="server" ImageUrl="~/Images/Plus-icon.png"
                                                            CausesValidation="false" Height="35px" Width="35px" ToolTip="Top up Balance"
                                                            ImageAlign="AbsMiddle" AlternateText="Top Up" OnCommand="imgBtnGoToSale_OnCommand" />
                                                        <%--                                                        <asp:LinkButton ID="LinkButton2" runat="server" >Top Up</asp:LinkButton>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--view history--%>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkViewPrepaidHistory" runat="server" CssClass="linkbutton-no-line"
                                                            Font-Size="0.85em" CommandArgument='<% # bind("prepaidBottleID") %>' OnCommand="lnkViewPrepaidHistory_OnCommand">View History</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <%--Water Analysis--%>
                        <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="Water Analysis ">
                            <ContentTemplate>
                                <div>
                                    <div class="mainContainer-innerSpacer">
                                        <h2>
                                            Add new analysis by entering data below</h2>
                                        <hr />
                                        <asp:FormView ID="fviewWaterAnalysis" runat="server" DefaultMode="Insert">
                                            <InsertItemTemplate>
                                                <div class="div-requiredFieldMessage">
                                                    <asp:Label ID="Label128" runat="server" Text="Note: All fields are required" CssClass="requiredFieldLabelMessage"></asp:Label>
                                                </div>
                                                <%--hardness--%>
                                                <p>
                                                    <asp:Label ID="Label27" runat="server" Text="Hardness" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtHardness" runat="server" CssClass="propertyValue" MaxLength="10"
                                                        ValidationGroup="valAddWaterAnalysis"></asp:TextBox>
                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtHardness"
                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                    </asp:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*"
                                                        Display="Dynamic" ControlToValidate="txtHardness" ValidationGroup="valAddWaterAnalysis"></asp:RequiredFieldValidator>
                                                </p>
                                                <%--ClearIron--%>
                                                <p>
                                                    <asp:Label ID="Label35" runat="server" Text="Clear Iron" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtClearIron" runat="server" CssClass="propertyValue" MaxLength="10"
                                                        vValidationGroup="valAddWaterAnalysis"></asp:TextBox>
                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtClearIron"
                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                    </asp:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                                                        Display="Dynamic" ControlToValidate="txtClearIron" ValidationGroup="valAddWaterAnalysis"></asp:RequiredFieldValidator>
                                                </p>
                                                <%--ph acid--%>
                                                <p>
                                                    <asp:Label ID="Label29" runat="server" Text="pH Acid" CssClass="propertyLabel"></asp:Label><asp:TextBox
                                                        ID="txtPh" runat="server" CssClass="propertyValue" MaxLength="10" ValidationGroup="valAddWaterAnalysis"></asp:TextBox>
                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtPh"
                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                    </asp:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*"
                                                        Display="Dynamic" ControlToValidate="txtPh" ValidationGroup="valAddWaterAnalysis"></asp:RequiredFieldValidator>
                                                </p>
                                                <%--hydrogen Sulfide--%>
                                                <p>
                                                    <asp:Label ID="Label30" runat="server" Text="Hydrogen Sulfide" CssClass="propertyLabel"></asp:Label><asp:TextBox
                                                        ID="txtHydrogenSulfide" runat="server" CssClass="propertyValue" MaxLength="10"
                                                        ValidationGroup="valAddWaterAnalysis"></asp:TextBox>
                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtHydrogenSulfide"
                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                    </asp:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*"
                                                        Display="Dynamic" ControlToValidate="txtHydrogenSulfide" ValidationGroup="valAddWaterAnalysis"></asp:RequiredFieldValidator>
                                                </p>
                                                <%--TDS--%>
                                                <p>
                                                    <asp:Label ID="Label34" runat="server" Text="Total Dissolved Solids" CssClass="propertyLabel"></asp:Label>
                                                    <asp:TextBox ID="txtTDS" runat="server" CssClass="propertyValue" MaxLength="10" ValidationGroup="valAddWaterAnalysis"></asp:TextBox>
                                                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtTDS"
                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                    </asp:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*"
                                                        Display="Dynamic" ControlToValidate="txtTDS" ValidationGroup="valAddWaterAnalysis"></asp:RequiredFieldValidator>
                                                </p>
                                            </InsertItemTemplate>
                                        </asp:FormView>
                                        <%--add button--%>
                                        <div style="padding: 2em 0 2em 30em">
                                            <asp:LinkButton ID="lnkAddWaterAnalysis" runat="server" CssClass="linkStyle" OnCommand="lnkAddWaterAnalysis_OnCommand"
                                                CausesValidation="true" ValidationGroup="valAddWaterAnalysis">Add</asp:LinkButton>
                                        </div>
                                    </div>
                                    <%--gridview water analysis--%>
                                    <div class="mainContainer-innerSpacer">
                                        <h2>
                                            Water Analysis History</h2>
                                        <hr />
                                        <asp:GridView ID="gviewWaterAnalysis" runat="server" CssClass="gridviewBaseStyle"
                                            AutoGenerateColumns="false" Width="100%" EmptyDataText="No records found. . .">
                                            <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                                            <RowStyle CssClass="gridviewRowStyle" />
                                            <HeaderStyle CssClass="gridviewHeaderStyle-min" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Date Taken">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label41" runat="server" Text='<% # bind("createddate") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Hardness">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label36" runat="server" Text='<% # bind("hardness") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clear Iron">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label37" runat="server" Text='<% # bind("clearIron") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="pH Acid">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label38" runat="server" Text='<% # bind("ph_acid") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Hydrogen Sulfide">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label39" runat="server" Text='<% # bind("hydrogenSulfide") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TDS">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label40" runat="server" Text='<% # bind("tds") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                </ContentTemplate>
            </asp:UpdatePanel>
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
                                Edit Home Address</h1>
                            <%--addressLine1--%>
                            <p>
                                <asp:Label ID="Label6" runat="server" Text="Address Line 1" CssClass="propertyLabel">
                                </asp:Label><asp:TextBox ID="txtAddressLine1" runat="server" CssClass="propertyValue"
                                    Text='<% # bind("addressLine1") %>'></asp:TextBox>
                                <asp:Label ID="Label11" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddressLine1"
                                    Display="Dynamic" ErrorMessage="Please enter address"></asp:RequiredFieldValidator>
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
                                <asp:Label ID="Label19" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCityTown"
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
                                    MaxLength="3" Style="text-transform: uppercase" Width="40" Text='<% # String.Format("{0}",Eval("postalCode") ).Substring(0,3) %>'></asp:TextBox>
                                <asp:Label ID="Label" runat="server" Text=" - "></asp:Label><%--postal code segment2 0L0--%><asp:TextBox
                                    ID="txtPostalCode_segment2" runat="server" CssClass="propertyValue" MaxLength="3"
                                    Style="text-transform: uppercase" Width="40" Text='<% # String.Format("{0}",Eval("postalCode") ).Substring(3,3) %>'></asp:TextBox>
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
            <%--save cancel button--%>
            <div class="modalPopupLinkbutton-div">
                <asp:LinkButton ID="lnkSaveHomeAddressOnEdit" runat="server" CausesValidation="true"
                    OnCommand="lnkSaveHomeAddressOnEdit_OnCommand" CssClass="linkStyle">Save</asp:LinkButton>
                <asp:LinkButton ID="lnkCancelHomeAddressOnEdit" runat="server" CausesValidation="false"
                    CssClass="linkStyle">Cancel</asp:LinkButton>
            </div>
        </asp:Panel>
        <%--modal popup for edit Mailing Address--%>
        <asp:Panel ID="pnlMailingAddressOnEdit" runat="server" Style="display: none; border: 0.2em solid gray;
            background: #FBFBFB">
            <asp:UpdatePanel ID="updPnlMailingAddressOnEdit" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnShowMailingAddress" runat="server" Text="Button" Style="display: none" />
                    <asp:ModalPopupExtender ID="mPopupEdit_MailingAddress" TargetControlID="btnShowMailingAddress"
                        PopupControlID="pnlMailingAddressOnEdit" BackgroundCssClass="ModalPopupBackground"
                        runat="server" CancelControlID="lnkCancelMailingAddressOnEdit">
                    </asp:ModalPopupExtender>
                    <asp:FormView ID="fview_EditMailingAddress" runat="server" DefaultMode="Edit" CssClass="formviewEdit">
                        <EditItemTemplate>
                            <h1>
                                Edit Mailing Address</h1>
                            <%--addressLine1--%>
                            <p>
                                <asp:Label ID="Label6" runat="server" Text="Address Line 1" CssClass="propertyLabel">
                                </asp:Label><asp:TextBox ID="txtAddressLine1" runat="server" CssClass="propertyValue"
                                    Text='<% # bind("addressLine1") %>'></asp:TextBox>
                                <asp:Label ID="Label22" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter an address"
                                    Display="Dynamic" ControlToValidate="txtAddressLine1"></asp:RequiredFieldValidator>
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
                                <asp:Label ID="Label23" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" SetFocusOnError="true"
                                    ErrorMessage="Please enter City" Display="Dynamic" ControlToValidate="txtCityTown"></asp:RequiredFieldValidator>
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
                            </p>
                        </EditItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--save cancel button--%>
            <div class="modalPopupLinkbutton-div">
                <asp:LinkButton ID="lnkSaveMailingAddressOnEdit" runat="server" CausesValidation="true"
                    OnCommand="lnkSaveMailingAddressOnEdit_OnCommand" CssClass="linkStyle">Save</asp:LinkButton>&nbsp
                <asp:LinkButton ID="lnkCancelMailingAddressOnEdit" runat="server" CausesValidation="false"
                    CssClass="linkStyle">Cancel</asp:LinkButton>
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
                        CssClass="formviewEdit">
                        <EditItemTemplate>
                            <h1>
                                Edit Primary Information</h1>
                            <%--title--%>
                            <p>
                                <asp:Label ID="Label1" runat="server" Text="Title" CssClass="propertyLabel"></asp:Label>
                                <asp:DropDownList ID="ddlTitle" runat="server" CssClass="propertyValue" ValidationGroup="val_EditPrimaryInfo">
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
                                <asp:TextBox ID="txtFirstname" runat="server" CssClass="propertyValue" Text='<% # bind("firstname") %>'
                                    ValidationGroup="val_EditPrimaryInfo"></asp:TextBox>
                                <asp:Label ID="Label8" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstname"
                                    ErrorMessage="Please enter First Name" InitialValue=" " Display="Dynamic" ValidationGroup="val_EditPrimaryInfo"></asp:RequiredFieldValidator>
                            </p>
                            <%--middlename--%>
                            <p>
                                <asp:Label ID="Label3" runat="server" Text="Middlename" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtMiddlename" runat="server" CssClass="propertyValue" Text='<% # bind("middlename") %>'
                                    ValidationGroup="val_EditPrimaryInfo"></asp:TextBox>
                            </p>
                            <%--lastname--%>
                            <p>
                                <asp:Label ID="Label4" runat="server" Text="Lastname" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtLastname" runat="server" CssClass="propertyValue" Text='<% # bind("lastname") %>'></asp:TextBox>
                                <asp:Label ID="Label28" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastname"
                                    ErrorMessage="Please enter Last Name" Display="Dynamic" ValidationGroup="val_EditPrimaryInfo"> </asp:RequiredFieldValidator>
                            </p>
                            <%--suffix--%>
                            <p>
                                <asp:Label ID="Label5" runat="server" Text="Suffix" CssClass="propertyLabel"></asp:Label>
                                <asp:DropDownList ID="ddlSuffix" runat="server" CssClass="propertyValue" ValidationGroup="val_EditPrimaryInfo">
                                    <asp:ListItem Value="">- Select One -</asp:ListItem>
                                    <asp:ListItem Value=""> n/a </asp:ListItem>
                                    <asp:ListItem>Sr </asp:ListItem>
                                    <asp:ListItem>Jr </asp:ListItem>
                                </asp:DropDownList>
                            </p>
                            <%--email--%>
                            <p>
                                <asp:Label ID="Label10" runat="server" CssClass="propertyLabel" Text="Email"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="propertyValue" Text='<% # bind("email") %>'
                                    MaxLength="50" ValidationGroup="val_EditPrimaryInfo"></asp:TextBox>
                                <asp:Label ID="Label33" runat="server" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                                    Display="Dynamic" ErrorMessage="Please enter an email address" ValidationGroup="val_EditPrimaryInfo"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="Please enter a valid address"
                                    Display="Dynamic" ControlToValidate="txtEmail" ValidationGroup="val_EditPrimaryInfo"
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                            </p>
                            <%--homephone--%>
                            <p>
                                <asp:Label ID="Label7" runat="server" CssClass="propertyLabel" Text="Home Phone"></asp:Label>
                                <asp:TextBox ID="txtHomePhone" runat="server" CssClass="propertyValue" Text='<% # bind("homephone") %>'
                                    MaxLength="10" ValidationGroup="val_EditPrimaryInfo"></asp:TextBox>
                                <asp:Label ID="Label16" runat="server" Text="*"></asp:Label>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHomePhone"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHomePhone"
                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter a Home phone"
                                    ValidationGroup="val_EditPrimaryInfo">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtHomePhone"
                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Must be 10 digits" ValidationGroup="val_EditPrimaryInfo"
                                    ValidationExpression="^(\d{10})$">
                                </asp:RegularExpressionValidator>
                            </p>
                            <%--mobilephone--%>
                            <p>
                                <asp:Label ID="Label20" runat="server" Text="Mobile Phone" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtMobilePhone" runat="server" MaxLength="10" CssClass="propertyValue"
                                    Text='<% # bind("MobilePhone") %>' ValidationGroup="val_EditPrimaryInfo"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtMobilePhone"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Must be 10 digits"
                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="val_EditPrimaryInfo"
                                    ControlToValidate="txtMobilePhone" ValidationExpression="^(\d{10})$"></asp:RegularExpressionValidator>
                            </p>
                            <%-- work phone--%>
                            <p>
                                <asp:Label ID="Label21" runat="server" Text="Work Phone" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtWorkPhone" runat="server" MaxLength="10" CssClass="propertyValue"
                                    Text='<% # bind("WorkPhone") %>' ValidationGroup="val_EditPrimaryInfo"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtWorkPhone"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Must be 10 digits"
                                    Display="Dynamic" ControlToValidate="txtWorkPhone" ValidationGroup="val_EditPrimaryInfo"
                                    SetFocusOnError="true" ValidationExpression="^(\d{10})$"></asp:RegularExpressionValidator>
                            </p>
                            <%--Customer since date--%>
                            <p>
                                <asp:Label ID="Label13" runat="server" Text="Customer Since" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtCustSinceDate" runat="server" CssClass="propertyValue" MaxLength="10"
                                    ValidationGroup="val_EditPrimaryInfo" CausesValidation="false" Text='<% # String.Format("{0:MM/dd/yyyy}" ,Eval("CustomerSince") )  %>'></asp:TextBox>
                                <asp:ImageButton ImageAlign="Top" ID="btnShowCalendar" runat="server" Width="20px"
                                    Height="20px" ImageUrl="~/Images/calendar.gif" CausesValidation="false" ValidationGroup="val_EditPrimaryInfo" />
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myConnection %>"
                                SelectCommand="SELECT [Description], [LocationID] FROM [Ref_WaterSourceLocation]">
                            </asp:SqlDataSource>
                            <p>
                                <asp:Label ID="Label14" runat="server" Text="Water Source Location" CssClass="propertyLabel"></asp:Label>
                                <asp:DropDownList ID="ddlWaterSourceLocation" runat="server" CssClass="propertyValue"
                                    ValidationGroup="val_EditPrimaryInfo" DataSourceID="SqlDataSource2" DataTextField="Description"
                                    DataValueField="LocationID">
                                </asp:DropDownList>
                            </p>
                            <%--contact frequency--%>
                            <p>
                                <asp:Label ID="Label15" runat="server" Text="Contact Frequency" CssClass="propertyLabel"></asp:Label>
                                <asp:DropDownList ID="ddlContactFrequency" runat="server" CssClass="propertyValue"
                                ValidationGroup="val_EditPrimaryInfo" >
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
                                <asp:CheckBox ID="chkNewsletterByEmail" runat="server" Text="Receive by Email?" Checked='<%# bind("IsENewsletter") %>'
                                    CssClass="checkboxProperty" ValidationGroup="val_EditPrimaryInfo" />
                                <asp:CheckBox ID="chkNewsletterByMail" runat="server" Text="Receive by mail?" Checked='<%# bind("IsNewsletter") %>'
                                    CssClass="checkboxProperty" ValidationGroup="val_EditPrimaryInfo" />
                            </p>
                        </EditItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--save cancel buttons--%>
            <div class="modalPopupLinkbutton-div">
                <asp:LinkButton ID="lnkSavePersonalInformationOnEdit" runat="server" CausesValidation="true"
                    OnCommand="lnkSavePersonalInformationOnEdit_OnCommand" CssClass="linkStyle" ValidationGroup="val_EditPrimaryInfo">Save</asp:LinkButton>
                <asp:LinkButton ID="lnkCancelPersonalInformatiOnEdit" runat="server" CausesValidation="false"
                    CssClass="linkStyle" ValidationGroup="val_EditPrimaryInfo">Cancel</asp:LinkButton>
            </div>
        </asp:Panel>
        <%--modal popup for deduct prepaid water package--%>
        <asp:Panel ID="pnlDeductPrepaidWaterPkg" runat="server" Width="40%" Style="display: none;
            border: 0.2em solid gray; background: White">
            <asp:UpdatePanel ID="updPnlDeductPrepaidPkg" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnShowModPopUpPrepaidWaterPkg" runat="server" Text="Button" Style="display: none" />
                    <asp:ModalPopupExtender ID="mPopUpShowDeductPrepaidPkg" runat="server" TargetControlID="btnShowModPopUpPrepaidWaterPkg"
                        PopupControlID="pnlDeductPrepaidWaterPkg" BackgroundCssClass="ModalPopupBackground"
                        CancelControlID="lnkCancelDeductPrepaid">
                    </asp:ModalPopupExtender>
                    <asp:FormView ID="fview_DeductPrepaidBottle" runat="server" CssClass="formView-input"
                        DefaultMode="Insert">
                        <InsertItemTemplate>
                            <br />
                            <h1>
                                U-Fill Prepaid Deduction</h1>
                            <%--current balance--%>
                            <p>
                                <asp:Label ID="Label53" runat="server" Text="Current Balance" CssClass="propertyLabel"></asp:Label>
                                <asp:Label ID="lblCurrentBalanceValue" runat="server" Text='<% # bind("balance") %>'
                                    CssClass="propertyValue"></asp:Label>
                            </p>
                            <%--enter deduct qty--%>
                            <p>
                                <asp:Label ID="Label56" runat="server" Text="Deduct Quantity" CssClass="propertyLabel"></asp:Label>
                                <asp:TextBox ID="txtDeductQty" runat="server" Style="width: 50px" ValidationGroup="valDeductPrepaid"></asp:TextBox>
                                <asp:Label ID="Label55" runat="server" Text="*"></asp:Label>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtDeductQty"
                                    FilterType="Numbers" FilterMode="ValidChars">
                                </asp:FilteredTextBoxExtender>
                            </p>
                            <div style="margin-left: 5em">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Please enter Deduct Quantity"
                                    ControlToValidate="txtDeductQty" ValidationGroup="valDeductPrepaid" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--deduct | cancel button--%><br />
            <div class="modalPopupLinkbutton-div">
                <asp:LinkButton ID="lnkDeductPrepaid" runat="server" CssClass="linkStyle" ValidationGroup="valDeductPrepaid"
                    OnCommand="lnkDeductPrepaid_OnCommand">Deduct</asp:LinkButton>
                <asp:LinkButton ID="lnkCancelDeductPrepaid" runat="server" CssClass="linkStyle" CausesValidation="false"
                    ValidationGroup="valDeductPrepaid">Cancel</asp:LinkButton>
            </div>
        </asp:Panel>
        <%--modal popup for view prepaid transaction history--%>
        <asp:Panel ID="pnlPrepaidHistory" runat="server" Width="50%" Style="display: none;
            border: 0.2em solid gray; background: White">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnShowModPopUpPrepaidHistory" runat="server" Text="Button" Style="display: none" />
                    <asp:ModalPopupExtender ID="modPopUpPrepaidHistory" runat="server" TargetControlID="btnShowModPopUpPrepaidHistory"
                        PopupControlID="pnlPrepaidHistory" BackgroundCssClass="ModalPopupBackground"
                        CancelControlID="lnkClosePrepaidHistory">
                    </asp:ModalPopupExtender>
                    <%--close button--%>
                    <div style="text-align: right; padding-right: 2em">
                        <asp:LinkButton ID="lnkClosePrepaidHistory" runat="server" CssClass="linkbutton-no-line"
                            CausesValidation="false">Close</asp:LinkButton>
                    </div>
                    <h1>
                        Prepaid History</h1>
                    <div style="margin: 1em 2em 1em 2em">
                        <asp:GridView ID="gviewPrepaidHistory" runat="server" EmptyDataText="No records found"
                            Width="100%" AutoGenerateColumns="false" CssClass="gridviewBaseStyle" OnRowDataBound="gviewPrepaidHistory_OnRowDataBound">
                            <HeaderStyle CssClass="gridviewHeaderStyle" />
                            <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                            <RowStyle CssClass="gridviewRowStyle" />
                            <Columns>
                                <%--transaction date--%>
                                <asp:TemplateField HeaderText="Date and Time">
                                    <ItemTemplate>
                                        <asp:Label ID="Label58" runat="server" Text='<% #  String.Format("{0:ddd MM/dd/yyyy hh:mm tt}", Eval("LastTransactionDate") ) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--transaction type--%>
                                <asp:TemplateField HeaderText="Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTransactionType" runat="server" Text='<% # bind("TransactionType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--hidden fields top up | deduct qty--%>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdnTopUpQty" Value='<% # bind("topUpQty") %>' runat="server"
                                            Visible="false" />
                                        <asp:HiddenField ID="hdnDeductQty" Value='<% # bind("deductQty") %>' runat="server"
                                            Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--qty--%>
                                <asp:TemplateField HeaderText="Update Qty">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUpdateQty" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--balance--%>
                                <asp:TemplateField HeaderText="New Balance">
                                    <ItemTemplate>
                                        <asp:Label ID="Label60" runat="server" Text='<% # bind("LastUpdatedBalance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <%--modal popup for add wte equipment from product db--%>
        <asp:Panel ID="pnlSelectWTE" runat="server" Width="55%" Style="display: none; border: 0.2em solid gray;
            background: White">
            <asp:UpdatePanel ID="updPnlSelectWTE" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnShowModPopUpSelectWTE" runat="server" Text="Button" Style="display: none" />
                    <asp:ModalPopupExtender ID="modPopUpSelectWTE" runat="server" TargetControlID="btnShowModPopUpSelectWTE"
                        PopupControlID="pnlSelectWTE" BackgroundCssClass="ModalPopupBackground" CancelControlID="lnkCloseWTE">
                    </asp:ModalPopupExtender>
                    <%--close button--%>
                    <div style="text-align: right; padding-right: 2em">
                        <asp:LinkButton ID="lnkCloseWTE" runat="server" CausesValidation="false" CssClass="linkbutton-no-line">Close</asp:LinkButton>
                    </div>
                    <h1>
                        Search for Water Treatment Equipment</h1>
                    <div class="mainContainer-innerSpacer">
                        <p>
                            <asp:DropDownList ID="ddlSearchWTE" runat="server">
                                <asp:ListItem Value="by_productcode">By Product Code</asp:ListItem>
                                <asp:ListItem Value="by_desc">By Description</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtSearchWTE" runat="server" Width="300px"></asp:TextBox>
                            <asp:ImageButton ID="btnSearchWTE" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/search.png"
                                Height="30px" Width="30px" ToolTip="Search" OnCommand="btnSearchWTE_OnCommand" />
                        </p>
                    </div>
                    <div style="margin: 1em 2em 1em 2em">
                        <asp:GridView ID="gviewSearchWTE" runat="server" AutoGenerateColumns="false" CssClass="gridviewBaseStyle">
                            <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                            <RowStyle CssClass="gridviewRowStyle" />
                            <HeaderStyle CssClass="gridviewHeaderStyle-min" />
                            <Columns>
                                <%--product code--%>
                                <asp:TemplateField HeaderText="Product Code">
                                    <ItemTemplate>
                                        <asp:Label ID="Label65" runat="server" Text='<% # bind("productCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--desc--%>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="Label66" runat="server" Text='<% # bind("productDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--manufacturer--%>
                                <asp:TemplateField HeaderText="Manufacturer">
                                    <ItemTemplate>
                                        <asp:Label ID="Label67" runat="server" Text='<% # bind("manufacturerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--select--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkSelectWTE" runat="server" OnCommand="lnkSelectWTE_OnCommand"
                                            CommandArgument='<% # bind("productID") %>'>Select</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>
