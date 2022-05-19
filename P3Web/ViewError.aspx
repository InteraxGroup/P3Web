<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewError.aspx.cs" Inherits="Paradigm3.ViewError" meta:resourcekey="PageResource1" %>

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
            <asp:Label ID="ErrorTitle" runat="server" Text=" Paradigm 3 Error" Font-Size="X-Large" Font-Bold="True" ForeColor="#E0E0E0" meta:resourcekey="ErrorTitleResource1" />
            <asp:ImageButton ID="btnExit" runat="server" OnClick="btnExit_Click" ImageAlign="Right" meta:resourcekey="btnExiteResource" OnClientClick="window.close();" />
            <asp:ImageButton ID="btnHome" runat="server" OnClick="btnHome_Click" ImageAlign="Left" meta:resourcekey="btnHomeResource1" />
        </div>
          <div style="float:left;width:20px; height:20px; position:relative" >
             <asp:Image ID="imgAlert" runat="server" style="width:30px; height:30px; position:relative; margin-left: 3px" />
              <i class="fa-solid fa-triangle-exclamation"></i>
                </div>
        <div id="pnlError">
            <%= GetLocalResourceObject("ErrorPara1") %>            
            <asp:Label ID="lblStackTrace" runat="server" meta:resourcekey="lblStackTraceResource1"></asp:Label>
            <br /><br />
            <%= GetLocalResourceObject("ErrorPara2") %>       
               
        </div>
    </form>
</body>
</html>