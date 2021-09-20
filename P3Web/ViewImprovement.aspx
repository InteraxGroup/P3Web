<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewImprovement.aspx.cs" Inherits="Paradigm3.ViewImprovement1" EnableEventValidation="false" Async="true" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Improvement Record</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/Record.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body class="recordBody">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />        
        <asp:UpdatePanel ID="udpToolBar" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="MenuTabs" EventName="MenuItemClick" />
                <asp:AsyncPostBackTrigger ControlID="btnFinishStep" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnNotApplicable" EventName="Click" />
            </Triggers>
        <ContentTemplate>
        <div id="toolBar">
            <asp:Panel ID="pnlSave" runat="server" CssClass="toolbarButton" Visible="false">
                <asp:ImageButton ID="BtnSave" runat="server" ImageUrl="~/images/save.png" OnClick="ImageButton_Click" CommandArgument="SaveItem" ToolTip="Save Record" />
                <br />
                <asp:Label ID="lblSave" runat="server" Text="Save" />
            </asp:Panel>
            <asp:Panel ID="pnlCalculate" runat="server" CssClass="toolbarButton" Visible="false">
                <asp:ImageButton ID="BtnCalculate" runat="server" ImageUrl="~/images/calculate.png" OnClick="ImageButton_Click" CommandArgument="Calculate" ToolTip="Calculate Formula Fields" />
                <br />
                <asp:Label ID="Calculate" runat="server" Text="Calculate" />
            </asp:Panel>
            <asp:Panel ID="pnlEdit" runat="server" CssClass="toolbarButton" Visible="false">
                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/edit.png" OnClick="ImageButton_Click" CommandArgument="EditItem" ToolTip="Set Record to Edit Mode" />
                <br />
                <asp:Label ID="lblEdit" runat="server" Text="Edit" />
            </asp:Panel>
            <asp:Panel ID="pnlProperties" runat="server" CssClass="toolbarButton" Visible="true">
                <asp:ImageButton ID="BtnProperties" runat="server" ImageUrl="~/images/properties.png" ToolTip="View Record Properties" />
                <br />
                <asp:Label ID="lblProperties" runat="server" Text="Properties" />
            </asp:Panel>
            <asp:Panel ID="pnlParaLink" runat="server" CssClass="toolbarButton" Visible="true">
                <asp:ImageButton ID="BtnParaLink" runat="server" ImageUrl="~/images/paralink.png" ToolTip="View Record Para-Links&reg;" />
                <br />
                <asp:Label ID="lblParaLink" runat="server" Text="Para-Link&reg;" />
            </asp:Panel>
            <asp:Panel ID="pnlRelatedAI" runat="server" CssClass="toolbarButton">
                <asp:ImageButton ID="BtnRelatedAI" runat="server" ImageUrl="~/images/actionitem.png" ToolTip="View Related Action Items" />
                <br />
                <asp:Label ID="lblRelatedAI" runat="server" Text="Related AI" />
            </asp:Panel>
            <asp:Panel ID="pnlAttachment" runat="server" CssClass="toolbarButton">
                <asp:ImageButton ID="BtnAttachment" runat="server" ImageUrl="~/images/attachment.png" OnClick="ImageButton_Click" CommandArgument="Attach" ToolTip="View Record Attachments" />
                <br />
                <asp:Label ID="lblAttachment" runat="server" Text="Attachments" />
            </asp:Panel>
            <div class="toolbarButton">
                <asp:ImageButton ID="BtnPrint" runat="server" ImageUrl="~/images/print.png" OnClick="ImageButton_Click" CommandArgument="Print" ToolTip="Print Record" />
                <br />
                <asp:Label ID="lblPrint" runat="server" Text="Print" />
            </div>
            <asp:Panel ID="pnlClose" runat="server" CssClass="toolbarButton">
                <asp:ImageButton ID="BtnClose" runat="server" ImageUrl="~/images/exit.png" OnClientClick="closeP3Window()" CommandArgument="Close" ToolTip="Close Record" />
                <br />
                <asp:Label ID="lblClose" runat="server" Text="Close" />
            </asp:Panel>            
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="udpDetails" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnSave" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="BtnEdit" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="MenuTabs" EventName="MenuItemClick" />
                <asp:AsyncPostBackTrigger ControlID="BtnFinishStep" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="BtnNotApplicable" EventName="Click" />
            </Triggers>
        <ContentTemplate>
        <div id="pnlRecordHeader">
            <table>
                <tr>
                    <td style="width: 80px; height: 24px; padding-left: 5px; text-align: left;">
                        <asp:Label ID="lblNameField" runat="server" Text="Name:" CssClass="recordLabel" /> 
                    </td>
                    <td style="height: 24px; width: 580px; text-align: left;">
                        <asp:TextBox ID="txtNameData" runat="server" Width="570px" ReadOnly="true" CssClass="ro_TitleControl" />
                    </td>
                    <td style="height: 24px; width: 50px; text-align: left;">
                        <asp:Label ID="lblIDField" runat="server" Text="ID/OrigID:" CssClass="recordLabel" />
                    </td>
                    <td style="height: 24px; width: 60px; text-align: left;">
                        <asp:Label ID="lblIDData" runat="server" CssClass="recordLabel" />
                    </td>
                    <td style="height: 24px; width: 90px; text-align: left;">
                        <asp:Label ID="lblCreatedField" runat="server" Text="Created Date:" CssClass="recordLabel" />
                    </td>
                    <td style="height: 24px; width: 70px; text-align: left;">
                        <asp:Label ID="lblCreatedData" runat="server" CssClass="recordLabel" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px; height: 24px; padding-left: 5px; text-align: left;">
                        <asp:Label ID="lblLabelField" runat="server" Text="Label:" CssClass="recordLabel" />
                    </td>
                    <td style="height: 24px; width: 580px; text-align: left;">
                        <asp:TextBox ID="txtLabelData" runat="server" Width="570px" ReadOnly="true" CssClass="ro_TitleControl" />
                    </td>
                    <td style="height: 24px; width: 50px; text-align: left;">
                        <asp:Label ID="lblStatusField" runat="server" Text="Status:" CssClass="recordLabel" />
                    </td>
                    <td style="height: 24px; width: 60px; text-align: left;">
                        <asp:Label ID="lblStatusData" runat="server" CssClass="recordLabel" />
                        <asp:Label ID="lblVersionData" runat="server" CssClass="recordLabel" />
                    </td>
                    <td colspan="2">

                    </td>
                </tr>
                <tr>
                    <td style="width: 80px; height: 24px; padding-left: 5px; text-align: left;">
                        <asp:Label ID="lblResponsibleField" runat="server" Text="Responsible:" CssClass="recordLabel" />
                    </td>
                    <td style="height: 24px; width: 580px; text-align: left;">
                        <asp:TextBox ID="txtResponsibleData" runat="server" Width="570px" ReadOnly="true" CssClass="ro_TitleControl" />
                    </td>
                    <td style="height: 24px; width: 50px; text-align: left; vertical-align: bottom;">
                        <asp:ImageButton ID="BtnAddResp" runat="server" ImageUrl="~/images/btnAdd_lock.png" ToolTip="Add Responsible Person" />
                        <asp:ImageButton ID="BtnRemoveResp" runat="server" ImageUrl="~/images/btnRemove_lock.png" ToolTip="Remove All Responsible" />
                    </td>
                    <td colspan="2" style="text-align: right;" >
                        <asp:Label ID="lblExpectedCompletionField" runat="server" Text="Expected Completion Date:" CssClass="recordLabel" Font-Size="X-Small" />
                    </td>
                    <td>
                        <asp:Label ID="lblExpectedCompletionData" runat="server" CssClass="recordLabel" Font-Size="X-Small" />
                    </td>
                </tr>
            </table>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="udpPageData" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="BtnEdit" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="MenuTabs" EventName="MenuItemClick" />
                <asp:AsyncPostBackTrigger ControlID="BtnFinishStep" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="BtnNotApplicable" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnUpdateUserList" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnUpdateField" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnDigitalSignature" EventName="Click" />
            </Triggers>
        <ContentTemplate>
        <div id="pnlRecordMenu">
            <table style="padding: 0;">
                <tr>
                    <td style="width: 80px; padding: 10px 0 0 40px; vertical-align: top;">
                        <asp:Label ID="lblStep" runat="server" Text="Select Step:" CssClass="recordLabel" />
                    </td>
                    <td style="width: 800px; text-align: left;">
                        <asp:Menu ID="MenuTabs" runat="server" Width="100%" Orientation="Horizontal" OnMenuItemClick="MenuTabs_MenuItemClick">
                            <Items>
                                <asp:MenuItem Text=" " Value="0" />
                                <asp:MenuItem Text=" " Value="1" />
                                <asp:MenuItem Text=" " Value="2" />
                                <asp:MenuItem Text=" " Value="3" />
                                <asp:MenuItem Text=" " Value="4" />
                                <asp:MenuItem Text=" " Value="5" />
                                <asp:MenuItem Text=" " Value="6" />
                                <asp:MenuItem Text=" " Value="7" />
                                <asp:MenuItem Text=" " Value="8" />
                                <asp:MenuItem Text=" " Value="9" />
                                <asp:MenuItem Text=" " Value="10" />
                                <asp:MenuItem Text=" " Value="11" />
                                <asp:MenuItem Text=" " Value="12" />
                                <asp:MenuItem Text=" " Value="13" />
                                <asp:MenuItem Text=" " Value="14" />    
                                <asp:MenuItem Text=" " Value="15" />      
                                <asp:MenuItem Text=" " Value="16" />
                                <asp:MenuItem Text=" " Value="17" />
                                <asp:MenuItem Text=" " Value="18" />
                                <asp:MenuItem Text=" " Value="19" />
                                <asp:MenuItem Text=" " Value="20" />
                                <asp:MenuItem Text=" " Value="21" />
                                <asp:MenuItem Text=" " Value="22" />
                                <asp:MenuItem Text=" " Value="23" />
                                <asp:MenuItem Text=" " Value="24" />
                                <asp:MenuItem Text=" " Value="25" />
                                <asp:MenuItem Text=" " Value="26" />
                                <asp:MenuItem Text=" " Value="27" />
                                <asp:MenuItem Text=" " Value="28" />
                                <asp:MenuItem Text=" " Value="29" />
                                <asp:MenuItem Text=" " Value="30" />
                                <asp:MenuItem Text=" " Value="31" />
                                <asp:MenuItem Text=" " Value="32" />
                                <asp:MenuItem Text=" " Value="33" />
                                <asp:MenuItem Text=" " Value="34" />
                                <asp:MenuItem Text=" " Value="35" />
                                <asp:MenuItem Text=" " Value="36" />
                                <asp:MenuItem Text=" " Value="37" />
                                <asp:MenuItem Text=" " Value="38" />
                                <asp:MenuItem Text=" " Value="39" />
                                <asp:MenuItem Text=" " Value="40" />
                                <asp:MenuItem Text=" " Value="41" />
                                <asp:MenuItem Text=" " Value="42" />
                                <asp:MenuItem Text=" " Value="43" />
                                <asp:MenuItem Text=" " Value="44" />
                                <asp:MenuItem Text=" " Value="45" />
                                <asp:MenuItem Text=" " Value="46" />
                                <asp:MenuItem Text=" " Value="47" />
                                <asp:MenuItem Text=" " Value="48" />
                                <asp:MenuItem Text=" " Value="49" />
                            </Items>
                        </asp:Menu>
                    </td>
                </tr>
            </table>
        </div>
        <div id="pnlRecordStepName">
            <asp:Label ID="lblStepName" runat="server" Font-Bold="true" Text="Test Label Name" />
            <asp:ImageButton ID="BtnInstructions" runat="server" ImageUrl="~/images/bluedown.png" CssClass="blueButton" CommandArgument="Open" OnClick="BtnInstructions_Click" />
            <asp:Panel ID="pnlInstructions" runat="server" CssClass="pnlInstructions">
                <asp:TextBox ID="txtInstructions" runat="server" TextMode="MultiLine" />
            </asp:Panel>
        </div>
        <div id="pnlRecordDetails">            
            <asp:Panel ID="Panel0" runat="server" Visible="false" CssClass="recordFields">
                Panel 0
            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server" Visible="false" CssClass="recordFields">
                Panel 1
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false" CssClass="recordFields">
                Panel 2
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" Visible="false" CssClass="recordFields">
                Panel 3
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel5" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel6" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel7" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel8" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel9" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel10" runat="server" Visible="false" CssClass="recordFields">
                    
            </asp:Panel>
            <asp:Panel ID="Panel11" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel12" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel13" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel14" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel15" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel16" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel17" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel18" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel19" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel20" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel21" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel22" runat="server" Visible="false" CssClass="recordFields">
            
            </asp:Panel>
            <asp:Panel ID="Panel23" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel24" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel25" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel26" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel27" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel28" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel29" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel30" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel31" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel32" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel33" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel34" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel35" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel36" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel37" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel38" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel39" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel40" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel41" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel42" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel43" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel44" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel45" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel46" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel47" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel48" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
            <asp:Panel ID="Panel49" runat="server" Visible="false" CssClass="recordFields">
                
            </asp:Panel>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="udpFinish" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
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
                        <asp:Button ID="BtnFinishStep" runat="server" Text="Finish Step" Width="140px" OnClick="BtnFinishStep_Click" />
                        <asp:ConfirmButtonExtender ID="cbeFinishStep" runat="server" ConfirmText="Finish Step:  Continue with the current operation?" TargetControlID="BtnFinishStep" />
                    </td>
                    <td style="width: 50px; text-align: left; vertical-align: middle;">
                        <asp:Label ID="lblDueDateField" runat="server" Text="Due Date:" CssClass="recordLabel" />
                    </td>
                    <td style="width: 200px; padding-left: 5px; text-align: left; vertical-align: middle;">
                        <asp:Label ID="lblDueDate" runat="server" CssClass="recordLabel" Text="2017/05/31" />
                    </td>
                    <td style="width: 300px; text-align: left; vertical-align: middle;">
                        <asp:Button ID="BtnNotApplicable" runat="server" Text="Step Not Applicable" Width="140px" OnClick="BtnNotApplicable_Click" />
                        <asp:ConfirmButtonExtender ID="cbeNotApplicable" runat="server" ConfirmText="Step Not Applicable:  Continue with the current operation?" TargetControlID="BtnNotApplicable" />
                    </td>
                </tr>   
            </table>
        </div>        
        </ContentTemplate>
        </asp:UpdatePanel>         
        <asp:Button ID="btnRefreshRec" runat="server" OnClick="btnRefreshRecord_Click" style="display:none;" />
        <asp:Button ID="btnUpdateUserList" runat="server" OnClick="Button_Click" CommandArgument="updateuser" style="display: none;" />
        <asp:Button ID="btnUpdateField" runat="server" OnClick="Button_Click" CommandArgument="updatefield" style="display: none;" />
        <asp:Button ID="btnDigitalSignature" runat="server" OnClick="Button_Click" CommandArgument="digitalSignature" style="display: none;" />
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
                        <div><asp:TextBox ID="txtDSUserName" runat="server" Width="190px"></asp:TextBox></div>
                        <div>Password:</div>
                        <div><asp:TextBox ID="txtDSPassword" runat="server" TextMode="Password" Width="190px"></asp:TextBox></div>
                        <div>
                            <asp:Button ID="btnDSSubmit" runat="server" Text="Submit" OnClick="Button_Click" CommandArgument="digitalSignature" />
                            &nbsp;
                            <button >Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
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
