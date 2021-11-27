<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDelete.aspx.cs" Inherits="Paradigm3.ViewDelete" Async="true" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> <%=GetLocalResourceObject("PageResource1.Title") %>   </title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
	<link href="styles/Modify.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
    <script type="text/javascript"> 
        function SetButtonText() {
            document.getElementById('frmbtnSubmit').innerHTML = <%=GetLocalResourceObject("btnTitleSubmit") %>;
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="modify-body">
            <div class="modify-title">
                <asp:Label ID="lblTitle" runat="server" meta:resourcekey="lblTitleResource1" />
            </div>
            <div class="modify-content">
                <asp:Panel ID="pnlDeleteItem" runat="server" Visible="False" style="overflow-y: auto; overflow-x: hidden; border: 1px solid #dcdcdc; width: 100%; height: 100%; padding: 10px 20px; box-sizing: border-box;" meta:resourcekey="pnlDeleteItemResource1">
                    <asp:CheckBoxList ID="cblVersion" runat="server" Visible="False" meta:resourcekey="cblVersionResource1">
                    </asp:CheckBoxList>
                    <asp:Label ID="lblUserDetail" runat="server" Visible="False" meta:resourcekey="lblUserDetailResource1"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="pnlDeleteFolder" runat="server" Visible="False" style="overflow: auto; width: 100%; height: 100%; padding: 10px 20px; box-sizing: border-box;" meta:resourcekey="pnlDeleteFolderResource1">
                   <%=GetLocalResourceObject("lblPnlText") %>
                    <br /><br />
                    <asp:Label ID="lblFolderName" runat="server" Font-Bold="True" Font-Size="X-Large" meta:resourcekey="lblFolderNameResource1" />
                </asp:Panel>
            </div>
            <div class="modify-buttons">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" meta:resourcekey="btnSubmitResource1" />
                &nbsp;
                <asp:Button ID="btnClose" runat="server" Text="Close" OnClientClick="javascript:window.close();" meta:resourcekey="btnCloseResource1" />
            </div>
        </div>
        <asp:Panel ID="pnlConfirm" runat="server" CssClass="modify-modal-body">
                <div class="modify-modal-message">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
                <div class="modify-modal-buttons">
                    <asp:Button ID="btnYes" runat="server" Text="Yes" Width="70px" OnClick="btnSubmit_Click" meta:resourcekey="btnYesResource1" />
                    &nbsp;
                    <asp:Button ID="btnNo" runat="server" Text="No" Width="70px" OnClientClick="javascript:document.getElementById('msg').style.display = 'none';" meta:resourcekey="btnNoResource1"></asp:Button>
                </div>
            </asp:Panel>

        <ajax:ModalPopupExtender ID="mpeCofirm" runat="server" TargetControlID="btnSubmit" CancelControlID="btnNo" PopupControlID="pnlConfirm">

        </ajax:ModalPopupExtender>
    </form>
</body>
</html>
