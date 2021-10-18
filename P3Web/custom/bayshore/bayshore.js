function openDocument(ItemID, IsItemID, ItemStatus) {
    var docPath = "../../ViewDocument.aspx?ItemID=" + ItemID + "&IsItemID=" + IsItemID + '&ItemStatus=' + ItemStatus;
    var windowWidth = screen.width - 100;
    var windowHeight = screen.height - 120;
    var xPos = screen.width / 2 - windowWidth / 2;
    window.open(docPath, 'docWindow' + ItemID, 'height=' + windowHeight + ',width=' + windowWidth + ',top=0,left=' + xPos + ',location=0,status=0,menubar=0,toolbar=0,scrollbars=0,resizable=0');
}