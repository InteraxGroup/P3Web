<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStatus.aspx.cs" Inherits="Paradigm3.ViewStatus" Async="true" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> <%=GetLocalResourceObject("PageResource1.Title") %> </title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body class="statusBody">
    <form id="form1" runat="server">
        <div class="pnlStatusWindow">
            <div class="pnlStatusTitle">
                 <%=GetLocalResourceObject("pnlStatusTitle") %>  
            </div>
            <div class="pnlStatusVersion">
                <span style="font-size: 1.35em;"><%=GetLocalResourceObject("pnlStatusVersion") %>  <asp:Label ID="lblVersion" runat="server" Font-Bold="True" meta:resourcekey="lblVersionResource1" /></span>
            </div>
            <div class="pnlStatusList" style="padding-left: 20px;">
                <asp:RadioButtonList ID="rbStatus" runat="server" meta:resourcekey="rbStatusResource1">
            
                </asp:RadioButtonList>
            </div>
            <div class="pnlStatusButtons">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="Button_Click" CommandArgument="Submit" meta:resourcekey="btnSubmitResource1" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="window.close();" meta:resourcekey="btnCancelResource1" />
            </div>
        </div>
        <div id="statusMessagePanel">
        <div id="statusMessage">
            <label id="lblStatusMessage" runat="server"></label>
            <button id="closeRefreshDoc" onclick="hideStatusMessage();docRefresh();window.close();" style="width: 70px; margin: 20px auto 0 auto;">OK</button>
            <button id="closeRefreshRecord" onclick="hideStatusMessage();recordRefresh();window.close();" style="width: 70px; margin: 20px auto 0 auto;">OK</button>
        </div>
    </div>
    </form>    
</body>
</html>
