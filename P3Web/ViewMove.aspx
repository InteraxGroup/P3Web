<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewMove.aspx.cs" Inherits="Paradigm3.ViewMove" Async="true" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Move</title>
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
                <asp:Label ID="lblTitle" runat="server" meta:resourcekey="lblTitleResource1"/>
            </div>
            <div class="modify-content">
                <div style="flex: 0 0 30px; width: 100%; font-size: .75em;">
                    <span><%=GetLocalResourceObject("lblSpanMove")%></span>
                </div>
                <div style="flex: 1 1 auto; width: 100%; border: 1px solid #dcdcdc; background-color: #fff; overflow: auto; padding: 5px 0; box-sizing: border-box;">
                    <asp:TreeView ID="p3Tree" runat="server"
                        EnableClientScript="False"
                        NodeIndent="15"
                        ExpandDepth="1"
                        OnTreeNodePopulate="P3Tree_TreeNodePopulate"
                        OnSelectedNodeChanged="P3Tree_SelectedNodeChanged" meta:resourcekey="p3TreeResource1">
                        <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
                <div style="flex: 0 0 50px; width: 100%; box-sizing: border-box; display: flex; align-items: flex-end;">
                    <asp:TextBox ID="txtFolderName" runat="server" ReadOnly="True" Width="99%" Height="30px" meta:resourcekey="txtFolderNameResource1" />
                </div>
            </div>
            <div class="modify-buttons">
                <div class="chkBox"><asp:CheckBox ID="chkProperties" runat="server" Text="Retain Properties settings of moved item(s)" meta:resourcekey="chkPropertiesResource1" /></div>
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
