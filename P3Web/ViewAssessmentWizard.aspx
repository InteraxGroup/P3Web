<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssessmentWizard.aspx.cs" Inherits="Paradigm3.ViewAssessmentWizard" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Competency Assessment</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <link href="styles/Assessment.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div style="position: relative;">
            <div class="assessmentTitle">
                Training Assessment
            </div>
            <asp:Panel ID="pnlWizard" runat="server" CssClass="assessmentContent" EnableViewState="False" meta:resourcekey="pnlWizardResource1">
            </asp:Panel>          
        </div>
    </form>
</body>
</html>
