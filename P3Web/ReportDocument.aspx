<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportDocument.aspx.cs" Inherits="Paradigm3.ReportDocument" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Document Report</title>
    <link href="styles/DocReport.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
</head>
<body class="reportBody">
    <form id="form1" runat="server">        
        <div class="pnlStatusTitle">
            Current Document Report - <asp:Label ID="lblDate" runat="server" />
        </div>
        <div style="padding: 10px; width: 100%;">
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
        </div>
        <%--<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />--%>
        <asp:Panel ID="ph1" runat="server" ScrollBars="Auto" CssClass="test">

        </asp:Panel>
    </form>
</body>
</html>
