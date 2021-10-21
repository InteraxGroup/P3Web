<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Paradigm3.Default" EnableEventValidation="false" Async="true" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Paradigm 3</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Modals.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="scripts/P3Web.js"></script>
</head>
<%--<body onload="getCountry()">--%>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="false"></asp:ScriptManager>        
        <input type="hidden" id="scrollPos" runat="server" />
        <div id="main">
            <asp:UpdatePanel ID="udpToolbar" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <Triggers>
                    <asp:ASyncPostBackTrigger ControlID="btnSubmitLogon" EventName="Click" />
                    <asp:ASyncPostBackTrigger ControlID="btnCancelLogon" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="gvItemList" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="gvRecordList" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="gvAIList" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="gvUsersList" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="p3Tree" EventName="SelectedNodeChanged" />
                    <asp:AsyncPostBackTrigger ControlID="Menu1" EventName="MenuItemClick" />
                    <asp:AsyncPostBackTrigger ControlID="mnuModules" EventName="MenuItemClick" />
                    <asp:AsyncPostBackTrigger ControlID="btnChangePW" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnRefeshEdit" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="mnuTVContext" EventName="MenuItemClick" />
                    <asp:PostBackTrigger ControlID="btnAdmin" />
                </Triggers>
            <ContentTemplate>                
                <div id="toolBar">
                    <iframe id="fileCheckout" style="display:none;"></iframe>
                    <asp:ImageButton ID="btnLogon" runat="server" CssClass="logonButton" OnClick="ImageButton_Click" CommandArgument="gotoLogon" CommandName="goToLogon" />
                    <asp:ImageButton ID="btnLogout" runat="server" CssClass="logonButton" OnClick="ImageButton_Click" CommandArgument="doLogout" CommandName="doLogout" />
                    <asp:Label ID="lblLogon" runat="server" CssClass="logonLabel" Font-Bold="true" />
                    <div style="display: block; position: relative;">
						<asp:Panel ID="pnlGuide" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;">
							<asp:ImageButton ID="btnGuide" runat="server" ImageUrl="~/images/help.png" OnClientClick="javascript:window.open('guide/guide.pdf'); return false;" />
                            <br />
                            <asp:Label ID="lblGuide" runat="server" Text="User Guide" />
						</asp:Panel>
                        <asp:Panel ID="pnlAdd" runat="server" CssClass="toolbarButton" Visible="false">
                            <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/images/add.png" OnClick="ImageButton_Click" CommandArgument="AddItem" />
                            <br />
                            <asp:Label ID="lblAdd" runat="server" Text="Add New" Font-Size="8pt" Font-Names="Arial" />
                            <asp:Panel id="pnlAddDropDown" runat="server" CssClass="dropdown-content" style="max-width: 200px;" Visible="false">
                                <asp:Menu ID="mnuAddDoc" runat="server" OnMenuItemClick="mnuAddDoc_MenuItemClick" Visible="true">
                                    <Items>
                                    </Items>
                                </asp:Menu>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel ID="pnlEdit" runat="server" CssClass="toolbarButton" Visible="false" style="border-right: 1px solid #999999;">
                            <asp:ImageButton ID="btnEdit" runat="server" OnClick="ImageButton_Click" CommandArgument="EditItem" />
                            <br />
                            <asp:Label ID="lblEdit" runat="server" Text="Edit" Font-Size="8pt" Font-Names="Arial" />
                        </asp:Panel>
                        <asp:Panel ID="pnlView" runat="server" CssClass="toolbarButton" Visible="false">
                            <asp:ImageButton ID="btnView" runat="server" ImageUrl="~/images/view.png" OnClick="ImageButton_Click" CommandArgument="ViewItem" />
                            <br />
                            <asp:Label ID="lblView" runat="server" Text="View" Font-Size="8pt" Font-Names="Arial" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRename" runat="server" CssClass="toolbarButton" Visible="false">
                            <asp:ImageButton ID="btnRename" runat="server" ImageUrl="~/images/rename.png" OnClick="ImageButton_Click" CommandArgument="Rename" />
                            <br />
                            <asp:Label ID="lblRename" runat="server" Text="Rename" Font-Size="8pt" Font-Names="Arial" />
                            <asp:Panel id="RenameDropdown" runat="server" CssClass="dropdown-content" Width="100px" Visible="false">
                                <asp:Menu ID="mnuRename" runat="server" OnMenuItemClick="mnuRename_MenuItemClick">
                                    <Items>
                                        <asp:MenuItem Value="0" Text="Rename Item"></asp:MenuItem>
                                        <asp:MenuItem Value="1" Text="Rename Folder"></asp:MenuItem>
                                    </Items>
                                </asp:Menu>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel ID="pnlMove" runat="server" CssClass="toolbarButton" Visible="false">
                            <asp:ImageButton ID="btnMove" runat="server" ImageUrl="~/images/move.png" OnClick="ImageButton_Click" CommandArgument="Move" />
                            <br />
                            <asp:Label ID="lblMove" runat="server" Text="Move123" Font-Size="8pt" Font-Names="Arial" />
                            <asp:Panel id="MoveDropdown" runat="server" CssClass="dropdown-content" Width="100px" Visible="false">
                                <asp:Menu ID="mnuMove" runat="server" OnMenuItemClick="mnuMove_MenuItemClick">
                                    <Items>
                                        <asp:MenuItem Value="0" Text="Move Item"></asp:MenuItem>
                                        <asp:MenuItem Value="1" Text="Move Folder"></asp:MenuItem>
                                    </Items>
                                </asp:Menu>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel ID="pnlDelete" runat="server" CssClass="toolbarButton" Visible="false">
                            <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/images/delete.png" OnClick="ImageButton_Click" CommandArgument="Delete" />
                            <br />
                            <asp:Label ID="lblDelete" runat="server" Text="Delete" Font-Size="8pt" Font-Names="Arial" />
                            <asp:Panel id="DeleteDropdown" runat="server" CssClass="dropdown-content" Width="100px" Visible="false">
                                <asp:Menu ID="mnuDelete" runat="server" OnMenuItemClick="mnuDelete_MenuItemClick">
                                    <Items>
                                        <asp:MenuItem Value="0" Text="Delete Item"></asp:MenuItem>
                                        <asp:MenuItem Value="1" Text="Delete Folder"></asp:MenuItem>
                                    </Items>
                                </asp:Menu>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel ID="pnlProperties" runat="server" CssClass="toolbarButton" Visible="false">
                            <asp:ImageButton ID="btnProperties" runat="server" ImageUrl="~/images/properties.png" OnClick="ImageButton_Click" CommandArgument="Properties" />
                            <br />
                            <asp:Label ID="lblProperties" runat="server" Text="Properties" Font-Size="8pt" Font-Names="Arial" />
                        </asp:Panel>
                        <asp:Panel ID="pnlStatus" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="false">
                            <asp:ImageButton ID="btnStatus" runat="server" ImageUrl="~/images/status.png" OnClick="ImageButton_Click" CommandArgument="Status" />
                            <br />
                            <asp:Label ID="lblStatus" runat="server" Text="Status" Font-Size="8pt" Font-Names="Arial" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRelatedAI" runat="server" CssClass="toolbarButton" Visible="false">
                            <asp:ImageButton ID="btnRelatedAI" runat="server" ImageUrl="~/images/actionitem.png" OnClick="ImageButton_Click" CommandArgument="RelatedAI" />
                            <br />
                            <asp:Label ID="lblRelatedAI" runat="server" Text="Related AI" Font-Size="8pt" Font-Names="Arial" />
                        </asp:Panel>
                        <asp:Panel ID="pnlOtherUserAI" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="false">
                            <asp:ImageButton ID="btnOtherUserAI" runat="server" ImageUrl="~/images/actionitem_otheruser.png" OnClick="ImageButton_Click" CommandArgument="OtherUserAI" />
                            <br />
                            <asp:Label ID="lblOtherUserAI" runat="server" Text="Other User" Font-Size="8pt" Font-Names="Arial" />
                        </asp:Panel>
                        <asp:Panel ID="pnlParaLink" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="false">
                            <asp:ImageButton ID="btnParaLink" runat="server" ImageUrl="~/images/paralink.png" OnClick="ImageButton_Click" CommandArgument="ParaLink" />
                            <br />
                            <asp:Label ID="lblParaLink" runat="server" Text="Para-Link" Font-Size="8pt" Font-Names="Arial" />
                        </asp:Panel>
                        <asp:Panel ID="pnlReport" runat="server" CssClass="toolbarButton" Visible="false">
                            <asp:ImageButton ID="btnReport" runat="server" ImageUrl="~/images/report.png" OnClick="ImageButton_Click" CommandArgument="Report" />
                            <br />
                            <asp:Label ID="lblReport" runat="server" Text="Reports" />
                            <asp:Panel id="rptDropDown" runat="server" CssClass="dropdown-content" Visible="false">
                                <asp:Menu ID="mnuReports" runat="server" OnMenuItemClick="mnuReports_MenuItemClick">
                                </asp:Menu>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel ID="pnlAdministration" runat="server" CssClass="toolbarButton" Visible="false" style="border-right: 1px solid #999;">
                            <asp:ImageButton ID="btnAdministration" runat="server" OnClick="btnAdministration_Click" Width="32" ImageUrl="~/images/administration.png" />
                            <br />
                            <asp:Label ID="lblAdministration" runat="server" Text="Admin" />
                        </asp:Panel>
                        <asp:Panel ID="pnlSearch" runat="server" CssClass="toolbarButton">
                            <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/images/search.png" OnClick="ImageButton_Click" CommandArgument="Search" />
                            <br />
                            <asp:Label ID="lblSearch" runat="server" Text="Search" Font-Size="8pt" Font-Names="Arial" />
                        </asp:Panel>                        
                        <asp:Panel ID="pnlProgress" runat="server" CssClass="toolbarButton" Visible="false">
                            <asp:ImageButton ID="btnProgress" runat="server" ImageUrl="~/images/progress.png" OnClick="ImageButton_Click" CommandArgument="Progress" />
                            <br />
                            <asp:Label ID="lblProgress" runat="server" Text="Progress" Font-Size="8pt" Font-Names="Arial" />
                        </asp:Panel>                        
                        <asp:Button ID="btnAdmin" runat="server" Text="Admin" OnClick="Button_Click" CommandArgument="Admin" Visible="false" />
                    </div>
                </div>
            </ContentTemplate>
            </asp:UpdatePanel>
            <div>
            <asp:UpdatePanel ID="udpSplitter" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnLogon" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnLogout" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnEdit" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnView" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnProperties" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnStatus" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnRelatedAI" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnOtherUserAI" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnParaLink" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnRefreshAI" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnGoThere" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnReport" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="mnuModules" EventName="MenuItemClick" />
					<asp:AsyncPostBackTrigger ControlID="lnkVersion" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnRefreshTree" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnRefreshTreeDelete" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnRefreshTreeMove" EventName="Click" />
                </Triggers>
            <ContentTemplate>
                <eo:Splitter ID="Splitter1" runat="server" DividerSize="8" DividerImage="~/images/splitter/vdivider.png" AutoFillWindow="true" HeightMargin="42" WidthMargin="11" BackColor="White">
                    <eo:SplitterPane ID="LeftPane" runat="server" InitialWidth="300" MinWidth="300" MaxWidth="300" ScrollBars="None">
                        <eo:Splitter ID="Splitter2" runat="server" Height="100%" Width="100%" DividerSize="8" DividerImage="~/images/splitter/hdivider.png" Orientation="Horizontal">                        
                            <eo:SplitterPane ID="TreePane" runat="server" Width="300" PersistScrollPosition="true" ScrollBars="Auto">
                                <asp:Panel ID="pnlTreeView" runat="server" Width="100%">
                                    <asp:Panel ID="pnlModuleLabel" runat="server" CssClass="pnlLinkTitle">
                                        <asp:Label ID="lblModuleLabel" runat="server" />
                                    </asp:Panel>
                                    <asp:TreeView ID="p3Tree" runat="server"
                                        EnableClientScript="false"
                                        NodeIndent="15"
                                        ExpandDepth="1"
                                        OnTreeNodePopulate="P3Tree_TreeNodePopulate"
                                        OnSelectedNodeChanged="P3Tree_SelectedNodeChanged">
                                        <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" />
                                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                                    </asp:TreeView>                                    
                                </asp:Panel>
                                <asp:Panel ID="pnlDirectLink" runat="server" Width="100%" Height="100%">
                                    <asp:Panel ID="pnlLinkTitle" runat="server" CssClass="pnlLinkTitle">
                                        <asp:Label ID="lblLinkTitle" runat="server" Text="Direct Links" />
                                    </asp:Panel>
                                    <asp:Menu ID="Menu1" runat="server" 
                                        CssClass="dlinks" 
                                        StaticMenuStyle-CssClass="StaticMenuStyle" 
                                        StaticMenuItemStyle-CssClass="StaticMenuItemStyle" 
                                        StaticEnableDefaultPopOutImage="false" 
                                        DynamicEnableDefaultPopOutImage="false"
                                        DynamicHorizontalOffset="-5" 
                                        StaticItemFormatString="&nbsp;{0}&nbsp;" 
                                        DynamicItemFormatString="&nbsp;{0}&nbsp;" 
                                        OnMenuItemClick="menu1_MenuItemClick" >         
                                    </asp:Menu>
                                </asp:Panel>                            
                            </eo:SplitterPane>
                            <eo:SplitterPane ID="ModulePane" runat="server" MinWidth="300" MaxHeight="199" MinHeight="31" ScrollBars="None" style="position: relative;">                                
                                <asp:Menu ID="mnuModules" runat="server" 
                                    CssClass="mainMenu" 
                                    StaticItemFormatString="&nbsp;&nbsp;&nbsp;{0}" 
                                    OnMenuItemClick="mnuModules_MenuItemClick">
                                    <StaticMenuItemStyle CssClass="staticMenuItem" />
                                    <StaticSelectedStyle CssClass="staticMenuSelectedItem" />
                                    <Items>
                                    </Items>
                                </asp:Menu>
                            </eo:SplitterPane>                            
                        </eo:Splitter>
                    </eo:SplitterPane>
                    <eo:SplitterPane ID="ListPane" runat="server" PersistScrollPosition="true">
                        <asp:Panel ID="pnlHome" runat="server">
                            <%--<iframe id="p3embed" src="homepanel.html"></iframe>--%>
                            <%--<iframe src="custom/Biotium/HomePage.aspx"></iframe>--%>
                            <%--<iframe src="custom/tillsonburg/HomePage.aspx"></iframe>--%>
                            <%--<iframe src="custom/amtrak/HomePage.aspx"></iframe>--%>
                            <iframe src="custom/bayshore/Homepage.aspx"></iframe>
                        </asp:Panel>
                        <asp:Panel ID="pnlList" runat="server" Width="1590px" Height="100%" CssClass="listViewPanel">
                            <asp:Panel ID="pnlItemListTitle" runat="server" CssClass="pnlLinkTitle">
                                <asp:Label ID="lblItemListTitle" runat="server" Text="Item List" />
                            </asp:Panel>
                            <asp:GridView ID="gvItemList" runat="server" CssClass="gridView" 
                                AutoGenerateColumns="False"
                                DataKeyNames="ItemID, OrigID, Name, LabelName, FileExtension, ParentGroupID, TypeOfPublish, IsEvidence, IsCheckedOut, Status" 
                                GridLines="None" 
                                AllowSorting="true"
                                OnRowDataBound="Gv_RowDataBound" 
                                OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGV">
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
                                        <HeaderStyle CssClass="gridViewHeader" Width="350px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName">
                                        <HeaderStyle CssClass="gridViewHeader" Width="250px" />
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
                                    <asp:BoundField DataField="Processing" HeaderText="Processing" SortExpression="Processing">
                                        <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OrigID" HeaderText="OrigID" SortExpression="OrigID">
                                        <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HasPLink" HeaderText="P-L" SortExpression="HasPLink">
                                        <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LastModified" HeaderText="Last Modified" SortExpression="LastModified">
                                        <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FileExtension" HeaderText="Extension" SortExpression="FileExtension">
                                        <HeaderStyle CssClass="gridViewHeader"  />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:GridView ID="gvRecordList" runat="server" CssClass="gridView" AutoGenerateColumns="False"
                                DataKeyNames="ItemID, OrigID, ParentGroupID, Status, ObjTypeID" 
                                GridLines="None" 
                                AllowSorting="true" 
                                OnRowDataBound="Gv_RowDataBound"
                                OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGV">
                                <HeaderStyle CssClass="gridViewHeader" />
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
                                        <HeaderStyle CssClass="gridViewHeader" Width="350px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName">
                                        <HeaderStyle CssClass="gridViewHeader" Width="350px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Version">
                                        <HeaderStyle CssClass="gridViewHeader" Width="100px" />                      
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CreateBy" HeaderText="Initiator" SortExpression="CreateBy">
                                        <HeaderStyle CssClass="gridViewHeader" Width="150px" />                        
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CreateDate" HeaderText="Created" SortExpression="CreateDate">
                                        <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OrigID" HeaderText="OrigID" SortExpression="OrigID">
                                        <HeaderStyle CssClass="gridViewHeader" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HasPLink" HeaderText="P-L" SortExpression="HasPLink">
                                        <HeaderStyle CssClass="gridViewHeader" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="VersionedBy" HeaderText="Converted By" SortExpression="VersionedBy">
                                        <HeaderStyle CssClass="gridViewHeader" Width="150px" /> 
                                    </asp:BoundField>
                                    <asp:BoundField DataField="VersionDate" HeaderText="Version Date" SortExpression="VersionDate">
                                        <HeaderStyle CssClass="gridViewHeader" Width="200px" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:GridView ID="gvAIList" runat="server" CssClass="gridView" AutoGenerateColumns="False" DataKeyNames="AIID, UserID, SenderID, NotifiedStatus, ShowModuleID"
                                GridLines="None" AllowSorting="true" OnRowDataBound="Gv_RowDataBound" OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGV">
                                <HeaderStyle CssClass="gridViewHeader" />
                                <RowStyle CssClass="gridViewRow" />
                                <AlternatingRowStyle CssClass="gridViewAltRow" />
                                <SelectedRowStyle CssClass="gridViewSelRow" />
                                <Columns>
                                    <asp:TemplateField HeaderText="" HeaderStyle-Width="30px" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="left">
                                        <ItemTemplate>
                                            <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UserName" HeaderText="Recipient" SortExpression="UserName">
                                        <HeaderStyle CssClass="gridViewHeader" Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Name" HeaderText="ActionItem" SortExpression="Name">
                                        <HeaderStyle CssClass="gridViewHeader" Width="450px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ShowModuleName" HeaderText="Related Module" SortExpression="ShowModuleName">
                                        <HeaderStyle CssClass="gridViewHeader" Width="120px" />                        
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ShowID" HeaderText="Related ID" SortExpression="ShowID">
                                        <HeaderStyle CssClass="gridViewHeader" Width="100px" /> 
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DateDue" HeaderText="Due Date" SortExpression="DateDue">
                                        <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SenderName" HeaderText="Sent By" SortExpression="SenderName">
                                        <HeaderStyle CssClass="gridViewHeader" Width="150px" />                              
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SendDate" HeaderText="Sent Date" SortExpression="SendDate">
                                        <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AIID" HeaderText="ID" SortExpression="AIID">
                                        <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority">
                                        <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CompleteDate" HeaderText="Completed Date" SortExpression="CompleteDate">
                                        <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:GridView ID="gvUsersList" runat="server" CssClass="gridView" 
                                AutoGenerateColumns="False"
                                DataKeyNames="UserID,Name" 
                                GridLines="None" 
                                AllowSorting="true"
                                OnRowDataBound="Gv_RowDataBound" 
                                OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGV">
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
                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                                    <asp:BoundField DataField="UserID" HeaderText="ID" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <asp:Panel ID="pnlLogon" runat="server" Width="100%" DefaultButton="btnSubmitLogon" HorizontalAlign="Center">
                            <table class="loginTable">
                                <tr>
                                    <td class="titleBar" colspan="2">
                                        Paradigm 3 Log In
                                    </td>
                                </tr>
                                <tr>
                                    <td class="spacer" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="loginLabel">
                                        <asp:Label ID="lblUserName" runat="server" ForeColor="#FFFFFF" Text="User Name:" />
                                    </td>
                                    <td class="loginField">
                                        <asp:TextBox ID="txtUserName" runat="server" Width="210px" />                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="loginLabel">
                                        <asp:Label ID="lblPassword" runat="server" ForeColor="#FFFFFF" Text="Password:" />
                                    </td>
                                    <td class="loginField">
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="210px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center; vertical-align: middle; height: 30px; color: red;" colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; vertical-align: middle; height: 40px; padding-right: 5px;" colspan="2">
                                        <asp:Button ID="btnSubmitLogon" runat="server" Width="75px" Text="Logon" OnClick="Button_Click" CommandArgument="doLogon" />
                                            &nbsp;
                                        <asp:Button ID="btnCancelLogon" runat="server" Width="75px" Text="Cancel" CausesValidation="false" OnClick="Button_Click" CommandArgument="cancelLogon" />
                                    </td>
                                </tr>
                            </table>
                            <br /><br />
                            <asp:Label ID="lblLogonError" runat="server" CssClass="logonError" />
                        </asp:Panel>
                        <asp:Panel ID="pnlChangePW" runat="server" DefaultButton="btnChangePW" Width="100%" HorizontalAlign="Center">
                            <table class="loginTable">
                                <tr>
                                    <td class="titleBar" colspan="2">
                                        Paradigm 3 - Change Password
                                    </td>
                                </tr>
                                <tr>
                                    <td class="spacer" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="changePWLabel">
                                        <asp:Label ID="lblNewPassword" runat="server" ForeColor="#FFFFFF" Text="New Password:" />
                                    </td>
                                    <td class="changePWField">      
                                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Width="180px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="changePWLabel">
                                        <asp:Label ID="lblConfirmPassword" runat="server" ForeColor="#FFFFFF" Text="Confirm Password:" />
                                    </td>
                                    <td class="changePWField">
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="180px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:center;vertical-align:middle;height:30px;color:red;" colspan="2">
                                    </td>
                                </tr>                                
                                <tr>
                                    <td colspan="2" style="padding-right: 5px;text-align:right;vertical-align:middle;height:40px;">
                                        <asp:Button ID="btnChangePW" runat="server" Text="OK" Width="75px" OnClick="Button_Click" CommandArgument="changePassword" />
                                        &nbsp;
                                        <asp:Button ID="btnCancelChangePW" runat="server" Text="Cancel" Width="75px" OnClick="Button_Click" CommandArgument="cancelLogon" />
                                    </td>
                                </tr>
                            </table>
                            <br /><br />
                            <asp:Label ID="lblChangePW" runat="server" CssClass="logonError" Text="Your password has expired and must be changed to proceed." />
                        </asp:Panel>
                    </eo:SplitterPane>
                </eo:Splitter>
                <asp:Panel ID="p3ContextMenu" runat="server" CssClass="context-menu">
                    <asp:HiddenField ID="hdnContextID" runat="server" />
                    <asp:HiddenField ID="hdnPosX" runat="server" />
                    <asp:HiddenField ID="hdnPosY" runat="server" />
                    <div id="gvMenu" style="display: none;">
                        <asp:Menu ID="mnuGVContext" runat="server" OnMenuItemClick="ContextMenu_MenuItemClick">
                            <StaticMenuItemStyle CssClass="context-menu-menuitem" />
                            <Items>
                                <%--<asp:MenuItem Value="view" Text="View"></asp:MenuItem>
                                <asp:MenuItem Value="rename" Text="Rename"></asp:MenuItem>
                                <asp:MenuItem Value="move" Text="Move"></asp:MenuItem>
                                <asp:MenuItem Value="delete" Text="Delete"></asp:MenuItem>
                                <asp:MenuItem Value="status" Text="Status"></asp:MenuItem>
                                <asp:MenuItem Value="changetoevidence" Text="Change to Evidence"></asp:MenuItem>
                                <asp:MenuItem Value="withdraw" Text="Withdraw"></asp:MenuItem>                        
                                <asp:MenuItem Value="exportitem" Text="Export Item"></asp:MenuItem>
                                <asp:MenuItem Value="properties" Text="Properties"></asp:MenuItem>
                                <asp:MenuItem Value="setrepublish" Text="Set Republish"></asp:MenuItem>--%>
                            </Items>
                        </asp:Menu>
                        <asp:Button ID="btnShowGVMenu" runat="server" OnClick="btnShowGVMenu_Click" style="display: none;" />
                    </div>
                    <div id="tvMenu" style="display: none;">
                        <asp:Menu ID="mnuTVContext" runat="server" OnMenuItemClick="ContextMenu_MenuItemClick">
                            <Items></Items>
                        </asp:Menu>
                    </div>
                </asp:Panel>
            </ContentTemplate>
            </asp:UpdatePanel>
            </div>
            <div id="footer">
				<asp:LinkButton ID="lnkVersion" runat="server" OnClick="lnkVersion_Click" CssClass="lblVersion"><asp:Label ID="lblVersion" runat="server" /></asp:LinkButton>                
            </div>            
            <asp:Button ID="btnRefreshDoc" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshDoc" />
            <asp:Button ID="btnRefreshRec" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshRec" />
            <asp:Button ID="btnRefreshUser" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshUser" />
            <asp:Button ID="btnRefreshAI" runat="server" OnClick="BtnRefreshAI_Click" style="display: none;" CommandArgument="RefreshAI" />
            <asp:Button ID="btnRefreshTree" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshTree" />
            <asp:Button ID="btnRefreshTreeDelete" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshTreeDelete" />
            <asp:Button ID="btnRefreshTreeMove" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshTreeMove" />
            <asp:Button ID="btnRefeshEdit" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshDoc" />
            <asp:Button ID="btnGoThere" runat="server" OnClick="BtnGoThere_Click" style="display: none;" CommandArgument="GoThere" />
			<asp:Button ID="btnCloseDoc" runat="server" OnClick="btnCloseDoc_Click" style="display: none;" />
            <asp:Button ID="btnAddTreeNode" runat="server" OnClick="btnAddTreeNode_Click" style="display: none;" />
            <asp:HiddenField ID="hdnNewSelectedNodePath" runat="server" />
            <asp:HiddenField ID="hdnNewSelectedNodeID" runat="server" />
        </div>        
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="IMGDIV" runat="server" class="pleaseWait">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/pleasewait.gif" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </form>
</body>
</html>