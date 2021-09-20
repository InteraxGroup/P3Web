<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewError.aspx.cs" Inherits="Paradigm3.ViewError" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Error</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
</head>
<body class="errorBody">
    <form id="form1" runat="server">
        <div id="pnlDetails">
            <asp:Label ID="ErrorTitle" runat="server" Text="Paradigm 3 Error..." Font-Size="X-Large" Font-Bold="true" ForeColor="#E0E0E0" />
            <asp:ImageButton ID="btnHome" runat="server" OnClick="btnHome_Click" ImageAlign="Right" />
        </div>
        <div id="pnlError">
            An error has occurred in the page and the application cannot continue:
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblError" runat="server" Font-Size="Large" Font-Bold="true" ForeColor="Red" />
            <br /><br />
            <asp:Label ID="lblStackTrace" runat="server"></asp:Label>
            <br /><br />
            More information is available in the Application Event Log on the server.  Please contact an Administrator to report the error and describe the process that caused it. We apologize for the inconvenience.
        </div>
    </form>
</body>
</html>
