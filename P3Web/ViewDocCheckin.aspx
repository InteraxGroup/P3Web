<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocCheckin.aspx.cs" Inherits="Paradigm3.ViewDocCheckin" Async="true" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Check In</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/Document.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
	<script src="scripts/P3Web.js"></script>
    <script>
		function testUpload() {
			document.getElementById("<%=btnConfirmedCheckin.ClientID %>").click();
		}
	</script>
</head>
<body class="documentBody" style="position: relative;">
    <form id="form1" runat="server" enctype="multipart/form-data">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="checkin-container">
            <div class="checkin-title">
                <asp:Label ID="lblDocStatus" runat="server" meta:resourcekey="lblDocStatusResource1" />                
            </div>
            <div class="checkin-body">
                <div class="checkin-document-title">
                    <asp:Label ID="lblTitle" runat="server" Text="Document Title and Status" meta:resourcekey="lblTitleResource1" />
                </div>
                <div class="checkin-document-message">
                    <asp:Label ID="lblCheckoutStatus" runat="server" meta:resourcekey="lblCheckoutStatusResource1" />
                </div>
                <asp:Panel ID="pnlUpload" runat="server" CssClass="checkin-document-form" meta:resourcekey="pnlUploadResource1">
                    <div>
                        <%--<input id="uploader" runat="server" type="file" style="width: 99%;" />--%>
                        <asp:FileUpload ID="uploader" runat="server" style="width: 99%;" AllowMultiple="false" />
                    &nbsp;</div>
                    <div style="padding-top: 20px">
                        <asp:Button ID="btnCommit" runat="server" Text="Check In" Width="80px" OnClick="btnCommit_Click" CausesValidation="False" meta:resourcekey="btnCommitResource1" />
                        <br />
                        <span id="test"></span>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlCheckIn" runat="server" Visible="False" CssClass="checkin-document-form" meta:resourcekey="pnlCheckInResource1">
                    <asp:Button ID="btnCheckIn" runat="server" Text="Check In" Width="80px" OnClick="btnCheckIn_Click" meta:resourcekey="btnCheckInResource1" />
                </asp:Panel>
            </div>
            <div class="checkin-footer">
                <asp:Button ID="btnCancelCheckOut" runat="server" Text ="Cancel Checkout" OnClick="btnCancelCheckOut_Click" meta:resourcekey="btnCancelCheckOutResource1" />
                &nbsp;&nbsp;
                <asp:Button ID="btnClose" runat="server" Text="Close" Width="80px" OnClientClick="window.close();" meta:resourcekey="btnCloseResource1" />
            </div>
        </div>
        <asp:Button ID="btnConfirmedCheckin" runat="server" OnClick="btnConfirmedCheckin_Click" meta:resourcekey="btnConfirmedCheckinResource1" />
        <a id="dummyclick" href="#" runat="server"></a>
        <asp:ModalPopupExtender ID="mpeConfirmName" runat="server" 
            TargetControlID="dummyclick" 
            PopupControlID="pnlConfirmName" 
            BackgroundCssClass="modalBackground" BehaviorID="mpeConfirmName" DynamicServicePath="">
        </asp:ModalPopupExtender>
        <asp:Panel ID="pnlConfirmName" runat="server" CssClass="uploader-name-confirm" meta:resourcekey="pnlConfirmNameResource1">
            <asp:Panel ID="pnlConfirmtitle" runat="server" meta:resourcekey="pnlConfirmtitleResource1">
                Name Confirmation
                <asp:ImageButton ID="imgCloseConfirm" runat="server" Width="20px" ImageUrl="~/images/squareclose.png" ImageAlign="Right" meta:resourcekey="imgCloseConfirmResource1" />
            </asp:Panel>
            <div>The name of the selected file does not match the checked-out file</div>
            <div>Do you want to continue?</div>
            <div>
                <asp:Button ID="btnConfirmNameCheck" runat="server" Text="Yes" Width="70px" OnClientClick="testCheckIn(this.event)" meta:resourcekey="btnConfirmNameCheckResource1" />
                &nbsp;
                <asp:Button ID="btnCancelConfirm" runat="server" Text="No" Width="70px" meta:resourcekey="btnCancelConfirmResource1" />
            </div>
        </asp:Panel>
    </form>
</body>
</html>
