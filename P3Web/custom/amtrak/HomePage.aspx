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
				<img id="imgLogo" runat="server" src="amtrak_logo.png" style="width: auto; height: 100px; margin: 0;" />
				<img id="imgAcela" runat="server" src="acela.png" style="width: auto; height: 100px; margin: 0;" />
				<span style="padding: 10px; font-size: 1.2em; color: #fff;">
					Paradigm is the document management system used by the Mechanical Department to track, manage, and store documentation and records
				</span>
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
											<%--OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGV">--%>
											<HeaderStyle CssClass="amtrak-gridViewHeader" />
											<RowStyle CssClass="amtrak-gridViewRow" />
											<AlternatingRowStyle CssClass="amtrak-gridViewAltRow" />
											<SelectedRowStyle CssClass="amtrak-gridViewSelRow" />
											<Columns>
												<asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName">
													<ItemStyle Width="20%" />
												</asp:BoundField>
												<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
													<ItemStyle Width="70%" />
												</asp:BoundField>
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
					<div class="amtrak-links">
						<div>
							<p style="text-decoration: underline; margin: 0; padding: 0;">Safety</p>
							<ul style="margin: 0; padding: 10px 0 10px 15px;">
								<li>
									Safety Programs: Risk Management (JSAs)
								</li>
								<li>
									Safety Programs: Promotion
								</li>
								<li>
									Safety Walkabout
								</li>
								<li>
									Report Safety Concerns
								</li>
								<li>
									Safety Rule Book
								</li>
							</ul>
						</div>
						<div>
							<p style="text-decoration: underline; margin: 0; padding: 0;">Rolling Stock Engineering</p>
							<ul style="margin: 0; padding: 10px 0 10px 15px;">
								<li>
									Document Discrepencies/Concerns
								</li>
								<li>
									EPDM (Drawings/Schematics)
								</li>
								<li>
									RESR Requests
								</li>
							</ul>
						</div>
						<div>
							<p style="text-decoration: underline; margin: 0; padding: 0;">Mechanical Department Documentation</p>
							<ul style="margin: 0; padding: 10px 0 10px 15px;">
								<li>
									Mechanical Bulletin Request
								</li>
								<li>
									New Document Request
								</li>
								<li>
									Existing Document Change Request
								</li>
							</ul>
							<span style="font-size: .75em;">
								* Applicable to entire Mechanical Department. Contact local DCR for site-specific infomration.
							</span>
						</div>
						<div>
							<p style="text-decoration: underline; margin: 0; padding: 0;">Assistance</p>
							<ul style="margin: 0; padding: 10px 0 10px 15px;">
								<li>
									Document Management FAQ
								</li>
								<li>
									Definitions and Acronyms
								</li>
								<li>
									WMS/Arrow Help
								</li>
							</ul>
						</div>
						<div>
							<p style="text-decoration: underline; margin: 0; padding: 0;">Links</p>
							<ul style="margin: 0; padding: 10px 0 10px 15px;">
								<li>
									All Aboard
								</li>
								<li>
									NRPC Forms
								</li>
								<li>
									Mechanical Department Forms
								</li>
								<li>
									Service Now
								</li>
							</ul>
						</div>
						<div>
							<p style="text-decoration: underline; margin: 0; padding: 0;">Paradigm</p>
							<ul style="margin: 0; padding: 10px 0 10px 15px;">
								<li>
									Paradigm Inquiry
								</li>
								<li>
									New Paradigm User Request
								</li>
								<li>
									Paradigm User Assistance
								</li>
								<li>
									DCR Assistance
								</li>
							</ul>
						</div>
						<div style="width: 100%;">
							<p style="text-decoration: underline; margin: 0; padding: 0;">About this Web Application</p>
							<ul style="margin: 0; padding: 10px 0 10px 15px;">
								<li>
									Document Management Contacts
								</li>
								<li>
									Feedback
								</li>
							</ul>
						</div>
					</div>
			</div>
		</div>
    </form>
</body>
<script src="../../scripts/P3Web.js"></script>
<script src="amtrakSearch.js"></script>
</html>
