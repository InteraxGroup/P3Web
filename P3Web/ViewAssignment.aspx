<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssignment.aspx.cs" Inherits="Paradigm3.ViewAssignment" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Improvement Assignment</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <link href="styles/Assignment.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
        <div class="assignmentTitle">
            Assign Step Responsible
        </div>
        <div class="assignmentContent">
            <div style="display: block; padding: 5px 0;">
                Select the step Responsible
            </div>
            <div style="display: block;">
                <div class="assignmentList">
                    <asp:GridView ID="gvResponsible" runat="server" DataKeyNames="ControlID" Width="100%" AutoGenerateColumns="False" GridLines="None" meta:resourcekey="gvResponsibleResource1">
                        <Columns>
                            <asp:TemplateField HeaderText="" ItemStyle-Width="20px" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" Checked="True" meta:resourcekey="chkSelectResource1" />
                                </ItemTemplate>

<ItemStyle Width="20px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Name" DataField="ControlFullName" HeaderStyle-HorizontalAlign="Left" meta:resourcekey="BoundFieldResource1" >
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Type" DataField="ControlType" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="40px" meta:resourcekey="BoundFieldResource2" >
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle Width="40px"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="assignmentButtons">
                    <asp:Button ID="btnAddResponsible" runat="server" Width="70px" Text="Add" OnClick="Button_Click" CommandArgument="assignresponsible" meta:resourcekey="btnAddResponsibleResource1" />
                </div>
            </div>
            <div class="dueDateLabel">
                <div style="display: inline-block; width: 100px;">
                    Due Date:
                </div>
                <div class="generalField">
                    <asp:TextBox ID="txtDueDate" runat="server" meta:resourcekey="txtDueDateResource1" />
                    <ajax:CalendarExtender ID="ceDueDate" runat="server" TargetControlID="txtDueDate" BehaviorID="ceDueDate" />
                </div>
            </div>
            <div class="escalateContent">
                <asp:UpdatePanel ID="udpEscalate" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="escalateCheck">
                            <asp:CheckBox ID="chkEscalate" runat="server" Text="If Action Item is overdue " AutoPostBack="True" OnCheckedChanged="chkEscalate_CheckedChanged" meta:resourcekey="chkEscalateResource1" />
                        </div>
                        <div class="generalField">
                            <asp:TextBox ID="txtNumDays" runat="server" meta:resourcekey="txtNumDaysResource1" />
                            <ajax:NumericUpDownExtender ID="neNumDays" runat="server" TargetControlID="txtNumDays" Width="50" Minimum="0" BehaviorID="neNumDays" Maximum="1.7976931348623157E+308" RefValues="" ServiceDownMethod="" ServiceDownPath="" ServiceUpMethod="" Tag="" TargetButtonDownID="" TargetButtonUpID="" />
                                days, send escalated Action Item to:
                        </div>
                        <div class="escalateListContent">
                            <asp:Panel ID="pnlEscalateList" runat="server" CssClass="escalateList" meta:resourcekey="pnlEscalateListResource1">
                                <asp:GridView ID="gvEscalate" runat="server" DataKeyNames="ControlID" Width="100%" AutoGenerateColumns="False" GridLines="None" meta:resourcekey="gvEscalateResource1">
                                    <Columns>
                                        <asp:BoundField HeaderText="Name" DataField="ControlFullName" meta:resourcekey="BoundFieldResource3" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Type" DataField="ControlType" meta:resourcekey="BoundFieldResource4" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                            <div class="escalateButtons">
                                <p>
                                    <asp:Button ID="btnAddEscalate" runat="server" Width="70px" Text="Add" OnClick="Button_Click" CommandArgument="assignEscalate" meta:resourcekey="btnAddEscalateResource1" />
                                </p>
                                <p>
                                    <asp:Button ID="btnRemoveEscalate" runat="server" Width="70px" Text="Remove" meta:resourcekey="btnRemoveEscalateResource1" />
                                </p>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>                
            </div>
            <div class="mainButtons">
                <asp:Button ID="btnSubmit" runat="server" Width="80px" Text="OK" OnClick="Button_Click" CommandArgument="submit" meta:resourcekey="btnSubmitResource1" />
                <asp:Button ID="btnCancel" runat="server" Width="80px" Text="Cancel" OnClick="Button_Click" CommandArgument="cancel" meta:resourcekey="btnCancelResource1" />
            </div>
        </div>
        <asp:Button ID="btnUpdateRespList" runat="server" OnClick="Button_Click" CommandArgument="refreshresponsible" style="display: none;" meta:resourcekey="btnUpdateRespListResource1" />
        <asp:Button ID="btnUpdateEscList" runat="server" OnClick="Button_Click" CommandArgument="refreshescalate" style="display: none;" meta:resourcekey="btnUpdateEscListResource1" />
    </form>
</body>
</html>
