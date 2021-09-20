<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewParaLinkAdd.aspx.cs" Inherits="Paradigm3.ViewParaLinkAdd" EnableEventValidation="false" Async="true" %>

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
                <div class="plink-treeview">
                    <asp:TreeView ID="plTree" runat="server"
                        EnableClientScript="false"
                        NodeIndent="15"
                        ExpandDepth="1" OnTreeNodePopulate="PlTree_TreeNodePopulate" OnSelectedNodeChanged="plTree_SelectedNodeChanged">
                        <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="12px" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
                <div></div>
                <div class="plink-listview">
                    <asp:GridView ID="gvItemList" runat="server" CssClass="gridView" Width="1000px"
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
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status">
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
            <div class="selected-title">
                Selected Items:
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
                                <asp:HiddenField ID="HFModuleID" runat="server" Value='<% #Eval("ModuleID") %>' />
                                <asp:HiddenField ID="HFOrigID" runat="server" Value='<% #Eval("OrigID") %>' />
                                <asp:Image ID="SelectedIcon" runat="server" Width="20px" Height="20px" ImageUrl='<% #Eval("ImageUrl") %>' />
                            </div>
                            <asp:Button ID="btnSelect" runat="server" Text='<% #Eval("Name") %>' CommandName="Select" CssClass="si-text" />
                        </div>
                    </ItemTemplate>
                    <SelectedItemTemplate>
                        <div class="selected-item" onmouseover="this.style.cursor='pointer'" onmouseout="this.style.cursor='cursor'">                  
                            <asp:Panel ID="pnlItemSelected" runat="server" CssClass="selected-item selected" onmouseover="this.style.cursor='pointer'" onmouseout="this.style.cursor='cursor'">                  
                                <div class="si-icon">
                                    <asp:HiddenField ID="HFModuleID" runat="server" Value='<% #Eval("ModuleID") %>' />
                                    <asp:HiddenField ID="HFOrigID" runat="server" Value='<% #Eval("OrigID") %>' />
                                    <asp:Image ID="SelectedIcon" runat="server" Width="20px" Height="20px" ImageUrl='<% #Eval("ImageUrl") %>' />
                                </div>
                                <div class="si-text">
                                    <asp:Label ID="SelectedName" runat="server" Text='<% #Eval("Name") %>'></asp:Label>                                
                                </div>
                            </asp:Panel>
                        </div>
                    </SelectedItemTemplate>
                </asp:ListView>
            </div>
            <div class="plink-control-buttons">
                <div>
                    <asp:Button ID="btnRemovePLink" runat="server" Text="Remove" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="removelink" />
                </div>
                <div>
                    <asp:Button ID="btnSavePLinks" runat="server" Text="OK" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="ok" />
                    &nbsp;
                    <asp:Button ID="btnCancelPLinks" runat="server" Text="Cancel" Width="70px" Font-Size="12px" OnClick="Button_Click" CommandArgument="Cancel" />
                </div>                
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
