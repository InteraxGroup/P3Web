function openDocWindow(ItemID, OrigID, ItemStatus, IsItemID, url, ext, pubType) {
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
            openDocument(ItemID, IsItemID, ItemStatus);
        } else {
            openDocument(OrigID, IsItemID, ItemStatus);
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

function openDocument(ItemID, IsItemID, ItemStatus) {
    var docPath = "../../ViewDocument.aspx?ItemID=" + ItemID + "&IsItemID=" + IsItemID + '&ItemStatus=' + ItemStatus;
    var windowWidth = screen.width - 100;
    var windowHeight = screen.height - 120;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(docPath, 'docWindow' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=0,left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function openPPO() {
	var docPath = "PPOrders.aspx";
	var windowWidth = screen.width - 100;
	var windowHeight = screen.height - 120;
	var xPos = screen.width / 2 - windowWidth / 2;
	window.open(docPath, 'docWindow' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=0,left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function goToGroup(ModuleID, GroupID) {
	var url, destination;
	url = document.location.href.split('/');
	if (url[3] == 'Default.aspx' || url[3] == 'custom') {
		destination = 'http://' + url[2] + '/Default.aspx?ModuleID=' + ModuleID + '&GroupID=' + GroupID;
	} else {
		destination = 'http://' + url[2] + '/' + url[3] + '/Default.aspx?ModuleID=' + ModuleID + '&GroupID=' + GroupID;
	}
	
	parent.document.location.href = destination;
	url = null;
	destination = null;
}

function openExternalWindow(Protocol, NavigateURL) {
	var destURL = Protocol + decodeURIComponent(NavigateURL);
	window.open(destURL);
	destURL = null;
}