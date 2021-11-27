<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRelatedActionItem.aspx.cs" Inherits="Paradigm3.ViewRelatedActionItem" EnableEventValidation="false" meta:resourcekey="PageResource1" %>

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
        <asp:UpdatePanel ID="udpRelatedAI" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <div id="toolBar">
            <div style="display: block; position: relative; width: 800px; position: relative;">
                <div class="toolbarButton">
                    <asp:ImageButton ID="btnView" runat="server" ImageUrl="~/images/view.png" OnClick="ImageButton_Click" CommandArgument="View" meta:resourcekey="btnViewResource1" />
                    <br />
                    <asp:Label ID="lblView" runat="server" Text="View" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblViewResource1" />
                </div>
                <div class="toolbarButton">
                    <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/images/exit.png" OnClick="ImageButton_Click" CommandArgument="Close" meta:resourcekey="btnCloseResource1" />
                    <br />
                    <asp:Label ID="lblClose" runat="server" Text="Close" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblCloseResource1" />
                </div>
            </div>
        </div>
        <div id="plItemVersion">
            <table style="width: 800px">
            <tr>
                <td style="width: 175px; text-align: right">
                    <asp:Label ID="lblConfirm" runat="server" Text="Action Items related to item:&nbsp;" meta:resourcekey="lblConfirmResource1" />
                </td>
                <td>
                    <asp:TextBox ID="txtConfirm" runat="server" Width="610px" ReadOnly="True" meta:resourcekey="txtConfirmResource1" />
                </td>
            </tr>
            <tr>
                <td style="width: 175px; text-align: right">
                    <asp:Label ID="lblVersion" runat="server" Text="Version:&nbsp;" meta:resourcekey="lblVersionResource1" />
                </td>
                <td>
                    <asp:DropDownList ID="ddlVersion" runat="server" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="DDLVersion_SelectedIndexChanged" meta:resourcekey="ddlVersionResource1" />
                </td>
            </tr>
        </table>
        </div>
        <div id="pnlAIList">
            <asp:GridView ID="gvAIList" runat="server" GridLines="None" DataKeyNames="AIID,ShowModuleID" Width="1080px" AutoGenerateColumns="False" OnRowDataBound="gvAIList_RowDataBound" meta:resourcekey="gvAIListResource1">
                <HeaderStyle  BackColor="#F0F0F0" Font-Bold="False" Font-Size="Small" Height="20px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                <RowStyle BackColor="White" ForeColor="Black" VerticalAlign="Middle" Height="20px" Font-Size="8pt" />
                <AlternatingRowStyle BackColor="#F0F0F0" />
                <SelectedRowStyle BackColor="#0078D7" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="Recipient" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Width="150px" ForeColor="Black" HorizontalAlign="Left" />
                        <ItemStyle Width="150px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Status" HeaderText="Status" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Width="80px" ForeColor="Black" HorizontalAlign="Left" />
                        <ItemStyle Width="80px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Action Item" meta:resourcekey="BoundFieldResource3">
                        <HeaderStyle ForeColor="Black" HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ShowModuleID" HeaderText="Module" meta:resourcekey="BoundFieldResource4">
                        <HeaderStyle Width="80px" ForeColor="Black" HorizontalAlign="Left" />
                        <ItemStyle Width="80px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DateDue" HeaderText="Date Due" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource5">
                        <HeaderStyle Width="80px" ForeColor="Black" HorizontalAlign="Left" />
                        <ItemStyle Width="80px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SenderName" HeaderText="Sent By" meta:resourcekey="BoundFieldResource6">
                        <HeaderStyle Width="150px" ForeColor="Black" HorizontalAlign="Left" />
                        <ItemStyle Width="150px" HorizontalAlign="Left" Font-Size="8pt" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SendDate" HeaderText="Sent Date" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource7">
                        <HeaderStyle Width="80px" ForeColor="Black" HorizontalAlign="Left" />
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
