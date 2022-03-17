<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCopy.aspx.cs" Inherits="Paradigm3.ViewCopy"  Async="true" meta:resourcekey="PageResource1"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="hdrtitle" runat="server"/>
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
                <asp:Label ID="lblTitle" runat="server"/>
            </div>           
           <div style="display: flex; flex-direction: row; height: 30px; align-items: center;">                
                <div style="padding-left: 5px; flex: 1 1 auto;" >    
                    <asp:label class="formLabel" id="lblCopyName" runat="server"/>
                    <asp:TextBox ID="txt_CopyName" style="font-weight:bold; width: 340px;" runat="server" ReadOnly="true" Enabled="false"/>
                </div>
                <div id="dv_copyFrom" runat="server" style="flex: 0 0 150px;">
                    <asp:label class="formLabel" ID="lblCopyfrm" runat="server"/>
                    <asp:DropDownList runat="server" ID="ddl_CopyVersion" CssClass="form-control"></asp:DropDownList>                    
                </div>
                <div id="dv_copyAs" runat="server" style="flex: 0 0 150px;">
                    <asp:label  class="formLabel" ID="lblCopyAs" runat="server"/>
                    <asp:DropDownList runat="server" ID="ddl_CopyType" CssClass="form-control">                
                    </asp:DropDownList>
                </div>
            </div>
            <div style="flex: 1 1 auto; width: 100%; border: 1px solid #dcdcdc; background-color: #fff; overflow: auto; padding: 5px 0; box-sizing: border-box;">
                <asp:TreeView ID="p3Tree" runat="server"
                    EnableClientScript="false"
                    NodeIndent="15"
                    ExpandDepth="1"
                    OnTreeNodePopulate="P3Tree_TreeNodePopulate"
                    OnSelectedNodeChanged="P3Tree_SelectedNodeChanged">
                    <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                    <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                </asp:TreeView>
            </div>
            <div style="flex: 0 0 50px; width: 100%; box-sizing: border-box; display: flex; align-items: flex-end;">
                <asp:TextBox ID="txtFolderName" runat="server" ReadOnly="true" Width="99%" Height="30px" />
            </div>           
            <div class="modify-buttons">
                <div class="chkBox"><asp:CheckBox ID="chkProperties" runat="server" TextAlign="Right" /></div>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" meta:Resourcekey="btnSubmit" />
                &nbsp;
                <asp:Button ID="btnClose" runat="server" Text="Close" OnClientClick="javascript:window.close();" meta:resourcekey="btnClose" />
            </div>
        </div>
        <asp:Panel ID="pnlConfirm" runat="server" CssClass="modify-modal-body">
                <div class="modify-modal-message">
                    <asp:Label ID="lblMessage" runat="server" meta:resourcekey="lblMessageResource1"></asp:Label>
                </div>
                <div class="modify-modal-buttons">
                    <asp:Button ID="btnYes" runat="server" Text="Yes" Width="70px" OnClick="btnSubmit_Click" meta:resourcekey="btnYesResource1" />
                    &nbsp;
                    <asp:Button ID="btnNo" runat="server" Text="No" Width="70px" OnClientClick="javascript:document.getElementById('msg').style.display = 'none';" meta:resourcekey="btnNoResource1" />
                </div>
            </asp:Panel>

        <ajax:ModalPopupExtender ID="mpeCofirm" runat="server" TargetControlID="btnSubmit" CancelControlID="btnNo" PopupControlID="pnlConfirm">

        </ajax:ModalPopupExtender>
        <%--<div id="msg" class="modify-modal-background">
            <div class="modify-modal-body">
                <div class="modify-modal-message">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
                <div class="modify-modal-buttons">
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Yes" Width="70px" />
                    &nbsp;
                    <button id="btnNo" runat="server" style="width: 70px;" onclick="javascript:document.getElementById('msg').style.display='none';">No</button>
                </div>
            </div>--%>
        </div>
    </form>
</body>
</html>
