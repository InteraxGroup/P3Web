// P3 Web JavaScript codes - Last Updated 2021-02-18 - Chris Reyno, Interax Group, Inc.

if (/Mobi/.test(navigator.userAgent)) {
    // mobile!
    console.log('mobile');
} else {
    console.log('not mobile');
}

function do_Logout() {
    document.getElementById('btnLogout').click(); return false;
}

function closeP3Window() {
    window.close();
}

//  Search
function openSearchWindow(ModuleID, ParentGroupID) {
    var UPath = "ViewSearch.aspx?ModuleID=" + ModuleID + "&ParentGroupID=" + ParentGroupID;
    var windowWidth = 1000;
    var windowHeight = 255;
    if (navigator.userAgent.indexOf("MSIE") !== -1) {
        windowHeight = 250;
    }
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(UPath, 'search', 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=20,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function enlargeSearchWindow() {
    window.resizeTo(1017, 650);
}

function reduceSearchWindow() {
    window.resizeTo(1017, 330);
}

//  Action Items

function openCreateAIWindow(ModuleID, OrigID, UserID) {
    var AIPath = 'ViewCreateActionItem.aspx?ModuleID=' + ModuleID + '&OrigID=' + OrigID + '&UserID=' + UserID;
    var windowWidth = 800;
    var windowHeight = 604;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(AIPath, 'CreateAIWindow' + OrigID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=50,left=' + centerWidth + ',location=0,menubar=0,toolbar=0,status=0,scrollbars=0,resizable=0');
}

function openAIWindow(AIID) {
    var AIPath = "ViewActionItem.aspx?AIID=" + AIID;
    var windowWidth = 800;
    var windowHeight = 604;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(AIPath, 'actionItem' + AIID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=50,left=' + centerWidth + ',location=0,menubar=0,toolbar=0,status=0,scrollbars=0,resizable=0');
}

function aiRefresh() {
    window.opener.document.getElementById('btnRefreshAI').click();
}

function openRelatedAI(OrigID, ModuleID) {
    var relAIPath = "ViewRelatedActionItem.aspx?OrigID=" + OrigID + "&ModuleID=" + ModuleID;
    var windowWidth = 800;
    var windowHeight = 450;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(relAIPath, 'relAI' + OrigID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function openOtherUserAI() {
    var othAIPath = "ViewActionItemOtherUser.aspx";
    var windowWidth = 1100;
    var windowHeight = 400;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(othAIPath, 'othAI', 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

//  Go There
function clickGoThere() {
    var parDoc = window.opener.document;
    var btn = parDoc.getElementById('btnGoThere');
    if (btn !== null) {
        btn.click();
    } else {
        var gparDoc = parDoc.window.opener.document;
        btn = gparDoc.getElementById('btnGoThere');
        window.opener.window.close();
        btn.click();
    }
}

//  Document
function openDocWindow(ItemID, OrigID, ItemStatus, IsItemID, url, ext, pubType) {
    //alert(ItemID + ',' + OrigID + ',' + ItemStatus + ',' + IsItemID + ',' + url + ',' + ext + ',' + pubType);
    var os = getMobileOperatingSystem();
    if (os === 'iOS') {
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
        if (IsItemID === 'True') {
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
}

function openDocument(ItemID, IsItemID, ItemStatus) {
    var docPath = "ViewDocument.aspx?ItemID=" + ItemID + "&IsItemID=" + IsItemID + '&ItemStatus=' + ItemStatus;
    var windowWidth = screen.width - 100;
    var windowHeight = screen.height - 120;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(docPath, 'docWindow' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=0,left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function openAddDocWindow(ModuleID, GroupID, AddOption, Status) {
    // AddOption 3003,3003_9,3003_4,3003_5 = item
    // AddOption 3002 = item from template
    // AddOption 3054 = item as evidence
    // AddOption 3004,4004,6004,12004 = folder

    var addDocPath, windowWidth, windowHeight, xPos, yPos;
    switch (AddOption) {
        case 1002:
            windowWidth = 800;
            windowHeight = 550;
            addDocPath = 'ViewPropertiesUser.aspx';
            break;
        case 3002:
            windowWidth = 700;
            windowHeight = 600;
            addDocPath = 'ViewDocumentAddFromTemplate.aspx?GroupID=' + GroupID;
            break;
        case 1004:
        case 3004:
        case 4004:
        case 6004:
        case 12004:
            windowWidth = 500;
            windowHeight = 150;
            addDocPath = 'NewGroup.aspx?ModuleID=' + ModuleID + '&ParentGroupID=' + GroupID;
            break;
        default:
            windowWidth = 700;
            windowHeight = 200;
            addDocPath = 'ViewDocumentAdd.aspx?GroupID=' + GroupID + '&Status=' + Status;
            break;
    }
    xPos = screen.width / 2 - windowWidth / 2;
    yPos = screen.height / 2 - windowHeight / 2;
    window.open(addDocPath, 'addDocWindow' + GroupID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=' + yPos + ',left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function openEditDocWindow(OrigID, Status, IsServer) {
    var editPath = 'ViewDocEdit.aspx?OrigID=' + OrigID + '&status=' + Status + '&IsServer=' + IsServer;
    var windowWidth = 700;
    var windowHeight = 260;
    var xPos = screen.width / 2 - windowWidth / 2;
    var yPos = screen.height / 2 - windowHeight / 2;
    window.open(editPath, 'editDocWindow' + OrigID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=' + yPos + ',left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function openCheckinWindow(origid, status, isserver) {
    var editPath = 'ViewDocCheckin.aspx?OrigID=' + origid + '&status=' + status + '&IsServer=' + isserver;
    var windowWidth = 700;
    var windowHeight = 260;
    var xPos = screen.width / 2 - windowWidth / 2;
    var yPos = screen.height / 2 - windowHeight / 2;
    window.open(editPath, 'editDocWindow' + origid, 'height=' + windowHeight + ',width=' + windowWidth + ',top=' + yPos + ',left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function docRefresh() {
    window.opener.document.getElementById('btnRefreshDoc').click();
}

function openNativeDoc(fullPath) {
    window.open(fullPath);
}

function openDocumentReport(ParentGroupID) {
    var reportPath = "ReportDocument.aspx?ParentGroupID=" + ParentGroupID;
    var windowWidth = screen.width - 100;
    var windowHeight = screen.height - 120;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(reportPath, 'rptWindow' + ParentGroupID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=0,left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function closeDoc() {
    var btn = document.getElementById('btnCloseDoc');
    btn.click();
    window.close();
}

function checkoutFile(url, name) {
    editRefresh(true, false, false);
    var link = document.createElement("a");
    link.download = name;
    link.href = url;
    //alert(link.href);
    link.click();
    link = null;
}

function checkoutToServer(url) {
    document.getElementById('btnRefreshDoc').click();
    editRefresh(true, false, true);
    alert('The file has been successfully checked out to ' + url + '. You may edit the file at that location.');
}

function nameConfirm(test) {
    if (confirm('The name of the selected file does not match the checked-out file ' + test + '. OVERWRITE ? ')) {
        document.getElementById('btnConfirmedCheckin').click();
    } else {
        alert('Aborted due to names not matching');
    }
}

function testCheckIn() {
    document.getElementById('btnConfirmedCheckin').click();
    return false;
}

//  New Record/Improvement/Training

function addRecord(ModuleID, ItemID, ObjTypeID, ParentGroupID) {
    // this will make a child Search page pop when the "Document Search" button is clicked.
    var UPath = "NewRecord.aspx?ModuleID=" + ModuleID + "&ItemID=" + ItemID + "&ObjTypeID=" + ObjTypeID + "&ParentGroupID=" + ParentGroupID;
    var windowWidth = 420;
    var windowHeight = 180;
    if (ModuleID == 12) {
        windowHeight = 220;
    }
    var centerWidth = (window.screen.width - windowWidth) / 2;
    var centerHeight = (window.screen.height - windowHeight) / 2;
    window.open(UPath, 'addItem' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=' + centerHeight + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

//  Record Viewer

function openRecordWindow(ModuleID, ItemID, ObjTypeID, ParentGroupID, IsNew) {
    var strPath;
    if (ModuleID === 4) {
        strPath = "ViewRecord.aspx?ItemID=" + ItemID + "&ObjTypeID=" + ObjTypeID + "&ParentGroupID=" + ParentGroupID + "&IsNew=" + IsNew;
    } else if (ModuleID === 6) {
        strPath = "ViewImprovement.aspx?ItemID=" + ItemID + "&ObjTypeID=" + ObjTypeID + "&ParentGroupID=" + ParentGroupID + "&IsNew=" + IsNew;
    } else {
        strPath = "ViewTraining.aspx?ItemID=" + ItemID + "&ObjTypeID=" + ObjTypeID + "&ParentGroupID=" + ParentGroupID + "&IsNew=" + IsNew;
    }
    var windowWidth = 960;
    var windowHeight = 780;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(strPath, 'openRecord' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=20,left=' + centerWidth + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function openAssignment(TabIndex, ItemID, ObjTypeID, IsNew) {
    var attPath = "ViewAssignment.aspx?TabIndex=" + TabIndex + "&ItemID=" + ItemID + "&ObjTypeID=" + ObjTypeID + "&IsNew=" + IsNew;
    var windowWidth = 500;
    var windowHeight = 620;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(attPath, 'assign' + ObjTypeID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function selListUpdate() {
    document.getElementById('btnUserField').click();
}

function printRecord(moduleid) {
    var printWindow = window.open('ViewPrintRecord.aspx?ModuleID=' + moduleid);
    printWindow.document.close();
    setTimeout(function () {
        printWindow.print();
    }, 500);
    return false;
}

function editContents(FieldID) {
    var path = "ViewFieldEdit.aspx?FieldID=" + FieldID;
    var windowWidth = 500;
    var windowHeight = 280;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(path, 'editFieldContents' + FieldID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top = 50, location = 0, status = 0, menubar = 0, toolbar = 0, scrollbars = 0, resizable = 0');
}

function digitalSignature(clientid) {
    var hidden = document.getElementById('hdnDigitalSignatureID');
    hidden.value = clientid;
    document.getElementById('btnDigitalSignature').click();
    hidden = null;
}

function showDigitalSignature(fieldid) {
    this.event.preventDefault();
    document.getElementById('hdnDigitalSignatureID').value = fieldid;
    document.getElementById('pnlDigitalSignature').style.display = 'flex';
    return false;
}

//  Properties
function openProperties(ItemID, ModuleID, IsGroup) {
    var proPath;
    var windowWidth;
    var windowHeight;
    if (ModuleID === 1 && IsGroup === 0) {
        proPath = "ViewPropertiesUser.aspx";
        windowWidth = 800;
        windowHeight = 550;
    } else {
        proPath = "ViewProperties.aspx?ItemID=" + ItemID + "&ModuleID=" + ModuleID + "&IsGroup=" + IsGroup;
        windowWidth = 640;
        windowHeight = 490;
    }
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(proPath, 'properties' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function openPropertiesModal(ItemID, ModuleID, IsGroup) {
    var xhr = createXHR();
    var url = 'ViewProperties.aspx?ItemID=' + ItemID + '&ModuleID=' + ModuleID + '&IsGroup=' + IsGroup;
    xhr.open('GET', url, true);
    xhr.onload = function () {
        if (this.status >= 200 && this.status < 400) {
            document.getElementById('divProperties').innerHTML = this.response;
            document.getElementById('divProperties').style.display = 'block';
        } else {
            var errMessage;
            switch (this.status) {
                case 400:
                    errMessage = 'Bad Request: Syntax error';
                    break;
                case 401:
                case 403:
                    errMessage = 'Access denied';
                    break;
                case 404:
                    errMessage = 'File not found: ' + url;
                    break;
                default:
                    errMessage = 'Undefined server error';
                    break;
            }
            alert(errMessage);
            //showMessage('error', '<p style="font-size: 1.3em;"><strong>loadView: Error #' + this.status + ':</strong></p><p> ' + errMessage + ' </p>');
        }
    };
    xhr.onerror = function () {
        alert('Server connection not available');
        //showMessage('error', '<p><strong>loadView Error:</strong></p><p>Server connection not available.  Please try again later.</p>');
    };
    xhr.send();
    xhr = null;
    url = null;
}

function editEventDates() {
    document.getElementById('dummyclicker').click();
}

//  Para-Link

function openParaLink(ItemID, ModuleID) {
    var plPath = "ViewParaLink.aspx?OrigID=" + ItemID + "&ModuleID=" + ModuleID;
    var windowWidth = 940;
    var windowHeight = 475;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(plPath, 'pLink' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function addParaLink(ModuleID, OrigID) {
    var plPath = "ViewParaLinkAdd.aspx?ModuleID=" + ModuleID + "&OrigID=" + OrigID;
    var windowWidth = 940;
    var windowHeight = 700;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(plPath, 'addPLink', 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function addGroupParaLink(ModuleID, OrigID) {
    var plPath = "ViewParaLinkAddGroup.aspx?ModuleID=" + ModuleID + "&OrigID=" + OrigID;
    var windowWidth = 400;
    var windowHeight = 500;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(plPath, 'addGroupPLink', 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function pLinkRefresh() {
    window.opener.document.getElementById('btnRefreshPLinks').click();
}

//  Attachments
function openAttachment(ItemID, ModuleID, ObjID, IsEdit) {
    var attPath = "ViewAttachment.aspx?ItemID=" + ItemID + "&ModuleID=" + ModuleID + "&ObjID=" + ObjID + "&IsEdit=" + IsEdit;
    var windowWidth = 850;
    var windowHeight = 370;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(attPath, 'attach' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function showAdd() {
    var uploader = document.getElementById("uploader");
    uploader.style.display = "flex";
}

function uploadComplete() {
    alert('Attachment uploaded successfully');
}

function uploadError() {
    alert('File upload unsuccessful.  Check the browser console by hitting [F12] to see if there is detailed information available.');
}

// Change Password
function openChangePassword(UserID) {
    var cpPath = "ChangePassword.aspx?UserID=" + UserID;
    var windowWidth = 405;
    var windowHeight = 307;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(cpPath, 'changePassword', 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

// Competency Assessment
function openAssessment(ItemID, ReqID, QuesSetID) {
    var attPath = "ViewAssessment.aspx?ItemID=" + ItemID + "&ReqID=" + ReqID + "&QuesSetID=" + QuesSetID;
    var windowWidth = 850;
    var windowHeight = 380;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(attPath, 'assess' + QuesSetID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

// Select User/Entity
function openSelect(FieldID) {
    var attPath = "ViewAssign.aspx?FieldID=" + FieldID;
    var windowWidth = 700;
    var windowHeight = 600;
    var centerWidth = (window.screen.width - windowWidth) / 2;
    window.open(attPath, 'assignEntity' + FieldID, 'height=' + windowHeight + ',width=' + windowWidth + ',left=' + centerWidth + ',top=50,location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

//  Open Reports
function openReportWindow(ModuleID, GroupID, ReportID) {
    var reportPath = "ViewReport.aspx?ModuleID=" + ModuleID + "&GroupID=" + GroupID + "&ReportID=" + ReportID;
    var windowWidth = screen.width - 100;
    var windowHeight = screen.height - 120;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(reportPath, 'rptWindow' + ReportID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=0,left=' + xPos + '');
}

//// Open Rename
function openRenameWindow(moduleid, origid, userid, isgroup) {
    var renamepath = 'viewrename.aspx?moduleid=' + moduleid + '&origid=' + origid + '&userid=' + userid + '&isgroup=' + isgroup;
    var windowwidth = 550;
    var windowheight = 280;
    var xpos = screen.width / 2 - windowwidth / 2;
    window.open(renamepath, 'renamewindow' + origid, 'height=' + windowheight + ',width=' + windowwidth + ',top=50px,left=' + xpos + '');
}

// Open Delete
function openDeleteWindow(ModuleID, OrigID, UserID, IsGroup) {
    var deletePath = 'ViewDelete.aspx?ModuleID=' + ModuleID + '&OrigID=' + OrigID + '&UserID=' + UserID + '&IsGroup=' + IsGroup;
    var windowWidth = 500;
    var windowHeight = 280;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(deletePath, 'deleteWindow' + OrigID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=50px,left=' + xPos + '');
}

// Open Move
function openMoveWindow(ModuleID, OrigID, UserID, SourcePath, IsGroup) {
    var movePath = 'ViewMove.aspx?ModuleID=' + ModuleID + '&OrigID=' + OrigID + '&UserID=' + UserID + '&SourcePath=' + SourcePath + '&IsGroup=' + IsGroup;
    var windowWidth = 700;
    var windowHeight = 600;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(movePath, 'deleteWindow' + OrigID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=50px,left=' + xPos + '');
}


// Open Copy
function openCopyWindow(ModuleID, OrigID, UserID, SourcePath, IsGroup) {
    var copyPath = 'ViewCopy.aspx?ModuleID=' + ModuleID + '&OrigID=' + OrigID + '&UserID=' + UserID + '&SourcePath=' + SourcePath + '&IsGroup=' + IsGroup;
    var windowWidth = 700;
    var windowHeight = 600;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(copyPath, 'copyWindow' + OrigID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=50px,left=' + xPos + '');
}

// Open ChangeEvidence
function openEvidenceWindow(ModuleID, OrigID, UserID, IsEvidenceCheck) {
    var copyPath = 'ViewChangeEvidence.aspx?ModuleID=' + ModuleID + '&OrigID=' + OrigID + '&UserID=' + UserID + '&isEvidence=' + IsEvidenceCheck;
    var windowWidth = 500;
    var windowHeight = 150;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(copyPath, 'evidenceWindow' + OrigID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=300px,left=' + xPos + '');
}

// Open ExportItem
function openExportWindow(ModuleID, OrigID, UserID, ItemStatus) {
    var copyPath = 'ViewExportDocument.aspx?ModuleID=' + ModuleID + '&OrigID=' + OrigID + '&UserID=' + UserID + '&ItemStatus=' + ItemStatus;
    var windowWidth = 400;
    var windowHeight = 300;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(copyPath, 'exportitemWindow' + OrigID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=300px,left=' + xPos + '');
}

// Status
function openStatusWindow(ModuleID, ItemID, OrigID) {
    var statusPath = "ViewStatus.aspx?ModuleID=" + ModuleID + "&ItemID=" + ItemID + "&OrigID=" + OrigID;
    var windowWidth = 400;
    var windowHeight = 330;
    var xPos = screen.width / 2 - windowWidth / 2;
    var yPos = screen.height / 2 - windowHeight / 2;
    window.open(statusPath, 'statusWindow' + OrigID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=' + yPos + ',left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}

function showStatusMessage(moduleid, msg, iserror) {
    var msgpnl = document.getElementById("statusMessagePanel");
    var msgbox = document.getElementById("statusMessage");
    var msglbl = document.getElementById("lblStatusMessage");
    var docbtn = document.getElementById("closeRefreshDoc");
    var recbtn = document.getElementById("closeRefreshRecord");
    if (moduleid == 3) {
        docbtn.style.display = "block";
        recbtn.style.display = "none";
    } else {
        docbtn.style.display = "none";
        recbtn.style.display = "block";
    }

    msglbl.innerText = msg;
    msgpnl.style.display = "block";
    if (iserror) {
        msgbox.style.backgroundColor = "red";
        msgbox.style.color = "white";
    } else {
        msgbox.style.backgroundColor = "#F0F0F0";
        msgbox.style.color = "black";
    }

    msgpnl = null;
    msgbox = null;
    msglbl = null;
    docbtn = null;
    recbtn = null;
}

function hideStatusMessage() {
    var msgpnl = document.getElementById("statusMessagePanel");
    msgpnl.style.display = "none";
    msgpnl.style.backgroundColor = "#F0F0F0";
    msgpnl.style.color = "black";
    msgpnl = null;
}

// Misc
function openRelNotes() {
    var request = new XMLHttpRequest();
    var homepanel = document.getElementById('pnlHome');
    request.open('GET', 'releasenotes/releasenotes.html', true);
    request.onload = function () {
        if (this.status >= 200 && this.status < 400) {
            // Success!
            var resp = this.response;
            homepanel.innerHTML = resp;

        } else {
            // We reached our target server, but it returned an error
            homepanel.innerHTML = '<div style="padding: 10px; background-color: #787878; color: #fff; font-size: 3em; font-weight: 700;">The release notes are not currently available.  Please try again later.</div>';
        }
    };

    request.onerror = function () {
        // There was a connection error of some sort
        homepanel.innerHTML = '<div style="padding: 10px; background-color: #787878; color: #fff; font-size: 3em; font-weight: 700;">The release notes are not currently available.  Please try again later.</div>';
    };

    request.send();
}

function resetHome() {
    if (navigator.userAgent.indexOf("Firefox") > 0) {
        window.location.href = 'default.aspx';
    } else {
        window.history.pushState({}, document.title, '' + 'Default.aspx');
        parent.document.location.reload();
    }
}

function saveItemScrollPos(grid) {
    var elem = document.getElementById('listView');
    var target = document.getElementById('scrollPos');
    if (elem.scrollTop != null) {
        target.value = elem.scrollTop;
    }
    console.log(elem.id);
}

function setItemScrollPos(val) {
    var elem = document.getElementById("listView");
    elem.scrollTop = val;
}

function saveSearchScrollPos() {
    var elem = document.getElementById("resultlist");
    var target = document.getElementById("scrollPos");
    if (elem.scrollTop !== null) {
        target.value = elem.scrollTop;
    }
}

function setSearchScrollPos(val) {
    var elem = document.getElementById("resultlist");
    elem.scrollTop = val;
}

function saveReportScrollPos() {
    var elem = document.getElementById("Panel1");
    var target = document.getElementById("scrollPos");
    if (elem.scrollTop != null) {
        target.value = elem.scrollTop;
    }
}

function setReportScrollPos(val) {
    var elem = document.getElementById("Panel1");
    elem.scrollTop = val;
}

function documentRefresh() {
    window.opener.document.getElementById('btnRefreshDoc').click();
}

function recordRefresh() {
    window.opener.document.getElementById('btnRefreshRec').click();
}

function recordRefreshLocal() {
    document.getElementById('btnRefreshRec').click();
}

function userRefresh() {
    window.opener.document.getElementById('btnRefreshUser').click();
}

function treeRefresh() {
    window.opener.document.getElementById('btnRefreshTree').click();
}

function treeRefreshDelete() {
    window.opener.document.getElementById('btnRefreshTreeDelete').click();
}

function treeRefreshMove() {
    window.opener.document.getElementById('btnRefreshTreeMove').click();
}

function escalateRefresh() {
    window.opener.document.getElementById('btnUpdateEscList').click();
}

function roleRefresh() {
    window.opener.document.getElementById('btnRefreshRoles').click();
}

function fieldRefresh() {
    window.opener.document.getElementById('btnUpdateField').click();
}

function addNodeToTree() {
    window.opener.document.getElementById('btnAddTreeNode').click();
    window.close();
}

function responsibleRefresh() {
    window.opener.document.getElementById('btnUpdateRespList').click();
}

function editRefresh(IsCheckedOut, cancelled, isServer) {
    //window.opener.document.getElementById('btnRefeshEdit').click();
    if (IsCheckedOut) {
        if (!isServer) {
            document.getElementById('btnRefreshDoc').click();
            alert('Your file has been successfully checked out and downloaded.');
        }
    } else {
        if (cancelled) {
            alert('The check-out has been cancelled');
        } else {
            alert('File has been successfully checked in');
        }
        window.close();
    }
}

function getCountry() {
    var requestUrl = "http://ip-api.com/json";

    $.ajax({
        url: requestUrl,
        type: 'GET',
        success: function (json) {
            if (json.country != 'Canada') {
                window.location.href = 'invalidLocation.html';
            }
        },
        error: function (err) {
            console.log("Request failed, error= " + err);
        }
    });
}

// Event Handling Methods for memory management & Cross-Browser support
var EventUtil = {
    // load function when page is ready
    ready: function (fn) {
        if (document.readyState === 'complete' && document.readyState !== 'loading') {
            fn();
        } else {
            document.addEventListener('DOMContentLoaded', fn, false);
        }
    },

    getEvent: function (event) {
        return event ? event : window.event;
    },

    // Get Event Target
    getTarget: function (event) {
        return event.target || event.srcElement;
    },

    getClosest: function (element, selector) {
        for (; element && element !== document; element = element.parentNode) {
            if (element.matches(selector)) return element;
        }
        return null;
    },

    // Add Event Listener
    addHandler: function (element, type, handler) {
        if (element.addEventListener) {
            element.addEventListener(type, handler, false);
        } else if (element.attachEvent) {
            element.attachEvent('on' + type, handler);
        } else {
            element['on' + type] = handler;
        }
    },

    // Remove Event Listener
    removeHandler: function (element, type, handler) {
        if (element.removeEventListener) {
            element.removeEventListener(type, handler, false);
        } else if (element.detachEvent) {
            element.detachEvent('on' + type, handler);
        } else {
            element['on' + type] = null;
        }
    },

    // Prevent Default
    preventDefault: function (event) {
        if (event.preventDefault) {
            event.preventDefault();
        } else {
            event.returnValue = false;
        }
    }
}

EventTarget.prototype = {
    constructor: EventTarget,

    addHandler: function (type, handler) {
        if (typeof this.handlers[type] == "undefined") {
            this.handlers[type] = [];
        }

        this.handlers[type].push(handler);
    },

    fire: function (event) {
        if (!event.target) {
            event.target = this;
        }
        if (this.handlers[event.type] instanceof Array) {
            var handlers = this.handlers[event.type];
            for (var i = 0, len = handlers.length; i < len; i++) {
                handlers[i](event);
            }
        }
    },

    removeHandler: function (type, handler) {
        if (this.handlers[type] instanceof Array) {
            var handlers = this.handlers[type];
            for (var i = 0, len = handlers.length; i < len; i++) {
                if (handlers[i] === handler) {
                    break;
                }
            }

            handlers.splice(i, 1);
        }
    }
};

// Create XHR Object for Application
var createXHR = (function () {
    if (typeof XMLHttpRequest != 'undefined') {
        return function () {
            return new XMLHttpRequest();
        };
    } else if (typeof ActiveXObject != 'undefined') {
        return function () {
            if (typeof arguments.callee.activeXString !== 'string') {
                var versions = ['MSXML2.XMLHttp.6.0', 'MSXML2.XMLHttp.3.0', 'MSXML2.XMLHttp'], i, len;

                for (i = 0, len = versions.length; i < len; i++) {
                    try {
                        new ActiveXObject(versions[i]);
                        arguments.callee.activeXString = versions[i];
                        break;
                    } catch (ex) {
                        // skip
                    }
                }
            }
            return new ActiveXObject(arguments.callee.activeXString);
        };
    } else {
        throw new Error('No XHR object available');
    }
})();

EventUtil.addHandler(window, 'contextmenu', function (e) {
    EventUtil.preventDefault(e);
    document.getElementById('hdnPosX').value = e.pageX;
    document.getElementById('hdnPosY').value = (e.pageY - 50);
    var contextMenu = document.getElementById('p3ContextMenu');
    if (contextMenu) {
        contextMenu.style.display = 'none';
    }
    var elem = EventUtil.getTarget(e);
    if (elem.nodeName === 'A') {
        var isTreeNode = elem.href.includes('p3Tree');
        if (isTreeNode) {
            document.getElementById('hdnNewSelectedNodePath').value = elem.href.substring(elem.href.lastIndexOf(',') + 2).slice(1, -2);
            var n = elem.href.lastIndexOf('\\');
            var groupId = elem.href.substring(n + 1).replace("')", '');
            n = null;
            if (groupId.includes("'s")) {
                var l = groupId.lastIndexOf("'s");
                groupid = groupId.substring(l + 2);
                l = null;
            }
            document.getElementById('hdnNewSelectedNodeID').value = groupId;
            createMenu('treeNode', groupId);
            groupid = null;
        }
        isTreeNode = null;
    } else if (elem.nodeName === 'TD') {
        if (elem.parentNode.parentNode.parentNode.className.includes('gridView')) {
            var rowVal = elem.parentNode.onclick.toString().substring(elem.parentNode.onclick.toString().lastIndexOf('$') + 1).slice(0, -4);
            document.getElementById('hdnContextID').value = rowVal;
            document.getElementById('btnShowGVMenu').click();
            rowVal = null;
        }
    }
    contextMenu = null;
});

function createMenu(type, id) {
    var div = document.getElementById('p3ContextMenu');
    div.style.display = 'block';
    div.style.left = document.getElementById('hdnPosX').value + 'px';
    div.style.top = document.getElementById('hdnPosY').value + 'px';
    document.getElementById('hdnContextID').value = id;
    var subDiv;
    if (type === 'treeNode') {
        subDiv = document.getElementById('tvMenu');
        document.getElementById('gvMenu').style.display = 'none';
    } else {
        subDiv = document.getElementById('gvMenu');
        document.getElementById('tvMenu').style.display = 'none';
    }
    subDiv.style.display = 'block';

    // cleanup
    div = null;
    subDiv = null;
    hdnContext = null;
}

function confirmApplyEventDatesToItems() {
    if (confirm('This action will OVERWRITE all item Event Dates in this folder. Do you wish to continue?')) {
        document.getElementById('btnApplyEDTSI').click();
    }
}

function confirmApplyEventDatesToFolders() {
    if (confirm('This action will OVERWRITE all item Event Dates in this folder and all sub-folders and items. Do you wish to continue?')) {
        document.getElementById('btnApplyEDTSF').click();
    }
}

function confirmApplyCategoriesToItems() {
    if (confirm('This action will OVERWRITE all item Categories in this folder. Do you wish to continue?')) {
        document.getElementById('btnApplyCTSI').click();
    }
}

function confirmApplyCategoriesToFolders() {
    if (confirm('This action will OVERWRITE all Categories in this folder and in all sub-folders and items. Do you wish to continue?')) {
        document.getElementById('btnApplyCTSF').click();
    }

    function checkRadioBtnExportItem(id) {

        alert("hi");
        var gv = document.getElementById('<%=gv.ClientID %>');

        for (var i = 1; i < gv.rows.length; i++) {
            var radioBtn = gv.rows[i].cells[0].getElementsByTagName("input");

            // Check if the id not same
            if (radioBtn[0].id != id.id) {
                radioBtn[0].checked = false;
            }
        }
    }
}