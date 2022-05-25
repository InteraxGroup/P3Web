<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestDocument.aspx.cs" Inherits="P3Web.TestDocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>    
</head>
<body>   
    <form id="form1" runat="server">
        <div>
            <h1>Test Document PDF Viewer</h1>
            <iframe title="documentviewer" style="width: 500px; height: 500px;" src="lib/pdfjs/web/viewer.html?file=../test.pdf"></iframe>
        </div>
    </form>
</body>
</html>
