<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewActionItem.aspx.cs" Inherits="Paradigm3.ViewActionItem" EnableEventValidation="false" Async="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Paradigm 3 -- Action Item</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body class="aiBody">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="udpActionItem" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
    <ContentTemplate>
    <div id="pnlAIToolbar">
        <asp:Label ID="lblCompleteTrigger" runat="server" style="display: none;" />
        <asp:Panel ID="pnlShowMe" runat="server" CssClass="toolbarButton" Visible="false" style="border-right: 1px solid #dcdcdc;">
            <asp:ImageButton ID="btnShowMe" runat="server" ImageUrl="~/images/showme.png" CausesValidation="false" />
            <br />
            <asp:Label ID="lblShowMeAI" runat="server" Text="Show Me" Font-Size="8pt" Font-Names="Arial" />
        </asp:Panel>
        <asp:Panel ID="pnlGoThere" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="false">
            <asp:ImageButton ID="btnGoThere" runat="server" ImageUrl="~/images/gothere.png" ToolTip="View Linked Folder" OnClick="ImageButton_Click" CommandArgument="GoThere" />
            <br />
            <asp:Label ID="lblGoThere" runat="server" Text="Go There" Font-Size="8pt" Font-Names="Arial" />
        </asp:Panel>
        <asp:Panel ID="pnlComplete" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible ="false">
            <asp:ImageButton ID="btnComplete" runat="server" ImageUrl="~/images/ai_complete.png" ToolTip="Complete Action Item" ValidationGroup="CompleteAI" CausesValidation="false" OnClick="ImageButton_Click" CommandArgument="OpenCompleteAIModal" />
            <br />
            <asp:Label ID="lblCompleteAI" runat="server" Text="Complete" Font-Size="8pt" Font-Names="Arial" />
        </asp:Panel>
        <asp:Panel ID="pnlCompletePwd" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999;" Visible="false">
            <asp:ImageButton ID="btnCompleteAIPwd" runat="server" ImageUrl="~/images/ai_complete.png" ToolTip="Complete Action Item" CausesValidation="false" OnClick="ImageButton_Click" CommandArgument="OpenCompleteAIPwdModal" />
            <br />
            <asp:Label ID="lblCompleteAIPwd" runat="server" Text="Complete" />
        </asp:Panel>
        <div class="toolbarButton" style="border-right: 1px solid #dcdcdc;">
            <asp:ImageButton ID="btnReply" runat="server" ImageUrl="~/images/aireply.png" ToolTip="Reply to Sender" />
            <br />
            <asp:Label ID="lblReply" runat="server" Text="Reply" Font-Size="8pt" Font-Names="Arial" />
        </div>
        <div class="toolbarButton" style="border-right: 1px solid #999999;">
            <asp:ImageButton ID="btnForward" runat="server" ImageUrl="~/images/aiforward.png" ToolTip="Forward to Another User" />
            <br />
            <asp:Label ID="lblForward" runat="server" Text="Forward" Font-Size="8pt" Font-Names="Arial" />
        </div>
        <div class="toolbarButton" style="border-right: 1px solid #dcdcdc;">
            <asp:ImageButton ID="btnPrevious" runat="server" ImageUrl="~/images/previous.png" ToolTip="Previous" OnClick="ImageButton_Click" CommandArgument="Previous" />
            <br />
            <asp:Label ID="lblPrevious" runat="server" Text="Previous" />
        </div>
        <div class="toolbarButton" style="border-right: 1px solid #999999;">
            <asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/images/next.png" ToolTip="Next" OnClick="ImageButton_Click" CommandArgument="Next" />
            <br />
            <asp:Label ID="lblNext" runat="server" Text="Next" />
        </div>
        <div class="toolbarButton">
            <asp:ImageButton ID="btnExit" runat="server" ImageUrl="~/images/exit.png" ToolTip="Close Action Item" OnClick="ImageButton_Click" CommandArgument="CloseWindow" />
            <br />
            <asp:Label ID="lblExitAI" runat="server" Text="Close" Font-Size="8pt" Font-Names="Arial" />
        </div>
    </div>
    <div id="pnlAIInfo">
        <table class="aiTable">
            <tr>
                <td class="aiTitleLabel">
                    Title:
                </td>           
                <td colspan="5" class="aiTitleField">
                    <asp:Label ID="lblTitle" runat="server" Font-Size="9pt" Font-Bold="true" />
                </td>                        
            </tr>
            <tr>
                <td class="aiLabelLeft">
                    Priority:
                </td>
                <td class="aiFieldLeft">
                    <asp:Label ID="lblPriority" runat="server" Font-Size="9pt" />
                </td>
                <td class="aiLabelMiddle">
                    Status:
                </td>
                <td class="aiFieldMiddle">
                    <asp:Label ID="lblStatus" runat="server" Font-Size="9pt" />
                </td>
                <td class="aiLabelRight">
                    <asp:Label ID="lblComplete" runat="server" Font-Size="9pt" />:
                </td>
                <td class="aiFieldRight">
                    <asp:Label ID="lblDateDue" runat="server" Font-Size="9pt" />
                </td>
            </tr>
            <tr>
                <td class="aiLabelLeft">
                    Sender:
                </td>
                <td class="aiFieldLeft">
                    <asp:Label ID="lblSender" runat="server" Font-Size="9pt" />
                </td>
                <td class="aiLabelMiddle">
                    Date Sent:
                </td>
                <td class="aiFieldMiddle">
                    <asp:Label ID="lblSent" runat="server" Font-Size="9pt" />
                </td>
                <td class="aiLabelRight">
                    Category:
                </td>
                <td class="aiFieldRight">
                    <asp:Label ID="lblCategory" runat="server" Font-Size="9pt" />
                </td>
            </tr>
        </table>
    </div>
    <div id="pnlAIDetails">
        Details:
        <br />
        <asp:TextBox ID="txtDetails" runat="server" CssClass="aiDetails" ReadOnly="true" TextMode="MultiLine" Font-Names="Arial" />
    </div>

    <asp:Button ID="btnHidden" runat="server" style="display: none;" />
    <a id="dummyLink" href="#" style="display: none; visibility: hidden;" runat="server"></a>
    <a id="dummyLinkPwd" href="#" style="display: none; visibility: hidden;" runat="server"></a>
    <asp:ModalPopupExtender ID="mpAIPwdCnf" runat="server" PopupControlID="pnlAIPwdConfirm" TargetControlID="dummyLinkPwd"
        CancelControlID="btnCancelPwd" Drag="true" PopupDragHandleControlID="pnlAIPwdCnfDrag" BackgroundCssClass="modalBackground" />
    <asp:modalpopupextender ID="mpCompleteAI" runat="server" PopUpControlID="pnlAIComplete" TargetControlID="dummyLink"
        CancelControlID="btnCancel" Drag="true" PopupDragHandleControlID="pnlAIDrag" BackgroundCssClass="modalBackground" BehaviorID="mpCompleteAI" />
    <asp:modalpopupextender ID="mpForwardAI" runat="server" PopUpControlID="pnlAIForward" TargetControlID="btnFWSelectOK"
        CancelControlID="btnFWCancel" Drag="true" PopupDragHandleControlID="pnlAIFWDrag" BackgroundCssClass="modalBackground" />
    <asp:modalpopupextender ID="mpReplyAI" runat="server" PopUpControlID="pnlAIReply" TargetControlID="btnReply"
        CancelControlID="btnReplyCancel" Drag="true" PopupDragHandleControlID="pnlAIReplyDrag" BackgroundCssClass="modalBackground" />
    <asp:modalpopupextender ID="mpFWUserSelect" runat="server" PopUpControlID="pnlSelectUser" TargetControlID="btnForward"
        CancelControlID="btnFWSelectCancel" Drag="true" PopupDragHandleControlID="pnlDragHandle" BackgroundCssClass="modalBackground" />

    <%-- PASSWORD CONFIRMATION MODAL POPUP --%>
    <asp:Panel ID="pnlAIPwdConfirm" runat="server" style="display: none;" DefaultButton="btnSubmitPwd">
        <asp:Panel ID="pnlAIPwdCnfDrag" runat="server">
            Password Confirmation
            <asp:ImageButton ID="imgClosePwd" runat="server" ImageUrl="~/images/squareclose.png" Height="20px" Width="20px" CausesValidation="false" CssClass="btnClose" />
        </asp:Panel>
        <div id="pnlAIPwdCnfBody">
            <div class="pwd-body-left">&nbsp;</div>
            <div class="pwd-body-right">
                <div class="pwd-label">
                    <span>Confirm password:</span>
                </div>
                <div class="pwd-field">
                    <asp:TextBox ID="txtPwdCnf" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                </div>
                <div class="pwd-buttons">
                    <asp:Button ID="btnSubmitPwd" runat="server" Text="Submit" OnClick="Button_Click" CommandArgument="PwdCnf" />
                    <asp:Button ID="btnCancelPwd" runat="server" Text="Cancel" />
                </div>
            </div>
        </div>
    </asp:Panel>

    <%-- COMPLETE ACTION ITEM MODAL POPUP --%>
    <asp:Panel ID="pnlAIComplete" runat="server" style="display: none" DefaultButton="btnOK">
        <asp:Panel ID="pnlAIDrag" runat="server">
            Comments
            <asp:ImageButton ID="imgClose" runat="server" ImageUrl="~/images/squareclose.png" Height="20px" Width="20px" CausesValidation="false" CssClass="btnClose" />
        </asp:Panel>
        <table class="aiCompleteTable">
            <tr>
                <td style="height: 5px">
                    
                </td>
            </tr>
            <tr>
                <td class="resultLabel">
                    <asp:Label ID="lblSelectResult" runat="server" Text="Result:" />&nbsp;
                </td>
                <td>
                    <asp:DropDownList ID="ddlResults" runat="server" Width="350px" AutoPostBack="false" ValidationGroup="CompleteAI" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select Result --" Value="0" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must select a result." Text="*" ControlToValidate="ddlResults" Display="None" InitialValue="0" SetFocusOnError="true" ValidationGroup="CompleteAI" />
                </td>
            </tr>            
            <tr>
                <td colspan="2" class="commentsLabel">
                    Comments:
                </td>
            </tr>
            <tr>
                <td colspan="2" class="commentsField">
                    <asp:TextBox ID="txtComments" runat="server" Width="460px" Height="200px" Wrap="true" BorderWidth="2px" BorderColor="#FFFFFF" BorderStyle="Inset" TextMode="MultiLine" Font-Names="Arial" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="complete">
                    <asp:Button ID="btnOK" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="CompleteActionItem" ValidationGroup="CompleteAI" CausesValidation="true" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="60px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" DisplayMode="BulletList" ShowSummary="false" ValidationGroup="CompleteAI" />

    <%-- SELECT USERS MODAL POPUP --%>
    <asp:Panel ID="pnlSelectUser" runat="server" style="display: none">
        <asp:Panel ID="pnlDragHandle" runat="server">
            <asp:Label ID="lblModalDragHandle" runat="server" Text="Select User/Entity" ForeColor="#FFFFFF" Font-Bold="true" />
            <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/images/squareclose.png" Width="20px" Height="20px" CssClass="btnClose" />
        </asp:Panel>
        <asp:UpdatePanel ID="ModalUpdatePanel1" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlModal" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="btnModalAdd" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFWSelectCancel" EventName="Click" />
            </Triggers>
        <ContentTemplate>
        <div id="pnlModalDDL">
            <asp:Label ID="lblModalDDL" runat="server" Text="Select Type:" />
            <asp:DropDownList ID="ddlModal" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlModal_SelectedIndexChanged">
                <asp:ListItem Value="0" Text="(Select)" Selected="True" />
                <asp:ListItem Value="1" Text="Users" />
                <asp:ListItem Value="2" Text="Organization" />
            </asp:DropDownList>
        </div>
        <div id="pnlFields">
            <div id="pnlModalSelect">
                <asp:ListBox ID="lbModalSelect" runat="server" Width="100%" Height="480px" SelectionMode="Multiple" CssClass="lbMSelect" />
                <asp:TreeView ID="P3Tree" runat="server" ShowLines="True" BackColor="White" NodeIndent="15" ExpandDepth="1" OnTreeNodePopulate="P3Tree_TreeNodePopulate" OnSelectedNodeChanged="P3Tree_SelectedNodeChanged">
                    <RootNodeStyle ImageUrl="~/images/entity.png" />
                    <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" ImageUrl="~/images/entity.png" NodeSpacing="0px" VerticalPadding="0px" />
                    <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                </asp:TreeView>
            </div>
            <div id="pnlModalButtons">
                <asp:Button ID="btnModalAdd" runat="server" Text="Add >" Width="90px" OnClick="Button_Click" CommandArgument="AddUsers" />
                <br /><br />
                <asp:Button ID="btnModalRemove" runat="server" Text="< Remove" Width="90px" OnClick="Button_Click" CommandArgument="RemoveUsers" />
            </div>
            <div id="pnlModalSelected">
                <asp:GridView ID="gvModalSelected" runat="server" BackColor="#FFFFFF" AutoGenerateColumns="false" DataKeyNames="NumData, TextData, Type" GridLines="None" Width="100%" OnRowDataBound="gvModalSelected_RowDataBound">
                    <HeaderStyle BackColor="#F0F0F0" BorderStyle="Solid" BorderWidth="1px" BorderColor="#000000" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="#F0F0F0" ForeColor="#000000" />
                    <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                    <Columns>
                        <asp:BoundField DataField="NumData" HeaderText="ID">
                            <HeaderStyle Width="35px" HorizontalAlign="Left" Font-Bold="false" />
                            <ItemStyle Width="35px" HorizontalAlign="Left" ForeColor="#000000" Font-Bold="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TextData" HeaderText="Name">
                            <HeaderStyle HorizontalAlign="Left" Font-Bold="false" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" ForeColor="#000000" Font-Bold="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Type" HeaderText="Type">
                           <HeaderStyle Width="60px" HorizontalAlign="Left" Font-Bold="false" />
                           <ItemStyle Width="60px" HorizontalAlign="Left" VerticalAlign="Top" ForeColor="#000000" Font-Bold="false" />
                        </asp:BoundField>
                    </Columns>                        
                </asp:GridView>  
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <div id="pnlModalFooter">
            <asp:Button ID="btnFWSelectOK" runat="server" Text="OK" Width="60px" />
            <asp:Button ID="btnFWSelectCancel" runat="server" Text="Cancel" Width="60px" />
        </div>
    </asp:Panel>
        
    <%-- FORWARD ACTION ITEM MODAL POPUP --%>

        <asp:Panel ID="pnlAIForward" runat="server" style="display: none">
            <asp:Panel ID="pnlAIFWDrag" runat="server">
                Comments
                <asp:ImageButton ID="btnCloseFW" runat="server" ImageUrl="~/images/squareclose.png" CssClass="btnClose"
                    Height="20px" Width="20px" />
            </asp:Panel>
            <table class="aiForwardTable">           
            <tr>
                <td colspan="2" class="commentsLabel">
                    Comments:
                </td>
            </tr>
            <tr>
                <td colspan="2" class="commentsField">
                    <asp:TextBox ID="txtFWComments" runat="server" Width="460px" Height="200px" Wrap="true" BorderWidth="2px"
                        BorderColor="#FFFFFF" BorderStyle="Inset" TextMode="MultiLine" Font-Names="Arial">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="forward">
                    <asp:Button ID="btnFWOK" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="ForwardActionItem" />
                    <asp:Button ID="btnFWCancel" runat="server" Text="Cancel" Width="60px" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <%-- REPLY ACTION ITEM MODAL POPUP --%>
    <asp:Panel ID="pnlAIReply" runat="server" Height="295px" style="display: none">
        <asp:Panel ID="pnlAIReplyDrag" runat="server">
            Comments
            <asp:ImageButton ID="btnCloseReply" runat="server" ImageUrl="~/images/squareclose.png" CssClass="btnClose" Height="20px" Width="20px" />
        </asp:Panel>
        <table class="aiForwardTable">           
            <tr>
                <td colspan="2" class="commentsLabel">
                    Comments:
                </td>
            </tr>
            <tr>
                <td colspan="2" class="commentsField">
                    <asp:TextBox ID="txtReplyComments" runat="server" Width="460px" Height="200px" Wrap="true" BorderWidth="2px" BorderColor="#FFFFFF" BorderStyle="Inset" TextMode="MultiLine" Font-Names="Arial">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="forward">
                    <asp:Button ID="btnReplyOK" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="ReplyActionItem" />
                    <asp:Button ID="btnReplyCancel" runat="server" Text="Cancel" Width="60px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    <div id="pleasewait" class="pleaseWait" style="display: none;">
        <img src="images/pleasewait.gif" alt="please wait" />
    </div>
</body>
</html>
