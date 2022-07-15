<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="P3Web.Default2" Async="true" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>P3Web -- Welcome!</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Modals.css" rel="stylesheet" />    
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <input type="hidden" id="scrollPos" runat="server" />
        <div id="main">
            <asp:UpdatePanel ID="udpToolbar" runat="server">
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
                    <%--<asp:PostBackTrigger ControlID="btnAdmin" />--%>
                </Triggers>
            <ContentTemplate>
            <div id="topBar">                
                <div class="toolbar">
                    <asp:Panel ID="pnlGuide" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #dcdcdc;" meta:resourcekey="pnlGuideResource1">
					    <asp:ImageButton ID="btnGuide" runat="server" ImageUrl="~/images/help.png" OnClientClick="javascript:window.open('guide/guide.pdf'); return false;" meta:resourcekey="btnGuideResource1" />
                        <br />
                        <asp:Label ID="lblGuide" runat="server" Text="Guide" meta:resourcekey="lblGuideResource1" />
				    </asp:Panel>
                    <asp:Panel ID="pnlAdd" runat="server" CssClass="toolbarButton" style="position: relative;" Visible="false" meta:resourcekey="pnlAddResource1">
                        <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/images/add.png" OnClick="ImageButton_Click" CommandArgument="AddItem" meta:resourcekey="btnAddResource1" />
                        <br />
                        <asp:Label ID="lblAdd" runat="server" Text="Add New" meta:resourcekey="lblAddResource1" />
                        <asp:Panel id="pnlAddDropDown" runat="server" CssClass="dropdown-content" style="max-width: 200px;" Visible="false" meta:resourcekey="pnlAddDropDownResource1">
                            <asp:Menu ID="mnuAddDoc" runat="server" OnMenuItemClick="mnuAddItem_MenuItemClick" meta:resourcekey="mnuAddDocResource1">
                            </asp:Menu>
                        </asp:Panel>                        
                    </asp:Panel>
                    <asp:Panel ID="pnlEdit" runat="server" CssClass="toolbarButton" Visible="False" style="border-right: 1px solid #999999;" meta:resourcekey="pnlEditResource1">
                        <asp:ImageButton ID="btnEdit" runat="server" OnClick="ImageButton_Click" CommandArgument="EditItem" meta:resourcekey="btnEditResource1" />
                        <br />
                        <asp:Label ID="lblEdit" runat="server" Text="Edit" meta:resourcekey="lblEditResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlView" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlViewResource1">
                        <asp:ImageButton ID="btnView" runat="server" ImageUrl="~/images/view.png" OnClick="ImageButton_Click" CommandArgument="ViewItem" meta:resourcekey="btnViewResource1" />
                        <br />
                        <asp:Label ID="lblView" runat="server" Text="View" meta:resourcekey="lblViewResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlProperties" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlPropertiesResource1">
                        <asp:ImageButton ID="btnProperties" runat="server" ImageUrl="~/images/properties.png" OnClick="ImageButton_Click" CommandArgument="Properties" meta:resourcekey="btnPropertiesResource1" />
                        <br />
                        <asp:Label ID="lblProperties" runat="server" Text="Properties" meta:resourcekey="lblPropertiesResource1" />
                     </asp:Panel>
                    <asp:Panel ID="pnlStatus" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #dcdcdc;" Visible="False" meta:resourcekey="pnlStatusResource1">
                        <asp:ImageButton ID="btnStatus" runat="server" ImageUrl="~/images/status.png" OnClick="ImageButton_Click" CommandArgument="Status" meta:resourcekey="btnStatusResource1" />
                        <br />
                        <asp:Label ID="lblStatus" runat="server" Text="Status" meta:resourcekey="lblStatusResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlRelatedAI" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlRelatedAIResource1">
                        <asp:ImageButton ID="btnRelatedAI" runat="server" ImageUrl="~/images/actionitem.png" OnClick="ImageButton_Click" CommandArgument="RelatedAI" meta:resourcekey="btnRelatedAIResource1" />
                        <br />
                        <asp:Label ID="lblRelatedAI" runat="server" Text="Related AI" meta:resourcekey="lblRelatedAIResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlOtherUserAI" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #dcdcdc;" Visible="False" meta:resourcekey="pnlOtherUserAIResource1">
                        <asp:ImageButton ID="btnOtherUserAI" runat="server" ImageUrl="~/images/actionitem_otheruser.png" OnClick="ImageButton_Click" CommandArgument="OtherUserAI" meta:resourcekey="btnOtherUserAIResource1" />
                        <br />
                        <asp:Label ID="lblOtherUserAI" runat="server" Text="Other User" meta:resourcekey="lblOtherUserAIResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlParaLink" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #dcdcdc;" Visible="False" meta:resourcekey="pnlParaLinkResource1">
                        <asp:ImageButton ID="btnParaLink" runat="server" ImageUrl="~/images/paralink.png" OnClick="ImageButton_Click" CommandArgument="ParaLink" meta:resourcekey="btnParaLinkResource1" />
                        <br />
                        <asp:Label ID="lblParaLink" runat="server" Text="Para-Link" meta:resourcekey="lblParaLinkResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlReport" runat="server" CssClass="toolbarButton" style="position: relative; z-index: 999;" Visible="False" meta:resourcekey="pnlReportResource1">
                        <asp:ImageButton ID="btnReport" runat="server" ImageUrl="~/images/report.png" OnClick="ImageButton_Click" CommandArgument="Report" meta:resourcekey="btnReportResource1" />
                        <br />
                        <asp:Label ID="lblReport" runat="server" Text="Reports" meta:resourcekey="lblReportResource1" />
                        <asp:Panel id="rptDropDown" runat="server" CssClass="dropdown-content" Visible="False" meta:resourcekey="rptDropDownResource1">
                            <asp:Menu ID="mnuReports" runat="server" OnMenuItemClick="mnuReports_MenuItemClick" meta:resourcekey="mnuReportsResource1">
                            </asp:Menu>
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="pnlAdministration" runat="server" CssClass="toolbarButton" Visible="False" style="border-right: 1px solid #dcdcdc;" meta:resourcekey="pnlAdministrationResource1">
                        <asp:ImageButton ID="btnAdministration" runat="server" OnClick="btnAdministration_Click" Width="32px" ImageUrl="~/images/administration.png" meta:resourcekey="btnAdministrationResource1" />
                        <br />
                        <asp:Label ID="lblAdministration" runat="server" Text="Admin" meta:resourcekey="lblAdministrationResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlSearch" runat="server" CssClass="toolbarButton" meta:resourcekey="pnlSearchResource1">
                        <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/images/search.png" OnClick="ImageButton_Click" CommandArgument="Search" meta:resourcekey="btnSearchResource1" />
                        <br />
                        <asp:Label ID="lblSearch" runat="server" Text="Search" meta:resourcekey="lblSearchResource1" />
                    </asp:Panel>                    
                </div>
                <div class="auth-buttons">
                    <div>
                        <asp:Button ID="btnLogon" runat="server" Text="Login" CssClass="authbutton" OnClick="Button_Click" CommandArgument="gotoLogon" meta:resourcekey="btnLogonResource1" />
                        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="authbutton" OnClick="Button_Click" CommandArgument="doLogout" meta:resoucekey="btnLogoutResource1" />
                    </div>
                    <div>
                        <asp:Label ID="lblLogon" runat="server" Text="Hello, you are not logged in" meta:resourcekey="lblLogonResource1" />
                    </div>
                </div>                
            </div>
            </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="udpSplitter" runat="server" UpdateMode="Conditional">
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
            <div id="content">
                <div id="treeMenu">
                    <div class="tmtop">
                        <asp:Panel ID="pnlDirectLink" runat="server" Width="100%" Height="100%" meta:resourcekey="pnlDirectLinkResource1">
                            <asp:Panel ID="pnlLinkTitle" runat="server" CssClass="pnlLinkTitle" meta:resourcekey="pnlLinkTitleResource1">
                                <asp:Label ID="lblLinkTitle" runat="server" Text="Direct Links" meta:resourcekey="lblLinkTitleResource1" />
                            </asp:Panel>
                            <asp:Menu ID="Menu1" runat="server" 
                                CssClass="dlinks" 
                                StaticEnableDefaultPopOutImage="False" 
                                DynamicEnableDefaultPopOutImage="False"
                                DynamicHorizontalOffset="-5" 
                                StaticItemFormatString="&nbsp;{0}&nbsp;" 
                                DynamicItemFormatString="&nbsp;{0}&nbsp;" 
                                OnMenuItemClick="menu1_MenuItemClick" meta:resourcekey="Menu1Resource1" >         
                                <StaticMenuItemStyle CssClass="StaticMenuItemStyle" />
                                <StaticMenuStyle CssClass="StaticMenuStyle" />
                            </asp:Menu>
                        </asp:Panel>
                        <asp:Panel ID="pnlTreeView" runat="server" Width="100%" Height="100%" ScrollBars="Auto" meta:resourcekey="pnlTreeViewResource1">
                            <asp:Panel ID="pnlModuleLabel" runat="server" CssClass="pnlLinkTitle" meta:resourcekey="pnlModuleLabelResource1">
                                <asp:Label ID="lblModuleLabel" runat="server" meta:resourcekey="lblModuleLabelResource1" />
                            </asp:Panel>
                            <asp:TreeView ID="p3Tree" runat="server"
                                EnableClientScript="False"
                                NodeIndent="15"
                                ExpandDepth="1"
                                OnTreeNodePopulate="P3Tree_TreeNodePopulate"
                                OnSelectedNodeChanged="P3Tree_SelectedNodeChanged" meta:resourcekey="p3TreeResource1">
                                <NodeStyle ForeColor="Black" 
                                    Font-Bold="False" 
                                    Font-Names="sans-serif" 
                                    Font-Size="12px" 
                                    Font-Underline="False" 
                                    NodeSpacing="0px" 
                                    VerticalPadding="0px" />
                                <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                            </asp:TreeView>                                    
                        </asp:Panel>
                    </div>
                    <asp:Panel ID="ModulePane" runat="server" CssClass="tmbottom">
                        <asp:Menu ID="mnuModules" runat="server" 
                            CssClass="mainMenu" 
                            StaticItemFormatString="&nbsp;&nbsp;&nbsp;{0}" 
                            OnMenuItemClick="mnuModules_MenuItemClick" meta:resourcekey="mnuModulesResource1">
                            <StaticMenuItemStyle CssClass="staticMenuItem" />
                            <StaticSelectedStyle CssClass="staticMenuSelectedItem" />
                        </asp:Menu>
                    </asp:Panel>
                </div>
                <div id="listView">
                    <asp:Panel ID="pnlHome" runat="server" style="height: calc(100vh - 85px);" meta:resourcekey="pnlHomeResource1">
                        <iframe src="custom/amtrak/HomePage.aspx"></iframe>
                    </asp:Panel>
                    <asp:Panel ID="pnlList" runat="server" Width="1590px" style="height: calc(100vh - 85px);" CssClass="listViewPanel" meta:resourcekey="pnlListResource1">
                        <asp:Panel ID="pnlItemListTitle" runat="server" CssClass="pnlLinkTitle" meta:resourcekey="pnlItemListTitleResource1">
                            <asp:Label ID="lblItemListTitle" runat="server" Text="Item List" meta:resourcekey="lblItemListTitleResource1" />
                        </asp:Panel>
                        <asp:GridView ID="gvItemList" runat="server" CssClass="gridView" 
                            AutoGenerateColumns="False"
                            DataKeyNames="ItemID,OrigID,Name,LabelName,FileExtension,ParentGroupID,TypeOfPublish,IsEvidence,IsCheckedOut,Status" 
                            GridLines="None" 
                            AllowSorting="True"
                            OnRowDataBound="Gv_RowDataBound" 
                            OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGV" meta:resourcekey="gvItemListResource1">
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
                                    <HeaderStyle CssClass="gridViewHeader" Width="350px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName" meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle CssClass="gridViewHeader" Width="250px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="VersionStatus" HeaderText="Status" SortExpression="VersionStatus" meta:resourcekey="BoundFieldResource3">
                                    <HeaderStyle  CssClass="gridViewHeader"  Width="80px" />                     
                                </asp:BoundField>
                                <asp:BoundField DataField="VersionedBy" HeaderText="Converted By" SortExpression="VersionedBy" meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle CssClass="gridViewHeader"  Width="150px" />                        
                                </asp:BoundField>
                                <asp:BoundField DataField="VersionDate" HeaderText="Converted Date" SortExpression="VersionDate" meta:resourcekey="BoundFieldResource5">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Processing" HeaderText="Processing" SortExpression="Processing" meta:resourcekey="BoundFieldResource6">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="OrigID" HeaderText="OrigID" SortExpression="OrigID" meta:resourcekey="BoundFieldResource7">
                                    <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="HasPLink" HeaderText="P-L" SortExpression="HasPLink" meta:resourcekey="BoundFieldResource8">
                                    <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LastModified" HeaderText="Last Modified" SortExpression="LastModified" meta:resourcekey="BoundFieldResource9">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FileExtension" HeaderText="Extension" SortExpression="FileExtension" meta:resourcekey="BoundFieldResource10">
                                    <HeaderStyle CssClass="gridViewHeader"  />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:GridView ID="gvRecordList" runat="server" CssClass="gridView" AutoGenerateColumns="False"
                            DataKeyNames="ItemID,OrigID,ParentGroupID,Status,ObjTypeID" 
                            GridLines="None" 
                            AllowSorting="True" 
                            OnRowDataBound="Gv_RowDataBound"
                            OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGV" meta:resourcekey="gvRecordListResource1">
                            <HeaderStyle CssClass="gridViewHeader" />
                            <RowStyle CssClass="gridViewRow" />
                            <AlternatingRowStyle CssClass="gridViewAltRow" />
                            <SelectedRowStyle CssClass="gridViewSelRow" />
                            <Columns>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" meta:resourcekey="ItemIconResource2" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" />
                                    <ItemStyle HorizontalAlign="Left" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource11">
                                    <HeaderStyle CssClass="gridViewHeader" Width="350px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName" meta:resourcekey="BoundFieldResource12">
                                    <HeaderStyle CssClass="gridViewHeader" Width="350px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Version" meta:resourcekey="BoundFieldResource13">
                                    <HeaderStyle CssClass="gridViewHeader" Width="100px" />                      
                                </asp:BoundField>
                                <asp:BoundField DataField="CreateBy" HeaderText="Initiator" SortExpression="CreateBy" meta:resourcekey="BoundFieldResource14">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" />                        
                                </asp:BoundField>
                                <asp:BoundField DataField="CreateDate" HeaderText="Created" SortExpression="CreateDate" meta:resourcekey="BoundFieldResource15">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="OrigID" HeaderText="OrigID" SortExpression="OrigID" meta:resourcekey="BoundFieldResource16">
                                    <HeaderStyle CssClass="gridViewHeader" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="HasPLink" HeaderText="P-L" SortExpression="HasPLink" meta:resourcekey="BoundFieldResource17">
                                    <HeaderStyle CssClass="gridViewHeader" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="VersionedBy" HeaderText="Converted By" SortExpression="VersionedBy" meta:resourcekey="BoundFieldResource18">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" /> 
                                </asp:BoundField>
                                <asp:BoundField DataField="VersionDate" HeaderText="Version Date" SortExpression="VersionDate" meta:resourcekey="BoundFieldResource19">
                                    <HeaderStyle CssClass="gridViewHeader" Width="200px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:GridView ID="gvAIList" runat="server" CssClass="gridView" AutoGenerateColumns="False" DataKeyNames="AIID,UserID,SenderID,NotifiedStatus,ShowModuleID"
                            GridLines="None" AllowSorting="True" OnRowDataBound="Gv_RowDataBound" OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGV" meta:resourcekey="gvAIListResource1">
                            <HeaderStyle CssClass="gridViewHeader" />
                            <RowStyle CssClass="gridViewRow" />
                            <AlternatingRowStyle CssClass="gridViewAltRow" />
                            <SelectedRowStyle CssClass="gridViewSelRow" />
                            <Columns>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" meta:resourcekey="ItemIconResource3" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" />
                                    <ItemStyle HorizontalAlign="Left" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="UserName" HeaderText="Recipient" SortExpression="UserName" meta:resourcekey="BoundFieldResource20">
                                    <HeaderStyle CssClass="gridViewHeader" Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="ActionItem" SortExpression="Name" meta:resourcekey="BoundFieldResource21">
                                    <HeaderStyle CssClass="gridViewHeader" Width="450px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ShowModuleName" HeaderText="Related Module" SortExpression="ShowModuleName" meta:resourcekey="BoundFieldResource22">
                                    <HeaderStyle CssClass="gridViewHeader" Width="120px" />                        
                                </asp:BoundField>
                                <asp:BoundField DataField="ShowID" HeaderText="Related ID" SortExpression="ShowID" meta:resourcekey="BoundFieldResource23">
                                    <HeaderStyle CssClass="gridViewHeader" Width="100px" /> 
                                </asp:BoundField>
                                <asp:BoundField DataField="DateDue" HeaderText="Due Date" SortExpression="DateDue" meta:resourcekey="BoundFieldResource24">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SenderName" HeaderText="Sent By" SortExpression="SenderName" meta:resourcekey="BoundFieldResource25">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" />                              
                                </asp:BoundField>
                                <asp:BoundField DataField="SendDate" HeaderText="Sent Date" SortExpression="SendDate" meta:resourcekey="BoundFieldResource26">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AIID" HeaderText="ID" SortExpression="AIID" meta:resourcekey="BoundFieldResource27">
                                    <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" meta:resourcekey="BoundFieldResource28">
                                    <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CompleteDate" HeaderText="Completed Date" SortExpression="CompleteDate" meta:resourcekey="BoundFieldResource29">
                                    <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:GridView ID="gvUsersList" runat="server" CssClass="gridView" 
                            AutoGenerateColumns="False"
                            DataKeyNames="UserID,Name" 
                            GridLines="None" 
                            AllowSorting="True"
                            OnRowDataBound="Gv_RowDataBound" 
                            OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGV" meta:resourcekey="gvUsersListResource1">
                            <HeaderStyle CssClass="gridViewHeader" />
                            <SortedAscendingHeaderStyle CssClass="sortasc" />
                            <SortedDescendingHeaderStyle CssClass="sortdesc" />
                            <RowStyle CssClass="gridViewRow" />
                            <AlternatingRowStyle CssClass="gridViewAltRow" />
                            <SelectedRowStyle CssClass="gridViewSelRow" />
                            <Columns>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" meta:resourcekey="ItemIconResource4" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" />
                                    <ItemStyle HorizontalAlign="Left" Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Name" HeaderText="Name" meta:resourcekey="BoundFieldResource30" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" meta:resourcekey="BoundFieldResource31" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" meta:resourcekey="BoundFieldResource32" />
                                <asp:BoundField DataField="FullName" HeaderText="Full Name" meta:resourcekey="BoundFieldResource33" />
                                <asp:BoundField DataField="UserID" HeaderText="ID" meta:resourcekey="BoundFieldResource34" />
                                <asp:BoundField DataField="Status" HeaderText="Status" meta:resourcekey="BoundFieldResource35" />
                                <asp:BoundField DataField="Email" HeaderText="Email" meta:resourcekey="BoundFieldResource36" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                    <asp:Panel ID="pnlLogon" runat="server" style="height: calc(100vh - 85px);" DefaultButton="btnSubmitLogon" HorizontalAlign="Center" meta:resourcekey="pnlLogonResource1">
                        <table class="loginTable">
                            <tr>
                                <td class="titleBar" colspan="2" style="font-size: .95rem;">
                                    <%= GetLocalResourceObject("P3WebLogin") %>
                                </td>
                            </tr>
                            <tr>
                                <td class="spacer" colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="loginLabel">
                                    <asp:Label ID="lblUserName" runat="server" ForeColor="White" Text="User Name:" meta:resourcekey="lblUserNameResource1" />
                                </td>
                                <td class="loginField">
                                    <asp:TextBox ID="txtUserName" runat="server" Width="210px" meta:resourcekey="txtUserNameResource1" />                                        
                                </td>
                            </tr>
                            <tr>
                                <td class="loginLabel">
                                    <asp:Label ID="lblPassword" runat="server" ForeColor="White" Text="Password:" meta:resourcekey="lblPasswordResource1" />
                                </td>
                                <td class="loginField">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="210px" meta:resourcekey="txtPasswordResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; vertical-align: middle; height: 30px; color: red;" colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; vertical-align: middle; height: 40px; padding-right: 5px;" colspan="2">
                                    <asp:Button ID="btnSubmitLogon" runat="server" CssClass="authbutton" Text="Logon" OnClick="Button_Click" CommandArgument="doLogon" meta:resourcekey="btnSubmitLogonResource1" />
                                    <asp:Button ID="btnCancelLogon" runat="server" CssClass="authbutton" Text="Cancel" CausesValidation="False" OnClick="Button_Click" CommandArgument="cancelLogon" meta:resourcekey="btnCancelLogonResource1" />
                                </td>
                            </tr>
                        </table>
                        <br /><br />
                        <asp:Label ID="lblLogonError" runat="server" CssClass="logonError" meta:resourcekey="lblLogonErrorResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlChangePW" runat="server" DefaultButton="btnChangePW" style="height: calc(100vh - 85px);" HorizontalAlign="Center" meta:resourcekey="pnlChangePWResource1">
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
                                    <asp:Label ID="lblNewPassword" runat="server" ForeColor="White" Text="New Password:" meta:resourcekey="lblNewPasswordResource1" />
                                </td>
                                <td class="changePWField">      
                                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Width="180px" meta:resourcekey="txtNewPasswordResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td class="changePWLabel">
                                    <asp:Label ID="lblConfirmPassword" runat="server" ForeColor="White" Text="Confirm Password:" meta:resourcekey="lblConfirmPasswordResource1" />
                                </td>
                                <td class="changePWField">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="180px" meta:resourcekey="txtConfirmPasswordResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center;vertical-align:middle;height:30px;color:red;" colspan="2">
                                </td>
                            </tr>                                
                            <tr>
                                <td colspan="2" style="padding-right: 5px;text-align:right;vertical-align:middle;height:40px;">
                                    <asp:Button ID="btnChangePW" runat="server" Text="OK" Width="75px" OnClick="Button_Click" CommandArgument="changePassword" meta:resourcekey="btnChangePWResource1" />
                                    &nbsp;
                                    <asp:Button ID="btnCancelChangePW" runat="server" Text="Cancel" Width="75px" OnClick="Button_Click" CommandArgument="cancelLogon" meta:resourcekey="btnCancelChangePWResource1" />
                                </td>
                            </tr>
                        </table>
                        <br /><br />
                        <asp:Label ID="lblChangePW" runat="server" CssClass="logonError" Text="Your password has expired and must be changed to proceed." meta:resourcekey="lblChangePWResource1" />
                    </asp:Panel>
                </div>
                <asp:Panel ID="p3ContextMenu" runat="server" CssClass="context-menu" meta:resourcekey="p3ContextMenuResource1">
                    <asp:HiddenField ID="hdnContextID" runat="server" />
                    <asp:HiddenField ID="hdnPosX" runat="server" />
                    <asp:HiddenField ID="hdnPosY" runat="server" />
                    <div id="gvMenu" style="display: none;">
                        <asp:Menu ID="mnuGVContext" runat="server"
                            DynamicHorizontalOffset="10"
                            OnMenuItemClick="ContextMenu_MenuItemClick" 
                            StaticDisplayLevels="3" 
                            Orientation="Vertical"
                            meta:resourcekey="mnuGVContextResource1">
                            <LevelSubMenuStyles>
                                <asp:SubMenuStyle CssClass="context-menu-menuitem" />
                            </LevelSubMenuStyles>
                            <StaticMenuItemStyle CssClass="context-menu-menuitem" />
                            <DynamicHoverStyle BackColor="#7c6f57" />
                            <DynamicMenuItemStyle HorizontalPadding="2px" VerticalPadding="2px" />
                            <DynamicMenuStyle BackColor="#f1f1f1"/>
                        </asp:Menu>
                        <asp:Button ID="btnShowGVMenu" runat="server" OnClick="btnShowGVMenu_Click" style="display: none;" meta:resourcekey="btnShowGVMenuResource1" />
                    </div>
                    <div id="tvMenu" style="display: none;">
                        <asp:Menu ID="mnuTVContext" runat="server" 
                            StaticDisplayLevels="3" 
                            Orientation="Vertical"
                            OnMenuItemClick="ContextMenu_MenuItemClick" 
                            meta:resourcekey="mnuTVContextResource1">                            
                            <StaticMenuItemStyle CssClass="context-menu-menuitem" />
                            <DynamicHoverStyle BackColor="#7C6F57" />
                            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                            <DynamicMenuStyle BackColor="#F7F6F3"/>
                        </asp:Menu>
                    </div>
                </asp:Panel>
            </div>
            </ContentTemplate>
            </asp:UpdatePanel>
            <div id="footer">
                <asp:LinkButton ID="lnkVersion" runat="server" OnClick="lnkVersion_Click" CssClass="lblVersion">
                    <asp:Label ID="lblVersion" runat="server" />
                </asp:LinkButton>
            </div>
            <asp:Button ID="btnRefreshDoc" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshDoc" meta:resourcekey="btnRefreshDocResource1" />
            <asp:Button ID="btnRefreshRec" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshRec" meta:resourcekey="btnRefreshRecResource1" />
            <asp:Button ID="btnRefreshUser" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshUser" meta:resourcekey="btnRefreshUserResource1" />
            <asp:Button ID="btnRefreshAI" runat="server" OnClick="BtnRefreshAI_Click" style="display: none;" CommandArgument="RefreshAI" meta:resourcekey="btnRefreshAIResource1" />
            <asp:Button ID="btnRefreshTree" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshTree" meta:resourcekey="btnRefreshTreeResource1" />
            <asp:Button ID="btnRefreshTreeDelete" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshTreeDelete" meta:resourcekey="btnRefreshTreeDeleteResource1" />
            <asp:Button ID="btnRefreshTreeMove" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshTreeMove" meta:resourcekey="btnRefreshTreeMoveResource1" />
            <asp:Button ID="btnRefeshEdit" runat="server" OnClick="BtnRefresh_Click" style="display: none;" CommandArgument="RefreshDoc" meta:resourcekey="btnRefeshEditResource1" />
            <asp:Button ID="btnGoThere" runat="server" OnClick="BtnGoThere_Click" style="display: none;" CommandArgument="GoThere" meta:resourcekey="btnGoThereResource1" />
            <asp:Button ID="btnCloseDoc" runat="server" OnClick="btnCloseDoc_Click" style="display: none;" meta:resourcekey="btnCloseDocResource1" />
            <asp:Button ID="btnAddTreeNode" runat="server" OnClick="btnAddTreeNode_Click" style="display: none;" meta:resourcekey="btnAddTreeNodeResource1" />
            <asp:HiddenField ID="hdnNewSelectedNodePath" runat="server" />
            <asp:HiddenField ID="hdnNewSelectedNodeID" runat="server" />
        </div>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <div id="IMGDIV" runat="server" class="pleaseWait">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/pleasewait.gif" meta:resourcekey="Image1Resource1" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
    <script src="scripts/P3Web.js"></script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            var elem = document.getElementById("listView");
            var val = document.getElementById("scrollPos").value;
            if (elem !== null) {
                setItemScrollPos(val);
            }
        }        
    </script>
</body>
</html>
