<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocumentAddFromTemplate.aspx.cs" Inherits="Paradigm3.ViewDocumentAddFromTemplate" EnableEventValidation="false" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Add Item from Template</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
	<link href="styles/Document.css" rel="stylesheet" />
	<link href="styles/P3Web.css" rel="stylesheet" />
	<script src="scripts/P3Web.js"></script>
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="add-document">
            <div class="add-document-header">
                Select Template:
            </div>
            <div class="add-document-browse">
                <div class="add-document-treeview">
                    <asp:TreeView ID="addFromTree" runat="server"
                        EnableClientScript="false"
                        NodeIndent="15"
                        ExpandDepth="1" OnTreeNodePopulate="addFromTree_TreeNodePopulate" OnSelectedNodeChanged="addFromTree_SelectedNodeChanged">
                        <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="12px" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
                <div class="add-document-divider"></div>
                <div class="add-document-listview">
                    <asp:GridView ID="gvItemList" runat="server" CssClass="gridView" Width="1000px" DataKeyNames = "ItemID,OrigID,FileExtension,Name,Status,TypeOfPublish"
                        AutoGenerateColumns="False"
                        GridLines="None" 
                        AllowSorting="true"
                        OnRowDataBound="Gv_RowDataBound" 
                        OnSelectedIndexChanged="Gv_SelectedIndexChanged">
                        <HeaderStyle CssClass="gridViewHeader" />
                        <SortedAscendingHeaderStyle CssClass="sortasc" />
                        <SortedDescendingHeaderStyle CssClass="sortdesc" />
                        <RowStyle CssClass="gridViewRow" />
                        <AlternatingRowStyle CssClass="gridViewAltRow" />
                        <SelectedRowStyle CssClass="gridViewSelRow" />
                        <Columns>
                            <asp:TemplateField HeaderText="" HeaderStyle-Width="30px" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="left">
                                <ItemTemplate>
                                    <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                <HeaderStyle CssClass="gridViewHeader" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName">
                                <HeaderStyle CssClass="gridViewHeader" Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VersionStatus" HeaderText="Status" SortExpression="VersionStatus">
                                <HeaderStyle  CssClass="gridViewHeader"  Width="80px" />                     
                            </asp:BoundField>
                            <asp:BoundField DataField="VersionedBy" HeaderText="Converted By" SortExpression="VersionedBy">
                                <HeaderStyle CssClass="gridViewHeader"  Width="150px" />                        
                            </asp:BoundField>
                            <asp:BoundField DataField="VersionDate" HeaderText="Converted Date" SortExpression="VersionDate">
                                <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OrigID" HeaderText="OrigID" SortExpression="OrigID">
                                <HeaderStyle CssClass="gridViewHeader" Width="60px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="add-document-selected">
                <asp:TextBox ID="txtSelectedTemplate" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="add-document-buttons">
                <asp:Button ID="btnOK" runat="server" Text="OK" Width="70px" Enabled="false" OnClientClick="document.getElementById('txtName').focus();" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClientClick="window.close();" />
            </div>
        </div>
        <asp:Panel ID="pnlNameLabel" runat="server" CssClass="add-document-namelabel">
            <asp:Panel ID="dragger" runat="server" CssClass="titlebar">
                Please Enter the New Item Name & Label
            </asp:Panel>
            <div class="add-document-textfields">
                <div class="title">
                    Name:
                </div>
                <div class="field">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </div>                
            </div>
            <div class="add-document-textfields">
                <div class="title">
                    Label:
                </div>
                <div class="field">
                    <asp:TextBox ID="txtLabel" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="add-document-textbuttons">
                <asp:Button ID="btnAddFromTemplate" runat="server" Text="OK" Width="70px" OnClick="btnAddFromTemplate_Click" />
                &nbsp
                <asp:Button ID="btnCancelAdd" runat="server" Text="Cancel" Width="70px" />
            </div>            
        </asp:Panel>
		<ajax:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
            TargetControlID="btnOK" 
            PopupControlID="pnlNameLabel"
            CancelControlID="btnCancelAdd" 
            BackgroundCssClass="modalBackground" Y="100" PopupDragHandleControlID="dragger">

		</ajax:ModalPopupExtender>
    </form>
</body>
</html>
