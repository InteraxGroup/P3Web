<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Paradigm3.custom.amtrak.HomePage" Async="true" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link href="../../styles/homepanel.css" rel="stylesheet" />
	<link href="amtrakSearch.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="homeContent">
			<div class="customBanner">
				<img id="imgLogo" runat="server" src="amtrak_logo.png" style="width: auto; height: 100px; margin: 0;" />
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
						<div class="homeBtn" onclick="mechBulletinRequest()">
							<div class="homeBtn-header">Mechanical Bulletin Request</div>
						</div>
						<div class="homeBtn" onclick="docChangeRequest()">
							<div class="homeBtn-header">Document Change Request (TFBRs)</div>
							<div class="homeBtn-description">(New and existing Mechanical Department Document Change Requests)</div>
						</div>
						<div class="homeBtn" onclick="docManagementGeneralRequest()">
							<div class="homeBtn-header">Document Management General Request</div>
							<div class="homeBtn-description">(New User request, Account changes & misc.)</div>
						</div>
						<div class="homeBtn" onclick="openFAQ()">
							<div class="homeBtn-header">Document Management FAQs</div>
						</div>
					</div>	
					<div class="amtrak-data">
						<div class="grid">
							<div class="gridHeader">
								Recently Released Mechanical Bulletins
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
						<div class="dcr-message">
								Contact your local DCR for site-specific documentation
						</div>
						<div>
							<hr />
						</div>						
						<div class="links">							
							<div class="safety-logo">
								<img src="safety.png" />
							</div>
							<div class="safety-links">
								<ul>
									<li>
										<a href="https://allaboard.amtrak.com/s/article/Safety-Programs-Risk-Management" target="_blank">Safety Programs: Risk Management</a>
									</li>
									<li>
										<a href="https://allaboard.amtrak.com/s/article/Safety-Programs-Promotion" target="_blank">Safety Programs: Promotion</a>
										
									</li>
									<li>
										<a href="#" onclick="addAmtrakRecord(4,0,164,237);">Generate New Safety Walkabout</a>										
									</li>
									<li>
										Report all Safety-Related Concerns to <a href="mailto:systemsafety@amtrak.com">systemsafety@amtrak.com</a> or 800-331-0008
									</li>
								</ul>
							</div>
						</div>
						<div>
							<hr />
						</div>
						<div class="links2">
							<div>
								<img src="../../images/improvement.png" />
								<a style="text-decoration: none;" href="http://pdgmweb01p/paradigm/DOCS/D0081396.pdf" target="_blank">Document Management Contacts</a>
							</div>
							<div>
								<img src="../../images/improvement.png" />
								<a style="text-decoration: none;" href="#" onclick="showComingSoon()">RSER Requests</a>
							</div>
						</div>
					</div>
				<div id="comingsoon" class="coming-soon">
					<div class="cs-title" style="background-color: #fff; border-bottom: 1px solid #000; position: relative;">
						<span>Coming Soon...</span>
						<img src="../../images/squareclose.png" onclick="hideComingSoon()" />
					</div>
					<div class="cs-message">
						<h2>Coming Soon!</h2>
					</div>					
				</div>
			</div>
		</div>
    </form>
</body>
<script src="../../scripts/P3Web.js"></script>
<script src="amtrakSearch.js"></script>
</html>
