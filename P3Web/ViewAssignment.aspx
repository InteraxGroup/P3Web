<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssignment.aspx.cs" Inherits="Paradigm3.ViewAssignment" %>

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
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
        <div class="assignmentTitle">
            Assign Step Responsible
        </div>
        <div class="assignmentContent">
            <div style="display: block; padding: 5px 0;">
                Select the step Responsible
            </div>
            <div style="display: block;">
                <div class="assignmentList">
                    <asp:GridView ID="gvResponsible" runat="server" DataKeyNames="ControlID" Width="100%" AutoGenerateColumns="false" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="" ItemStyle-Width="20px">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" Text="" Checked="true" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Name" DataField="ControlFullName" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Type" DataField="ControlType" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="40px" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="assignmentButtons">
                    <asp:Button ID="btnAddResponsible" runat="server" Width="70px" Text="Add" OnClick="Button_Click" CommandArgument="assignresponsible" />
                </div>
            </div>
            <div class="dueDateLabel">
                <div style="display: inline-block; width: 100px;">
                    Due Date:
                </div>
                <div class="generalField">
                    <asp:TextBox ID="txtDueDate" runat="server" />
                    <ajax:CalendarExtender ID="ceDueDate" runat="server" TargetControlID="txtDueDate" />
                </div>
            </div>
            <div class="escalateContent">
                <asp:UpdatePanel ID="udpEscalate" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="escalateCheck">
                            <asp:CheckBox ID="chkEscalate" runat="server" Text="If Action Item is overdue " TextAlign="Right" AutoPostBack="true" OnCheckedChanged="chkEscalate_CheckedChanged" />
                        </div>
                        <div class="generalField">
                            <asp:TextBox ID="txtNumDays" runat="server" />
                            <ajax:NumericUpDownExtender ID="neNumDays" runat="server" TargetControlID="txtNumDays" Width="50" Minimum="0" />
                                days, send escalated Action Item to:
                        </div>
                        <div class="escalateListContent">
                            <asp:Panel ID="pnlEscalateList" runat="server" CssClass="escalateList">
                                <asp:GridView ID="gvEscalate" runat="server" DataKeyNames="ControlID" Width="100%" AutoGenerateColumns="false" GridLines="None">
                                    <Columns>
                                        <asp:BoundField HeaderText="Name" DataField="ControlFullName" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Type" DataField="ControlType" HeaderStyle-HorizontalAlign="Left" />
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                            <div class="escalateButtons">
                                <p>
                                    <asp:Button ID="btnAddEscalate" runat="server" Width="70px" Text="Add" OnClick="Button_Click" CommandArgument="assignEscalate" />
                                </p>
                                <p>
                                    <asp:Button ID="btnRemoveEscalate" runat="server" Width="70px" Text="Remove" />
                                </p>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>                
            </div>
            <div class="mainButtons">
                <asp:Button ID="btnSubmit" runat="server" Width="80px" Text="OK" OnClick="Button_Click" CommandArgument="submit" />
                <asp:Button ID="btnCancel" runat="server" Width="80px" Text="Cancel" OnClick="Button_Click" CommandArgument="cancel" />
            </div>
        </div>
        <asp:Button ID="btnUpdateRespList" runat="server" OnClick="Button_Click" CommandArgument="refreshresponsible" style="display: none;" />
        <asp:Button ID="btnUpdateEscList" runat="server" OnClick="Button_Click" CommandArgument="refreshescalate" style="display: none;" />
    </form>
</body>
</html>
