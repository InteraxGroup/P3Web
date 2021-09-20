<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewParaLinkAddGroup.aspx.cs" Inherits="Paradigm3.ViewParaLinkAddGroup" EnableEventValidation="false" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Para-Link -- Add Folder Para-Link</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
	<link href="styles/paraLink.css" rel="stylesheet" />
	<link href="styles/P3Web.css" rel="stylesheet" />
	<script src="scripts/P3Web.js"></script>
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<asp:UpdatePanel ID="udpAddPLink" runat="server" ChildrenAsTriggers="true">
        <ContentTemplate>
        <div class="addParaLink">
            <div class="select-module">
                Select Module:
                &nbsp;
                <asp:DropDownList ID="DDLModule" runat="server" Width="200px" OnSelectedIndexChanged="DDLModule_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <div class="main-content">
                <div class="plink-treeview-folder">
                    <asp:TreeView ID="plTree" runat="server"
                        EnableClientScript="false"
                        NodeIndent="15"
                        ExpandDepth="1" OnTreeNodePopulate="plTree_TreeNodePopulate" OnSelectedNodeChanged="plTree_SelectedNodeChanged">
                        <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="12px" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
            </div>
            <div class="selected-plinks-folder">
                <div>Folder:</div>
                <div>
                    <asp:TextBox ID="txtPLinkedFolder" runat="server" Width="100%"></asp:TextBox>
                </div>
            </div>
            <div class="plink-control-buttons">
                <div></div>
                <div>
                    <asp:Button ID="btnSavePLinks" runat="server" Text="OK" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="ok" />
                    &nbsp;
                    <asp:Button ID="btnCancelPLinks" runat="server" Text="Cancel" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="cancel" />
                </div>
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
