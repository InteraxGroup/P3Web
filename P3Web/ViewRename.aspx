<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRename.aspx.cs" Inherits="Paradigm3.ViewRename" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Rename</title>
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
                <div class="label">
                     <label>Name:</label>
                </div>
                <div class="field">
                    <asp:TextBox ID="txtName" runat="server" Width="100%" Height="30px" style="font-size: 1.25em;" />
                </div>
                <asp:Panel ID="pnlLabel" runat="server" CssClass="label" Visible="false">
                    <label>Label:</label>
                </asp:Panel>
                <asp:Panel ID="pnlField" runat="server" CssClass="field" Visible="false">
                    <asp:TextBox ID="txtLabel" runat="server" Width="100%" Height="30px" style="font-size: 1.25em;" />
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
