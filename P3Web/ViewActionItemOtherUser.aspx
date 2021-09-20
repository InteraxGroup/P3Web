<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewActionItemOtherUser.aspx.cs" Inherits="Paradigm3.ViewActionItemOtherUser" Async="true" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Other Users Action Items</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body class="aiBody">
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <input type="hidden" id="scrollPos" runat="server" />
        <div style="height: 50px; padding: 10px; box-sizing: border-box;">
            <span style="font-size: .75em;">Action Items for user(s):</span><br />
            <asp:TextBox ID="txtUsers" runat="server" Width="99%" ReadOnly="true" style="background-color: #f0f0f0;"></asp:TextBox>
        </div>
        <asp:UpdatePanel ID="udpAIList" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BtnRefreshAI" EventName="Click" />
        </Triggers>
        <ContentTemplate>
        <div style="height: calc(100vh - 110px); padding: 10px; box-sizing: border-box;">
            <div id="resultlist" style="width: 100%; height: 100%; background-color: #fff; border: 1px solid #000; overflow: auto;">
                <asp:GridView ID="gvAIList" runat="server" CssClass="gridView" Width="1500px" AutoGenerateColumns="False" DataKeyNames="AIID,Status,UserID,SenderID,NotifiedStatus,ShowModuleID,ShowID,Priority"
                    GridLines="None" AllowSorting="true" OnRowDataBound="Gv_RowDataBound" OnSelectedIndexChanged="Gv_SelectedIndexChanged" OnSorting="SortGv">
                    <HeaderStyle CssClass="gridViewHeader" />
                    <RowStyle CssClass="gridViewRow" />
                    <AlternatingRowStyle CssClass="gridViewAltRow" />
                    <SelectedRowStyle CssClass="gridViewSelRow" />
                    <Columns>
                        <asp:TemplateField HeaderText="" HeaderStyle-Width="30px" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="left">
                            <ItemTemplate>
                                <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" ImageUrl="~/images/actionitem.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserName" HeaderText="Recipient" SortExpression="UserName">
                            <HeaderStyle CssClass="gridViewHeader" Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="ActionItem" SortExpression="Name">
                            <HeaderStyle CssClass="gridViewHeader" Width="450px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status">
                            <HeaderStyle CssClass="gridViewHeader" Width="120px" />                        
                        </asp:BoundField>
                        <asp:BoundField DataField="ShowModuleID" HeaderText="Related Module" SortExpression="ShowModuleID">
                            <HeaderStyle CssClass="gridViewHeader" Width="120px" />                        
                        </asp:BoundField>
                        <asp:BoundField DataField="ShowID" HeaderText="Related ID" SortExpression="ShowID">
                            <HeaderStyle CssClass="gridViewHeader" Width="100px" /> 
                        </asp:BoundField>
                        <asp:BoundField DataField="DateDue" HeaderText="Due Date" SortExpression="DateDue">
                            <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SenderName" HeaderText="Sent By" SortExpression="SenderName">
                            <HeaderStyle CssClass="gridViewHeader" Width="150px" />                              
                        </asp:BoundField>
                        <asp:BoundField DataField="SendDate" HeaderText="Sent Date" SortExpression="SendDate">
                            <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AIID" HeaderText="ID" SortExpression="AIID">
                            <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority">
                            <HeaderStyle CssClass="gridViewHeader" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CompleteDate" HeaderText="Completed Date" SortExpression="CompleteDate">
                            <HeaderStyle CssClass="gridViewHeader" Width="150px" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="udpButtons" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="height: 40px; padding: 10px; box-sizing: border-box; text-align: right;">
                    <asp:Button ID="btnOpen" runat="server" Text="Open" Width="70px" OnClick="Button_Click" />
                    <button type="button" name="close" onclick="window.close()" style="width: 70px;">Close</button>
                </div>
                <div style="height: 10px; padding: 2px 5px; box-sizing:border-box; font-size: .75em; border-top: 1px solid #dcdcdc;">
            Total Items: <asp:Label ID="lblTotalAI" runat="server"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnRefreshAI" runat="server" OnClick="BtnRefreshAI_Click" style="display: none;" />
    </form>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            var elem = document.getElementById("resultlist");
            var val = document.getElementById("scrollPos").value;
            if (elem !== null) {
                setSearchScrollPos(val);
            }
        }        
	</script>
</body>
</html>
