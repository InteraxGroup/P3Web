<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Paradigm3.custom.Biotium.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link href="../../styles/homepanel.css" rel="stylesheet" />
	<link href="Biotium.css" rel="stylesheet" />
	<script src="../../scripts/P3Web.js"></script>
	<script src="Biotium.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="homeContent">
		<div class="customBanner">
			<img id="imgLogo" runat="server" src="banner_logo.png" style="height: 90px; margin-left: 10px; margin-top: 5px;" />
		</div>
		<div class="customContent">
			<h1>Welcome to P3Web!</h1>
			<h2>How to use:</h2>
			<ul>
				<li>
					Click a link in the main menu to the left to access commonly used file groups and direct links
				</li>
				<li>
					Use the search engine in the toolbar above to locate file by name, number, or content
				</li>
				<li>
					Click the “Login” link  at the top right to access direct form links
				</li>
				<li>
					Commonly used forms are available to logged on users. They will be available below.
				</li>
			</ul>
			<p>
				<strong>Please note that although you are able to print documents from within this web site, a printed copy of the document may not reflect the current, electronic version. Any copies appearing in paper form should always be checked against the electronic version prior to use</strong>
			</p>
			<asp:Panel ID="pnlShortcuts" runat="server" Visible="false"><a class="biotium-link" href="#" onclick="addBiotiumRecord(6, 0, 270, 130);">Raise New Purchase Order (OPF004)</a></asp:Panel>
		</div>
	</div>
    </form>
</body>
</html>
