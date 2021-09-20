<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDelete.aspx.cs" Inherits="Paradigm3.ViewDelete" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Delete</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
	<link href="styles/Modify.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="modify-body">
            <div class="modify-title">
                <asp:Label ID="lblTitle" runat="server" />
            </div>
            <div class="modify-content">
                <asp:Panel ID="pnlDeleteItem" runat="server" Visible="false" style="overflow-y: auto; overflow-x: hidden; border: 1px solid #dcdcdc; width: 100%; height: 100%; padding: 10px 20px; box-sizing: border-box;">
                    <asp:CheckBoxList ID="cblVersion" runat="server" Visible="false">
                    </asp:CheckBoxList>
                    <asp:Label ID="lblUserDetail" runat="server" Visible="false"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="pnlDeleteFolder" runat="server" Visible="false" style="overflow: auto; width: 100%; height: 100%; padding: 10px 20px; box-sizing: border-box;">
                    Folder to be deleted:
                    <br /><br />
                    <asp:Label ID="lblFolderName" runat="server" Font-Bold="true" Font-Size="X-Large" />
                </asp:Panel>
            </div>
            <div class="modify-buttons">
                <button type="button" onclick="javascript:document.getElementById('msg').style.display='block';">Submit</button>
                &nbsp;
                <button type="button" onclick="javascript:window.close();">Close</button>
            </div>
        </div>
        <div id="msg" class="modify-modal-background">
            <div class="modify-modal-body">
                <div class="modify-modal-message">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
                <div class="modify-modal-buttons">
                    <asp:Button ID="btnSubmit" runat="server" Text="Yes" Width="70px" OnClick="btnSubmit_Click" />
                    &nbsp;
                    <button type="button" style="width: 70px;" onclick="javascript:document.getElementById('msg').style.display = 'none';">No</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
