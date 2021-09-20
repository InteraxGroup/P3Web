<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFieldEdit.aspx.cs" Inherits="Paradigm3.ViewFieldEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Edit Field</title>
    <link href="styles/Pages.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body style="padding: 0; margin: 0; width: 100vw; box-sizing: border-box; background-color: #f0f0f0;">
    <form id="form1" runat="server">
        
        <div class="fieldEdit">
            <asp:Label ID="lblFieldName" runat="server" Text="Edit Field Contents" />
            <asp:TextBox ID="txtFieldContents" runat="server" TextMode="MultiLine" />
        </div>
        <div class="fieldEditButtons">
            <asp:Button ID="btnSubmit" runat="server" OnClick="Button_Click" CommandArgument="submit" Text="Submit" />
            <asp:Button ID="btnCancel" runat="server" OnClick="Button_Click" CommandArgument="cancel" Text="Cancel" />
        </div>        
    </form>
</body>
</html>
