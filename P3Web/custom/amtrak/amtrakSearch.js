function openSearch() {
	var pth = "/custom/amtrak/AmtrakSearch.aspx";
	var windowHeight = 720;
	var windowWidth = 1150;
	var xPos = screen.width / 2 - windowWidth / 2;
	window.open(pth, 'amtrakSearch', 'height=' + windowHeight + ',width=' + windowWidth + ',top=20,left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
	//window.open(pth);
}

function show(index) {
	var list = document.getElementsByTagName('select');
	var elem = list[index];
	if (elem.classList != null || elem.classList != undefined) {
		if (elem.classList.contains('showList')) {
			elem.classList.remove('showList');
		} else {
			elem.classList.add('showList');
		}		
	} else {
		elem.classList.add('showList');
	}

	switch (index) {
		case 0:
			document.getElementById('LB1').value = elem.classList;
			break;
		case 1:
			document.getElementById('LB2').value = elem.classList;
			break;
		case 2:
			document.getElementById('LB3').value = elem.classList;
			break;
		case 3:
			document.getElementById('LB4').value = elem.classList;
			break;
	}
}

function setDisplay() {
	//alert(document.getElementById('LB1').value + '|' + document.getElementById('LB2').value + '|' + document.getElementById('LB3').value + '|' + document.getElementById('LB4').value + '|')

	document.getElementById('LBStyle').classList = document.getElementById('LB1').value;
	document.getElementById('LBFleet').classList = document.getElementById('LB2').value;
	document.getElementById('LBType').classList = document.getElementById('LB3').value;
	document.getElementById('LBSystem').classList = document.getElementById('LB4').value;
	document.getElementById('LBDocType').classList = document.getElementById('LB5').value;
	document.getElementById('LBLocation').classList = document.getElementById('LB6').value;
	document.getElementById('LBContractor').classList = document.getElementById('LB7').value;
}

function resetDisplay() {
	document.getElementById('LB1').value = 'selectList';
	document.getElementById('LB2').value = 'selectList';
	document.getElementById('LB3').value = 'selectList';
	document.getElementById('LB4').value = 'selectList';
	document.getElementById('LB5').value = 'selectList';
	document.getElementById('LB6').value = 'selectList';
	document.getElementById('LB7').value = 'selectList';


	ocument.getElementById('LBStyle').classList = document.getElementById('LB1').value;
	document.getElementById('LBFleet').classList = document.getElementById('LB2').value;
	document.getElementById('LBType').classList = document.getElementById('LB3').value;
	document.getElementById('LBSystem').classList = document.getElementById('LB4').value;
	document.getElementById('LBDocType').classList = document.getElementById('LB5').value;
	document.getElementById('LBLocation').classList = document.getElementById('LB6').value;
	document.getElementById('LBContractor').classList = document.getElementById('LB7').value;
}

function openAmtrakDocument(ItemID) {
	var docPath = "../../ViewDocument.aspx?ItemID=" + ItemID + "&IsItemID=false&ItemStatus=9";
	var windowWidth = screen.width - 100;
	var windowHeight = screen.height - 120;
	var xPos = screen.width / 2 - windowWidth / 2;
	window.open(docPath, 'docWindow' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=0,left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function openMechDocuments(GroupID) {
	//window.parent.location.href = 'http://obiwan/p3web/default.aspx?ModuleID=3&GroupID=' + GroupID;
	window.parent.location.href = 'http://pdgmweb01p/paradigm/default.aspx?ModuleID=3&GroupID=' + GroupID;
}

function openFAQ() {
	//window.open('http://obiwan/p3web/DOCS/D0000264.PDF');
	window.open('http://pdgmweb01p/paradigm/DOCS/D0081397.pdf');
}

function addAmtrakRecord(ModuleID, ItemID, ObjTypeID, ParentGroupID) {
	// this will make a child Search page pop when the "Document Search" button is clicked.
	var UPath = "../../NewRecord.aspx?ModuleID=" + ModuleID + "&ItemID=" + ItemID + "&ObjTypeID=" + ObjTypeID + "&ParentGroupID=" + ParentGroupID;
	var windowWidth = 420;
	var windowHeight = 180;
	if (ModuleID == 12) {
		windowHeight = 220;
	}
	var centerWidth = (window.screen.width - windowWidth) / 2;
	var centerHeight = (window.screen.height - windowHeight) / 2;
	window.open(UPath, 'addItem' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=' + centerHeight + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function mechBulletinRequest() {
	var url = 'https://amtrak.sharepoint.com/sites/mech/MMI_PFT/_layouts/15/listform.aspx?PageType=8&ListId=%7B69A3FF1F-519D-4B23-8E0E-58F093D107C7%7D&RootFolder=%2Fsites%2Fmech%2FMMI_PFT%2FLists%2FMechanical%20Bulletin%20Request%20Form&Source=https%3A%2F%2Famtrak.sharepoint.com%2Fsites%2Fmech%2FMMI_PFT%2FLists%2FMechanical%2520Bulletin%2520Request%2520Form%2FAllItems.aspx&ContentTypeId=0x010034DED711288FFA489441E6B17ECF73EE';
	window.open(url);
}

function docChangeRequest() {
	var url = 'https://amtrak.sharepoint.com/sites/mech/MMI_PFT/_layouts/15/listform.aspx?PageType=8&ListId=%7B98626506-BEB3-40D8-99A2-35795634C242%7D&RootFolder=%2Fsites%2Fmech%2FMMI_PFT%2FLists%2FDoc%20Change%20Request%20Form&Source=https%3A%2F%2Famtrak.sharepoint.com%2Fsites%2Fmech%2FMMI_PFT%2FLists%2FDoc%2520Change%2520Request%2520Form%2FAllItems.aspx&ContentTypeId=0x0100125B9A3E26F3184DA467080C1E81012500B4681CB81A9C4141BE58D003C10687DB';
	window.open(url);
}

function docManagementGeneralRequest() {
	var url = 'https://amtrak.sharepoint.com/sites/mech/MMI_PFT/_layouts/15/listform.aspx?PageType=8&ListId=%7B2D57FEA1-C082-4B6E-85B5-0734A5A1D861%7D&RootFolder=%2Fsites%2Fmech%2FMMI_PFT%2FLists%2FGeneral%20Request%20Form&Source=https%3A%2F%2Famtrak.sharepoint.com%2Fsites%2Fmech%2FMMI_PFT%2FLists%2FGeneral%2520Request%2520Form%2FAllItems.aspx%3Fviewpath%3D%252Fsites%252Fmech%252FMMI_PFT%252FLists%252FGeneral%2520Request%2520Form%252FAllItems.aspx&ContentTypeId=0x010010AF00D111438C4781EF95F8028DE3FB';
	window.open(url);
}

function showComingSoon() {
	document.getElementById('comingsoon').style.display = 'flex';
}

function hideComingSoon() {
	document.getElementById('comingsoon').style.display = 'none';
}

//  Document
function amtrakOpenDocWindow(ItemID, OrigID, ItemStatus, IsItemID, url, ext, pubType) {
	//alert(ItemID + ',' + OrigID + ',' + ItemStatus + ',' + IsItemID + ',' + url + ',' + ext + ',' + pubType);
	var os = getMobileOperatingSystem();
	if (os == 'iOS') {
		switch (pubType) {
			case 1:
				ext = '.htm';
				break;
			case 2:
				switch (ext.toUpperCase) {
					case "DOC":
					case "DOCX":
					case "XLS":
					case "XLSX":
					case "XLSM":
					case "RTF":
						ext = ".htm";
						break;
					default:
						ext = "." + ext;
						break;
				}
				break;
			case 3:
				ext = "." + ext;
				break;
			case 4:
				ext = ".pdf";
				break;
			case 5:
				switch (ext.toUpperCase()) {
					case "DOC":
					case "DOCX":
					case "XLS":
					case "XLSX":
					case "DWG":
						ext = ".pdf";
						break;
					default:
						ext = "." + FileExtension;
						break;
				}
				break;
			default:
				break;
		}
		var n = OrigID + '';
		if (IsItemID == true) {
			n = ItemID + '';
		}
		while (n.length < 7) n = '0' + n;
		n = url.substring(2) + 'D' + n + ext;
		window.open(n);
		n = null;
	} else {
		if (IsItemID == 'True') {
			amtrakOpenDocument(ItemID, IsItemID, ItemStatus);
		} else {
			amtrakOpenDocument(OrigID, IsItemID, ItemStatus);
		}
	}
	os = null;
}

function getMobileOperatingSystem() {
	var userAgent = navigator.userAgent || navigator.vendor || window.opera;
	if (userAgent.match(/iPad/i) || userAgent.match(/iPhone/i) || userAgent.match(/iPod/i)) {
		return 'iOS';

	}
	else if (userAgent.match(/Android/i)) {

		return 'Android';
	}
	else {
		return 'unknown';
	}
	userAgent = null;
}

function amtrakOpenDocument(ItemID, IsItemID, ItemStatus) {
	var docPath = "../../ViewDocument.aspx?ItemID=" + ItemID + "&IsItemID=" + IsItemID + '&ItemStatus=' + ItemStatus;
	var windowWidth = screen.width - 100;
	var windowHeight = screen.height - 120;
	var xPos = screen.width / 2 - windowWidth / 2;
	window.open(docPath, 'docWindow' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=0,left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}