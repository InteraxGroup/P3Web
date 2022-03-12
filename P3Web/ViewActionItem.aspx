<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewActionItem.aspx.cs" Inherits="Paradigm3.ViewActionItem" EnableEventValidation="false" Async="true" meta:resourcekey="PageResource1" %>
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
    <asp:UpdatePanel ID="udpActionItem" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="topBar">
        <div class="toolbar">
            <asp:Label ID="lblCompleteTrigger" runat="server" style="display: none;" meta:resourcekey="lblCompleteTriggerResource1" />
            <asp:Panel ID="pnlShowMe" runat="server" CssClass="toolbarButton" Visible="False" style="border-right: 1px solid #dcdcdc;" meta:resourcekey="pnlShowMeResource1">
                <asp:ImageButton ID="btnShowMe" runat="server" ImageUrl="~/images/showme.png" CausesValidation="False" meta:resourcekey="btnShowMeResource1" />
                <br />
                <asp:Label ID="lblShowMeAI" runat="server" Text="Show Me" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblShowMeAIResource1" />
            </asp:Panel>
            <asp:Panel ID="pnlGoThere" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="False" meta:resourcekey="pnlGoThereResource1">
                <asp:ImageButton ID="btnGoThere" runat="server" ImageUrl="~/images/gothere.png" ToolTip="View Linked Folder" OnClick="ImageButton_Click" CommandArgument="GoThere" meta:resourcekey="btnGoThereResource1" />
                <br />
                <asp:Label ID="lblGoThere" runat="server" Text="Go There" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblGoThereResource1" />
            </asp:Panel>
            <asp:Panel ID="pnlComplete" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible ="False" meta:resourcekey="pnlCompleteResource1">
                <asp:ImageButton ID="btnComplete" runat="server" ImageUrl="~/images/ai_complete.png" ToolTip="Complete Action Item" ValidationGroup="CompleteAI" CausesValidation="False" OnClick="ImageButton_Click" CommandArgument="OpenCompleteAIModal" meta:resourcekey="btnCompleteResource1" />
                <br />
                <asp:Label ID="lblCompleteAI" runat="server" Text="Complete" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblCompleteAIResource1" />
            </asp:Panel>
            <asp:Panel ID="pnlCompletePwd" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999;" Visible="False" meta:resourcekey="pnlCompletePwdResource1">
                <asp:ImageButton ID="btnCompleteAIPwd" runat="server" ImageUrl="~/images/ai_complete.png" ToolTip="Complete Action Item" CausesValidation="False" OnClick="ImageButton_Click" CommandArgument="OpenCompleteAIPwdModal" meta:resourcekey="btnCompleteAIPwdResource1" />
                <br />
                <asp:Label ID="lblCompleteAIPwd" runat="server" Text="Complete" meta:resourcekey="lblCompleteAIPwdResource1" />
            </asp:Panel>
            <div class="toolbarButton" style="border-right: 1px solid #dcdcdc;">
                <asp:ImageButton ID="btnReply" runat="server" ImageUrl="~/images/aireply.png" ToolTip="Reply to Sender" meta:resourcekey="btnReplyResource1" />
                <br />
                <asp:Label ID="lblReply" runat="server" Text="Reply" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblReplyResource1" />
            </div>
            <div class="toolbarButton" style="border-right: 1px solid #999999;">
                <asp:ImageButton ID="btnForward" runat="server" ImageUrl="~/images/aiforward.png" ToolTip="Forward to Another User" meta:resourcekey="btnForwardResource1" />
                <br />
                <asp:Label ID="lblForward" runat="server" Text="Forward" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblForwardResource1" />
            </div>
            <div class="toolbarButton" style="border-right: 1px solid #dcdcdc;">
                <asp:ImageButton ID="btnPrevious" runat="server" ImageUrl="~/images/previous.png" ToolTip="Previous" OnClick="ImageButton_Click" CommandArgument="Previous" meta:resourcekey="btnPreviousResource1" />
                <br />
                <asp:Label ID="lblPrevious" runat="server" Text="Previous" meta:resourcekey="lblPreviousResource1" />
            </div>
            <div class="toolbarButton" style="border-right: 1px solid #999999;">
                <asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/images/next.png" ToolTip="Next" OnClick="ImageButton_Click" CommandArgument="Next" meta:resourcekey="btnNextResource1" />
                <br />
                <asp:Label ID="lblNext" runat="server" Text="Next" meta:resourcekey="lblNextResource1" />
            </div>
            <div class="toolbarButton">
                <asp:ImageButton ID="btnExit" runat="server" ImageUrl="~/images/exit.png" ToolTip="Close Action Item" OnClick="ImageButton_Click" CommandArgument="CloseWindow" meta:resourcekey="btnExitResource1" />
                <br />
                <asp:Label ID="lblExitAI" runat="server" Text="Close" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblExitAIResource1" />
            </div>
        </div>
    </div>
    <div id="pnlAIInfo">
        <table class="aiTable">
            <tr>
                <td class="aiTitleLabel">
                    <%= GetLocalResourceObject("TitleLabel") %>
                </td>           
                <td colspan="5" class="aiTitleField">
                    <asp:Label ID="lblTitle" runat="server" Font-Size="9pt" Font-Bold="True" meta:resourcekey="lblTitleResource1" />
                </td>                        
            </tr>
            <tr>
                <td class="aiLabelLeft">
                    <%= GetLocalResourceObject("PriorityLabel") %>
                </td>
                <td class="aiFieldLeft">
                    <asp:Label ID="lblPriority" runat="server" Font-Size="9pt" meta:resourcekey="lblPriorityResource1" />
                </td>
                <td class="aiLabelMiddle">
                    <%= GetLocalResourceObject("StatusLabel") %>
                </td>
                <td class="aiFieldMiddle">
                    <asp:Label ID="lblStatus" runat="server" Font-Size="9pt" meta:resourcekey="lblStatusResource1" />
                </td>
                <td class="aiLabelRight">
                    <asp:Label ID="lblComplete" runat="server" Font-Size="9pt" meta:resourcekey="lblCompleteResource1" />:
                </td>
                <td class="aiFieldRight">
                    <asp:Label ID="lblDateDue" runat="server" Font-Size="9pt" meta:resourcekey="lblDateDueResource1" />
                </td>
            </tr>
            <tr>
                <td class="aiLabelLeft">
                    <%= GetLocalResourceObject("SenderLabel") %>
                </td>
                <td class="aiFieldLeft">
                    <asp:Label ID="lblSender" runat="server" Font-Size="9pt" meta:resourcekey="lblSenderResource1" />
                </td>
                <td class="aiLabelMiddle">
                    <%= GetLocalResourceObject("DateSentLabel") %>
                </td>
                <td class="aiFieldMiddle">
                    <asp:Label ID="lblSent" runat="server" Font-Size="9pt" meta:resourcekey="lblSentResource1" />
                </td>
                <td class="aiLabelRight">
                    <%= GetLocalResourceObject("CategoryLabel") %>
                </td>
                <td class="aiFieldRight">
                    <asp:Label ID="lblCategory" runat="server" Font-Size="9pt" meta:resourcekey="lblCategoryResource1" />
                </td>
            </tr>
        </table>
    </div>
    <div id="pnlAIDetails">
        <%= GetLocalResourceObject("DetailsLabel") %>
        <br />
        <asp:TextBox ID="txtDetails" runat="server" CssClass="aiDetails" ReadOnly="True" TextMode="MultiLine" Font-Names="sans-serif" style="resize: none;" meta:resourcekey="txtDetailsResource1" />
    </div>

    <asp:Button ID="btnHidden" runat="server" style="display: none;" meta:resourcekey="btnHiddenResource1" />
    <a id="dummyLink" href="#" style="display: none; visibility: hidden;" runat="server"></a>
    <a id="dummyLinkPwd" href="#" style="display: none; visibility: hidden;" runat="server"></a>
    <asp:ModalPopupExtender ID="mpAIPwdCnf" runat="server" PopupControlID="pnlAIPwdConfirm" TargetControlID="dummyLinkPwd"
        CancelControlID="btnCancelPwd" Drag="True" PopupDragHandleControlID="pnlAIPwdCnfDrag" BackgroundCssClass="modalBackground" BehaviorID="mpAIPwdCnf" DynamicServicePath="" />
    <asp:modalpopupextender ID="mpCompleteAI" runat="server" PopUpControlID="pnlAIComplete" TargetControlID="dummyLink"
        CancelControlID="btnCancel" Drag="True" PopupDragHandleControlID="pnlAIDrag" BackgroundCssClass="modalBackground" BehaviorID="mpCompleteAI" DynamicServicePath="" />
    <asp:modalpopupextender ID="mpForwardAI" runat="server" PopUpControlID="pnlAIForward" TargetControlID="btnFWSelectOK"
        CancelControlID="btnFWCancel" Drag="True" PopupDragHandleControlID="pnlAIFWDrag" BackgroundCssClass="modalBackground" BehaviorID="mpForwardAI" DynamicServicePath="" />
    <asp:modalpopupextender ID="mpReplyAI" runat="server" PopUpControlID="pnlAIReply" TargetControlID="btnReply"
        CancelControlID="btnReplyCancel" Drag="True" PopupDragHandleControlID="pnlAIReplyDrag" BackgroundCssClass="modalBackground" BehaviorID="mpReplyAI" DynamicServicePath="" />
    <asp:modalpopupextender ID="mpFWUserSelect" runat="server" PopUpControlID="pnlSelectUser" TargetControlID="btnForward"
        CancelControlID="btnFWSelectCancel" Drag="True" PopupDragHandleControlID="pnlDragHandle" BackgroundCssClass="modalBackground" BehaviorID="mpFWUserSelect" DynamicServicePath="" />

    <asp:Panel ID="pnlAIPwdConfirm" runat="server" style="display: none;" DefaultButton="btnSubmitPwd" meta:resourcekey="pnlAIPwdConfirmResource1">
        <asp:Panel ID="pnlAIPwdCnfDrag" runat="server" meta:resourcekey="pnlAIPwdCnfDragResource1">
            <%= GetLocalResourceObject("PasswordConfirmationLabel") %>
            <asp:ImageButton ID="imgClosePwd" runat="server" ImageUrl="~/images/squareclose.png" Height="20px" Width="20px" CausesValidation="False" CssClass="btnClose" meta:resourcekey="imgClosePwdResource1" />
        </asp:Panel>
        <div id="pnlAIPwdCnfBody">
            <div class="pwd-body-left">&nbsp;</div>
            <div class="pwd-body-right">
                <div class="pwd-label">
                    <span><%= GetLocalResourceObject("ConfirmPasswordLabel") %></span>
                </div>
                <div class="pwd-field">
                    <asp:TextBox ID="txtPwdCnf" runat="server" TextMode="Password" Width="200px" meta:resourcekey="txtPwdCnfResource1"></asp:TextBox>
                </div>
                <div class="pwd-buttons">
                    <asp:Button ID="btnSubmitPwd" runat="server" Text="Submit" OnClick="Button_Click" CommandArgument="PwdCnf" meta:resourcekey="btnSubmitPwdResource1" />
                    <asp:Button ID="btnCancelPwd" runat="server" Text="Cancel" meta:resourcekey="btnCancelPwdResource1" />
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlAIComplete" runat="server" style="display: none" DefaultButton="btnOK" meta:resourcekey="pnlAICompleteResource1">
        <asp:Panel ID="pnlAIDrag" runat="server" meta:resourcekey="pnlAIDragResource1">
            <%= GetLocalResourceObject("CommentsTitleLabel") %>
            <asp:ImageButton ID="imgClose" runat="server" ImageUrl="~/images/squareclose.png" Height="20px" Width="20px" CausesValidation="False" CssClass="btnClose" meta:resourcekey="imgCloseResource1" />
        </asp:Panel>
        <table class="aiCompleteTable">
            <tr>
                <td style="height: 5px">
                    
                </td>
            </tr>
            <tr>
                <td class="resultLabel">
                    <asp:Label ID="lblSelectResult" runat="server" Text="Result:" meta:resourcekey="lblSelectResultResource1" />&nbsp;
                </td>
                <td>
                    <asp:DropDownList ID="ddlResults" runat="server" Width="350px" style="outline: none;" ValidationGroup="CompleteAI" AppendDataBoundItems="True" meta:resourcekey="ddlResultsResource1">
                        <asp:ListItem Text="-- Select Result --" Value="0" meta:resourcekey="ListItemResource1" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must select a result." Text="*" ControlToValidate="ddlResults" Display="None" InitialValue="0" SetFocusOnError="True" ValidationGroup="CompleteAI" meta:resourcekey="RequiredFieldValidator1Resource1" />
                </td>
            </tr>            
            <tr>
                <td colspan="2" class="commentsLabel">
                    <%= GetLocalResourceObject("CommentsLabel") %>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="commentsField">
                    <asp:TextBox ID="txtComments" runat="server" Width="460px" Height="200px" BorderWidth="2px" BorderColor="White" BorderStyle="Inset" TextMode="MultiLine" Font-Names="Arial" style="resize: none; outline: none;" meta:resourcekey="txtCommentsResource1" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="complete">
                    <asp:Button ID="btnOK" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="CompleteActionItem" ValidationGroup="CompleteAI" meta:resourcekey="btnOKResource1" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="60px" meta:resourcekey="btnCancelResource1" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="CompleteAI" meta:resourcekey="ValidationSummary1Resource1" />

    <asp:Panel ID="pnlSelectUser" runat="server" style="display: none" meta:resourcekey="pnlSelectUserResource1">
        <asp:Panel ID="pnlDragHandle" runat="server" meta:resourcekey="pnlDragHandleResource1">
            <asp:Label ID="lblModalDragHandle" runat="server" Text="Select User/Entity" ForeColor="White" Font-Bold="True" meta:resourcekey="lblModalDragHandleResource1" />
            <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/images/squareclose.png" Width="20px" Height="20px" CssClass="btnClose" meta:resourcekey="btnCloseResource1" />
        </asp:Panel>
        <asp:UpdatePanel ID="ModalUpdatePanel1" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlModal" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="btnModalAdd" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnFWSelectCancel" EventName="Click" />
            </Triggers>
        <ContentTemplate>
        <div id="pnlModalDDL">
            <asp:Label ID="lblModalDDL" runat="server" Text="Select Type:" meta:resourcekey="lblModalDDLResource1" />
            <asp:DropDownList ID="ddlModal" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlModal_SelectedIndexChanged" meta:resourcekey="ddlModalResource1">
                <asp:ListItem Value="0" Text="(Select)" Selected="True" meta:resourcekey="ListItemResource2" />
                <asp:ListItem Value="1" Text="Users" meta:resourcekey="ListItemResource3" />
                <asp:ListItem Value="2" Text="Organization" meta:resourcekey="ListItemResource4" />
            </asp:DropDownList>
        </div>
        <div id="pnlFields">
            <div id="pnlModalSelect">
                <asp:ListBox ID="lbModalSelect" runat="server" Width="100%" Height="480px" SelectionMode="Multiple" CssClass="lbMSelect" meta:resourcekey="lbModalSelectResource1" />
                <asp:TreeView ID="P3Tree" runat="server" ShowLines="True" BackColor="White" NodeIndent="15" ExpandDepth="1" OnTreeNodePopulate="P3Tree_TreeNodePopulate" OnSelectedNodeChanged="P3Tree_SelectedNodeChanged" meta:resourcekey="P3TreeResource1">
                    <RootNodeStyle ImageUrl="~/images/entity.png" />
                    <NodeStyle ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" ImageUrl="~/images/entity.png" NodeSpacing="0px" VerticalPadding="0px" />
                    <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                </asp:TreeView>
            </div>
            <div id="pnlModalButtons">
                <asp:Button ID="btnModalAdd" runat="server" Text="Add >" Width="90px" OnClick="Button_Click" CommandArgument="AddUsers" meta:resourcekey="btnModalAddResource1" />
                <br /><br />
                <asp:Button ID="btnModalRemove" runat="server" Text="< Remove" Width="90px" OnClick="Button_Click" CommandArgument="RemoveUsers" meta:resourcekey="btnModalRemoveResource1" />
            </div>
            <div id="pnlModalSelected">
                <asp:GridView ID="gvModalSelected" runat="server" BackColor="White" AutoGenerateColumns="False" DataKeyNames="NumData,TextData,Type" GridLines="None" Width="100%" OnRowDataBound="gvModalSelected_RowDataBound" meta:resourcekey="gvModalSelectedResource1">
                    <HeaderStyle BackColor="#F0F0F0" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="#F0F0F0" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#0078D7" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="NumData" HeaderText="ID" meta:resourcekey="BoundFieldResource1">
                            <HeaderStyle Width="35px" HorizontalAlign="Left" Font-Bold="False" />
                            <ItemStyle Width="35px" HorizontalAlign="Left" ForeColor="Black" Font-Bold="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TextData" HeaderText="Name" meta:resourcekey="BoundFieldResource2">
                            <HeaderStyle HorizontalAlign="Left" Font-Bold="False" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" ForeColor="Black" Font-Bold="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Type" HeaderText="Type" meta:resourcekey="BoundFieldResource3">
                           <HeaderStyle Width="60px" HorizontalAlign="Left" Font-Bold="False" />
                           <ItemStyle Width="60px" HorizontalAlign="Left" VerticalAlign="Top" ForeColor="Black" Font-Bold="False" />
                        </asp:BoundField>
                    </Columns>                        
                </asp:GridView>  
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <div id="pnlModalFooter">
            <asp:Button ID="btnFWSelectOK" runat="server" Text="OK" Width="60px" meta:resourcekey="btnFWSelectOKResource1" />
            <asp:Button ID="btnFWSelectCancel" runat="server" Text="Cancel" Width="60px" meta:resourcekey="btnFWSelectCancelResource1" />
        </div>
    </asp:Panel>
        
        <asp:Panel ID="pnlAIForward" runat="server" style="display: none" meta:resourcekey="pnlAIForwardResource1">
            <asp:Panel ID="pnlAIFWDrag" runat="server" meta:resourcekey="pnlAIFWDragResource1">
                <%= GetLocalResourceObject("CommentsTitleLabel") %>
                <asp:ImageButton ID="btnCloseFW" runat="server" ImageUrl="~/images/squareclose.png" CssClass="btnClose"
                    Height="20px" Width="20px" meta:resourcekey="btnCloseFWResource1" />
            </asp:Panel>
            <table class="aiForwardTable">           
            <tr>
                <td colspan="2" class="commentsLabel">
                    <%= GetLocalResourceObject("CommentsLabel") %>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="commentsField">
                    <asp:TextBox ID="txtFWComments" runat="server" Width="460px" Height="200px" BorderWidth="2px" BorderColor="White" BorderStyle="Inset" TextMode="MultiLine" Font-Names="Arial" style="outline: none; resize: none;" meta:resourcekey="txtFWCommentsResource1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="forward">
                    <asp:Button ID="btnFWOK" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="ForwardActionItem" meta:resourcekey="btnFWOKResource1" />
                    <asp:Button ID="btnFWCancel" runat="server" Text="Cancel" Width="60px" meta:resourcekey="btnFWCancelResource1" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="pnlAIReply" runat="server" Height="295px" style="display: none" meta:resourcekey="pnlAIReplyResource1">
        <asp:Panel ID="pnlAIReplyDrag" runat="server" meta:resourcekey="pnlAIReplyDragResource1">
            <%= GetLocalResourceObject("CommentsTitleLabel") %>
            <asp:ImageButton ID="btnCloseReply" runat="server" ImageUrl="~/images/squareclose.png" CssClass="btnClose" Height="20px" Width="20px" meta:resourcekey="btnCloseReplyResource1" />
        </asp:Panel>
        <table class="aiForwardTable">           
            <tr>
                <td colspan="2" class="commentsLabel">
                    <%= GetLocalResourceObject("CommentsLabel") %>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="commentsField">
                    <asp:TextBox ID="txtReplyComments" runat="server" Width="460px" Height="200px" BorderWidth="2px" BorderColor="White" BorderStyle="Inset" TextMode="MultiLine" Font-Names="Arial" style="outline: none; resize: none;" meta:resourcekey="txtReplyCommentsResource1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="forward">
                    <asp:Button ID="btnReplyOK" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="ReplyActionItem" meta:resourcekey="btnReplyOKResource1" />
                    <asp:Button ID="btnReplyCancel" runat="server" Text="Cancel" Width="60px" meta:resourcekey="btnReplyCancelResource1" />
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
