<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRename.aspx.cs" Inherits="Paradigm3.ViewRename" Async="true" meta:resourcekey="PageResource1" %>

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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="modify-body">
            <div class="modify-title">
                <asp:Label ID="lblTitle" runat="server" meta:resourcekey="lblTitleResource1" />
            </div>
            <div class="modify-content">
                <div class="label">
                     <label><asp:Label ID="NameLabel" runat="server" Text="Name:" meta:resourcekey="NameLabel"></asp:Label></label>
                </div>
                <div class="field">
                    <asp:TextBox ID="txtName" runat="server" Width="100%" Height="30px" style="font-size: 1.25em;" meta:resourcekey="txtNameResource1" />
                </div>
                <asp:Panel ID="pnlLabel" runat="server" CssClass="label" Visible="False" meta:resourcekey="pnlLabelResource1">
                    <label><asp:Label ID="LabelLabel" runat="server" Text="Label:" meta:resourcekey="LabelLabel"></asp:Label></label>
                </asp:Panel>
                <asp:Panel ID="pnlField" runat="server" CssClass="field" Visible="False" meta:resourcekey="pnlFieldResource1">
                    <asp:TextBox ID="txtLabel" runat="server" Width="100%" Height="30px" style="font-size: 1.25em;" meta:resourcekey="txtLabelResource1" />
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
                    <asp:Label ID="lblMessage" runat="server" meta:resourcekey="lblMessageResource1"></asp:Label>
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
