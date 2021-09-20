<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStatusControl.aspx.cs" Inherits="Paradigm3.ViewStatusControl" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Status Control</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>
</head>
<body class="statusBody">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="pnlStatusWindow">
            <div class="pnlStatusVersion" style="padding-bottom: 10px;">
                <span style="font-size: 1.35em;"><asp:Label ID="lblDocName" runat="server" /></span>
            </div>
            <div class="pnlStatusList">
                <div class="version-fields">
                    <div class="version-row-1">
                        <div class="version-text">
                            Current Version:
                        </div>
                        <div class="version-field">
                            <asp:TextBox ID="txtCurrVersion" runat="server" Width="110px" />
                        </div>
                    </div>
                    <div class="version-row-2">
                        <div class="version-text">
                            New Version:
                        </div>
                        <div class="version-field">
                            <asp:TextBox ID="txtNewVersion" runat="server" Width="110px" />
                        </div>
                    </div>
                    <div class="version-row-3">
                        <div class="version-text">Effective Date:</div>
                        <div class="version-field">
                            <asp:TextBox ID="txtEffectiveDate" runat="server" Width="110px" />
                            <ajax:CalendarExtender ID="ceEffectiveDate" runat="server" TargetControlID="txtEffectiveDate" Format="MM/dd/yyyy" />
                        </div>
                    </div>
                    <div class="version-row-4">
                        <div>
                            Details for History:
                        </div>
                        <div>
                            <asp:TextBox ID="txtHistory" runat="server" TextMode="MultiLine" Width="218px" Height="82px" />
                        </div>
                    </div>
                </div>
                <div class="version-options">
                    <fieldset class="version-options-list">
                        <legend>Revision Method</legend>
                        <asp:RadioButtonList ID="rblRevisionMethod" runat="server" Font-Size="11px" AutoPostBack="true" OnSelectedIndexChanged="rblRevisionMethod_SelectedIndexChanged">
                            <asp:ListItem Text="Auto Update" Value="0" Selected="true" />
                            <asp:ListItem Text="Manual Update" Value="1" />
                            <asp:ListItem Text="Do Not Update" Value="2" />
                        </asp:RadioButtonList>
                    </fieldset>
                    <div class="version-options-separator">
                        &nbsp;
                    </div>
                    <fieldset class="version-options-list">
                        <legend>Revision Type</legend>
                        <asp:RadioButtonList ID="rblRevisionType" runat="server" Font-Size="11px" AutoPostBack="true" OnSelectedIndexChanged="rblRevisionType_SelectedIndexChanged">
                            <asp:ListItem Text="Major (+1)" Value="0" Selected="true" />
                            <asp:ListItem Text="Medium (+0.1)" Value="1" />
                            <asp:ListItem Text="Minor (+0.0.1)" Value="2" />
                        </asp:RadioButtonList>
                    </fieldset>
                </div>
            </div>
            <div class="pnlStatusButtons">
                <asp:Button ID="btnSubmit" runat="server" Text="OK" Width="70px" OnClick="btnSubmit_Click" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Close" Width="70px" OnClientClick="window.close();" />
            </div>
        </div>
        <div id="statusMessagePanel">
            <div id="statusMessage">
                <label id="lblStatusMessage" runat="server"></label>
                <button id="closeRefreshDoc" onclick="hideStatusMessage();docRefresh();window.close();" style="width: 70px; margin: 20px auto 0 auto;">OK</button>
                <button id="closeRefreshRecord" onclick="hideStatusMessage();recordRefresh();window.close();" style="width: 70px; margin: 20px auto 0 auto;">OK</button>
            </div>
        </div>
    </form>
</body>
</html>
