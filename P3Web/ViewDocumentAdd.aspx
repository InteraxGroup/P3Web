<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocumentAdd.aspx.cs" Inherits="Paradigm3.ViewDocumentAdd" Async="true" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Add New Document</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
	<link href="styles/Document.css" rel="stylesheet" />
	<link href="styles/Pages.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body style="overflow: hidden;">
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="add-document" style="overflow: hidden;">            
            <div class="add-document-header" style="border-bottom: 1px solid #dcdcdc; padding-bottom: 5px; font-size: 20px;">
                <asp:Label ID="lblAddTitle" runat="server" Text="Import New File(s)"></asp:Label>
            </div>            
            <div class="add-document-browse" style="display: block; overflow-y: auto; padding: 20px;">
				<%--<ajax:AjaxFileUpload ID="AjaxFileUpload1" runat="server" 
                    AutoStartUpload="true" 
                    AllowedFileTypes="xls,xlsx,doc,docx,ppt,pptx,rtf,txt,csv,sql,vsd,dwg,msg,jpg,png,bmp,gif"
                    OnUploadComplete="AjaxFileUpload1_UploadComplete"
                    OnClientUploadError="uploadError" />--%>
                <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
                <p>
                    <asp:Label ID="lblTEST" runat="server"></asp:Label>
                </p>                
            </div>			
            <div class="add-document-buttons" style="border-top: 1px solid #dcdcdc;">
                <asp:Button ID="btnOK" runat="server" Text="OK" Width="70px" OnClick="btnOK_Click" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClientClick="window.close()" />
            </div>
        </div>
        <div id="statusMessagePanel">
            <div id="statusMessage">
                <asp:Label ID="lblStatusMessage" runat="server"></asp:Label>
                <button id="closeRefreshDoc" onclick="hideStatusMessage();docRefresh();window.close();" style="width: 70px; margin: 20px auto 0 auto;">OK</button>
                <button id="closeRefreshRecord" onclick="hideStatusMessage();recordRefresh();window.close();" style="width: 70px; margin: 20px auto 0 auto;">OK</button>
            </div>
        </div>
    </form>
</body>
</html>
