<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocument.aspx.cs" Inherits="Paradigm3.ViewDocument" Async="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Document</title>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body class="docBody">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="udpDocData" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
        <div id="pnlDocToolBar">
            <div id="pnlToolbarLeft">
                <div class="toolbarButton">
                    <asp:ImageButton ID="btnProperties" runat="server" ImageUrl="~/images/properties.png" ToolTip="Show Properties" />
                    <br />
                    <asp:Label ID="lblProperties" runat="server" Text="Properties" Font-Size="8pt" Font-Names="Arial" />
                </div>
                <asp:Panel ID="pnlParaLink" runat="server" CssClass="toolbarButton" Visible="false">
                    <asp:ImageButton ID="btnParaLink" runat="server" ImageUrl="~/images/paralink.png" ToolTip="View Para-Links&reg;" />
                    <br />
                    <asp:Label ID="lblParaLink" runat="server" Text="Para-Link&reg;" Font-Size="8pt" Font-Names="Arial" />
                </asp:Panel>
                <asp:Panel ID="pnlRelatedAI" runat="server" CssClass="toolbarButton" Visible="false">
                    <asp:ImageButton ID="btnRelatedAI" runat="server" ImageUrl="~/images/actionitem.png" ToolTip="View Related Action Items" />
                    <br />
                    <asp:Label ID="lblRelatedAI" runat="server" Text="Related AI" Font-Size="8pt" Font-Names="Arial" />
                </asp:Panel>
                <div class="toolbarButton">
                    <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/images/exit.png" ToolTip="Close Document" OnClick="btnCloseDoc_Click" />
                    <br />
                    <asp:Label ID="lblClose" runat="server" Text="Close" Font-Size="8pt" Font-Names="Arial" />
                </div>
            </div>            
            <div id="pnlToolbarRight">
                <div class="doc-top-row">
                    <div class="left-column">
                        <div>Name:</div>
                        <div><asp:Label ID="lblNameData" CssClass="truncate" runat="server" /></div>
                    </div>
                    <div class="right-column">
                        <div>Released:</div>
                        <div>
                            <asp:Label ID="lblReleasedData" runat="server" Font-Size="9pt" />&nbsp;
                            <asp:Label ID="lblReleasedByData" runat="server" Font-Size="9pt" />
                        </div>
                    </div>
                </div>
                <div class="doc-bottom-row">
                    <div class="left-column">
                        <div>Label:</div>
                        <div><asp:Label ID="lblLabelData" CssClass="truncate" runat="server" /></div>
                    </div>
                    <div class="right-column">
                        <div>Version:</div>
                        <div>
                            <asp:Label ID="lblVersionData" runat="server" Font-Size="9pt" />&nbsp;
                            <asp:Label ID="lblStatusData" runat="server" Font-Size="9pt" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="udpDocument" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <asp:Panel ID="pnlDocView" runat="server">
                <iframe id="DocViewer" runat="server" class="docFrame"></iframe>
            </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnGoThere" runat="server" OnClick="BtnGoThere_Click" style="display: none;" CommandArgument="GoThere" />
		<asp:Button ID="btnCloseDoc" runat="server" OnClick="btnCloseDoc_Click" style="display: none;" />
    </form>
</body>
</html>
