<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="P3Web.Default1" Async="true" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>P3Web</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Modals.css" rel="stylesheet" />    
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"></asp:ScriptManager>
        <input type="hidden" id="scrollPos" runat="server" />
        <div id="main">
            <div id="toolBar">
                <asp:ImageButton ID="btnLogon" runat="server" CssClass="logonButton" OnClick="ImageButton_Click" CommandArgument="gotoLogon" CommandName="goToLogon" meta:resourcekey="btnLogonResource1" />
                    <asp:ImageButton ID="btnLogout" runat="server" CssClass="logonButton" OnClick="ImageButton_Click" CommandArgument="doLogout" CommandName="doLogout" meta:resourcekey="btnLogoutResource1" />
                    <asp:Label ID="lblLogon" runat="server" CssClass="logonLabel" Font-Bold="True" meta:resourcekey="lblLogonResource1" />
                    <div style="display: block; position: relative;">
						<asp:Panel ID="pnlGuide" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" meta:resourcekey="pnlGuideResource1">
							<asp:ImageButton ID="btnGuide" runat="server" ImageUrl="~/images/help.png" OnClientClick="javascript:window.open('guide/guide.pdf'); return false;" meta:resourcekey="btnGuideResource1" />
                            <br />
                            <asp:Label ID="lblGuide" runat="server" Text="User Guide" meta:resourcekey="lblGuideResource1" />
						</asp:Panel>
                        <asp:Panel ID="pnlAdd" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlAddResource1">
                            <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/images/add.png" OnClick="ImageButton_Click" CommandArgument="AddItem" meta:resourcekey="btnAddResource1" />
                            <br />
                            <asp:Label ID="lblAdd" runat="server" Text="Add New" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblAddResource1" />
                            <%--<asp:Panel id="pnlAddDropDown" runat="server" CssClass="dropdown-content" style="max-width: 200px;" Visible="False" meta:resourcekey="pnlAddDropDownResource1">
                                <asp:Menu ID="mnuAddDoc" runat="server" OnMenuItemClick="mnuAddDoc_MenuItemClick" meta:resourcekey="mnuAddDocResource1">
                                </asp:Menu>
                            </asp:Panel>--%>
                        </asp:Panel>
                        <asp:Panel ID="pnlEdit" runat="server" CssClass="toolbarButton" Visible="False" style="border-right: 1px solid #999999;" meta:resourcekey="pnlEditResource1">
                            <asp:ImageButton ID="btnEdit" runat="server" OnClick="ImageButton_Click" CommandArgument="EditItem" meta:resourcekey="btnEditResource1" />
                            <br />
                            <asp:Label ID="lblEdit" runat="server" Text="Edit" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblEditResource1" />
                        </asp:Panel>
                        <asp:Panel ID="pnlView" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlViewResource1">
                            <asp:ImageButton ID="btnView" runat="server" ImageUrl="~/images/view.png" OnClick="ImageButton_Click" CommandArgument="ViewItem" meta:resourcekey="btnViewResource1" />
                            <br />
                            <asp:Label ID="lblView" runat="server" Text="View" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblViewResource1" />
                        </asp:Panel>
                        <asp:Panel ID="pnlProperties" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlPropertiesResource1">
                            <asp:ImageButton ID="btnProperties" runat="server" ImageUrl="~/images/properties.png" OnClick="ImageButton_Click" CommandArgument="Properties" meta:resourcekey="btnPropertiesResource1" />
                            <br />
                            <asp:Label ID="lblProperties" runat="server" Text="Properties" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblPropertiesResource1" />
                        </asp:Panel>
                        <asp:Panel ID="pnlStatus" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="False" meta:resourcekey="pnlStatusResource1">
                            <asp:ImageButton ID="btnStatus" runat="server" ImageUrl="~/images/status.png" OnClick="ImageButton_Click" CommandArgument="Status" meta:resourcekey="btnStatusResource1" />
                            <br />
                            <asp:Label ID="lblStatus" runat="server" Text="Status" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblStatusResource1" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRelatedAI" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlRelatedAIResource1">
                            <asp:ImageButton ID="btnRelatedAI" runat="server" ImageUrl="~/images/actionitem.png" OnClick="ImageButton_Click" CommandArgument="RelatedAI" meta:resourcekey="btnRelatedAIResource1" />
                            <br />
                            <asp:Label ID="lblRelatedAI" runat="server" Text="Related AI" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblRelatedAIResource1" />
                        </asp:Panel>
                        <asp:Panel ID="pnlOtherUserAI" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="False" meta:resourcekey="pnlOtherUserAIResource1">
                            <asp:ImageButton ID="btnOtherUserAI" runat="server" ImageUrl="~/images/actionitem_otheruser.png" OnClick="ImageButton_Click" CommandArgument="OtherUserAI" meta:resourcekey="btnOtherUserAIResource1" />
                            <br />
                            <asp:Label ID="lblOtherUserAI" runat="server" Text="Other User" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblOtherUserAIResource1" />
                        </asp:Panel>
                        <asp:Panel ID="pnlParaLink" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="False" meta:resourcekey="pnlParaLinkResource1">
                            <asp:ImageButton ID="btnParaLink" runat="server" ImageUrl="~/images/paralink.png" OnClick="ImageButton_Click" CommandArgument="ParaLink" meta:resourcekey="btnParaLinkResource1" />
                            <br />
                            <asp:Label ID="lblParaLink" runat="server" Text="Para-Link" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblParaLinkResource1" />
                        </asp:Panel>
                        <asp:Panel ID="pnlSearch" runat="server" CssClass="toolbarButton" meta:resourcekey="pnlSearchResource1">
                            <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/images/search.png" OnClick="ImageButton_Click" CommandArgument="Search" meta:resourcekey="btnSearchResource1" />
                            <br />
                            <asp:Label ID="lblSearch" runat="server" Text="Search" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblSearchResource1" />
                        </asp:Panel>                        
                        <asp:Panel ID="pnlProgress" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlProgressResource1">
                            <asp:ImageButton ID="btnProgress" runat="server" ImageUrl="~/images/progress.png" OnClick="ImageButton_Click" CommandArgument="Progress" meta:resourcekey="btnProgressResource1" />
                            <br />
                            <asp:Label ID="lblProgress" runat="server" Text="Progress" Font-Size="8pt" Font-Names="Arial" meta:resourcekey="lblProgressResource1" />
                        </asp:Panel>                        
                    </div>
            </div>
            <div id="application">
                <div id="LeftPane">
                    Left
                </div>
                <div id="RightPane">
                    Right
                </div>
            </div>
            <div id="footer">
                Footer
            </div>
        </div>
    </form>
    <script src="scripts/P3Web.js"></script>
</body>
</html>
