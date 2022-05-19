<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Paradigm3.custom.amtrak.HomePage" Async="true" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link href="amtrakSearch.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="homeContent">
			<div class="customBanner">
				<img id="imgLogo" runat="server" src="amtrak_logo.png" />				
				<div class="bannerText">
					<div>
						Mechanical Department Document Management System
					</div>
					<div>
						Paradigm is the document management system used by the Amtrak Mechanical Department to track, manage, and store documentation and records.
					</div>					
				</div>
			</div>			
			<asp:Panel ID="pnlActionItems" runat="server" CssClass="amtrak-ActionItems" Visible="false">
				<img src="../../images/actionitem.png" style="height: 20px; margin-right: 10px;" />
				<asp:Label ID="lblActionItems" runat="server"></asp:Label>
				<img src="../../images/actionitem.png" style="height: 20px; margin-left: 10px;" />
			</asp:Panel>
			<div class="customContent">			
				<div class="amtrak-buttons">
					<div class="homeBtn" onclick="openSearch()">
						<div class="homeBtn-header">Search</div>
						<div class="homeBtn-description">Mechanical Documents</div>
					</div>
					<div class="homeBtn" onclick="openMechDocuments(109)">
						<div class="homeBtn-header">Browse</div>
						<div class="homeBtn-description">Mechanical Documents</div>
					</div>
				</div>
				<div class="amtrak-links">
					<div>
						<p class="linkTitle">Safety</p>
						<ul style="margin: 0; padding: 10px 0 10px 15px;">
							<li>
								<a href="https://allaboard.amtrak.com/s/article/Safety-Programs-Risk-Management" target="_blank">Safety Programs: Risk Management (JSAs)</a>
							</li>
							<li>
								<a href="https://allaboard.amtrak.com/s/article/Safety-Programs-Promotion" target="_blank">Safety Programs: Promotion</a>
							</li>
							<li>
								<a href="javascript:addAmtrakRecord(4,0,163,586);">Safety Walkabout</a>
							</li>
							<li>
								<a href="javascript:alert('Report all safety-related concerns to systemsafety@amtrak.com or 800-331-0008.');">Report Safety Concerns</a>
							</li>
							<li>
								<a href="http://pdgmweb01p/paradigm/DOCS/D0080124.pdf" target="_blank">Safety Rule Book</a>
							</li>
						</ul>
					</div>
					<div>
						<p style="text-decoration: underline; margin: 0; padding: 0;">Rolling Stock Engineering</p>
						<ul style="margin: 0; padding: 10px 0 10px 15px;">
							<li>
								<a href="javascript:addAmtrakRecord(6,0,68,1326);">Document Discrepencies/Concerns</a>
							</li>
							<li>
								<a href="javascript:alert('Send EPDM inquiries to junod@amtrak.com.');">EPDM (Drawings/Schematics)</a>
							</li>
							<li>
								<a href="javascript:alert('Coming Soon');">RSER Requests</a>
							</li>
						</ul>
					</div>
					<div>
						<p style="text-decoration: underline; margin: 0; padding: 0;">Mechanical Department Documentation</p>
						<ul style="margin: 0; padding: 10px 0 10px 15px;">
							<li>
								<a href="https://amtrak.sharepoint.com/sites/mech/MMI_PFT/_layouts/15/listform.aspx?PageType=8&ListId=%7B69A3FF1F-519D-4B23-8E0E-58F093D107C7%7D&RootFolder=%2Fsites%2Fmech%2FMMI_PFT%2FLists%2FMechanical%20Bulletin%20Request%20Form&Source=https%3A%2F%2Famtrak.sharepoint.com%2Fsites%2Fmech%2FMMI_PFT%2FLists%2FMechanical%2520Bulletin%2520Request%2520Form%2FAllItems.aspx&ContentTypeId=0x010034DED711288FFA489441E6B17ECF73EE" target="_blank">Mechanical Bulletin Request</a>
							</li>
							<li>
								<a href="javascript:addAmtrakRecord(6,0,68,1326);">New Document Request</a>
							</li>
							<li>
								<a href="javascript:addAmtrakRecord(6,0,68,1326);">Existing Document Change Request</a>
							</li>
						</ul>
						<span style="font-size: .75em;">
							* Applicable to entire Mechanical Department. Contact local DCR for site-specific information.
						</span>
					</div>
					<div>
						<p style="text-decoration: underline; margin: 0; padding: 0;">Assistance</p>
						<ul style="margin: 0; padding: 10px 0 10px 15px;">
							<li>
								<a href="http://pdgmweb01p/paradigm/DOCS/D0081397.pdf" target="_blank">Document Management FAQ</a>
							</li>
							<li>
								<a href="http://pdgmweb01p/paradigm/DOCS/D0082940.pdf" target="_blank">Definitions and Acronyms</a>
							</li>
							<li>
								<a href="../../Default.aspx?ModuleID=3&GroupID=6902" target="_parent">WMS/Arrow Help</a>
							</li>
						</ul>
					</div>
					<div>
						<p style="text-decoration: underline; margin: 0; padding: 0;">Links</p>
						<ul style="margin: 0; padding: 10px 0 10px 15px;">
							<li>
								<a href="https://allaboard.amtrak.com/s/" target="_blank">All Aboard</a>
							</li>
							<li>
								<a href="http://corpapp01p/forms/" target="_blank">NRPC Forms</a>
							</li>
							<li>
								<a href="../../Default.aspx?ModuleID=3&GroupID=16463" target="_parent">Mechanical Department Forms</a>
							</li>
							<li>
								<a href="https://amtrak.service.now.com/sp" target="_blank">Service Now</a>
							</li>
						</ul>
					</div>
					<div>
						<p style="text-decoration: underline; margin: 0; padding: 0;">Paradigm</p>
							<ul style="margin: 0; padding: 10px 0 10px 15px;">
								<li>
									<a href="mailto:DocMgmt_Mech@Amtrak.com">Paradigm Inquiry</a>
								</li>
								<li>
									New Paradigm User Request
								</li>
								<li>
									<a href="../../Default.aspx?ModuleID=3&GroupID=12475" target="_parent">Paradigm User Assistance</a>
								</li>
								<li>
									<a href="../../Default.aspx?ModuleID=3&GroupID=12475" target="_parent">DCR Assistance</a>
								</li>
							</ul>
						</div>
						<div style="width: 100%;">
							<p style="text-decoration: underline; margin: 0; padding: 0;">About this Web Application</p>
							<ul style="margin: 0; padding: 10px 0 10px 15px;">
								<li>
									<a href="http://pdgmweb01p/paradigm/DOCS/D0081396.pdf" target="_blank">Document Management Contacts</a>
								</li>
								<li>
									<a href="mailto:DocMgmt_Mech@Amtrak.com">Feedback</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="grid">
					<div class="gridHeader">
						Recently Released Mechanical Bulletins (Last 60 Days)
					</div>
					<div class="gridBody">
						<asp:UpdatePanel ID="udpGridView" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
							<ContentTemplate>
								<asp:GridView ID="gvRecentBulletins" runat="server" CssClass="amtrak-gridView"
									AutoGenerateColumns="False"
									DataKeyNames="ItemID, OrigID, Name, LabelName, FileExtension, ParentGroupID, TypeOfPublish, IsEvidence, IsCheckedOut, Status" 
									GridLines="None" 
									ShowHeader="true"
									OnRowDataBound="Gv_RowDataBound" >
									<HeaderStyle CssClass="amtrak-gridViewHeader" />
									<RowStyle CssClass="amtrak-gridViewRow" />
									<AlternatingRowStyle CssClass="amtrak-gridViewAltRow" />
									<SelectedRowStyle CssClass="amtrak-gridViewSelRow" />
									<Columns>
										<asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName">
											<ItemStyle Width="20%" />
										</asp:BoundField>
										<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
										<asp:BoundField DataField="VersionDate" HeaderText="Released" SortExpression="VersionDate" DataFormatString="{0:d}">
											<ItemStyle Width="10%" />
										</asp:BoundField>
									</Columns>
								</asp:GridView>
							</ContentTemplate>
						</asp:UpdatePanel>								
					</div>							
				</div>
		</div>
    </form>
</body>
<script src="../../scripts/P3Web.js"></script>
<script src="amtrakSearch.js"></script>
</html>
