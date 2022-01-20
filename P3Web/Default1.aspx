<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="P3Web.Default1" Async="true" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>P3Web</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Modals.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"></asp:ScriptManager>
        <input type="hidden" id="scrollPos" runat="server" />
        <div id="main">
            <div id="toolBar">
                Toolbar
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
</body>
</html>
