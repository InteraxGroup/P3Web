<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocEdit.aspx.cs" Inherits="Paradigm3.ViewDocEdit" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm3 -- Edit Document</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/Document.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
	<script src="scripts/P3Web.js"></script>
</head>
<body class="documentBody" style="position: relative;">
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="titlePanel">
            <asp:Label ID="lblDocStatus" runat="server" />     
        </div>
        <div id="contentPanel">
            <div class="fileNamePanel">
                <asp:Label ID="lblTitle" runat="server" />
            </div>
            <div class="detailsPanel">
                <asp:Label ID="lblConfirmCheckIn" runat="server" />
            </div>
            <asp:Panel ID="pnlCheckIn" runat="server" Visible="false">
                <div style="padding-top: 20px;">
                    <asp:Panel ID="pnlBrowse" runat="server">
                        <input type="file" id="CheckInUploader" runat="server" />
                    </asp:Panel>
                    <div style="padding-top: 20px;">
                    <asp:Button ID="btnCheckIn" runat="server" Text="Check In" Width="80px" Enabled="false" />                    
                    <br /><br />
                    <asp:Label ID="lblCheckIn" runat="server" ForeColor="#990000" Font-Size="X-Large" />
                    </div>                    
                </div>
            </asp:Panel>            
        </div>        
        <div id="footerPanel">
            <asp:Button ID="btnCancelCheckOut" runat="server" Text ="Cancel Checkout" Width="120px" OnClick="btnCancelCheckOut_Click" Visible="false" />
            &nbsp;
            <asp:Button ID="btnClose" runat="server" Text="Close" Width="80px" OnClick="btnClose_Click" />
        </div>
        <asp:HiddenField ID="ConfirmValue" runat="server" />
        <asp:Panel ID="pnlConfirm" runat="server" style="display: flex; flex-direction: column; width: 500px; height: 200px; border: 1px solid black; border-radius: 5px; background-color: #f0f0f0;">
            <div style="flex: 0 0 20px; display: flex; align-items: center; padding-left: 5px; box-sizing: border-box; background-color: red; color: white; font-size: 1.5em; border-top-left-radius: 5px; border-top-right-radius: 5px;">
                Alert
            </div>
            <div style="flex: 1 1 auto;">
                <p style="text-align: center; box-sizing: border-box; font-size: 1.25em; padding: 0 5px;">
                    The name of the selected file does not match the name of the checked-out file.
                    The checked in file will <b>OVERWRITE</b> the draft file that is currently on the server.
                </p>
                <h3 style="text-align: center; font-size: 1.5em;">Continue?</h3>
            </div>
            <div style="flex: 0 0 30px; display: flex; align-items: center; justify-content: center;">
                <asp:Button ID="btnYes" runat="server" Text="Yes" />
                &nbsp;
                <asp:Button ID="btnNo" runat="server" Text="No" />
            </div>
        </asp:Panel>
        <asp:Button ID="btnShowConfirm" runat="server" style="display: none;" />
		<ajax:ModalPopupExtender ID="mpeConfirm" runat="server" PopupControlID="pnlConfirm" TargetControlID="btnShowConfirm" BackgroundCssClass="modalBackground" CancelControlID="btnNo" >
		</ajax:ModalPopupExtender>
    </form>
</body>
</html>
