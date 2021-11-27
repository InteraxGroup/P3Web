<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewChangeEvidence.aspx.cs" Inherits="Paradigm3.ViewChangeEvidence"  Async="true" meta:resourcekey="PageResource2" %>

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
               <asp:Label ID="lblTitle" runat="server"  style="display:flex; flex-direction:row;  margin-left:20%" meta:resourcekey="lblTitleResource2">Do you want to proceed?</asp:Label>
               
            </div>           
           <div style="padding: 20px; box-sizing: border-box; text-align:center;">
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Yes" Width="70px" meta:resourcekey="btnSubmitResource2" />
                <asp:Button ID="btn_No" runat="server" OnClientClick="window.close(); return false;" Text="No" Width="70px" meta:resourcekey="btn_NoResource2" />
            </div>
        </div>
     
    </form>
</body>
</html>
