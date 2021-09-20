<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssessment.aspx.cs" Inherits="Paradigm3.ViewAssessment" %>

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
<body class="assessmentBody">
    <form id="form1" runat="server">
        <div style="position: relative;">
            <div class="assessmentTitle">
                Training Assessment
            </div>
            <div class="assessmentContent">
                <p>To finish this requirement, there is a training assessment must be successfully completed.  If you continue, do not close or refresh the window during the assessment or the questions will re-randomize and your results will be lost.</p>
                <p><strong>Do you wish to continue?</strong></p>
                <div class="assessmentOptions">
                    <asp:Button ID="btnStart" runat="server" Text="Yes" OnClick="Button_Click" CommandArgument="Assess" CssClass="assessmentButton" />
                    <asp:Button ID="btnCancel" runat="server" Text="No" OnClick="Button_Click" CommandArgument="Cancel" CssClass="assessmentButton" />
                </div> 
            </div>                       
        </div>
    </form>
</body>
</html>
