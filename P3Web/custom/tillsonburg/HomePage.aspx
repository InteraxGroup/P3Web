<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Paradigm3.custom.tillsonburg.HomePage" EnableEventValidation="false" Async="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link href="tillsonburg.css" rel="stylesheet" />
</head>
<body style="position: relative;">
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<div class="tillsonburg-header">
			<img src="image.png" />
			<asp:ImageButton ID="BtnAdmin" runat="server" ImageUrl="~/custom/tillsonburg/admin.png" Visible="false" OnClick="BtnAdmin_Click" CssClass="tillsonburg-admin-img" />
		</div>
		<asp:UpdatePanel ID="udpMenu" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
				<div id="pnlMenu">
					<div id="menuLeft">
						<asp:Menu ID="Menu2" runat="server" Orientation="Horizontal" CssClass="tillsonburg-menu"
							StaticItemFormatString="&nbsp;{0}&nbsp" OnMenuItemClick="Menu2_MenuItemClick">
							<Items>
								<asp:MenuItem Text="Home" Value="0" />
								<asp:MenuItem Text="Employee Information" Value="1" />
								<asp:MenuItem Text="General Information" Value="2" />
								<%--<asp:MenuItem Text="PP Orders" Value="3" />--%>
							</Items>
						</asp:Menu>
					</div>
				</div>
			</ContentTemplate>
		</asp:UpdatePanel>
		<asp:UpdatePanel ID="udpMultiView" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
			<Triggers>
				<asp:AsyncPostBackTrigger ControlID="Menu2" EventName="MenuItemClick" />
			</Triggers>
		<ContentTemplate>
		<asp:MultiView ID="P3MultiView" runat="server">
            <asp:View ID="HomeView" runat="server">
                <asp:UpdatePanel ID="udpHome" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                <div id="pnlPageHomeView">
                    <div id="pnlHomeViewLeft">
						<div class="tillsonburg-home">
							<%--<div class="tillsonburg-home-title">WELCOME TO THE INTRANET</div>--%>
							<div class="tillsonburg-home-content">
								<div>
									<asp:Literal ID="ltlWelcomeTxt" runat="server"></asp:Literal>
								</div>
								<div>
									<div class="tillsonburg-home-title" style="font-size: 1em; height: 50px;">HOT LINKS</div>
									<div class="tillsonburg-hotlink-content">
										<asp:GridView ID="gvHotLinks" runat="server" AutoGenerateColumns="false"
                                        DataKeyNames="ID, Type, OrigID, GroupID, ParentGroupID, LinkName, URLProtocol, NavigateUrl"
                                        ShowHeader="false" GridLines="None" BorderWidth="0px" OnRowDataBound="gvHotLinks_RowDataBound">
                                        <EmptyDataTemplate>
                                            &nbsp;&nbsp;<asp:Label ID="lblEmptyHotLinkData" runat="server" Text="No Hot Links Available..." />
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemStyle Width="24px" />
                                                <ItemTemplate>
                                                    <asp:Image ID="imgType" runat="server" Width="20px" Height="20px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:ButtonField DataTextField="LinkName">
                                                <ControlStyle CssClass="hyperLink" />
                                            </asp:ButtonField>
                                        </Columns>
                                    </asp:GridView>
									</div>
								</div>
							</div>
						</div>
                    </div>
                </div>
                </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>
            <asp:View ID="EmpInfoView" runat="server">
                <asp:Panel ID="pnlEmployeeViewTop" runat="server" CssClass="pageInfoView">
                    <h1 style="margin-top: 10px; margin-bottom: 5px;">Employee Information</h1>
                    <asp:Literal ID="ltlEmpInfoTxt" runat="server" />
                </asp:Panel>
                <asp:Panel ID="pnlEmployeeViewBottom" runat="server" CssClass="viewBottom">
                    <asp:TabContainer ID="tcEmployee" runat="server" CssClass="tab-container" UseVerticalStripPlacement="false">
                        <asp:TabPanel ID="tabEducation" runat="server" HeaderText="Education">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Education</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlEducationTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabEHW" runat="server" HeaderText="Employee Health &amp; Wellness">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Employee Health &amp; Wellness</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlEHWTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabHIP" runat="server" HeaderText="Health Information &amp; Privacy">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Health Information &amp; Privacy</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlHIPTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabHR" runat="server" HeaderText="Human Resources">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Human Resources</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlHRTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabPayroll" runat="server" HeaderText="Payroll">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Payroll</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlPayrollTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                </asp:Panel>
            </asp:View>
            <asp:View ID="GenInfoView" runat="server">
                <asp:Panel ID="pnlGeneralInfoViewTop" runat="server" CssClass="pageInfoView">
                    <h1 style="margin-top: 10px; margin-bottom: 5px;">General Information</h1>
                    <asp:Literal ID="ltlGenInfoTxt" runat="server" />
                </asp:Panel>
                <asp:Panel ID="pnlGeneralViewBottom" runat="server" CssClass="viewBottom">
                    <asp:TabContainer ID="tcGeneral" runat="server" CssClass="tab-container" UseVerticalStripPlacement="false">
                        <asp:TabPanel ID="tabAccreditation" runat="server" HeaderText="Accreditation">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Accreditation</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlAccreditationTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabAdministration" runat="server" HeaderText="Administration">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Administration</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlAdministrationTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabCommittees" runat="server" HeaderText="Committees">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Committees</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlCommitteesTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabER" runat="server" HeaderText="Emergency Response">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Emergency Response</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlERTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabEthics" runat="server" HeaderText="Ethics">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Ethics</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlEthicsTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabIC" runat="server" HeaderText="Infection Control">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Infection Control</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlICTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabIMAC" runat="server" HeaderText="IMAC">
                            <HeaderTemplate>
                                <span class="tab-content-tab">IMAC</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlIMACTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabIT" runat="server" HeaderText="IT - How Do I...">
                            <HeaderTemplate>
                                <span class="tab-content-tab">IT - How Do I...</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlITTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabJHS" runat="server" HeaderText="Joint Health &amp; Safety">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Joint Health &amp; Safety</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlJHSTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabNE" runat="server" HeaderText="News &amp; Events">
                            <HeaderTemplate>
                                <span class="tab-content-tab">News &amp; Events</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlNETxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabPC" runat="server" HeaderText="Pastoral Care">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Pastoral Care</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlPCTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabPS" runat="server" HeaderText="Patient Safety">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Patient Safety</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlPSTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tabRC" runat="server" HeaderText="Recreation Committee">
                            <HeaderTemplate>
                                <span class="tab-content-tab">Recreation Committee</span>
                            </HeaderTemplate>
                            <ContentTemplate>
                            	<div class="tab-content">
									<asp:Literal ID="ltlRCTxt" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                </asp:Panel>
            </asp:View>
			<%--<asp:View ID="PPOView" runat="server">
				<div class="pageInfoView">
                    <h1 style="margin-top: 10px; margin-bottom: 5px;">PPOs</h1>
                    <p>
						The following list represents all PPOs
                    </p>
                </div>
				<div class="viewBottom">
					<asp:GridView ID="gvPPOrders" runat="server" Width="100%" CssClass="tillsonburg-gridView"
						AutoGenerateColumns="False" GridLines="None"
						DataKeyNames="ItemID, OrigID, ParentGroupID, FileExtension" 
						OnRowDataBound="gvPPOrders_RowDataBound" 
						OnSelectedIndexChanged="gvPPOrders_SelectedIndexChanged">
						<HeaderStyle CssClass="tillsonburg-gridViewHeader" />
                        <RowStyle CssClass="tillsonburg-gridViewRow" />
                        <AlternatingRowStyle CssClass="tillsonburg-gridViewAltRow" />
                        <SelectedRowStyle CssClass="tillsonburg-gridViewSelRow" />
						<Columns>                                    
							<asp:TemplateField HeaderText="" HeaderStyle-Width="24px" ItemStyle-Width="24px">
								<ItemTemplate>
									<asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px"/>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
								<HeaderStyle HorizontalAlign="Left" Font-Size="9pt" />
								<ControlStyle Font-Size="8pt" Font-Names="Arial" Font-Underline="false" />
							</asp:BoundField>
							<asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName">
								<HeaderStyle Width="150px" HorizontalAlign="Left" />
								<ItemStyle Width="150px" />
								<ControlStyle Font-Size="8pt" Font-Names="Arial" Font-Underline="false" />
							</asp:BoundField>
							<asp:BoundField DataField="Status" HeaderText="Status">
								<HeaderStyle Width="100px" HorizontalAlign="Left" />
								<ItemStyle Width="100px" />
								<ControlStyle Font-Size="8pt" Font-Names="Arial" Font-Underline="false" />
							</asp:BoundField>
							<asp:BoundField DataField="VersionDate" HeaderText="Converted" SortExpression="VersionDate" DataFormatString="{0:d}">
								<HeaderStyle Width="100px" HorizontalAlign="Left" />
								<ItemStyle Width="100px" />
								<ControlStyle Font-Size="8pt" Font-Names="Arial" Font-Underline="false" />
							</asp:BoundField>
							<asp:BoundField DataField="VersionedBy" HeaderText="Converted By" SortExpression="VersionedBy">
								<HeaderStyle Width="150px" HorizontalAlign="Left" />
								<ItemStyle Width="150px" />
								<ControlStyle Font-Size="8pt" Font-Names="Arial" Font-Underline="false" />                              
							</asp:BoundField>							
							<asp:BoundField DataField="OrigID" HeaderText="OrigID" SortExpression="OrigID">
								<HeaderStyle Width="80px" HorizontalAlign="Left" />
								<ItemStyle Width="80px" />
								<ControlStyle Font-Size="8pt" Font-Names="Arial" Font-Underline="false" />
							</asp:BoundField>
						</Columns>
					</asp:GridView>
				</div>
			</asp:View>--%>
		</asp:MultiView>
		</ContentTemplate>
		</asp:UpdatePanel>
    </form>
	<script src="tillsonburg.js"></script>
</body>
</html>
