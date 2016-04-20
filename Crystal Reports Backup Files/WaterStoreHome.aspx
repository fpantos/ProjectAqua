<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Home.master" AutoEventWireup="true"
    CodeBehind="WaterStoreHome.aspx.cs" Inherits="Aqua.WaterStoreHome" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link href="../Styles/mainStyle.css" rel="stylesheet" type="text/css" />
    <title>The Water Store Milton</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="mainContainer">
        <div class="mainContainer-innerSpacer">
            <h2>
                Store Updates
            </h2>
        </div>
        <div class="mainContainer-innerSpacer">
            <h2>
                Water Usage
            </h2>
            <hr />
            <asp:Label ID="lblWaterUsageChartMessage" runat="server" Font-Italic="true"></asp:Label>
            <asp:Panel ID="pnlChrtMeasureOptions" runat="server">
                <div>
                    <asp:RadioButtonList ID="rbtnUnit" runat="server" AutoPostBack="true" CssClass="linkbutton-no-line"
                        Font-Size="0.75em" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="litres">Litres</asp:ListItem>
                        <asp:ListItem Value="gallons">US Gallons</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </asp:Panel>
            <div>
                <asp:Chart ID="chrtWaterUsage" runat="server" Width="700px" Height="300px" ImageStorageMode="UseHttpHandler"
                    AntiAliasing="All">
                    <Series>
                        <asp:Series Name="Series1" XValueType="String" YValueType="String" ChartType="Column"
                            ChartArea="MainChartArea" IsValueShownAsLabel="true" ShadowOffset="1" BackGradientStyle="LeftRight"
                            LabelForeColor="White" LabelBackColor="Gray">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="MainChartArea">
                            <AxisX Interval="1" LineColor="Gray">
                                <MajorGrid Enabled="true" LineColor="Gray" Interval="1" />
                                <MajorTickMark LineColor="Gray" Enabled="true" Interval="1" />
                                <LabelStyle ForeColor="Gray" Enabled="true" Interval="1" />
                            </AxisX>
                            <AxisY LineColor="Gray">
                                <MajorGrid Enabled="true" LineColor="Gray" />
                                <MajorTickMark LineColor="Gray" />
                                <LabelStyle ForeColor="Gray" />
                            </AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <div style="margin-left: 70%;">
                    <asp:Label ID="Label1" runat="server" Text="Total " ForeColor="#1f6aae"></asp:Label><br />
                    <asp:Label ID="lblTotalConsumption" runat="server" ForeColor="#1f6aae" Font-Size="1.3em"></asp:Label>
                </div>
            </div>
        </div>
        <br />
        <div style="clear: both">
        </div>
        <div class="mainContainer-innerSpacer">
            <h2>
                Upcoming Service Work
            </h2>
            <hr />
            <asp:GridView ID="gviewServiceWork" runat="server" AutoGenerateColumns="false" CssClass="gridviewBaseStyle"
                Width="100%" EmptyDataText="Nothing exciting yet">
                <AlternatingRowStyle CssClass="gridviewAlternatingStyle" />
                <RowStyle CssClass="gridviewRowStyle" />
                <HeaderStyle CssClass="gridviewHeaderStyle" HorizontalAlign="Left" />
                <Columns>
                    <asp:TemplateField HeaderText="Service ID">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkViewServiceWorkDetails" runat="server" Text='<% # bind("serviceWorkID") %>'
                                CommandArgument='<% # bind("serviceWorkID") %>' CssClass="linkbutton-no-line"
                                OnCommand="lnkViewServiceWorkDetails_OnCommand"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<% # String.Format("{0:MM/dd/yyyy}" ,Eval("ServiceDate") )  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Time">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<% # FormatShortTimeString(Eval("serviceStartTime").ToString() ) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Account Holder">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<% # bind("[Account Holder]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
