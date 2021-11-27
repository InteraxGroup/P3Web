<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssign.aspx.cs" Inherits="Paradigm3.ViewAssign" EnableEventValidation="false" Async="true" meta:resourcekey="PageResource1" %>

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
                <asp:Label ID="lblAssignTitle" runat="server" Text="Assign User/Entity" meta:resourcekey="lblAssignTitle"></asp:Label>
            </div>                   
            <div class="assignFields" style="padding-top: 5px;">
                <asp:UpdatePanel ID="udpSelect" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                <div class="assignSelect">
                    <asp:ListBox ID="lbSelect" runat="server" SelectionMode="Multiple" CssClass="lbAssignSelect" Visible="False" meta:resourcekey="lbSelectResource1" />
                    <asp:TreeView ID="P3UTree" runat="server"
                        ShowLines="True" 
                        BackColor="White" 
                        NodeIndent="15" 
                        ExpandDepth="1" 
                        OnTreeNodePopulate="P3UTree_TreeNodePopulate" 
                        OnSelectedNodeChanged="P3UTree_SelectedNodeChanged" 
                        Visible="False" meta:resourcekey="P3UTreeResource1">
                        <RootNodeStyle ImageUrl="~/images/users_sm.png" Height="20px"  />
                        <NodeStyle ImageUrl="~/images/users2.png"  ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="8pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                    <asp:TreeView ID="P3Tree" runat="server" 
                        ShowLines="True" 
                        BackColor="White" 
                        NodeIndent="15" 
                        ExpandDepth="1" 
                        OnTreeNodePopulate="P3Tree_TreeNodePopulate" 
                        OnSelectedNodeChanged="P3Tree_SelectedNodeChanged" 
                        Visible="False" meta:resourcekey="P3TreeResource1">
                        <RootNodeStyle ImageUrl="~/images/entity.png" />
                        <NodeStyle ImageUrl="~/images/entity.png"  ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="8pt" Font-Underline="False" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
                <div class="assignButtons">
                    <p>
                        <asp:Button ID="btnAddEntity" runat="server" Text="Add >" Width="90px" OnClick="Button_Click" CommandArgument="addentity" meta:resourcekey="btnAddEntityResource1" />
                    </p>
                    <p>
                        <asp:Button ID="btnRemoveEntity" runat="server" Text="< Remove" Width="90px" OnClick="Button_Click" CommandArgument="removeentity" meta:resourcekey="btnRemoveEntityResource1" />
                    </p>
                </div>                
                <div class="assignSelected">
                    <asp:GridView ID="gvSelected" runat="server" BackColor="White" AutoGenerateColumns="False" DataKeyNames="NumData,TextData,Type" GridLines="None" Width="100%" OnRowDataBound="GVSelected_RowDataBound" meta:resourcekey="gvSelectedResource1">
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
                </ContentTemplate>
                </asp:UpdatePanel>
                <div class="assignFooter">
                    <asp:Button ID="btnSubmit" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="submit" meta:resourcekey="btnSubmitResource1" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="60px" OnClick="Button_Click" CommandArgument="cancel" meta:resourcekey="btnCancelResource1" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
