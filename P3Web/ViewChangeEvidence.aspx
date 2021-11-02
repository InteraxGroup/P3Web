<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewChangeEvidence.aspx.cs" Inherits="Paradigm3.ViewChangeEvidence"  Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Change to Evidence</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
	<link href="styles/Modify.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="modify-body">
            <div class="modify-title">             
               <asp:Label ID="lblTitle" runat="server"  style="display:flex; flex-direction:row;  margin-left:20%">Do you want to proceed?</asp:Label>               
            </div>           
           <div style="flex: 1 1 auto; display:flex; flex-direction:row; align-items: center; justify-content: center;">
               <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Yes" Width="70px" />&nbsp;
               <asp:Button ID="btn_No" runat="server" OnClientClick="window.close(); return false;" Text="No" Width="70px" />
           </div>
        </div>
    </form>
</body>
</html>
