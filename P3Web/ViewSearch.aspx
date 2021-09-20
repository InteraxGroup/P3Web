<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSearch.aspx.cs" Inherits="Paradigm3.ViewSearch" EnableEventValidation="false" Async="true" %>

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
<body class="search" onload="focus();">
    <form id="form1" runat="server" defaultbutton="btnSearch">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:HiddenField ID="scrollPos" runat="server" />
    <asp:UpdatePanel ID="udpSearch" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBrowseOK" EventName="Click" />
        </Triggers>
    <ContentTemplate>
        <div id="pnlSearch">
            <div id="pnlSearchLeft">
                <asp:TabContainer ID="TabContainer1" runat="server" Width="750px" Height="200px" BackColor="#F0F0F0">
                    <asp:TabPanel ID="TabGeneral" runat="server" HeaderText="General">
                        <ContentTemplate>
                            <div class="tdCell" style="width: 100px;">
                                In Module
                            </div>
                            <div class="tdCell" style="width: 420px;">
                                <asp:DropDownList ID="DDLModule" runat="server" Width="400px" AutoPostBack="true" OnSelectedIndexChanged="DDL_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="tdCell" style="width:200px">
                                <asp:CheckBox ID="CHKGroupOrigID" runat="server" Checked="true" Text="Group by OrigiD" />
                            </div>
                            <div class="tdCell" style="clear:both; width: 100px;" >
                                In Folder
                            </div>
                            <div class="tdCell" style="width:630px;">
                                <asp:TextBox ID="txtFolder" runat="server" Width="593px" ReadOnly="true" BackColor="#F0F0F0" />
                            </div>
                            <div class="tdCell" style="clear: both; width: 96px;">

                            </div>
                            <div class="tdCell" style="width: 200px">
                                <asp:CheckBox ID="chkSubGroup" runat="server" Text="Include Subgroups" Checked="true" />
                            </div>
                            <div class="tdCell" style="width: 200px">
                                <asp:CheckBox ID="chkWithdrawn" runat="server" Text="Withdrawn Items Only" Checked="false" />
                            </div>
                            <div class="tdCell" style="width: 202px; justify-content: flex-end;">
                                <asp:Button ID="btnBrowse" runat="server" Text="Browse" />
                                <asp:ModalPopupExtender ID="BrowsePopUp" runat="server" PopupControlID="pnlBrowse" TargetControlID="btnBrowse"
                                    Drag="true" PopupDragHandleControlID="pnlBrowseDrag" CancelControlID="btnBrowseCancel" 
                                    BackgroundCssClass="modalBackground" />
                            </div>
                            <div class="tdCell" style="clear: both;width : 100px;">
                                In Field
                            </div>
                            <div class="tdCell" style="width: 600px">
                                <asp:DropDownList ID="DDLField" runat="server" Width="598px" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="DDL_SelectedIndexChanged" />
                            </div>
                            <div class="tdCell" style="clear: both; width: 100px;">
                                Search
                            </div>
                            <div class="tdCell" style="width:630px;">
                                <asp:TextBox ID="txtSearch" runat="server" Width="594px" />
                                <asp:DropDownList ID="DDLSearch" runat="server" Width="598px" />
                                <asp:TextBox ID="txtStartDate" runat="server" Width="150px" />
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate" />&nbsp;
                                <asp:Label ID="lblTo" runat="server" Text=" to " />&nbsp;
                                <asp:TextBox ID="txtEndDate" runat="server" Width="150px" />
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate" />
                            </div>
                            <div class="tdCell" style="clear: both; width: 100px;">
                                <asp:Label ID="lblConvertedBy" runat="server" Text="Converted by" />
                            </div>
                            <div class="tdCell" style="width: 630px;">
                                <asp:DropDownList ID="DDLConvertedBy" runat="server" Width="200px" />      
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabRoles" runat="server" HeaderText="Roles">
                        <ContentTemplate>
                            <div class="tabPanel">
                                <div class="tdCell" style="width: 100px;">
                                    Roles
                                </div>
                                <div class="tdCell" style="clear: both;width: 700px;">
                                    <asp:DropDownList ID="DDLRoles" runat="server" Width="700" AutoPostBack="true" OnSelectedIndexChanged="DDL_SelectedIndexChanged" />
                                </div>
                                <div class="tdCell" style="width: 100px;">
                                    Role Members
                                </div>
                                <div class="tdCell" style="clear:both; width: 700px;">
                                    <asp:DropDownList ID="DDLRoleAssigned" runat="server" Width="700px" />
                                </div>                     
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabCategory" runat="server" HeaderText="Category">
                        <ContentTemplate>
                            <div class="categoryList">
                                <asp:CheckBoxList ID="cblCategory" runat="server" TextAlign="Right" BorderStyle="None">
                                </asp:CheckBoxList>
                            </div>                            
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabStyle" runat="server" HeaderText="Style Fields">
                        <ContentTemplate>
                            <table style="width: 100%; padding: 0px">
                                <tr class="trRow">
                                    <td class="tdHeader">
                                        Styles:
                                    </td>
                                    <td style="width: 600px">
                                        <asp:DropDownList ID="ddlStyles" runat="server" Width="400px" AutoPostBack="true" AppendDataBoundItems="true" Enabled="false" OnSelectedIndexChanged="DDL_SelectedIndexChanged">
                                            <asp:ListItem Text="-- Select --" Value="0" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr class="trRow">
                                    <td colspan="2">
                                        Select Field:
                                    </td>
                                </tr>
                                <tr class="trRow">
                                    <td colspan="2">
                                        <asp:DropDownList ID="ddlObjField" runat="server" Width="300px" AutoPostBack="true" AppendDataBoundItems="true" Visible="false" OnSelectedIndexChanged="DDL_SelectedIndexChanged">
                                            <%--<asp:ListItem Text="-- Select --" Value="0" />--%>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlModify" runat="server" Width="100px" AutoPostBack="true" Visible="false" />
                                        <asp:TextBox ID="txtSearchString" runat="server" Width="300px" Visible="false" />
                                        <asp:DropDownList ID="ddlMod" runat="server" Width="100px" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDL_SelectedIndexChanged" />
                                        <asp:TextBox ID="txtDateStart" runat="server" Width="100px" Visible="false" />
                                        <asp:CalendarExtender ID="ceDateStart" runat="server" TargetControlID="txtDateStart" />
                                        <asp:TextBox ID="txtNumStart" runat="server" Width="100px" Visible="false" />
                                        <asp:Label ID="lblModTo" runat="server" Text="and" Visible="false" />
                                        <asp:TextBox ID="txtDateEnd" runat="server" Width="100px" Visible="false" />
                                        <asp:CalendarExtender ID="ceDateEnd" runat="server" TargetControlID="txtDateEnd" />                                        
                                        <asp:TextBox ID="txtNumEnd" runat="server" Width="100px" Visible="false" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </div>
            <div id="pnlSearchRight">
                <asp:Button ID="btnSearch" runat="server" Text="Search" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="Search" />
                <asp:Button ID="btnClear" runat="server" Text="Clear Search" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="Clear" Visible="false" Enabled="false" />
                <asp:Button ID="btnShowMe" runat="server" Text="Show Me" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="ShowMe" Visible="false" Enabled="false" />
                <asp:Button ID="btnGo" runat="server" Text="Go There" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="GoThere" Visible="false" Enabled="false" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="110px" CssClass="searchButton" OnClick="Button_Click" CommandArgument="Cancel" />
            </div>
        </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="udpResults" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnClear" EventName="Click" />
        </Triggers>
    <ContentTemplate>
        <asp:Panel ID="pnlResults" runat="server" CssClass="resultsPanel">
            <div id="pnlSearchResults">
                <div class="searchResultsCounter">
                    <asp:Label ID="lblResultCount" runat="server" ForeColor="#F0F0F0" Font-Bold="true" />
                </div>
                <div id="resultlist" class="searchResultsList">
                    <asp:GridView ID="gvSearchResults" runat="server" CssClass="gridView" 
						Width="100%" 
						AutoGenerateColumns="False"
						GridLines="None" OnRowDataBound="GV_RowDataBound" 
						AllowSorting="true" 
						OnSorting="Sort_GV">
                        <HeaderStyle CssClass="gridViewHeader" />
                        <RowStyle CssClass="gridViewRow" />
                        <AlternatingRowStyle CssClass="gridViewAltRow" />
                        <SelectedRowStyle CssClass="gridViewSelRow" />
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <HeaderStyle Width="20px" />
                                <ItemStyle Width="20px" />
                                <ItemTemplate>
                                    <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                <HeaderStyle CssClass="gridViewHeader" />
                            </asp:BoundField>                                    
                            <asp:BoundField DataField="LabelName" HeaderText="Label" SortExpression="LabelName">
                                <HeaderStyle CssClass="gridViewHeader" Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version">
                                <HeaderStyle CssClass="gridViewHeader" Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OrigID" HeaderText="OrigID" SortExpression="OrigID">
                                <HeaderStyle CssClass="gridViewHeader" Width="50px" />                          
                            </asp:BoundField>                            
                        </Columns>
                    </asp:GridView>
                    <asp:GridView ID="gvAISearchResults" runat="server" 
						CssClass="gridView" 
						Width="1400px" 
						AutoGenerateColumns="False" 
						DataKeyNames="AIID, ShowModuleID" 
						GridLines="None" 
						OnRowDataBound="GV_RowDataBound" 
						AllowSorting="true" 
						OnSorting="Sort_GV">
                        <HeaderStyle CssClass="gridViewHeader" />
                        <RowStyle CssClass="gridViewRow" />
                        <AlternatingRowStyle CssClass="gridViewAltRow" />
                        <SelectedRowStyle CssClass="gridViewSelRow" />
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <HeaderStyle Width="20px" />
                                <ItemStyle Width="20px" />
                                <ItemTemplate>
                                    <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserName" HeaderText="Recipient" SortExpression="UserName">
                                <HeaderStyle CssClass="gridViewHeader" Width="140px" />
                            </asp:BoundField>                                    
                            <asp:BoundField DataField="ParentGroupID" HeaderText="Status" SortExpression="ParentGroupID">
                                <HeaderStyle CssClass="gridViewHeader" Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Action Item" SortExpression="Name">
                                <HeaderStyle CssClass="gridViewHeader" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority">
                                <HeaderStyle CssClass="gridViewHeader" Width="60px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="ShowModuleID" HeaderText="Related Module" SortExpression="ShowModuleID">
                                <HeaderStyle CssClass="gridViewHeader" Width="120px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="ShowID" HeaderText="Related ID" SortExpression="ShowID">
                                <HeaderStyle CssClass="gridViewHeader" Width="100px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="DateDue" HeaderText="Due Date" SortExpression="DateDue">
                                <HeaderStyle CssClass="gridViewHeader" Width="120px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="SenderName" HeaderText="Sent By" SortExpression="SenderName">
                                <HeaderStyle CssClass="gridViewHeader" Width="140px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="SendDate" HeaderText="Sent Date" SortExpression="SendDate">
                                <HeaderStyle CssClass="gridViewHeader" Width="120px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="AIID" HeaderText="ID" SortExpression="AIID">
                                <HeaderStyle CssClass="gridViewHeader" Width="30px" />                          
                            </asp:BoundField>
                            <asp:BoundField DataField="CompleteDate" HeaderText="Completed Date" SortExpression="CompleteDate">
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
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/pleasewait.gif" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <!-- ----------------------------------------- -->
        <asp:UpdatePanel ID="udpTreeView" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnBrowseOK" EventName="Click" />
            </Triggers>
        <ContentTemplate>
            <asp:Panel ID="pnlBrowse" runat="server" CssClass="browsePanel">
                <asp:Panel ID="pnlBrowseDrag" runat="server" CssClass="browseTitleBar">
                    Select Folder
                </asp:Panel>
                <asp:UpdatePanel ID="udpBrowseTree" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Panel ID="browseTreeView" runat="server" CssClass="browseTree">
                        <asp:TreeView ID="tvBrowse" runat="server" ShowLines="True" NodeIndent="15" OnSelectedNodeChanged="TVBrowse_SelectedNodeChanged" OnTreeNodePopulate="TVBrowse_TreeNodePopulate" ExpandDepth="1">
                            <RootNodeStyle ImageUrl="~/images/root.png" />
                            <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                            <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                        </asp:TreeView>
                    </asp:Panel>
                </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Panel ID="browseButtons" runat="server" CssClass="browseButton">
                    <asp:Button ID="btnBrowseOK" runat="server" Text="OK" Width="100px" OnClick="Button_Click" CommandArgument="Browse" />
                    <asp:Button ID="btnBrowseCancel" runat="server" Text="Cancel" Width="100px" />
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
