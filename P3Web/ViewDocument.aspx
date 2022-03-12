<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocument.aspx.cs" Inherits="Paradigm3.ViewDocument" Async="true" meta:resourcekey="PageResource1" %>

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
        <asp:UpdatePanel ID="udpDocData" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <div id="topBar">
            <div id="pnlToolbarLeft">
                <div class="toolbarButton">
                    <asp:ImageButton ID="btnProperties" runat="server" ImageUrl="~/images/properties.png" ToolTip="Show Properties" meta:resourcekey="btnPropertiesResource1" />
                    <br />
                    <asp:Label ID="lblProperties" runat="server" Text="Properties" meta:resourcekey="lblPropertiesResource1" />
                </div>
                <asp:Panel ID="pnlParaLink" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlParaLinkResource1">
                    <asp:ImageButton ID="btnParaLink" runat="server" ImageUrl="~/images/paralink.png" ToolTip="View Para-Links&reg;" meta:resourcekey="btnParaLinkResource1" />
                    <br />
                    <asp:Label ID="lblParaLink" runat="server" Text="Para-Link" meta:resourcekey="lblParaLinkResource1" />
                </asp:Panel>
                <asp:Panel ID="pnlRelatedAI" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlRelatedAIResource1">
                    <asp:ImageButton ID="btnRelatedAI" runat="server" ImageUrl="~/images/actionitem.png" ToolTip="View Related Action Items" meta:resourcekey="btnRelatedAIResource1" />
                    <br />
                    <asp:Label ID="lblRelatedAI" runat="server" Text="Related AI" meta:resourcekey="lblRelatedAIResource1" />
                </asp:Panel>
                <div class="toolbarButton">
                    <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/images/exit.png" ToolTip="Close Document" OnClick="btnCloseDoc_Click" meta:resourcekey="btnCloseResource1" />
                    <br />
                    <asp:Label ID="lblClose" runat="server" Text="Close" meta:resourcekey="lblCloseResource1" />
                </div>
            </div>            
            <div id="pnlToolbarRight">
                <div class="doc-top-row">
                    <div class="left-column">
                        <div><asp:Label ID="NameLabel" runat="server" Text="Name:" meta:resourcekey="NameLabel"></asp:Label></div>
                        <div><asp:Label ID="lblNameData" CssClass="truncate" runat="server" meta:resourcekey="lblNameDataResource1" /></div>
                    </div>
                    <div class="right-column">
                        <div><asp:Label ID="ReleasedLabel" runat="server" Text="Released:" meta:resourcekey="ReleasedLabel"></asp:Label></div>
                        <div>
                            <asp:Label ID="lblReleasedData" runat="server" meta:resourcekey="lblReleasedDataResource1" />&nbsp;
                            <asp:Label ID="lblReleasedByData" runat="server" meta:resourcekey="lblReleasedByDataResource1" />
                        </div>
                    </div>
                </div>
                <div class="doc-bottom-row">
                    <div class="left-column">
                        <div><asp:Label ID="LabelLabel" runat="server" Text="Label:" meta:resourcekey="LabelLabel"></asp:Label></div>
                        <div><asp:Label ID="lblLabelData" CssClass="truncate" runat="server" meta:resourcekey="lblLabelDataResource1" /></div>
                    </div>
                    <div class="right-column">
                        <div><asp:Label ID="VersionLabel" runat="server" Text="Version:" meta:resourcekey="VersionLabel"></asp:Label></div>
                        <div>
                            <asp:Label ID="lblVersionData" runat="server" meta:resourcekey="lblVersionDataResource1" />&nbsp;
                            <asp:Label ID="lblStatusData" runat="server" meta:resourcekey="lblStatusDataResource1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="udpDocument" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlDocView" runat="server" meta:resourcekey="pnlDocViewResource1">
                <iframe id="DocViewer" runat="server" class="docFrame"></iframe>
            </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnGoThere" runat="server" OnClick="BtnGoThere_Click" style="display: none;" CommandArgument="GoThere" meta:resourcekey="btnGoThereResource1" />
		<asp:Button ID="btnCloseDoc" runat="server" OnClick="btnCloseDoc_Click" style="display: none;" meta:resourcekey="btnCloseDocResource1" />
    </form>
</body>
</html>
