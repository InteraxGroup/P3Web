function addBiotiumRecord(ModuleID, ItemID, ObjTypeID, ParentGroupID) {
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