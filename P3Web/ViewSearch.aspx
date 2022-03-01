<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSearch.aspx.cs" Inherits="Paradigm3.ViewSearch" EnableEventValidation="false" Async="true" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Search</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Search.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body class="searchbody" onload="focus();">
    <form id="form1" runat="server" defaultbutton="btnSearch">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:HiddenField ID="scrollPos" runat="server" />
    <asp:UpdatePanel ID="udpSearch" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBrowseOK" EventName="Click" />
        </Triggers>
    <ContentTemplate>
        <div id="pnlSearch">
            <div id="pnlSearchLeft">
                <asp:TabContainer ID="TabContainer1" runat="server" Width="100%" Height="180px" BackColor="#f1f1f1" meta:resourcekey="TabContainer1Resource1">
                    <asp:TabPanel ID="TabGeneral" runat="server" HeaderText="General" meta:resourcekey="TabGeneralResource1">
                        <ContentTemplate>
                            <div class="tdCell" style="width: 120px;">
                                <asp:Label ID="InModuleLabel" runat="server" Text="In Module:" meta:resourcekey="InModuleLabel"></asp:Label>
                            </div>
                            <div class="tdCell" style="width: 500px;">
                                <asp:DropDownList ID="DDLModule" runat="server" Width="500px" AutoPostBack="True" OnSelectedIndexChanged="DDL_SelectedIndexChanged" meta:resourcekey="DDLModuleResource1">
                                </asp:DropDownList>
                            </div>
                            <div class="tdCell" style="width:200px; padding-left: 5px; box-sizing: border-box;">
                                <asp:CheckBox ID="CHKGroupOrigID" runat="server" Checked="True" Text="Group by OrigiD" meta:resourcekey="CHKGroupOrigIDResource1" />
                            </div>
                            <div class="tdCell" style="width: 120px;" >
                                <asp:Label ID="InFolderLabel" runat="server" Text="In Folder:" meta:resourcekey="InFolderLabel"></asp:Label>
                            </div>
                            <div class="tdCell" style="width:700px;">
                                <asp:TextBox ID="txtFolder" runat="server" Width="700px" ReadOnly="True" BackColor="#F0F0F0" meta:resourcekey="txtFolderResource1" />
                            </div>
                            <div class="tdCell" style="width: 120px;">

                            </div>
                            <div class="tdCell" style="width: 240px">
                                <asp:CheckBox ID="chkSubGroup" runat="server" Text="Include Subgroups" Checked="True" meta:resourcekey="chkSubGroupResource1" />
                            </div>
                            <div class="tdCell" style="width: 240px">
                                <asp:CheckBox ID="chkWithdrawn" runat="server" Text="Withdrawn Items Only" meta:resourcekey="chkWithdrawnResource1" />
                            </div>
                            <div class="tdCell" style="width: 220px; justify-content: flex-end;">
                                <asp:Button ID="btnBrowse" runat="server" Text="Browse" meta:resourcekey="btnBrowseResource1" />
                                <asp:ModalPopupExtender ID="BrowsePopUp" runat="server" PopupControlID="pnlBrowse" TargetControlID="btnBrowse"
                                    Drag="True" PopupDragHandleControlID="pnlBrowseDrag" CancelControlID="btnBrowseCancel" 
                                    BackgroundCssClass="modalBackground" BehaviorID="BrowsePopUp" />
                            </div>
                            <div class="tdCell" style="width: 120px;">
                                <asp:Label ID="InFieldLabel" runat="server" Text="In Field:" meta:resourcekey="InFieldLabel"></asp:Label>
                            </div>
                            <div class="tdCell" style="width: 700px">
                                <asp:DropDownList ID="DDLField" runat="server" Width="700px" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="DDL_SelectedIndexChanged" meta:resourcekey="DDLFieldResource1" />
                            </div>
                            <div class="tdCell" style="width: 120px;">
                                <asp:Label ID="SearchLabel" runat="server" Text="Search:" meta:resourcekey="SearchLabel"></asp:Label>
                            </div>
                            <div class="tdCell" style="width:700px;">
                                <asp:TextBox ID="txtSearch" runat="server" Width="700px" meta:resourcekey="txtSearchResource1" />
                                <asp:DropDownList ID="DDLSearch" runat="server" Width="700px" meta:resourcekey="DDLSearchResource1"></asp:DropDownList>
                                <asp:TextBox ID="txtStartDate" runat="server" Width="150px" meta:resourcekey="txtStartDateResource1" />
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate" BehaviorID="CalendarExtender1" />&nbsp;
                                <asp:Label ID="lblTo" runat="server" Text=" to " meta:resourcekey="lblToResource1" />&nbsp;
                                <asp:TextBox ID="txtEndDate" runat="server" Width="150px" meta:resourcekey="txtEndDateResource1" />
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate" BehaviorID="CalendarExtender2" />
                            </div>
                            <div class="tdCell" style="width: 120px;">
                                <asp:Label ID="lblConvertedBy" runat="server" Text="Converted by" meta:resourcekey="ConvertedByLabel" />
                            </div>
                            <div class="tdCell" style="width: 700px;">
                                <asp:DropDownList ID="DDLConvertedBy" runat="server" Width="200px" meta:resourcekey="DDLConvertedByResource1" />      
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabRoles" runat="server" HeaderText="Roles" meta:resourcekey="TabRolesResource1">
                        <ContentTemplate>
                            <div class="tabPanel">
                                <div class="tdCell" style="width: 150px;">
                                    <asp:Label ID="RolesLabel" runat="server" Text="Roles:" meta:resourcekey="RolesLabel"></asp:Label>
                                </div>
                                <div class="tdCell" style="width: calc(100% - 150px);">
                                    <asp:DropDownList ID="DDLRoles" runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="DDL_SelectedIndexChanged" meta:resourcekey="DDLRolesResource1" />
                                </div>
                                <div class="tdCell" style="width: 150px;">
                                    <asp:Label ID="RoleMembersLabel" runat="server" Text="Role Members:" meta:resourcekey="RoleMembersLabel"></asp:Label>
                                </div>
                                <div class="tdCell" style="width: calc(100% - 150px);">
                                    <asp:DropDownList ID="DDLRoleAssigned" runat="server" Width="100%" meta:resourcekey="DDLRoleAssignedResource1" />
                                </div>                     
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabCategory" runat="server" HeaderText="Category" Width="100%" meta:resourcekey="TabCategoryResource1">
                        <ContentTemplate>
                            <div class="categoryList">
                                <asp:CheckBoxList ID="cblCategory" runat="server" BorderStyle="None" meta:resourcekey="cblCategoryResource1">
                                </asp:CheckBoxList>
                            </div>                            
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabStyle" runat="server" HeaderText="Style Fields" meta:resourcekey="TabStyleResource1" Width="800px">
                        <ContentTemplate>
                            <table style="width: 100%; padding: 0px;">
                                <tr class="trRow">
                                    <td class="tdHeader" style="width: 100px;">
                                        <asp:Label ID="StylesLabel" runat="server" Text="Styles:" meta:resourcekey="StylesLabel"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlStyles" runat="server" Width="400px" AutoPostBack="True" AppendDataBoundItems="True" Enabled="False" OnSelectedIndexChanged="DDL_SelectedIndexChanged" meta:resourcekey="ddlStylesResource1">
                                            <asp:ListItem Text="-- Select --" Value="0" meta:resourcekey="ListItemResource1" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr class="trRow">
                                    <td style="width: 100px;">
                                        <asp:Label ID="SelectFieldLabel" runat="server" Text="Select Field:" meta:resourcekey="SelectFieldLabel"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlObjField" runat="server" Width="300px" AutoPostBack="True" AppendDataBoundItems="True" Visible="False" OnSelectedIndexChanged="DDL_SelectedIndexChanged" meta:resourcekey="ddlObjFieldResource1">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlModify" runat="server" Width="100px" AutoPostBack="True" Visible="False" meta:resourcekey="ddlModifyResource1" />
                                        <asp:TextBox ID="txtSearchString" runat="server" Width="200px" Visible="False" meta:resourcekey="txtSearchStringResource1" />
                                        <asp:DropDownList ID="ddlMod" runat="server" Width="100px" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="DDL_SelectedIndexChanged" meta:resourcekey="ddlModResource1" />
                                        <asp:TextBox ID="txtDateStart" runat="server" Width="100px" Visible="False" meta:resourcekey="txtDateStartResource1" />
                                        <asp:CalendarExtender ID="ceDateStart" runat="server" TargetControlID="txtDateStart" BehaviorID="ceDateStart" />
                                        <asp:TextBox ID="txtNumStart" runat="server" Width="100px" Visible="False" meta:resourcekey="txtNumStartResource1" />
                                        <asp:Label ID="lblModTo" runat="server" Text="and" Visible="False" meta:resourcekey="lblModToResource1" />
                                        <asp:TextBox ID="txtDateEnd" runat="server" Width="100px" Visible="False" meta:resourcekey="txtDateEndResource1" />
                                        <asp:CalendarExtender ID="ceDateEnd" runat="server" TargetControlID="txtDateEnd" BehaviorID="ceDateEnd" />                                        
                                        <asp:TextBox ID="txtNumEnd" runat="server" Width="100px" Visible="False" meta:resourcekey="txtNumEndResource1" />
                                    </td>
                                </tr>
                                <%--<tr class="trRow">
                                    
                                </tr>--%>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </div>
            <div id="pnlSearchRight">
                <asp:Button ID="btnSearch" runat="server" Text="Search" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="Search" meta:resourcekey="btnSearchResource1" />
                <asp:Button ID="btnClear" runat="server" Text="Clear Search" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="Clear" Visible="False" Enabled="False" meta:resourcekey="btnClearResource1" />
                <asp:Button ID="btnShowMe" runat="server" Text="Show Me" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="ShowMe" Visible="False" Enabled="False" meta:resourcekey="btnShowMeResource1" />
                <asp:Button ID="btnGo" runat="server" Text="Go There" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="GoThere" Visible="False" Enabled="False" meta:resourcekey="btnGoResource1" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="Cancel" meta:resourcekey="btnCancelResource1" />
            </div>
        </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="udpResults" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnClear" EventName="Click" />
        </Triggers>
    <ContentTemplate>
        <asp:Panel ID="pnlResults" runat="server" CssClass="resultsPanel" meta:resourcekey="pnlResultsResource1">
            <div id="pnlSearchResults">
                <div class="searchResultsCounter">
                    <asp:Label ID="lblResultCount" runat="server" ForeColor="#F0F0F0" Font-Bold="True" meta:resourcekey="lblResultCountResource1" />
                </div>
                <div id="resultlist" class="searchResultsList">
                    <asp:GridView ID="gvSearchResults" runat="server" CssClass="gridView" 
						Width="100%" 
						AutoGenerateColumns="False"
						GridLines="None" OnRowDataBound="GV_RowDataBound" 
						AllowSorting="True" 
						OnSorting="Sort_GV" meta:resourcekey="gvSearchResultsResource1">
                        <HeaderStyle CssClass="gridViewHeader" />
                        <RowStyle CssClass="gridViewRow" />
                        <AlternatingRowStyle CssClass="gridViewAltRow" />
                        <SelectedRowStyle CssClass="gridViewSelRow" />
                        <Columns>
                            <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                <HeaderStyle Width="20px" />
                                <ItemStyle Width="20px" />
                                <ItemTemplate>
                                    <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" meta:resourcekey="ItemIconResource1"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource1">
                                <HeaderStyle CssClass="gridViewHeader" />
                            </asp:BoundField>                                    
                            <asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName" meta:resourcekey="BoundFieldResource2">
                                <HeaderStyle CssClass="gridViewHeader" Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" meta:resourcekey="BoundFieldResource3">
                                <HeaderStyle CssClass="gridViewHeader" Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OrigID" HeaderText="OrigID" SortExpression="OrigID" meta:resourcekey="BoundFieldResource4">
                                <HeaderStyle CssClass="gridViewHeader" Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="HasPLink" HeaderText="P-L" SortExpression="HasPLink">
                                <HeaderStyle CssClass="gridViewHeader" Width="50px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:GridView ID="gvAISearchResults" runat="server" 
						CssClass="gridView" 
						Width="1400px" 
						AutoGenerateColumns="False" 
						DataKeyNames="AIID,ShowModuleID" 
						GridLines="None" 
						OnRowDataBound="GV_RowDataBound" 
						AllowSorting="True" 
						OnSorting="Sort_GV" meta:resourcekey="gvAISearchResultsResource1">
                        <HeaderStyle CssClass="gridViewHeader" />
                        <RowStyle CssClass="gridViewRow" />
                        <AlternatingRowStyle CssClass="gridViewAltRow" />
                        <SelectedRowStyle CssClass="gridViewSelRow" />
                        <Columns>
                            <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                                <HeaderStyle Width="20px" />
                                <ItemStyle Width="20px" />
                                <ItemTemplate>
                                    <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" meta:resourcekey="ItemIconResource2"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserName" HeaderText="Recipient" SortExpression="UserName" meta:resourcekey="BoundFieldResource5">
                                <HeaderStyle CssClass="gridViewHeader" Width="140px" />
                            </asp:BoundField>                                    
                            <asp:BoundField DataField="ParentGroupID" HeaderText="Status" SortExpression="ParentGroupID" meta:resourcekey="BoundFieldResource6">
                                <HeaderStyle CssClass="gridViewHeader" Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Action Item" SortExpression="Name" meta:resourcekey="BoundFieldResource7">
                                <HeaderStyle CssClass="gridViewHeader" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" meta:resourcekey="BoundFieldResource8">
                                <HeaderStyle CssClass="gridViewHeader" Width="60px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="ShowModuleID" HeaderText="Related Module" SortExpression="ShowModuleID" meta:resourcekey="BoundFieldResource9">
                                <HeaderStyle CssClass="gridViewHeader" Width="120px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="ShowID" HeaderText="Related ID" SortExpression="ShowID" meta:resourcekey="BoundFieldResource10">
                                <HeaderStyle CssClass="gridViewHeader" Width="100px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="DateDue" HeaderText="Due Date" SortExpression="DateDue" meta:resourcekey="BoundFieldResource11">
                                <HeaderStyle CssClass="gridViewHeader" Width="120px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="SenderName" HeaderText="Sent By" SortExpression="SenderName" meta:resourcekey="BoundFieldResource12">
                                <HeaderStyle CssClass="gridViewHeader" Width="140px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="SendDate" HeaderText="Sent Date" SortExpression="SendDate" meta:resourcekey="BoundFieldResource13">
                                <HeaderStyle CssClass="gridViewHeader" Width="120px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="AIID" HeaderText="ID" SortExpression="AIID" meta:resourcekey="BoundFieldResource14">
                                <HeaderStyle CssClass="gridViewHeader" Width="30px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="CompleteDate" HeaderText="Completed Date" SortExpression="CompleteDate" meta:resourcekey="BoundFieldResource15">
                                <HeaderStyle CssClass="gridViewHeader" Width="120px" />                          
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="IMGDIV" runat="server" class="pleaseWait">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/pleasewait.gif" meta:resourcekey="Image1Resource1" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <!-- ----------------------------------------- -->
        <asp:UpdatePanel ID="udpTreeView" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnBrowseOK" EventName="Click" />
            </Triggers>
        <ContentTemplate>
            <asp:Panel ID="pnlBrowse" runat="server" CssClass="browsePanel" meta:resourcekey="pnlBrowseResource1">
                <asp:Panel ID="pnlBrowseDrag" runat="server" CssClass="browseTitleBar" meta:resourcekey="pnlBrowseDragResource1">
                    Select Folder
                </asp:Panel>
                <asp:UpdatePanel ID="udpBrowseTree" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="browseTreeView" runat="server" CssClass="browseTree" meta:resourcekey="browseTreeViewResource1">
                        <asp:TreeView ID="tvBrowse" runat="server" ShowLines="True" NodeIndent="15" OnSelectedNodeChanged="TVBrowse_SelectedNodeChanged" OnTreeNodePopulate="TVBrowse_TreeNodePopulate" ExpandDepth="1" meta:resourcekey="tvBrowseResource1">
                            <RootNodeStyle ImageUrl="~/images/root.png" />
                            <NodeStyle ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                            <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                        </asp:TreeView>
                    </asp:Panel>
                </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Panel ID="browseButtons" runat="server" CssClass="browseButton" meta:resourcekey="browseButtonsResource1">
                    <asp:Button ID="btnBrowseOK" runat="server" Text="OK" Width="100px" OnClick="Button_Click" CommandArgument="Browse" meta:resourcekey="btnBrowseOKResource1" />
                    <asp:Button ID="btnBrowseCancel" runat="server" Text="Cancel" Width="100px" meta:resourcekey="btnBrowseCancelResource1" />
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            var elem = document.getElementById("resultlist");
            var val = document.getElementById("scrollPos").value;
            if (elem !== null) {
                setSearchScrollPos(val);
            }
        }        
    </script>
</body>
</html>
