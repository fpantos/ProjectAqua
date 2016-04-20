<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/LoggedIn.master" AutoEventWireup="true"
    CodeBehind="NewWorkOrder.aspx.cs" Inherits="Aqua.Accounts.WorkOrder.NewWorkOrder" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <h1>
            Service Work
        </h1>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <span class="span-label">Account#</span> <span class="span-value">
                        <asp:Label ID="lblAccountNumber" runat="server"></asp:Label></span>
                </div>
                <div class="row">
                    <span class="span-label">Account Holder</span> <span class="span-value">
                        <asp:Label ID="lblAccountHolder" runat="server"></asp:Label></span>
                </div>
                <br />
                <br />
                <asp:MultiView ID="mviewService" runat="server" ActiveViewIndex="0" OnActiveViewChanged="mviewService_ActiveViewChanged">
                    <%--add work order--%>
                    <asp:View ID="vwAddWorkOrder" runat="server" OnActivate="vwAddWorkOrder_Activate"
                        OnDeactivate="vwAddWorkOrder_Deactivate">
                        <%--step 1 enter work order details--%>
                        <asp:Panel ID="Panel4" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <h2>
                                    Step 1 - Enter Work Order Details</h2>
                                <br />
                                <asp:FormView ID="fviewWork" runat="server" DefaultMode="Insert">
                                    <InsertItemTemplate>
                                        <p>
                                            <asp:Label ID="Label1" runat="server" Text="Work Type" CssClass="propertyLabel"></asp:Label>
                                            <asp:DropDownList ID="ddlWorkType" runat="server" AutoPostBack="true" CssClass="propertyValue"
                                                ValidationGroup="valWorkOrder" OnSelectedIndexChanged="ddlWorkType_OnSelectedIndexChanged">
                                                <asp:ListItem Selected="True">Select</asp:ListItem>
                                                <asp:ListItem Value="70">Inspection</asp:ListItem>
                                                <asp:ListItem>Installation</asp:ListItem>
                                                <asp:ListItem>Repair</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="Label6" runat="server" Text="*"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator321" runat="server" ErrorMessage="Please select"
                                                InitialValue="Select" ValidationGroup="valWorkOrder" ControlToValidate="ddlWorkType"></asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <asp:Label ID="Label3" runat="server" Text="Work Charge" CssClass="propertyLabel"></asp:Label>
                                            <asp:TextBox ID="txtWorkCharge" runat="server" CssClass="propertyValue" ValidationGroup="valWorkOrder"></asp:TextBox>
                                            <asp:Label ID="Label7" runat="server" Text="*"></asp:Label>
                                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtWorkCharge"
                                                FilterType="Numbers,Custom" FilterMode="ValidChars" ValidChars=".">
                                            </asp:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter charge amount"
                                                ControlToValidate="txtWorkCharge" InitialValue="" ValidationGroup="valWorkOrder"></asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <asp:Label ID="Label2" runat="server" Text="Work Notes" CssClass="propertyLabel"></asp:Label>
                                            <asp:TextBox ID="txtWorkNotes" runat="server" TextMode="MultiLine" Width="500px"
                                                Height="50px" CssClass="propertyValue" ValidationGroup="valWorkOrder"></asp:TextBox>
                                        </p>
                                    </InsertItemTemplate>
                                </asp:FormView>
                                <%--add work order button--%>
                                <div class="div-workOrder">
                                    <asp:LinkButton ID="lnkAddToWorkOrderGrid" OnCommand="lnkAddToWorkOrderGrid_OnCommand"
                                        runat="server" CausesValidation="true" ValidationGroup="valWorkOrder" CssClass="linkStyle">Add to work order</asp:LinkButton>
                                </div>
                                <br />
                                <br />
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                <%--work order gridview--%>
                                <asp:GridView ID="gviewWorkList" runat="server" AutoGenerateColumns="false" Width="100%"
                                    OnRowDeleting="gviewWorkList_RowDeleting" EmptyDataText="No work orders" ShowFooter="true"
                                    OnRowDataBound="gviewWorkList_RowDataBound" CssClass="gridviewBaseStyle">
                                    <HeaderStyle CssClass="gridviewHeaderStyle" />
                                    <RowStyle CssClass="gridviewRowStyle" />
                                    <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                                    <FooterStyle CssClass="gridviewFooterStyle" />
                                    <Columns>
                                        <%--work type--%>
                                        <asp:TemplateField HeaderText="Work Type">
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<% # bind("WorkType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--work notes--%>
                                        <asp:TemplateField HeaderText="Work Notes">
                                            <ItemTemplate>
                                                <asp:Label ID="Label10" runat="server" Text='<% # bind("WorkNotes") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--work charge--%>
                                        <asp:TemplateField HeaderText="Work Charge" ItemStyle-CssClass=" gridviewItemStyle-Currency"
                                            HeaderStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" Text='<% # String.Format ("{0:c}", Eval("WorkCharge") ) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--Remove from grid--%>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkRemoveWorkOrderFromGrid" CommandName="Delete" runat="server"
                                                    CausesValidation="false"> Remove</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                        <br />
                        <%--Step 2 - Add Replacement Part(s)--%>
                        <asp:Panel ID="Panel3" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <h2>
                                    Step 2 - Add Replacement Part(s)</h2>
                                <div style="margin-left: 5em">
                                    Put parts placeholder here</div>
                            </div>
                        </asp:Panel>
                        <br />
                        <%--Step 3 - Set Service Date and Time--%>
                        <asp:Panel ID="Panel5" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <h2>
                                    Step 3 - Set Service Date and Time</h2>
                                <div style="margin-left: 5em;">
                                    <br />
                                    <div>
                                        <asp:LinkButton ID="lnkOpenScheduler" runat="server" OnCommand="lnkOpenScheduler_OnCommand"
                                            Enabled="false" CausesValidation="false">Open Scheduler</asp:LinkButton>
                                    </div>
                                    <br />
                                    <%--Confirmed Service Datetime--%>
                                    <asp:Panel ID="pnlConfirmedServiceDateTime" runat="server" Visible="false">
                                        <p>
                                            <asp:Label ID="Label12" runat="server" Text="Service Date"></asp:Label>
                                            <asp:Label ID="lblConfirmedServiceDate" runat="server"></asp:Label>
                                        </p>
                                        <p>
                                            <asp:Label ID="Label13" runat="server" Text="Service Time"></asp:Label>
                                            <asp:Label ID="lblConfirmedServiceTime" runat="server"></asp:Label>
                                        </p>
                                    </asp:Panel>
                                </div>
                            </div>
                        </asp:Panel>
                        <br />
                        <%--step 4 - select a technician--%>
                        <asp:Panel ID="Panel10" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <h2>
                                    Step 4 - Assign a technician</h2>
                                <div style="margin-left: 5em">
                                    <asp:DropDownList ID="ddlTechnician" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTechnician"
                                        Display="Dynamic" InitialValue="Please Select" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </asp:Panel>
                        <br />
                        <%--navigation buttons--%>
                        <div class="div-navigation-linkbutton">
                            <asp:LinkButton ID="lnkGoToSetAppointmentDate" runat="server" CommandName="NextView"
                                Enabled="false" CssClass="linkDeactivatedStyle" CausesValidation="true">Next</asp:LinkButton>&nbsp
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" PostBackUrl="~/Accounts/ViewAccount.aspx"
                                OnClick="lnkCancel_Click" CssClass="linkStyle">Cancel</asp:LinkButton>
                        </div>
                    </asp:View>
                    <%--finalize order--%>
                    <asp:View ID="vwFinalizeOrder" runat="server" OnActivate="vwFinalizeOrder_Activate"
                        OnDeactivate="vwFinalizeOrder_Deactivate">
                        <h2>
                            Review Order</h2>
                        <%-- review work orders--%>
                        <asp:Panel ID="Panel6" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <h2>
                                    Work Orders</h2>
                                <asp:GridView ID="gviewWorkOrdersReview" runat="server" AutoGenerateColumns="false"
                                    CssClass="gridviewBaseStyle" ShowFooter="true" OnRowDataBound="gviewWorkOrdersReview_RowDataBound">
                                    <HeaderStyle CssClass="gridviewHeaderStyle" />
                                    <RowStyle CssClass="gridviewRowStyle" />
                                    <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                                    <FooterStyle CssClass="gridviewFooterStyle" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Work Type">
                                            <ItemTemplate>
                                                <asp:Label ID="Label14" runat="server" Text='<% # bind("workType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Work Notes">
                                            <ItemTemplate>
                                                <asp:Label ID="Label15" runat="server" Text='<% # bind("workNotes") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Work Charge" ItemStyle-CssClass=" gridviewItemStyle-Currency"
                                            HeaderStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="Label16" runat="server" Text='<% # String.Format ("{0:c}", Eval("WorkCharge") ) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                        <%--review parts--%>
                        <asp:Panel ID="Panel7" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <h2>
                                    Additional Parts</h2>
                                <asp:GridView ID="GridView1" runat="server">
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                        <%--review service datetime--%>
                        <asp:Panel ID="Panel1" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <h2>
                                    Service Date and Time</h2>
                                <div style="margin-left: 5em">
                                    <div class="row">
                                        <span>
                                            <asp:Label ID="lblReviewServiceDateTime" runat="server"></asp:Label></span>
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <%--review technician--%>
                        <asp:Panel ID="Panel9" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                <h2>
                                    Technician</h2>
                                <div style="margin-left: 5em">
                                    <div class="row">
                                        <span>
                                            <asp:Label ID="lblReviewTechnician" runat="server"></asp:Label></span>
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <br />
                        <%--navigation Buttons--%>
                        <div class="div-navigation-linkbutton">
                            <asp:LinkButton ID="lnkCompleteOrder" runat="server" CssClass="linkStyle" OnCommand="lnkCompleteOrder_OnCommand"
                                CommandName="NextView" CausesValidation="false">Complete Order</asp:LinkButton>&nbsp
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="PrevView" CssClass="linkStyle">Previous</asp:LinkButton>&nbsp
                            <asp:LinkButton ID="LinkButton7" runat="server" CausesValidation="false" OnClick="lnkCancel_Click"
                                CssClass="linkStyle">Cancel</asp:LinkButton>
                        </div>
                    </asp:View>
                    <%--PrintInvoice--%>
                    <asp:View ID="vwPrintInvoice" runat="server">
                        <asp:Panel ID="Panel8" runat="server" CssClass="panel-formview">
                            <div class="mainContainer-innerSpacer">
                                The service work order has been successfully completed.
                            </div>
                        </asp:Panel>
                        <br />
                        <div class="div-navigation-linkbutton">
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkStyle" CausesValidation="false">Print Invoice</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Accounts/ViewAccount.aspx"
                                CssClass="linkStyle" CausesValidation="false">Back to Account</asp:LinkButton>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%-- Modal popup for setting serice date and time--%>
        <asp:Panel ID="pnlServiceDateTime" Width="80%" Height="95%" runat="server" Style="display: none;
            border: 0.2em solid gray; background: #FBFBFB">
            <%--cancel button--%>
            <div style="text-align: right; padding-right: 2em;">
                <asp:LinkButton ID="lnkCancelSetServiceDateTime" runat="server" OnClick="lnkCancelSetServiceDateTime_OnClick"
                    CausesValidation="false">Cancel</asp:LinkButton>
            </div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnShowServiceDateTime" runat="server" Text="Button" Style="display: none" />
                    <asp:ModalPopupExtender ID="mPopupSetServiceDateTime" PopupControlID="pnlServiceDateTime"
                        TargetControlID="btnShowServiceDateTime" BackgroundCssClass="ModalPopupBackground"
                        CancelControlID="lnkCancelSetServiceDateTime" runat="server">
                    </asp:ModalPopupExtender>
                    <asp:Panel ID="Panel2" runat="server" Style="margin: 0 5% 0 5%; height: 100%">
                        <h1>
                            Service Work Scheduler</h1>
                        <asp:Label ID="Label5" runat="server" Text="Week of "></asp:Label>
                        <asp:TextBox ID="txtRefDate" runat="server" CausesValidation="false" Width="6em"
                            Font-Size="1em"></asp:TextBox>
                        <asp:CalendarExtender ID="serviceWorkCalendarExtender" runat="server" TargetControlID="txtRefDate"
                            Format="MM/dd/yyyy">
                        </asp:CalendarExtender>
                        <asp:LinkButton ID="lnkChangeDate" runat="server" OnCommand="lnkChangeDate_OnCommand"
                            CausesValidation="false">Go to</asp:LinkButton>&nbsp<asp:Label ID="lblAppointmentMessage"
                                runat="server"></asp:Label><br />
                        <asp:Label ID="Label4" runat="server" ForeColor="Gray" Font-Size="0.85em" Text="(Click on the box to select a new date and then click Go to)"></asp:Label>
                        <br />
                        <br />
                        <%--gridview schedule--%>
                        <asp:Label ID="Label17" runat="server" Text="Click the + sign to select an appointment"></asp:Label>
                        <asp:GridView ID="gviewSchedule" runat="server" AutoGenerateColumns="False" CssClass="gridviewBaseStyle-scheduling"
                            EnableModelValidation="True" OnRowDataBound="gviewSchedule_RowDataBound" HeaderStyle-VerticalAlign="Middle"
                            OnSelectedIndexChanged="gviewSchedule_OnSelectedIndexChanged">
                            <AlternatingRowStyle CssClass="gridviewAlternatingStyle-scheduling" />
                            <HeaderStyle CssClass="gridviewHeaderStyle-scheduling" />
                            <RowStyle CssClass="gridviewRowStyle-scheduling" />
                            <Columns>
                                <%--time--%>
                                <asp:TemplateField HeaderText="Time" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblHours" runat="server" Text='<% # bind("time") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--sunday--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" CssClass="gridviewSchedule-label" runat="server">-</asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--monday--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkSetMondayAppointment" runat="server" CommandArgument='<% # bind("time") %>'
                                            CssClass="linkbutton-no-line" OnCommand="selectAServiceDateTime_OnCommand" CommandName="monday"
                                            CausesValidation="false" ValidationGroup="valGrpScheduler" ToolTip='<% # bind("time") %>'>+</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--tuesday--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkSetTuesdayAppointment" runat="server" CssClass="linkbutton-no-line"
                                            OnCommand="selectAServiceDateTime_OnCommand" CommandName="tuesday" CommandArgument='<% # bind("time") %>'
                                            CausesValidation="false" ValidationGroup="valGrpScheduler" ToolTip='<% # bind("time") %>'>+</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--wednesday--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkSetWednesdayAppointment" runat="server" CssClass="linkbutton-no-line"
                                            OnCommand="selectAServiceDateTime_OnCommand" CommandName="wednesday" CommandArgument='<% # bind("time") %>'
                                            CausesValidation="false" ValidationGroup="valGrpScheduler" ToolTip='<% # bind("time") %>'>+</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--thursday--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnnkSetThursdayAppointment" runat="server" CssClass="linkbutton-no-line"
                                            OnCommand="selectAServiceDateTime_OnCommand" CommandName="thursday" CommandArgument='<% # bind("time") %>'
                                            CausesValidation="false" ValidationGroup="valGrpScheduler" ToolTip='<% # bind("time") %>'>+</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--friday--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkSetFridayAppointment" runat="server" CssClass="linkbutton-no-line"
                                            OnCommand="selectAServiceDateTime_OnCommand" CommandName="friday" CommandArgument='<% # bind("time") %>'
                                            CausesValidation="false" ValidationGroup="valGrpScheduler" ToolTip='<% # bind("time") %>'>+</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--saturday--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkSetSaturdayAppointment" runat="server" CssClass="linkbutton-no-line"
                                            OnCommand="selectAServiceDateTime_OnCommand" CommandName="saturday" CommandArgument='<% # bind("time") %>'
                                            CausesValidation="false" ValidationGroup="valGrpScheduler" ToolTip='<% # bind("time") %>'>+</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <br />
                        <%--Confirm datetime panel--%>
                        <asp:Panel ID="pnlConfirmServiceWorkAppointment" runat="server" Visible="false">
                            <h1>
                                Confirm Appointment</h1>
                            <div class="row">
                                <span class="span-label">Service Date</span> <span class="span-value">
                                    <asp:Label ID="lblSelectedServiceDate" runat="server"></asp:Label></span>
                            </div>
                            <div class="row">
                                <span class="span-label">Start Time</span> <span class="span-value">
                                    <asp:DropDownList ID="ddlServiceStartTime" runat="server">
                                    </asp:DropDownList>
                                </span>
                            </div>
                            <div class="row">
                                <span class="span-label">End Time</span> <span class="span-value">
                                    <asp:DropDownList ID="ddlServiceEndTime" runat="server">
                                    </asp:DropDownList>
                                </span>
                            </div>
                            <div class="row">
                                <asp:Label ID="lblBookingMessage" runat="server" ForeColor="red"></asp:Label>
                            </div>
                            <%--Book | Reset--%>
                            <div class="modalPopupLinkbutton-div">
                                <asp:LinkButton ID="lnkConfirmServiceDateTime" OnCommand="lnkConfirmServiceDateTime_OnCommand"
                                    runat="server" Enabled="false" CssClass="linkStyle" CausesValidation="false"
                                    ValidationGroup="valGrpScheduler">Book</asp:LinkButton>&nbsp
                                <asp:LinkButton ID="lnkResetServiceDateTime" OnCommand="lnkResetServiceDateTime_OnCommand"
                                    runat="server" CssClass="linkStyle" CausesValidation="false" ValidationGroup="valGrpScheduler">Reset</asp:LinkButton>
                            </div>
                        </asp:Panel>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>
