<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewParaLinkAdd.aspx.cs" Inherits="Paradigm3.ViewParaLinkAdd" EnableEventValidation="false" Async="true" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Add Item Para-Link</title>
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
                <div class="plink-treeview">
                    <asp:TreeView ID="plTree" runat="server"
                        EnableClientScript="False"
                        NodeIndent="15"
                        ExpandDepth="1" OnTreeNodePopulate="PlTree_TreeNodePopulate" OnSelectedNodeChanged="plTree_SelectedNodeChanged" meta:resourcekey="plTreeResource1">
                        <NodeStyle ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="12px" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
                <div></div>
                <div class="plink-listview">
                    <asp:GridView ID="gvItemList" runat="server" CssClass="gridView" Width="1000px"
                        AutoGenerateColumns="False"
                        GridLines="None" 
                        AllowSorting="True"
                        OnRowDataBound="Gv_RowDataBound" 
                        OnSelectedIndexChanged="Gv_SelectedIndexChanged" meta:resourcekey="gvItemListResource1">
                        <HeaderStyle CssClass="gridViewHeader" />
                        <SortedAscendingHeaderStyle CssClass="sortasc" />
                        <SortedDescendingHeaderStyle CssClass="sortdesc" />
                        <RowStyle CssClass="gridViewRow" />
                        <AlternatingRowStyle CssClass="gridViewAltRow" />
                        <SelectedRowStyle CssClass="gridViewSelRow" />
                        <Columns>
                            <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" meta:resourcekey="ItemIconResource1" />
                                </ItemTemplate>
                                <HeaderStyle Width="30px" />
                                <ItemStyle HorizontalAlign="Left" Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource1">
                                <HeaderStyle CssClass="gridViewHeader" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName" meta:resourcekey="BoundFieldResource2">
                                <HeaderStyle CssClass="gridViewHeader" Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VersionStatus" HeaderText="Status" SortExpression="VersionStatus" meta:resourcekey="BoundFieldResource3">
                                <HeaderStyle  CssClass="gridViewHeader"  Width="80px" />                     
                            </asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" meta:resourcekey="BoundFieldResource4">
                                <HeaderStyle  CssClass="gridViewHeader"  Width="80px" />                     
                            </asp:BoundField>
                            <asp:BoundField DataField="VersionedBy" HeaderText="Converted By" SortExpression="VersionedBy" meta:resourcekey="BoundFieldResource5">
                                <HeaderStyle CssClass="gridViewHeader"  Width="150px" />                        
                            </asp:BoundField>
                            <asp:BoundField DataField="VersionDate" HeaderText="Converted Date" SortExpression="VersionDate" meta:resourcekey="BoundFieldResource6">
                                <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OrigID" HeaderText="OrigID" SortExpression="OrigID" meta:resourcekey="BoundFieldResource7">
                                <HeaderStyle CssClass="gridViewHeader" Width="60px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>                    
                </div>
            </div>
            <div class="selected-title">
                <asp:Label ID="SelectedItemsLabel" runat="server" Text="Selected Items:" meta:resourcekey="SelectedItemsLabel"></asp:Label>
            </div>
            <div class="selected-plinks">
                <asp:ListView ID="LVSelected" runat="server" 
                    AutoPostback="true" 
                    DataKeyNames="ModuleID,OrigID,Name,ImageUrl" 
                    OnSelectedIndexChanging="LVSelected_SelectedIndexChanging" 
                    OnSelectedIndexChanged="LVSelected_SelectedIndexChanged">
                    <ItemTemplate>
                        <div class="selected-item" onmouseover="this.style.cursor='pointer'" onmouseout="this.style.cursor='cursor'">                  
                            <div class="si-icon">
                                <asp:HiddenField ID="HFModuleID" runat="server" Value='<%# Eval("ModuleID") %>' />
                                <asp:HiddenField ID="HFOrigID" runat="server" Value='<%# Eval("OrigID") %>' />
                                <asp:Image ID="SelectedIcon" runat="server" Width="20px" Height="20px" ImageUrl='<%# Eval("ImageUrl") %>' meta:resourcekey="SelectedIconResource1" />
                            </div>
                            <asp:Button ID="btnSelect" runat="server" Text='<%# Eval("Name") %>' CommandName="Select" CssClass="si-text" meta:resourcekey="btnSelectResource1" />
                        </div>
                    </ItemTemplate>
                    <SelectedItemTemplate>
                        <div class="selected-item" onmouseover="this.style.cursor='pointer'" onmouseout="this.style.cursor='cursor'">                  
                            <asp:Panel ID="pnlItemSelected" runat="server" CssClass="selected-item selected" onmouseover="this.style.cursor='pointer'" onmouseout="this.style.cursor='cursor'" meta:resourcekey="pnlItemSelectedResource1">                  
                                <div class="si-icon">
                                    <asp:HiddenField ID="HFModuleID" runat="server" Value='<%# Eval("ModuleID") %>' />
                                    <asp:HiddenField ID="HFOrigID" runat="server" Value='<%# Eval("OrigID") %>' />
                                    <asp:Image ID="SelectedIcon" runat="server" Width="20px" Height="20px" ImageUrl='<%# Eval("ImageUrl") %>' meta:resourcekey="SelectedIconResource2" />
                                </div>
                                <div class="si-text">
                                    <asp:Label ID="SelectedName" runat="server" Text='<%# Eval("Name") %>' meta:resourcekey="SelectedNameResource1"></asp:Label>                                
                                </div>
                            </asp:Panel>
                        </div>
                    </SelectedItemTemplate>
                </asp:ListView>
            </div>
            <div class="plink-control-buttons">
                <div>
                    <asp:Button ID="btnRemovePLink" runat="server" Text="Remove" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="removelink" meta:resourcekey="btnRemovePLinkResource1" />
                </div>
                <div>
                    <asp:Button ID="btnSavePLinks" runat="server" Text="OK" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="ok" meta:resourcekey="btnSavePLinksResource1" />
                    &nbsp;
                    <asp:Button ID="btnCancelPLinks" runat="server" Text="Cancel" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="Cancel" meta:resourcekey="btnCancelPLinksResource1" />
                </div>                
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
