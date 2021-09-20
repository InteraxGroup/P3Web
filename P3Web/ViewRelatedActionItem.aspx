<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRelatedActionItem.aspx.cs" Inherits="Paradigm3.ViewRelatedActionItem" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Related Action Items</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <script src="scripts/P3Web.js"></script>
    <link href="styles/Pages.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
</head>
<body class="relatedAI">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="udpRelatedAI" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
        <div id="toolBar">
            <div style="display: block; position: relative; width: 800px; position: relative;">
                <div class="toolbarButton">
                    <asp:ImageButton ID="btnView" runat="server" ImageUrl="~/images/view.png" OnClick="ImageButton_Click" CommandArgument="View" />
                    <br />
                    <asp:Label ID="lblView" runat="server" Text="View" Font-Size="8pt" Font-Names="Arial" />
                </div>
                <div class="toolbarButton">
                    <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/images/exit.png" OnClick="ImageButton_Click" CommandArgument="Close" />
                    <br />
                    <asp:Label ID="lblClose" runat="server" Text="Close" Font-Size="8pt" Font-Names="Arial" />
                </div>
            </div>
        </div>
        <div id="plItemVersion">
            <table style="width: 800px">
            <tr>
                <td style="width: 175px; text-align: right">
                    <asp:Label ID="lblConfirm" runat="server" Text="Action Items related to item:&nbsp;" />
                </td>
                <td>
                    <asp:TextBox ID="txtConfirm" runat="server" Width="610px" ReadOnly="true" />
                </td>
            </tr>
            <tr>
                <td style="width: 175px; text-align: right">
                    <asp:Label ID="lblVersion" runat="server" Text="Version:&nbsp;" />
                </td>
                <td>
                    <asp:DropDownList ID="ddlVersion" runat="server" Width="300px" AutoPostBack="true" OnSelectedIndexChanged="DDLVersion_SelectedIndexChanged" />
                </td>
            </tr>
        </table>
        </div>
        <div id="pnlAIList">
            <asp:GridView ID="gvAIList" runat="server" GridLines="None" DataKeyNames="AIID,ShowModuleID" Width="1080px" AutoGenerateColumns="false" OnRowDataBound="gvAIList_RowDataBound">
                <HeaderStyle  BackColor="#F0F0F0" Font-Bold="false" Font-Size="Small" Height="20px" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" />
                <RowStyle BackColor="#FFFFFF" ForeColor="#000000" VerticalAlign="Middle" Height="20px" Font-Size="8pt" />
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="Recipient">
                        <HeaderStyle Width="150px" ForeColor="#000000" HorizontalAlign="Left" />
                        <ItemStyle Width="150px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Status" HeaderText="Status">
                        <HeaderStyle Width="80px" ForeColor="#000000" HorizontalAlign="Left" />
                        <ItemStyle Width="80px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Action Item">
                        <HeaderStyle ForeColor="#000000" HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ShowModuleID" HeaderText="Module">
                        <HeaderStyle Width="80px" ForeColor="#000000" HorizontalAlign="Left" />
                        <ItemStyle Width="80px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DateDue" HeaderText="Date Due" DataFormatString="{0:d}">
                        <HeaderStyle Width="80px" ForeColor="#000000" HorizontalAlign="Left" />
                        <ItemStyle Width="80px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SenderName" HeaderText="Sent By">
                        <HeaderStyle Width="150px" ForeColor="#000000" HorizontalAlign="Left" />
                        <ItemStyle Width="150px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SendDate" HeaderText="Sent Date" DataFormatString="{0:d}">
                        <HeaderStyle Width="80px" ForeColor="#000000" HorizontalAlign="Left" />
                        <ItemStyle Width="80px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
