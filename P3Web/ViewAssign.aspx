<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssign.aspx.cs" Inherits="Paradigm3.ViewAssign" EnableEventValidation="false" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Select User/Entity</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <link href="styles/Assignment.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="assignEntityPanel">
            <div class="assignmentTitle">
                Assign User/Entity
            </div>                   
            <div class="assignFields" style="padding-top: 5px;">
                <asp:UpdatePanel ID="udpSelect" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                <div class="assignSelect">
                    <asp:ListBox ID="lbSelect" runat="server" SelectionMode="Multiple" CssClass="lbAssignSelect" Visible="false" />
                    <asp:TreeView ID="P3UTree" runat="server"
                        ShowLines="True" 
                        BackColor="White" 
                        NodeIndent="15" 
                        ExpandDepth="1" 
                        OnTreeNodePopulate="P3UTree_TreeNodePopulate" 
                        OnSelectedNodeChanged="P3UTree_SelectedNodeChanged" 
                        Visible="false">
                        <RootNodeStyle ImageUrl="~/images/users_sm.png" Height="20px"  />
                        <NodeStyle ImageUrl="~/images/users2.png"  ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="8pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" />
                        <%--<LeafNodeStyle ImageUrl="~/images/user.png"  ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="8pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" />--%>
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                    <asp:TreeView ID="P3Tree" runat="server" 
                        ShowLines="True" 
                        BackColor="White" 
                        NodeIndent="15" 
                        ExpandDepth="1" 
                        OnTreeNodePopulate="P3Tree_TreeNodePopulate" 
                        OnSelectedNodeChanged="P3Tree_SelectedNodeChanged" 
                        Visible="false">
                        <RootNodeStyle ImageUrl="~/images/entity.png" />
                        <NodeStyle ImageUrl="~/images/entity.png"  ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="8pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
                <div class="assignButtons">
                    <p>
                        <asp:Button ID="btnAddEntity" runat="server" Text="Add >" Width="90px" OnClick="Button_Click" CommandArgument="addentity" />
                    </p>
                    <p>
                        <asp:Button ID="btnRemoveEntity" runat="server" Text="< Remove" Width="90px" OnClick="Button_Click" CommandArgument="removeentity" />
                    </p>
                </div>                
                <div class="assignSelected">
                    <asp:GridView ID="gvSelected" runat="server" BackColor="#FFFFFF" AutoGenerateColumns="false" DataKeyNames="NumData, TextData, Type" GridLines="None" Width="100%" OnRowDataBound="GVSelected_RowDataBound">
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
                </ContentTemplate>
                </asp:UpdatePanel>
                <div class="assignFooter">
                    <asp:Button ID="btnSubmit" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="submit" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="60px" OnClick="Button_Click" CommandArgument="cancel" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
