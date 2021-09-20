<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPropertiesUser.aspx.cs" Inherits="Paradigm3.ViewPropertiesUser" Async="true" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>P3Web - User Properties</title>
	<link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body style="padding: 0; margin: 0; overflow: hidden;">
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="u-prop-main">
            <div class="u-prop-content">
                <asp:TabContainer ID="tcUserDetails" runat="server" Width="100%" Height="450px">
                    <asp:TabPanel ID="tpGeneral" runat="server" HeaderText="General">
                        <ContentTemplate>
                            <div class="u-prop-tabcontent">
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">Login Name:</div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtLoginName" runat="server" MaxLength="255" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">First Name:</div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtFirstName" runat="server" style="width: 230px;" MaxLength="255" />
                                    </div>
                                    <div class="u-prop-field-label" style="flex: 0 0 80px; text-align: center;">Last Name:</div>
                                    <div class="u-prop-field" style="flex: 0 0 270px;">
                                        <asp:TextBox ID="txtLastName" runat="server" style="width: 244px;" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">Password:</div>
                                    <div class="u-prop-field"><asp:TextBox ID="txtPasssword" runat="server" TextMode="Password" MaxLength="255" /></div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">Confirm Password:</div>
                                    <div class="u-prop-field"><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" MaxLength="255" /></div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">Email:</div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="255" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">Mobile Number:</div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtMobileNumber" runat="server" MaxLength="15" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">Spare Field 1:</div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtSF1" runat="server" MaxLength="255" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">Spare Field 2:</div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtSF2" runat="server" MaxLength="255" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">Spare Field 3:</div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtSF3" runat="server" Width="200px" MaxLength="50" />
                                        <asp:CalendarExtender ID="cetxtSF3" runat="server" TargetControlID="txtSF3" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label">Spare Field 4:</div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtSF4" runat="server" Width="200px" MaxLength="50" />
                                        <asp:CalendarExtender ID="cetxtSF4" runat="server" TargetControlID="txtSF4" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-lastrow">
                                    <div class="u-prop-field-label" style="align-items: flex-start;">Description:</div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>                        
                    </asp:TabPanel>
                    <asp:TabPanel ID="tpMembership" runat="server" HeaderText="Membership">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="udpMembership" runat="server" ChildrenAsTriggers="true">
                            <ContentTemplate>
                            <div class="u-prop-tabcontent" style="border: none;">
                                <div class="u-prop-mem-row1">
                                    <div class="u-mem-license-type">
                                        <fieldset style="display: flex; flex-direction: column; height: 100%; border: 1px solid #dcdcdc;">
                                            <legend>What level of access do you want to grant this user</legend>
                                            <div class="u-mem-lt-row">
                                                <asp:RadioButton ID="rbExtenalUser" runat="server" Text="External User" AutoPostBack="true" OnCheckedChanged="rb_CheckedChanged" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                External account users CANNOT access any modules
                                            </div>
                                            <div class="u-mem-lt-row">
                                                <asp:RadioButton ID="rbRestricted" runat="server" Text="Restricted" AutoPostBack="true" OnCheckedChanged="rb_CheckedChanged" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                Restricted account users can only use certain fixed functions of the selected modules
                                            </div>
                                            <div class="u-mem-lt-row">
                                                <asp:RadioButton ID="rbNormal" runat="server" Text="Normal" AutoPostBack="true" OnCheckedChanged="rb_CheckedChanged" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                Standard account users can use the selected modules for normal operation
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                <asp:CheckBox ID="chkDefReq" runat="server" Text="Can set definitions and requirements and manage assessments" TextAlign="Right" Enabled="false" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                <asp:CheckBox ID="chkTrainingAnalysis" runat="server" Text="Can do Training Analysis" TextAlign="Right" Enabled="false" />
                                                <asp:CheckBox ID="chkViewOtherAssessment" runat="server" Text="View Other's Assessment" TextAlign="Right" Enabled="false" />
                                            </div>
                                            <div class="u-mem-lt-row">
                                                <asp:RadioButton ID="rbAdministrator" runat="server" Text="Adminstrator" AutoPostBack="true" OnCheckedChanged="rb_CheckedChanged" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                Administrators have complete access to all modules and can make desired changes to settings
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="u-mem-module-access">
                                        <fieldset style="display: flex; flex-direction: column; height: 100%; border: 1px solid #dcdcdc;">
                                            <legend>Modules accessible for this user</legend>
                                            <div style="border: 1px solid #dcdcdc;">
                                                <asp:CheckBoxList ID="cblModules" runat="server" CssClass="checkboxlist">
                                                    <asp:ListItem Value="1"><img src="images/users.png" /> Users</asp:ListItem>
                                                    <asp:ListItem Value="3"><img src="images/document.png" /> Documentation</asp:ListItem>
                                                    <asp:ListItem Value="4"><img src="images/record.png" /> Records</asp:ListItem>
                                                    <asp:ListItem Value="6"><img src="images/improvement.png" /> Improvements</asp:ListItem>
                                                    <asp:ListItem Value="12"><img src="images/training.png" /> Training</asp:ListItem>
                                                    <asp:ListItem Value="14"><img src="images/actionitem.png" /> Action Items</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="u-prop-mem-row2">
                                    <div class="membership-label">Member of:</div>
                                    <div class="membership-list">
                                        <asp:GridView ID="gvMemberships" runat="server" 
                                            DataKeyNames="GroupID,Name" 
                                            CssClass="gridView"
                                            GridLines="None" 
                                            ShowHeader="false" 
                                            ShowFooter="false" 
                                            AutoGenerateColumns="false" OnRowDataBound="GV_RowDataBound">
                                            <RowStyle CssClass="gridViewRow" />
                                            <SelectedRowStyle CssClass="gridViewSelRow" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemStyle Width="20px" />
                                                    <ItemTemplate>
                                                        <img src="images/entity.png" style="width: 16px;" />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>                                    
                                </div>
                                <div class="u-prop-mem-row3">
                                    <asp:Button ID="btnAddMembership" runat="server" Text="Add" Width="70px" />
                                    &nbsp;
                                    <asp:Button ID="btnRemoveMembership" runat="server" Text="Remove" Width="70px" OnClick="btnRemoveMembership_Click" />
                                </div>
                            </div>
                            <asp:Panel ID="pnlAddMemberships" runat="server" CssClass="u-other-add-panel">
                                <div class="u-other-add-title">
                                    <img src="images/P3_32.ico" />
                                    Select Entity
                                </div>
                                <div class="u-other-add-content">
                                    <div class="u-other-add-left">
                                        <asp:TreeView ID="p3Tree2" runat="server" ShowLines="true"
                                            EnableClientScript="false"
                                            NodeIndent="15"
                                            ExpandDepth="1" RootNodeStyle-ImageUrl="~/images/entity.png" NodeStyle-ImageUrl="~/images/entity.png"
                                            OnTreeNodePopulate="P3Tree_TreeNodePopulate"
                                            OnSelectedNodeChanged="P3Tree_SelectedNodeChanged" 
                                            OnTreeNodeCollapsed="p3Tree_TreeNodeCollapsedExpanded" 
                                            OnTreeNodeExpanded="p3Tree_TreeNodeCollapsedExpanded">
                                            <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" />
                                            <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                                        </asp:TreeView>
                                     </div>
                                    <div class="u-other-add-center">
                                        <asp:Button ID="btnAddMember" runat="server" Text="Add >" CssClass="u-other-button" OnClick="Button_Click" CommandArgument="AddMemberToList" />
                                        <asp:Button ID="btnRemoveMember" runat="server" Text="< Remove" CssClass="u-other-button" OnClick="Button_Click" CommandArgument="RemoveMemberFromList" /> 
                                    </div>
                                    <div class="u-other-add-right">
                                        <asp:GridView ID="gvMembers" runat="server" 
                                            DataKeyNames="ControlID,ControlFullName,ControlType" 
                                            CssClass="gridView"
                                            GridLines="None" 
                                            ShowHeader="true" 
                                            ShowFooter="false" 
                                            AutoGenerateColumns="false" OnRowDataBound="GV_RowDataBound" OnSelectedIndexChanged="GV_SelectedIndexChanged">
                                            <HeaderStyle CssClass="gridViewHeader" />
                                            <RowStyle CssClass="gridViewRow" />
                                            <SelectedRowStyle CssClass="gridViewSelRow" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemStyle Width="20px" />
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgAddedIcon" runat="server" ImageUrl="images/entity.png" style="width: 16px;" />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ControlFullName" HeaderText="Name" />
                                                <asp:BoundField DataField="ControlType" HeaderText="Type" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="u-other-add-buttons">
                                    <div>
                                        <asp:Button ID="btnCommitAddMembers" runat="server" Text="OK" Width="70px" OnClick="Button_Click" CommandArgument="UpdateWithNewMembers" />
                                        <asp:Button ID="btnCancelAddMember" runat="server" Text="Cancel" Width="70px" OnClick="Button_Click" CommandArgument="CancelMemberChanges" />
                                    </div>                                        
                                </div>
                            </asp:Panel>
                                <asp:ModalPopupExtender ID="mpeAddMemberShips" runat="server" 
                                    TargetControlID="btnAddMembership" 
                                    PopupControlID="pnlAddMemberShips" 
                                    BackgroundCssClass="modalBackground">
                                </asp:ModalPopupExtender>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="tpOptions" runat="server" HeaderText="Options">
                        <ContentTemplate>
                            <div class="u-prop-tabcontent" style="border: none;">
                                <div class="u-opt-row">
                                    <asp:CheckBox ID="cbChangePassword" runat="server" Text="Prompt the user to change password at next login" TextAlign="Right" />
                                </div>
                                <div class="u-opt-row">
                                    <asp:CheckBox ID="cbDisableUser" runat="server" Text="Disable user's account" TextAlign="Right" />
                                </div>
                                <div class="u-opt-row" style="flex: 0 0 144px; display: flex; flex-direction: column; align-items: stretch;">
                                    <fieldset style="display: flex;flex-direction: column; justify-content: flex-start; border: 1px solid #dcdcdc;">
                                        <legend>Email Notification of Action Item</legend>
                                        <div class="u-opt-row">
                                             <asp:CheckBox ID="cbEmailSummary" runat="server" Text="Email summary of all open Action Items" TextAlign="Right" />
                                        </div>
                                        <div class="u-opt-row">
                                             <asp:CheckBox ID="cbEmailAll" runat="server" Text="Email all Event Action Item" TextAlign="Right" />
                                        </div>
                                        <div class="u-opt-row">
                                             <asp:CheckBox ID="cbEmailUrgent" runat="server" Text="Email urgent Action Item ONLY" TextAlign="Right" />
                                        </div>
                                        <div class="u-opt-row">
                                             <asp:CheckBox ID="cbEmailStep" runat="server" Text="Email notification of step, send, reply, and forward Action Item" TextAlign="Right" />
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="u-opt-row">
                                    <asp:CheckBox ID="cbSMS" runat="server" Text="SMS notification of step, send, reply, and forward Action Items" TextAlign="Right" />
                                </div>
                                <div class="u-opt-row" style="display: flex; flex-direction: row;">
                                    <div style="flex: 0 0 200px;">Set User Language:</div>
                                    <div style="flex: 1 1 auto;">
                                        <asp:DropDownList ID="ddlLanguage" runat="server">
                                            <asp:ListItem Value="en-US">English</asp:ListItem>
                                            <asp:ListItem Value="FR">Fran&ccedil;ais</asp:ListItem>
                                            <asp:ListItem Value="es-es">Spanish/Espa&ntilde;ol</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="u-opt-row">
                                    <asp:CheckBox ID="cbHeaderFooter" runat="server" Text="User can apply Header/Footer" TextAlign="Right" />
                                </div>
                                <div class="u-ops-row" style="flex: 1 1 auto;"></div>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="tpTraining" runat="server" HeaderText="Training">
                        <ContentTemplate>
                            <div class="u-prop-tabcontent" style="border: none;">
                                <div class="u-prop-gen-row">
                                    Training Records:
                                </div>
                                <div class="u-prop-gen-row" style="flex: 1 1 auto; align-items: flex-start; padding: 0; border: 1px solid #dcdcdc; overflow-x: hidden; overflow-y: auto;">
                                    <asp:GridView ID="gvUserTraining" runat="server" Width="740px"
                                        DataKeyNames="ItemID,OrigID,Name,ParentGroupID"
                                        CssClass="gridView"
                                        GridLines="None"
                                        ShowFooter="false" 
                                        AutoGenerateColumns="false" OnRowDataBound="GV_RowDataBound">
                                        <HeaderStyle CssClass="gridViewHeader" />
                                        <RowStyle CssClass="gridViewRow" />
                                        <SelectedRowStyle CssClass="gridViewSelRow" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemStyle Width="20px" />
                                                <ItemTemplate>
                                                    <asp:Image ID="imgIcon" runat="server" Width="16px" ImageUrl="~/images/training.png" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" />
                                            <asp:BoundField DataField="LabelName" HeaderText="Label" ItemStyle-Width="200px" />
                                            <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="65px" />
                                            <asp:BoundField DataField="Version" HeaderText="Version" ItemStyle-Width="55px" />
                                            <asp:BoundField DataField="VersionDate" HeaderText="Version Date" ItemStyle-Width="120px" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="u-prop-gen-row">
                                    <asp:Button ID="btnShowMeTraining" runat="server" Text="Show Me" Width="80px" OnClick="Button_Click" CommandArgument="ShowMe" />&nbsp;
                                    <asp:Button ID="btnGoThereTraining" runat="server" Text="Go There" Width="80px" OnClick="Button_Click" CommandArgument="GoThere" />&nbsp;
                                    <asp:Button ID="btnExportTraining" runat="server" Text="Export List" Width="80px" />
                                </div>
                                <asp:Panel ID="pnlExportTraining" runat="server" CssClass="u-train-exportpanel">
                                    <div class="u-train-export-title">
                                        <img src="images/P3_32.ico" />
                                        Export Data
                                    </div>
                                    <div class="u-train-export-label">Export Data</div>
                                    <div class="u-train-export-field">
                                        <div>Select Column</div>
                                        <asp:CheckBoxList ID="cblTrainColumns" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbl_SelectedIndexChanged">
                                            <asp:ListItem Value="1" Text="Name"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Label"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Status"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Version"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="VersionDate"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                    <div class="u-train-export-buttons">
                                        <div>
                                            <asp:Button ID="btnCheckAllTrainColumns" runat="server" Text="Check All" OnClick="Button_Click" CommandArgument="CheckAll" />&nbsp;
                                            <asp:Button ID="btnUncheckAllTrainColumns" runat="server" Text="Uncheck All" OnClick="Button_Click" CommandArgument="UncheckAll" />
                                        </div>
                                        <div>
                                            <asp:Button ID="btnSubmitExportTraining" runat="server" Text="Export" OnClick="Button_Click" CommandArgument="ExportTraining" Enabled="false" />&nbsp;
                                            <asp:Button ID="btnCancelExportTraining" runat="server" Text="Cancel" />
                                        </div>                                        
                                    </div>                                    
                                </asp:Panel>
                                <asp:ModalPopupExtender ID="mpeExportTraining" runat="server" 
                                    PopupControlID="pnlExportTraining" 
                                    TargetControlID="btnExportTraining"
                                    BackgroundCssClass="modalBackground"
                                    CancelControlID="btnCancelExportTraining">
                                </asp:ModalPopupExtender>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="tpOtherUserAI" runat="server" HeaderText="Other Users Action Item">
                        <ContentTemplate>
                            <div class="u-prop-tabcontent" style="border: none;">
                                <div class="u-prop-gen-row">
                                    This user can view the following User(s)/Entities' Action Items:
                                </div>
                                <div class="u-prop-gen-row" style="border: 1px solid #000; flex: 1 1 auto; align-items: flex-start; padding: 0; overflow-x: hidden; overflow-y: auto;">
                                    <asp:GridView ID="gvOtherUserAI" runat="server" 
                                        CssClass="gridView" 
                                        DataKeyNames="ControlID,ControlFullName,ControlType" 
                                        AutoGenerateColumns="false" 
                                        GridLines="None" 
                                        Width="750px" 
                                        OnRowDataBound="GV_RowDataBound">
                                        <HeaderStyle CssClass="gridViewHeader" />
                                        <RowStyle CssClass="gridViewRow" />
                                        <SelectedRowStyle CssClass="gridViewSelRow" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemStyle Width="20px" />
                                                <ItemTemplate>
                                                    <asp:Image ID="imgTypeIcon" runat="server" Width="16px" ImageUrl="~/images/entity.png" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ControlFullName" HeaderText="Name" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" ItemStyle-Width="100px" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="u-prop-gen-row" style="justify-content: flex-end;">
                                    <asp:Button ID="btnAddUserAI" runat="server" Text="Add" Width="70px" OnClick="Button_Click" CommandArgument="AddUserEntity" />&nbsp;
                                    <asp:Button ID="btnRemoveUserAI" runat="server" Text="Remove" Width="70px" />
                                    <asp:Button ID="btnOpenModal" runat="server" style="display: none;" />
                                </div>
                                <asp:Panel ID="pnlAddOtherUserAI" runat="server" CssClass="u-other-add-panel">
                                    <div class="u-other-add-title">
                                        <img src="images/P3_32.ico" />
                                        Select User/Entity
                                    </div>
                                    <div class="u-other-add-content">
                                        <div class="u-other-add-left">
                                            <asp:TreeView ID="p3Tree" runat="server" ShowLines="true"
                                                EnableClientScript="false"
                                                NodeIndent="15"
                                                ExpandDepth="1"
                                                OnTreeNodePopulate="P3Tree_TreeNodePopulate"
                                                OnSelectedNodeChanged="P3Tree_SelectedNodeChanged" 
                                                OnTreeNodeCollapsed="p3Tree_TreeNodeCollapsedExpanded" 
                                                OnTreeNodeExpanded="p3Tree_TreeNodeCollapsedExpanded">
                                                <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" />
                                                <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                                            </asp:TreeView>
                                        </div>
                                        <div class="u-other-add-center">
                                            <asp:Button ID="btnAddToList" runat="server" Text="Add >" CssClass="u-other-button" OnClick="Button_Click" CommandArgument="AddToList" />
                                            <asp:Button ID="btnRemoveFromList" runat="server" Text="< Remove" CssClass="u-other-button" OnClick="Button_Click" CommandArgument="RemoveFromList" /> 
                                        </div>
                                        <div class="u-other-add-right">
                                            <asp:GridView ID="gvAdded" runat="server" 
                                            DataKeyNames="ControlID,ControlFullName,ControlType" 
                                            CssClass="gridView"
                                            GridLines="None" 
                                            ShowHeader="true" 
                                            ShowFooter="false" 
                                            AutoGenerateColumns="false" OnRowDataBound="GV_RowDataBound" OnSelectedIndexChanged="GV_SelectedIndexChanged">
                                            <HeaderStyle CssClass="gridViewHeader" />
                                            <RowStyle CssClass="gridViewRow" />
                                            <SelectedRowStyle CssClass="gridViewSelRow" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemStyle Width="20px" />
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgAddedIcon" runat="server" ImageUrl="images/entity.png" style="width: 16px;" />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ControlFullName" HeaderText="Name" />
                                                <asp:BoundField DataField="ControlType" HeaderText="Type" />
                                            </Columns>
                                        </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="u-other-add-buttons">
                                        <div>
                                            <asp:Button ID="btnSubmitOtherUserChange" runat="server" Text="OK" Width="70px" OnClick="Button_Click" CommandArgument="UpdateWithNewUsers" />
                                            <asp:Button ID="btnCancelOtherUserChange" runat="server" Text="Cancel" Width="70px" OnClick="Button_Click" CommandArgument="CancelOtherUserChanges" />
                                        </div>                                        
                                    </div>
                                </asp:Panel>
                                <asp:ModalPopupExtender ID="mpeOtherUserAI" runat="server"
                                    TargetControlID="btnOpenModal" 
                                    PopupControlID="pnlAddOtherUserAI" 
                                    BackgroundCssClass="modalBackground">
                                </asp:ModalPopupExtender>
                            </div>
                        </ContentTemplate>                        
                    </asp:TabPanel>
                </asp:TabContainer>
            </div>
            <div class="u-prop-controls">
                <asp:Button ID="btnOK" runat="server" Text="OK" Width="70" OnClick="btnOK_Click" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70" OnClientClick="window.close();" />
            </div>            
        </div>
    </form>
</body>
</html>
