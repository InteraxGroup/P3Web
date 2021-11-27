<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssessmentResult.aspx.cs" Inherits="Paradigm3.ViewAssessmentResult" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Assessment.css" rel="stylesheet" />
</head>
<body class="assessmentBody">
    <form id="form1" runat="server">
        <div class="assessmentTitle">
            Assessment Results
        </div>
        <div class="assessmentResults">
            <div class="resultDetails">
                <div class="resultID">
                    Assessment 
                    <asp:Label ID="lblID" runat="server" meta:resourcekey="lblIDResource1"></asp:Label>
                </div>                
            </div>
            <div class="resultNumbers">
                <div class="resultID">
                    Item ID:
                    <asp:Label ID="lblItemID" runat="server" meta:resourcekey="lblItemIDResource1"></asp:Label>
                </div>
                <div class="resultID">
                    Total Questions:
                    <asp:Label ID="lblTotalQues" runat="server" meta:resourcekey="lblTotalQuesResource1"></asp:Label>
                </div>
                <div class="resultID">
                    Correct Answers:
                    <asp:Label ID="lblTotalCrct" runat="server" meta:resourcekey="lblTotalCrctResource1"></asp:Label>
                </div>
                <div class="resultID">
                    Required:
                    <asp:Label ID="lblRequired" runat="server" meta:resourcekey="lblRequiredResource1"></asp:Label>
                </div>
            </div>
            <div class="resultText">
                <asp:Label ID="lblResult" runat="server" meta:resourcekey="lblResultResource1"></asp:Label>
            </div>
            <div class="resultInstruction">
                <asp:Label ID="lblInstruction" runat="server" meta:resourcekey="lblInstructionResource1"></asp:Label>
            </div>
        </div>
        <div class="resultButton">
            <asp:Button ID="btnClose" runat="server" Text="Close" OnClientClick="window.close()" meta:resourcekey="btnCloseResource1" />
        </div>
    </form>
    <script src="scripts/P3Web.js"></script>
</body>
</html>
