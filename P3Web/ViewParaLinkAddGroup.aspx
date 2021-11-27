<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewParaLinkAddGroup.aspx.cs" Inherits="Paradigm3.ViewParaLinkAddGroup" EnableEventValidation="false" Async="true" meta:resourcekey="PageResource1" %>

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
		<asp:UpdatePanel ID="udpAddPLink" runat="server">
        <ContentTemplate>
        <div class="addParaLink">
            <div class="select-module">
                <asp:Label ID="SelectModuleLabel" runat="server" Text="Select Module:" meta:resourcekey="SelectModuleLabel"></asp:Label>
                &nbsp;
                <asp:DropDownList ID="DDLModule" runat="server" Width="200px" OnSelectedIndexChanged="DDLModule_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="DDLModuleResource1">
                </asp:DropDownList>
            </div>
            <div class="main-content">
                <div class="plink-treeview-folder">
                    <asp:TreeView ID="plTree" runat="server"
                        EnableClientScript="False"
                        NodeIndent="15"
                        ExpandDepth="1" OnTreeNodePopulate="plTree_TreeNodePopulate" OnSelectedNodeChanged="plTree_SelectedNodeChanged" meta:resourcekey="plTreeResource1">
                        <NodeStyle ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="12px" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
            </div>
            <div class="selected-plinks-folder">
                <div><asp:Label ID="FolderLabel" runat="server" Text="Folder:" meta:resourcekey="FolderLabel"></asp:Label></div>
                <div>
                    <asp:TextBox ID="txtPLinkedFolder" runat="server" Width="100%" meta:resourcekey="txtPLinkedFolderResource1"></asp:TextBox>
                </div>
            </div>
            <div class="plink-control-buttons">
                <div></div>
                <div>
                    <asp:Button ID="btnSavePLinks" runat="server" Text="OK" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="ok" meta:resourcekey="btnSavePLinksResource1" />
                    &nbsp;
                    <asp:Button ID="btnCancelPLinks" runat="server" Text="Cancel" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="cancel" meta:resourcekey="btnCancelPLinksResource1" />
                </div>
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
