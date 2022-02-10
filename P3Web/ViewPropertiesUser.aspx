<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPropertiesUser.aspx.cs" Inherits="Paradigm3.ViewPropertiesUser" meta:resourcekey="PageResource1" EnableEventValidation="false" Async="true" %>
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
        <asp:Label ID="lblUserID" runat="server" meta:resourcekey="lblUserIDResource1"></asp:Label>
        <div class="u-prop-main">
            <div class="u-prop-content">
                <asp:TabContainer ID="tcUserDetails" runat="server" Width="100%" Height="450px" ActiveTabIndex="0" meta:resourcekey="tcUserDetailsResource1">
                    <asp:TabPanel ID="tpGeneral" runat="server" HeaderText="General" meta:resourcekey="tpGeneralResource1">
                        <ContentTemplate>
                            <div class="u-prop-tabcontent">
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("LoginNameLabel") %></div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtLoginName" runat="server" MaxLength="255" meta:resourcekey="txtLoginNameResource1" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("FirstNameLabel") %></div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtFirstName" runat="server" style="width: 230px;" MaxLength="255" meta:resourcekey="txtFirstNameResource1" />
                                    </div>
                                    <div class="u-prop-field-label" style="flex: 0 0 80px; text-align: center;"><%= GetLocalResourceObject("LastNameLabel") %></div>
                                    <div class="u-prop-field" style="flex: 0 0 270px;">
                                        <asp:TextBox ID="txtLastName" runat="server" style="width: 244px;" meta:resourcekey="txtLastNameResource1" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("PasswordLabel") %></div>
                                    <div class="u-prop-field"><asp:TextBox ID="txtPasssword" runat="server" TextMode="Password" MaxLength="255" meta:resourcekey="txtPassswordResource1" /></div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("ConfirmPasswordLabel") %></div>
                                    <div class="u-prop-field"><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" MaxLength="255" meta:resourcekey="txtConfirmPasswordResource1" /></div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("EmailLabel") %></div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="255" meta:resourcekey="txtEmailResource1" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("MobileNumberLabel") %></div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtMobileNumber" runat="server" MaxLength="15" meta:resourcekey="txtMobileNumberResource1" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("SpareField1Label") %></div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtSF1" runat="server" MaxLength="255" meta:resourcekey="txtSF1Resource1" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("SpareField2Label") %></div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtSF2" runat="server" MaxLength="255" meta:resourcekey="txtSF2Resource1" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("SpareField3Label") %></div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtSF3" runat="server" Width="200px" MaxLength="50" meta:resourcekey="txtSF3Resource1" />
                                        <asp:CalendarExtender ID="cetxtSF3" runat="server" TargetControlID="txtSF3" BehaviorID="cetxtSF3" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-row">
                                    <div class="u-prop-field-label"><%= GetLocalResourceObject("SpareField4Label") %></div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtSF4" runat="server" Width="200px" MaxLength="50" meta:resourcekey="txtSF4Resource1" />
                                        <asp:CalendarExtender ID="cetxtSF4" runat="server" TargetControlID="txtSF4" BehaviorID="cetxtSF4" />
                                    </div>
                                </div>
                                <div class="u-prop-gen-lastrow">
                                    <div class="u-prop-field-label" style="align-items: flex-start;"><%= GetLocalResourceObject("DescriptionLabel") %></div>
                                    <div class="u-prop-field">
                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" meta:resourcekey="txtDescriptionResource1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>                        
                    </asp:TabPanel>
                    <asp:TabPanel ID="tpMembership" runat="server" HeaderText="Membership" meta:resourcekey="tpMembershipResource1">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="udpMembership" runat="server">
                            <ContentTemplate>
                            <div class="u-prop-tabcontent" style="border: none;">
                                <div class="u-prop-mem-row1">
                                    <div class="u-mem-license-type">
                                        <fieldset style="display: flex; flex-direction: column; height: 100%; border: 1px solid #dcdcdc;">
                                            <legend><%= GetLocalResourceObject("AccessLevelLabel") %></legend>
                                            <div class="u-mem-lt-row">
                                                <asp:RadioButton ID="rbExtenalUser" runat="server" Text="External User" AutoPostBack="True" OnCheckedChanged="rb_CheckedChanged" meta:resourcekey="rbExtenalUserResource1" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                <%= GetLocalResourceObject("ExternalDescriptionLabel") %>
                                            </div>
                                            <div class="u-mem-lt-row">
                                                <asp:RadioButton ID="rbRestricted" runat="server" Text="Restricted" AutoPostBack="True" OnCheckedChanged="rb_CheckedChanged" meta:resourcekey="rbRestrictedResource1" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                <%= GetLocalResourceObject("RestrictedDescriptionLabel") %>
                                            </div>
                                            <div class="u-mem-lt-row">
                                                <asp:RadioButton ID="rbNormal" runat="server" Text="Normal" AutoPostBack="True" OnCheckedChanged="rb_CheckedChanged" meta:resourcekey="rbNormalResource1" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                <%= GetLocalResourceObject("NormalDescriptionLabel") %>
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                <asp:CheckBox ID="chkDefReq" runat="server" Text="Can set definitions and requirements and manage assessments" Enabled="False" meta:resourcekey="chkDefReqResource1" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                <asp:CheckBox ID="chkTrainingAnalysis" runat="server" Text="Can do Training Analysis" Enabled="False" meta:resourcekey="chkTrainingAnalysisResource1" />
                                                <asp:CheckBox ID="chkViewOtherAssessment" runat="server" Text="View Other's Assessment" Enabled="False" meta:resourcekey="chkViewOtherAssessmentResource1" />
                                            </div>
                                            <div class="u-mem-lt-row">
                                                <asp:RadioButton ID="rbAdministrator" runat="server" Text="Adminstrator" AutoPostBack="True" OnCheckedChanged="rb_CheckedChanged" meta:resourcekey="rbAdministratorResource1" />
                                            </div>
                                            <div class="u-mem-lt-row" style="margin-left: 50px;">
                                                <%= GetLocalResourceObject("AdminDescriptionLabel") %>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="u-mem-module-access">
                                        <fieldset style="display: flex; flex-direction: column; height: 100%; border: 1px solid #dcdcdc;">
                                            <legend><%= GetLocalResourceObject("AccessibleModulesLabel") %></legend>
                                            <div style="border: 1px solid #dcdcdc;">
                                                <asp:CheckBoxList ID="cblModules" runat="server" CssClass="checkboxlist" AutoPostBack="true" OnSelectedIndexChanged="cbl_SelectedIndexChanged" meta:resourcekey="cblModulesResource1">
                                                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource1">&lt;img src=&quot;images/users.png&quot; /&gt; Users</asp:ListItem>
                                                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource2">&lt;img src=&quot;images/document.png&quot; /&gt; Documentation</asp:ListItem>
                                                    <asp:ListItem Value="4" meta:resourcekey="ListItemResource3">&lt;img src=&quot;images/record.png&quot; /&gt; Records</asp:ListItem>
                                                    <asp:ListItem Value="6" meta:resourcekey="ListItemResource4">&lt;img src=&quot;images/improvement.png&quot; /&gt; Improvements</asp:ListItem>
                                                    <asp:ListItem Value="12" meta:resourcekey="ListItemResource5">&lt;img src=&quot;images/training.png&quot; /&gt; Training</asp:ListItem>
                                                    <asp:ListItem Value="14" meta:resourcekey="ListItemResource6">&lt;img src=&quot;images/actionitem.png&quot; /&gt; Action Items</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="u-prop-mem-row2">
                                    <div class="membership-label"><%= GetLocalResourceObject("MemberOfLabel") %></div>
                                    <div class="membership-list">
                                        <asp:GridView ID="gvMemberships" runat="server" 
                                            DataKeyNames="GroupID,Name" 
                                            CssClass="gridView"
                                            GridLines="None" 
                                            ShowHeader="False" 
                                            AutoGenerateColumns="False" OnRowDataBound="GV_RowDataBound" meta:resourcekey="gvMembershipsResource1">
                                            <RowStyle CssClass="gridViewRow" />
                                            <SelectedRowStyle CssClass="gridViewSelRow" />
                                            <Columns>
                                                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                                    <ItemStyle Width="20px" />
                                                    <ItemTemplate>
                                                        <img src="images/entity.png" style="width: 16px;" />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" meta:resourcekey="BoundFieldResource1" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>                                    
                                </div>
                                <div class="u-prop-mem-row3">
                                    <asp:Button ID="btnAddMembership" runat="server" Text="Add" Width="70px" meta:resourcekey="btnAddMembershipResource1" />
                                    &nbsp;
                                    <asp:Button ID="btnRemoveMembership" runat="server" Text="Remove" Width="70px" OnClick="btnRemoveMembership_Click" meta:resourcekey="btnRemoveMembershipResource1" />
                                </div>
                            </div>
                            <asp:Panel ID="pnlAddMemberships" runat="server" CssClass="u-other-add-panel" meta:resourcekey="pnlAddMembershipsResource1">
                                <div class="u-other-add-title">
                                    <img src="images/P3_32.ico" />
                                    Select Entity
                                </div>
                                <div class="u-other-add-content">
                                    <div class="u-other-add-left">
                                        <asp:TreeView ID="p3Tree2" runat="server" ShowLines="True"
                                            EnableClientScript="False"
                                            NodeIndent="15"
                                            ExpandDepth="1"
                                            OnTreeNodePopulate="P3Tree_TreeNodePopulate"
                                            OnSelectedNodeChanged="P3Tree_SelectedNodeChanged" 
                                            OnTreeNodeCollapsed="p3Tree_TreeNodeCollapsedExpanded" 
                                            OnTreeNodeExpanded="p3Tree_TreeNodeCollapsedExpanded" meta:resourcekey="p3Tree2Resource1">
                                            <NodeStyle ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" ImageUrl="~/images/entity.png" />
                                            <RootNodeStyle ImageUrl="~/images/entity.png" />
                                            <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                                        </asp:TreeView>
                                     </div>
                                    <div class="u-other-add-center">
                                        <asp:Button ID="btnAddMember" runat="server" Text="Add >" CssClass="u-other-button" OnClick="Button_Click" CommandArgument="AddMemberToList" meta:resourcekey="btnAddMemberResource1" />
                                        <asp:Button ID="btnRemoveMember" runat="server" Text="< Remove" CssClass="u-other-button" OnClick="Button_Click" CommandArgument="RemoveMemberFromList" meta:resourcekey="btnRemoveMemberResource1" /> 
                                    </div>
                                    <div class="u-other-add-right">
                                        <asp:GridView ID="gvMembers" runat="server" 
                                            DataKeyNames="ControlID,ControlFullName,ControlType" 
                                            CssClass="gridView"
                                            GridLines="None" 
                                            AutoGenerateColumns="False" OnRowDataBound="GV_RowDataBound" OnSelectedIndexChanged="GV_SelectedIndexChanged" meta:resourcekey="gvMembersResource1">
                                            <HeaderStyle CssClass="gridViewHeader" />
                                            <RowStyle CssClass="gridViewRow" />
                                            <SelectedRowStyle CssClass="gridViewSelRow" />
                                            <Columns>
                                                <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                                                    <ItemStyle Width="20px" />
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgAddedIcon" runat="server" ImageUrl="images/entity.png" style="width: 16px;" meta:resourcekey="imgAddedIconResource1" />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ControlFullName" HeaderText="Name" meta:resourcekey="BoundFieldResource2" />
                                                <asp:BoundField DataField="ControlType" HeaderText="Type" meta:resourcekey="BoundFieldResource3" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="u-other-add-buttons">
                                    <div>
                                        <asp:Button ID="btnCommitAddMembers" runat="server" Text="OK" Width="70px" OnClick="Button_Click" CommandArgument="UpdateWithNewMembers" meta:resourcekey="btnCommitAddMembersResource1" />
                                        <asp:Button ID="btnCancelAddMember" runat="server" Text="Cancel" Width="70px" OnClick="Button_Click" CommandArgument="CancelMemberChanges" meta:resourcekey="btnCancelAddMemberResource1" />
                                    </div>                                        
                                </div>
                            </asp:Panel>
                                <asp:ModalPopupExtender ID="mpeAddMemberShips" runat="server" 
                                    TargetControlID="btnAddMembership" 
                                    PopupControlID="pnlAddMemberShips" 
                                    BackgroundCssClass="modalBackground" BehaviorID="mpeAddMemberShips" DynamicServicePath="">
                                </asp:ModalPopupExtender>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="tpOptions" runat="server" HeaderText="Options" meta:resourcekey="tpOptionsResource1">
                        <ContentTemplate>
                            <div class="u-prop-tabcontent" style="border: none;">
                                <div class="u-opt-row">
                                    <asp:CheckBox ID="cbChangePassword" runat="server" Text="Prompt the user to change password at next login" meta:resourcekey="cbChangePasswordResource1" />
                                </div>
                                <div class="u-opt-row">
                                    <asp:CheckBox ID="cbDisableUser" runat="server" Text="Disable user's account" meta:resourcekey="cbDisableUserResource1" />
                                </div>
                                <div class="u-opt-row" style="flex: 0 0 144px; display: flex; flex-direction: column; align-items: stretch;">
                                    <fieldset style="display: flex;flex-direction: column; justify-content: flex-start; border: 1px solid #dcdcdc;">
                                        <legend><%= GetLocalResourceObject("EmailNotificationLabel") %></legend>
                                        <div class="u-opt-row">
                                             <asp:CheckBox ID="cbEmailSummary" runat="server" Text="Email summary of all open Action Items" meta:resourcekey="cbEmailSummaryResource1" />
                                        </div>
                                        <div class="u-opt-row">
                                             <asp:CheckBox ID="cbEmailAll" runat="server" Text="Email all Event Action Item" meta:resourcekey="cbEmailAllResource1" />
                                        </div>
                                        <div class="u-opt-row">
                                             <asp:CheckBox ID="cbEmailUrgent" runat="server" Text="Email urgent Action Item ONLY" meta:resourcekey="cbEmailUrgentResource1" />
                                        </div>
                                        <div class="u-opt-row">
                                             <asp:CheckBox ID="cbEmailStep" runat="server" Text="Email notification of step, send, reply, and forward Action Item" meta:resourcekey="cbEmailStepResource1" />
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="u-opt-row">
                                    <asp:CheckBox ID="cbSMS" runat="server" Text="SMS notification of step, send, reply, and forward Action Items" meta:resourcekey="cbSMSResource1" />
                                </div>
                                <div class="u-opt-row" style="display: flex; flex-direction: row;">
                                    <div style="flex: 0 0 200px;"><%= GetLocalResourceObject("UserLanguageLabel") %></div>
                                    <div style="flex: 1 1 auto;">
                                        <asp:DropDownList ID="ddlLanguage" runat="server" meta:resourcekey="ddlLanguageResource1">
                                            <asp:ListItem Value="en-US" meta:resourcekey="ListItemResource7">English</asp:ListItem>
                                            <asp:ListItem Value="FR" meta:resourcekey="ListItemResource8">Fran&ccedil;ais</asp:ListItem>
                                            <asp:ListItem Value="es-es" meta:resourcekey="ListItemResource9">Spanish/Espa&ntilde;ol</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="u-opt-row">
                                    <asp:CheckBox ID="cbHeaderFooter" runat="server" Text="User can apply Header/Footer" meta:resourcekey="cbHeaderFooterResource1" />
                                </div>
                                <div class="u-ops-row" style="flex: 1 1 auto;"></div>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="tpTraining" runat="server" HeaderText="Training" meta:resourcekey="tpTrainingResource1">
                        <ContentTemplate>
                            <div class="u-prop-tabcontent" style="border: none;">
                                <div class="u-prop-gen-row">
                                    <%= GetLocalResourceObject("TrainingRecordsLabel") %>
                                </div>
                                <div class="u-prop-gen-row" style="flex: 1 1 auto; align-items: flex-start; padding: 0; border: 1px solid #dcdcdc; overflow-x: hidden; overflow-y: auto;">
                                    <asp:GridView ID="gvUserTraining" runat="server" Width="740px"
                                        DataKeyNames="ItemID,OrigID,Name,ParentGroupID"
                                        CssClass="gridView"
                                        GridLines="None" 
                                        AutoGenerateColumns="False" OnRowDataBound="GV_RowDataBound" meta:resourcekey="gvUserTrainingResource1">
                                        <HeaderStyle CssClass="gridViewHeader" />
                                        <RowStyle CssClass="gridViewRow" />
                                        <SelectedRowStyle CssClass="gridViewSelRow" />
                                        <Columns>
                                            <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
                                                <ItemStyle Width="20px" />
                                                <ItemTemplate>
                                                    <asp:Image ID="imgIcon" runat="server" Width="16px" ImageUrl="~/images/training.png" meta:resourcekey="imgIconResource1" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" meta:resourcekey="BoundFieldResource4" />
                                            <asp:BoundField DataField="LabelName" HeaderText="Label" meta:resourcekey="BoundFieldResource5" >
                                            <ItemStyle Width="200px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Status" HeaderText="Status" meta:resourcekey="BoundFieldResource6" >
                                            <ItemStyle Width="65px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Version" HeaderText="Version" meta:resourcekey="BoundFieldResource7" >
                                            <ItemStyle Width="55px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="VersionDate" HeaderText="Version Date" meta:resourcekey="BoundFieldResource8" >
                                            <ItemStyle Width="120px" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="u-prop-gen-row">
                                    <asp:Button ID="btnShowMeTraining" runat="server" Text="Show Me" Width="80px" OnClick="Button_Click" CommandArgument="ShowMe" meta:resourcekey="btnShowMeTrainingResource1" />&nbsp;
                                    <asp:Button ID="btnGoThereTraining" runat="server" Text="Go There" Width="80px" OnClick="Button_Click" CommandArgument="GoThere" meta:resourcekey="btnGoThereTrainingResource1" />&nbsp;
                                    <asp:Button ID="btnExportTraining" runat="server" Text="Export List" Width="80px" meta:resourcekey="btnExportTrainingResource1" />
                                </div>
                                <asp:Panel ID="pnlExportTraining" runat="server" CssClass="u-train-exportpanel" meta:resourcekey="pnlExportTrainingResource1">
                                    <div class="u-train-export-title">
                                        <img src="images/P3_32.ico" />
                                        Export Data
                                    </div>
                                    <div class="u-train-export-label">Export Data</div>
                                    <div class="u-train-export-field">
                                        <div>Select Column</div>
                                        <asp:CheckBoxList ID="cblTrainColumns" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbl_SelectedIndexChanged" meta:resourcekey="cblTrainColumnsResource1">
                                            <asp:ListItem Value="1" Text="Name" meta:resourcekey="ListItemResource10"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Label" meta:resourcekey="ListItemResource11"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Status" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Version" meta:resourcekey="ListItemResource13"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="VersionDate" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </div>
                                    <div class="u-train-export-buttons">
                                        <div>
                                            <asp:Button ID="btnCheckAllTrainColumns" runat="server" Text="Check All" OnClick="Button_Click" CommandArgument="CheckAll" meta:resourcekey="btnCheckAllTrainColumnsResource1" />&nbsp;
                                            <asp:Button ID="btnUncheckAllTrainColumns" runat="server" Text="Uncheck All" OnClick="Button_Click" CommandArgument="UncheckAll" meta:resourcekey="btnUncheckAllTrainColumnsResource1" />
                                        </div>
                                        <div>
                                            <asp:Button ID="btnSubmitExportTraining" runat="server" Text="Export" OnClick="Button_Click" CommandArgument="ExportTraining" Enabled="False" meta:resourcekey="btnSubmitExportTrainingResource1" />&nbsp;
                                            <asp:Button ID="btnCancelExportTraining" runat="server" Text="Cancel" meta:resourcekey="btnCancelExportTrainingResource1" />
                                        </div>                                        
                                    </div>                                    
                                </asp:Panel>
                                <asp:ModalPopupExtender ID="mpeExportTraining" runat="server" 
                                    PopupControlID="pnlExportTraining" 
                                    TargetControlID="btnExportTraining"
                                    BackgroundCssClass="modalBackground"
                                    CancelControlID="btnCancelExportTraining" BehaviorID="mpeExportTraining" DynamicServicePath="">
                                </asp:ModalPopupExtender>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="tpOtherUserAI" runat="server" HeaderText="Other Users Action Item" meta:resourcekey="tpOtherUserAIResource1">
                        <ContentTemplate>
                            <div class="u-prop-tabcontent" style="border: none;">
                                <div class="u-prop-gen-row">
                                    <%= GetLocalResourceObject("OtherUserAILabel") %>
                                </div>
                                <div class="u-prop-gen-row" style="border: 1px solid #000; flex: 1 1 auto; align-items: flex-start; padding: 0; overflow-x: hidden; overflow-y: auto;">
                                    <asp:GridView ID="gvOtherUserAI" runat="server" 
                                        CssClass="gridView" 
                                        DataKeyNames="ControlID,ControlFullName,ControlType" 
                                        AutoGenerateColumns="False" 
                                        GridLines="None" 
                                        Width="750px" 
                                        OnRowDataBound="GV_RowDataBound" meta:resourcekey="gvOtherUserAIResource1">
                                        <HeaderStyle CssClass="gridViewHeader" />
                                        <RowStyle CssClass="gridViewRow" />
                                        <SelectedRowStyle CssClass="gridViewSelRow" />
                                        <Columns>
                                            <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                                                <ItemStyle Width="20px" />
                                                <ItemTemplate>
                                                    <asp:Image ID="imgTypeIcon" runat="server" Width="16px" ImageUrl="~/images/entity.png" meta:resourcekey="imgTypeIconResource1" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ControlFullName" HeaderText="Name" meta:resourcekey="BoundFieldResource9" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" meta:resourcekey="BoundFieldResource10" >
                                            <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="u-prop-gen-row" style="justify-content: flex-end;">
                                    <asp:Button ID="btnAddUserAI" runat="server" Text="Add" Width="70px" OnClick="Button_Click" CommandArgument="AddUserEntity" meta:resourcekey="btnAddUserAIResource1" />&nbsp;
                                    <asp:Button ID="btnRemoveUserAI" runat="server" Text="Remove" Width="70px" meta:resourcekey="btnRemoveUserAIResource1" />
                                    <asp:Button ID="btnOpenModal" runat="server" style="display: none;" meta:resourcekey="btnOpenModalResource1" />
                                </div>
                                <asp:Panel ID="pnlAddOtherUserAI" runat="server" CssClass="u-other-add-panel" meta:resourcekey="pnlAddOtherUserAIResource1">
                                    <div class="u-other-add-title">
                                        <img src="images/P3_32.ico" />
                                        Select User/Entity
                                    </div>
                                    <div class="u-other-add-content">
                                        <div class="u-other-add-left">
                                            <asp:TreeView ID="p3Tree" runat="server" ShowLines="True"
                                                EnableClientScript="False"
                                                NodeIndent="15"
                                                ExpandDepth="1"
                                                OnTreeNodePopulate="P3Tree_TreeNodePopulate"
                                                OnSelectedNodeChanged="P3Tree_SelectedNodeChanged" 
                                                OnTreeNodeCollapsed="p3Tree_TreeNodeCollapsedExpanded" 
                                                OnTreeNodeExpanded="p3Tree_TreeNodeCollapsedExpanded" meta:resourcekey="p3TreeResource1">
                                                <NodeStyle ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" />
                                                <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                                            </asp:TreeView>
                                        </div>
                                        <div class="u-other-add-center">
                                            <asp:Button ID="btnAddToList" runat="server" Text="Add >" CssClass="u-other-button" OnClick="Button_Click" CommandArgument="AddToList" meta:resourcekey="btnAddToListResource1" />
                                            <asp:Button ID="btnRemoveFromList" runat="server" Text="< Remove" CssClass="u-other-button" OnClick="Button_Click" CommandArgument="RemoveFromList" meta:resourcekey="btnRemoveFromListResource1" /> 
                                        </div>
                                        <div class="u-other-add-right">
                                            <asp:GridView ID="gvAdded" runat="server" 
                                            DataKeyNames="ControlID,ControlFullName,ControlType" 
                                            CssClass="gridView"
                                            GridLines="None" 
                                            AutoGenerateColumns="False" OnRowDataBound="GV_RowDataBound" OnSelectedIndexChanged="GV_SelectedIndexChanged" meta:resourcekey="gvAddedResource1">
                                            <HeaderStyle CssClass="gridViewHeader" />
                                            <RowStyle CssClass="gridViewRow" />
                                            <SelectedRowStyle CssClass="gridViewSelRow" />
                                            <Columns>
                                                <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                                                    <ItemStyle Width="20px" />
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgAddedIcon" runat="server" ImageUrl="images/entity.png" style="width: 16px;" meta:resourcekey="imgAddedIconResource2" />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ControlFullName" HeaderText="Name" meta:resourcekey="BoundFieldResource11" />
                                                <asp:BoundField DataField="ControlType" HeaderText="Type" meta:resourcekey="BoundFieldResource12" />
                                            </Columns>
                                        </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="u-other-add-buttons">
                                        <div>
                                            <asp:Button ID="btnSubmitOtherUserChange" runat="server" Text="OK" Width="70px" OnClick="Button_Click" CommandArgument="UpdateWithNewUsers" meta:resourcekey="btnSubmitOtherUserChangeResource1" />
                                            <asp:Button ID="btnCancelOtherUserChange" runat="server" Text="Cancel" Width="70px" OnClick="Button_Click" CommandArgument="CancelOtherUserChanges" meta:resourcekey="btnCancelOtherUserChangeResource1" />
                                        </div>                                        
                                    </div>
                                </asp:Panel>
                                <asp:ModalPopupExtender ID="mpeOtherUserAI" runat="server"
                                    TargetControlID="btnOpenModal" 
                                    PopupControlID="pnlAddOtherUserAI" 
                                    BackgroundCssClass="modalBackground" BehaviorID="mpeOtherUserAI" DynamicServicePath="">
                                </asp:ModalPopupExtender>
                            </div>
                        </ContentTemplate>                        
                    </asp:TabPanel>
                </asp:TabContainer>
            </div>
            <div class="u-prop-controls">
                <asp:Button ID="btnOK" runat="server" Text="OK" Width="70px" OnClick="btnOK_Click" meta:resourcekey="btnOKResource1" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClientClick="window.close();" meta:resourcekey="btnCancelResource1" />
            </div>            
        </div>
    </form>
</body>
</html>
