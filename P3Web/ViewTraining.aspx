<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTraining.aspx.cs" Inherits="Paradigm3.ViewTraining" Async="true" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Training</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/Record.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
</head>
<body class="recordBody">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="udpToolBar" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="MenuTabs" EventName="MenuItemClick" />
                <asp:AsyncPostBackTrigger ControlID="btnFinishStep" EventName="Click" />
            </Triggers>
        <ContentTemplate>
            <div id="topBar">
                <div class="toolbar">
                    <asp:Panel ID="pnlSave" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlSaveResource1">
                        <asp:ImageButton ID="BtnSave" runat="server" ImageUrl="~/images/save.png" OnClick="ImageButton_Click" CommandArgument="SaveItem" ToolTip="Save Record" meta:resourcekey="BtnSaveResource1" />
                        <br />
                        <asp:Label ID="lblSave" runat="server" Text="Save" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblSaveResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlCalculate" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlCalculateResource1">
                        <asp:ImageButton ID="BtnCalculate" runat="server" ImageUrl="~/images/calculate.png" OnClick="ImageButton_Click" CommandArgument="Calculate" ToolTip="Calculate Formula Fields" meta:resourcekey="BtnCalculateResource1" />
                        <br />
                        <asp:Label ID="Calculate" runat="server" Text="Calculate" meta:resourcekey="CalculateResource2" />
                    </asp:Panel>
                    <asp:Panel ID="pnlEdit" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlEditResource1">
                        <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/edit.png" OnClick="ImageButton_Click" CommandArgument="EditItem" ToolTip="Set Record to Edit Mode" meta:resourcekey="BtnEditResource1" />
                        <br />
                        <asp:Label ID="lblEdit" runat="server" Text="Edit" meta:resourcekey="lblEditResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlProperties" runat="server" CssClass="toolbarButton" meta:resourcekey="pnlPropertiesResource1">
                        <asp:ImageButton ID="BtnProperties" runat="server" ImageUrl="~/images/properties.png" ToolTip="View Record Properties" meta:resourcekey="BtnPropertiesResource1" />
                        <br />
                        <asp:Label ID="lblProperties" runat="server" Text="Properties" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblPropertiesResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlParaLink" runat="server" CssClass="toolbarButton" meta:resourcekey="pnlParaLinkResource1">
                        <asp:ImageButton ID="BtnParaLink" runat="server" ImageUrl="~/images/paralink.png" CommandArgument="ParaLink" ToolTip="View Record Para-Links&reg;" meta:resourcekey="BtnParaLinkResource1" />
                        <br />
                        <asp:Label ID="lblParaLink" runat="server" Text="Para-Link" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblParaLinkResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlRelatedAI" runat="server" CssClass="toolbarButton" meta:resourcekey="pnlRelatedAIResource1">
                        <asp:ImageButton ID="BtnRelatedAI" runat="server" ImageUrl="~/images/actionitem.png" ToolTip="View Related Action Items" meta:resourcekey="BtnRelatedAIResource1" />
                        <br />
                        <asp:Label ID="lblRelatedAI" runat="server" Text="Related AI" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblRelatedAIResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlAttachment" runat="server" CssClass="toolbarButton" meta:resourcekey="pnlAttachmentResource1">
                        <asp:ImageButton ID="BtnAttachment" runat="server" ImageUrl="~/images/attachment.png" OnClick="ImageButton_Click" CommandArgument="Attach" ToolTip="View Record Attachments" meta:resourcekey="BtnAttachmentResource1" />
                        <br />
                        <asp:Label ID="lblAttachment" runat="server" Text="Attachments" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblAttachmentResource1" />
                    </asp:Panel>
                    <asp:Panel ID="pnlTrainLink" runat="server" CssClass="toolbarButton" style="width: 62px;" Visible="False" meta:resourcekey="pnlTrainLinkResource1">
                        <asp:ImageButton ID="BtnTrainLink" runat="server" ImageUrl="~/images/traininglink.png" ToolTip="View Training Record Links" meta:resourcekey="BtnTrainLinkResource1" />
                        <br />
                        <asp:Label ID="lblTrainLink" runat="server" Text="Training Link" meta:resourcekey="lblTrainLinkResource1" />
                    </asp:Panel>
			        <asp:Panel ID="pnlAssessment" runat="server" CssClass="toolbarButton" meta:resourcekey="pnlAssessmentResource1">
				        <asp:ImageButton ID="BtnAssessment" runat="server" ImageUrl="~/images/assessment.png" ToolTip="Launch Competency Assessment" meta:resourcekey="BtnAssessmentResource1" />
				        <br />
				        <asp:Label ID="lblAssessment" runat="server" Text="Assessment" meta:resourcekey="lblAssessmentResource1" />
			        </asp:Panel>
                    <asp:Panel ID="pnlClose" runat="server" CssClass="toolbarButton" meta:resourcekey="pnlCloseResource1">
                        <asp:ImageButton ID="BtnClose" runat="server" ImageUrl="~/images/exit.png" OnClick="ImageButton_Click" CommandArgument="CloseItem" ToolTip="Close Record" meta:resourcekey="BtnCloseResource1" />
                        <br />
                        <asp:Label ID="lblClose" runat="server" Text="Close" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblCloseResource1" />
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="udpDetails" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSave" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="BtnEdit" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="MenuTabs" EventName="MenuItemClick" />
                <asp:AsyncPostBackTrigger ControlID="BtnFinishStep" EventName="Click" />
            </Triggers>
        <ContentTemplate>
        <div id="pnlRecordHeader">
            <table>
                <tr>
                    <td style="width: 80px; height: 24px; padding-left: 5px; text-align: left;">
                        <asp:Label ID="lblNameField" runat="server" Text="Name:" CssClass="recordLabel" meta:resourcekey="lblNameFieldResource1" /> 
                    </td>
                    <td style="height: 24px; width: 580px; text-align: left;">
                        <asp:TextBox ID="txtNameData" runat="server" Width="570px" ReadOnly="True" CssClass="ro_TitleControl" meta:resourcekey="txtNameDataResource1" />
                    </td>
                    <td style="height: 24px; width: 50px; text-align: left;">
                        <asp:Label ID="lblIDField" runat="server" Text="ID/OrigID:" CssClass="recordLabel" meta:resourcekey="lblIDFieldResource1" />
                    </td>
                    <td style="height: 24px; width: 60px; text-align: left;">
                        <asp:Label ID="lblIDData" runat="server" CssClass="recordLabel" meta:resourcekey="lblIDDataResource1" />
                    </td>
                    <td style="height: 24px; width: 90px; text-align: left;">
                        <asp:Label ID="lblCreatedField" runat="server" Text="Created Date:" CssClass="recordLabel" meta:resourcekey="lblCreatedFieldResource1" />
                    </td>
                    <td style="height: 24px; width: 70px; text-align: left;">
                        <asp:Label ID="lblCreatedData" runat="server" CssClass="recordLabel" meta:resourcekey="lblCreatedDataResource1" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px; height: 24px; padding-left: 5px; text-align: left;">
                        <asp:Label ID="lblLabelField" runat="server" Text="Label:" CssClass="recordLabel" meta:resourcekey="lblLabelFieldResource1" />
                    </td>
                    <td style="height: 24px; width: 580px; text-align: left;">
                        <asp:TextBox ID="txtLabelData" runat="server" Width="570px" ReadOnly="True" CssClass="ro_TitleControl" meta:resourcekey="txtLabelDataResource1" />
                    </td>
                    <td style="height: 24px; width: 50px; text-align: left;">
                        <asp:Label ID="lblStatusField" runat="server" Text="Status:" CssClass="recordLabel" meta:resourcekey="lblStatusFieldResource1" />
                    </td>
                    <td style="height: 24px; width: 60px; text-align: left;">
                        <asp:Label ID="lblStatusData" runat="server" CssClass="recordLabel" meta:resourcekey="lblStatusDataResource1" />
                        <asp:Label ID="lblVersionData" runat="server" CssClass="recordLabel" meta:resourcekey="lblVersionDataResource1" />
                    </td>
                    <td colspan="2">

                    </td>
                </tr>
                <tr>
                    <td style="width: 80px; height: 24px; padding-left: 5px; text-align: left;">
                        <asp:Label ID="lblTraineeField" runat="server" Text="Trainee:" CssClass="recordLabel" meta:resourcekey="lblTraineeFieldResource1" />
                    </td>
                    <td style="height: 24px; width: 580px; text-align: left;" colspan="4">
                        <asp:TextBox ID="txtTraineeData" runat="server" Width="570px" ReadOnly="True" CssClass="ro_TitleControl" meta:resourcekey="txtTraineeDataResource1" />
                    </td>
                </tr>
            </table>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="udpPageData" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="BtnEdit" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="MenuTabs" EventName="MenuItemClick" />
                <asp:AsyncPostBackTrigger ControlID="BtnFinishStep" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnUpdateUserList" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnUpdateField" EventName="Click" />
            </Triggers>
        <ContentTemplate>
        <div id="pnlRecordMenu">
            <table style="padding: 0;">
                <tr>
                    <td style="width: 110px; padding: 10px 0 0 5px; vertical-align: top;">
                        <asp:Label ID="lblStep" runat="server" Text="Select Requirement:" CssClass="recordLabel" meta:resourcekey="lblStepResource1" />
                    </td>
                    <td style="width: 800px; text-align: left;">
                        <asp:Menu ID="MenuTabs" runat="server" Width="100%" Orientation="Horizontal" OnMenuItemClick="MenuTabs_MenuItemClick" meta:resourcekey="MenuTabsResource1">
                            <Items>
                                <asp:MenuItem Text=" " Value="0" meta:resourcekey="MenuItemResource1" />
                                <asp:MenuItem Text=" " Value="1" meta:resourcekey="MenuItemResource2" />
                                <asp:MenuItem Text=" " Value="2" meta:resourcekey="MenuItemResource3" />
                                <asp:MenuItem Text=" " Value="3" meta:resourcekey="MenuItemResource4" />
                                <asp:MenuItem Text=" " Value="4" meta:resourcekey="MenuItemResource5" />
                                <asp:MenuItem Text=" " Value="5" meta:resourcekey="MenuItemResource6" />
                                <asp:MenuItem Text=" " Value="6" meta:resourcekey="MenuItemResource7" />
                                <asp:MenuItem Text=" " Value="7" meta:resourcekey="MenuItemResource8" />
                                <asp:MenuItem Text=" " Value="8" meta:resourcekey="MenuItemResource9" />
                                <asp:MenuItem Text=" " Value="9" meta:resourcekey="MenuItemResource10" />
                                <asp:MenuItem Text=" " Value="10" meta:resourcekey="MenuItemResource11" />
                                <asp:MenuItem Text=" " Value="11" meta:resourcekey="MenuItemResource12" />
                                <asp:MenuItem Text=" " Value="12" meta:resourcekey="MenuItemResource13" />
                                <asp:MenuItem Text=" " Value="13" meta:resourcekey="MenuItemResource14" />
                                <asp:MenuItem Text=" " Value="14" meta:resourcekey="MenuItemResource15" />    
                                <asp:MenuItem Text=" " Value="15" meta:resourcekey="MenuItemResource16" />      
                                <asp:MenuItem Text=" " Value="16" meta:resourcekey="MenuItemResource17" />
                                <asp:MenuItem Text=" " Value="17" meta:resourcekey="MenuItemResource18" />
                                <asp:MenuItem Text=" " Value="18" meta:resourcekey="MenuItemResource19" />
                                <asp:MenuItem Text=" " Value="19" meta:resourcekey="MenuItemResource20" />
                                <asp:MenuItem Text=" " Value="20" meta:resourcekey="MenuItemResource21" />
                                <asp:MenuItem Text=" " Value="21" meta:resourcekey="MenuItemResource22" />
                                <asp:MenuItem Text=" " Value="22" meta:resourcekey="MenuItemResource23" />
                                <asp:MenuItem Text=" " Value="23" meta:resourcekey="MenuItemResource24" />
                                <asp:MenuItem Text=" " Value="24" meta:resourcekey="MenuItemResource25" />
                                <asp:MenuItem Text=" " Value="25" meta:resourcekey="MenuItemResource26" />
                                <asp:MenuItem Text=" " Value="26" meta:resourcekey="MenuItemResource27" />
                                <asp:MenuItem Text=" " Value="27" meta:resourcekey="MenuItemResource28" />
                                <asp:MenuItem Text=" " Value="28" meta:resourcekey="MenuItemResource29" />
                                <asp:MenuItem Text=" " Value="29" meta:resourcekey="MenuItemResource30" />
                                <asp:MenuItem Text=" " Value="30" meta:resourcekey="MenuItemResource31" />
                                <asp:MenuItem Text=" " Value="31" meta:resourcekey="MenuItemResource32" />
                                <asp:MenuItem Text=" " Value="32" meta:resourcekey="MenuItemResource33" />
                                <asp:MenuItem Text=" " Value="33" meta:resourcekey="MenuItemResource34" />
                                <asp:MenuItem Text=" " Value="34" meta:resourcekey="MenuItemResource35" />
                                <asp:MenuItem Text=" " Value="35" meta:resourcekey="MenuItemResource36" />
                                <asp:MenuItem Text=" " Value="36" meta:resourcekey="MenuItemResource37" />
                                <asp:MenuItem Text=" " Value="37" meta:resourcekey="MenuItemResource38" />
                                <asp:MenuItem Text=" " Value="38" meta:resourcekey="MenuItemResource39" />
                                <asp:MenuItem Text=" " Value="39" meta:resourcekey="MenuItemResource40" />
                                <asp:MenuItem Text=" " Value="40" meta:resourcekey="MenuItemResource41" />
                                <asp:MenuItem Text=" " Value="41" meta:resourcekey="MenuItemResource42" />
                                <asp:MenuItem Text=" " Value="42" meta:resourcekey="MenuItemResource43" />
                                <asp:MenuItem Text=" " Value="43" meta:resourcekey="MenuItemResource44" />
                                <asp:MenuItem Text=" " Value="44" meta:resourcekey="MenuItemResource45" />
                                <asp:MenuItem Text=" " Value="45" meta:resourcekey="MenuItemResource46" />
                                <asp:MenuItem Text=" " Value="46" meta:resourcekey="MenuItemResource47" />
                                <asp:MenuItem Text=" " Value="47" meta:resourcekey="MenuItemResource48" />
                                <asp:MenuItem Text=" " Value="48" meta:resourcekey="MenuItemResource49" />
                                <asp:MenuItem Text=" " Value="49" meta:resourcekey="MenuItemResource50" />
                            </Items>
                        </asp:Menu>
                    </td>
                </tr>
            </table>
        </div>

        <div id="pnlRecordStepName">
            <asp:Label ID="lblStepName" runat="server" Font-Bold="True" Text="Test Label Name" meta:resourcekey="lblStepNameResource1" />
            <asp:ImageButton ID="BtnInstructions" runat="server" ImageUrl="~/images/bluedown.png" CssClass="blueButton" CommandArgument="Open" OnClick="BTNInstructions_Click" meta:resourcekey="BtnInstructionsResource1" />
            <asp:Panel ID="pnlReqNotes" runat="server" CssClass="pnlInstructions" meta:resourcekey="pnlReqNotesResource1">
                <asp:TextBox ID="txtReqNotes" runat="server" TextMode="MultiLine" meta:resourcekey="txtReqNotesResource1" />
            </asp:Panel>
        </div>

        <div id="pnlRecordDetails">            
            <asp:Panel ID="Panel0" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel0Resource1">
                Panel 0
            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel1Resource1">
                Panel 1
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel2Resource1">
                Panel 2
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel3Resource1">
                Panel 3
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel4Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel5" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel5Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel6" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel6Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel7" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel7Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel8" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel8Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel9" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel9Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel10" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel10Resource1">
                    
            </asp:Panel>
            <asp:Panel ID="Panel11" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel11Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel12" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel12Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel13" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel13Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel14" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel14Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel15" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel15Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel16" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel16Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel17" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel17Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel18" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel18Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel19" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel19Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel20" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel20Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel21" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel21Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel22" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel22Resource1">
            
            </asp:Panel>
            <asp:Panel ID="Panel23" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel23Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel24" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel24Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel25" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel25Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel26" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel26Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel27" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel27Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel28" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel28Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel29" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel29Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel30" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel30Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel31" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel31Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel32" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel32Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel33" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel33Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel34" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel34Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel35" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel35Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel36" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel36Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel37" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel37Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel38" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel38Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel39" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel39Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel40" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel40Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel41" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel41Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel42" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel42Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel43" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel43Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel44" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel44Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel45" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel45Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel46" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel46Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel47" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel47Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel48" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel48Resource1">
                
            </asp:Panel>
            <asp:Panel ID="Panel49" runat="server" Visible="False" CssClass="recordFields" meta:resourcekey="Panel49Resource1">
                
            </asp:Panel>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="udpFinish" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="BtnEdit" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="MenuTabs" EventName="MenuItemClick" />
            </Triggers>
        <ContentTemplate>
        <div id="pnlFinishStep">
            <table style="width: 950px; padding: 0px; border: 0px solid Black;">
                <tr>
                    <td style="width: 150px; vertical-align: middle;">
                        <asp:Button ID="BtnFinishStep" runat="server" Text="Finish Requirement" Width="140px" OnClick="Button_Click" CommandArgument="FinishRequirement" meta:resourcekey="BtnFinishStepResource1" />
                        <asp:ConfirmButtonExtender ID="cbeFinishStep" runat="server" ConfirmText="Finish Requirement:  Continue with the current operation?" TargetControlID="BtnFinishStep" BehaviorID="cbeFinishStep" />
                    </td>
                    <td style="width: 50px; text-align: left; vertical-align: middle;">
                        <asp:Label ID="lblDueDateField" runat="server" Text="Due Date:" CssClass="recordLabel" meta:resourcekey="lblDueDateFieldResource1" />
                    </td>
                    <td style="width: 200px; padding-left: 5px; text-align: left; vertical-align: middle;">
                        <asp:Label ID="lblDueDate" runat="server" CssClass="recordLabel" Text="2017/05/31" meta:resourcekey="lblDueDateResource1" />
                    </td>
                   <td style="width: 300px; text-align: left; vertical-align: middle;">

                    </td>
                </tr>   
            </table>
        </div>        
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnRefreshRec" runat="server" OnClick="btnRefreshRecord_Click" style="display:none;" meta:resourcekey="btnRefreshRecResource1" />
        <asp:Button ID="btnUpdateUserList" runat="server" OnClick="Button_Click" CommandArgument="updateuser" style="display: none;" meta:resourcekey="btnUpdateUserListResource1" />
        <asp:Button ID="btnUpdateField" runat="server" OnClick="Button_Click" CommandArgument="updatefield" style="display: none;" meta:resourcekey="btnUpdateFieldResource1" />
        <asp:Button ID="btnDigitalSignature" runat="server" OnClick="Button_Click" CommandArgument="digitalSignature" style="display: none;" meta:resourcekey="btnDigitalSignatureResource1" />
        <asp:HiddenField ID="hdnDigitalSignatureID" runat="server" />
        <div id="pnlDigitalSignature" class="digital-signature-background">
            <div class="digital-signature">
                <div class="digital-signature-title">
                    Password
                    <img src="images/squareclose.png" onclick="document.getElementByID('pnlDigitalSignature').style.display = 'none';" style="cursor: pointer;" />
                </div>
                <div class="digital-signature-body">
                    <div class="ds-left">
                    </div>
                    <div class="ds-right">
                        <div>Username:</div>
                        <div><asp:TextBox ID="txtDSUserName" runat="server" Width="190px" meta:resourcekey="txtDSUserNameResource1"></asp:TextBox></div>
                        <div>Password:</div>
                        <div><asp:TextBox ID="txtDSPassword" runat="server" TextMode="Password" Width="190px" meta:resourcekey="txtDSPasswordResource1"></asp:TextBox></div>
                        <div>
                            <asp:Button ID="btnDSSubmit" runat="server" Text="Submit" OnClick="Button_Click" CommandArgument="digitalSignature" meta:resourcekey="btnDSSubmitResource1" />
                            &nbsp;
                            <button >Cancel</button>
                        </div>
                    </div>
                </div>
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
</body>
</html>
