<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewGroup.aspx.cs" Inherits="Paradigm3.NewGroup1" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Add New Folder</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
	<link href="styles/Document.css" rel="stylesheet" />
	<link href="styles/Pages.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="folder-add" style="overflow: hidden;">
            <div class="folder-add-title">
                Add New Folder
            </div>
            <div class="folder-add-name">
                <div>
                    Folder Name:
                </div>
                <div>
                    <asp:TextBox ID="txtFolderName" runat="server" style="height: 20px; width: 100%;"></asp:TextBox>
                </div>                
            </div>
            <div class="folder-add-buttons" style="border-top: 1px solid #dcdcdc;">
                <asp:Button ID="btnOK" runat="server" Text="OK" Width="70px" OnClick="btnOK_Click" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClientClick="window.close()" />
            </div>
        </div>
        <div id="statusMessagePanel">
            <div id="statusMessage">
                <asp:Label ID="lblStatusMessage" runat="server"></asp:Label>
                <button id="closeRefreshDoc" onclick="hideStatusMessage();" style="width: 70px; margin: 20px auto 0 auto;">OK</button>
                <button id="closeRefreshRecord" onclick="hideStatusMessage();" style="width: 70px; margin: 20px auto 0 auto;">OK</button>
            </div>
        </div>
    </form>
</body>
</html>
