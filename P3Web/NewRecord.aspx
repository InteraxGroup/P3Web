<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRecord.aspx.cs" Inherits="Paradigm3.NewRecord" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Add New Record</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="~/images/favicon.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/NewRecord.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body class="addRecordBody">
    <form id="form1" runat="server">
        <div class="pnlAddRecord">
        <table style="width: 100%; padding: 0px;">
            <tr>
                <td class="fieldName">
                    Name:
                </td>
                <td class="fieldValue">
                    <asp:TextBox ID="txtName" runat="server" Width="325px" ValidationGroup="GenAdd" />                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must enter a name."
                        ControlToValidate="txtName" Display="None" SetFocusOnError="true" ValidationGroup="AddRecord" />
                    <asp:DropDownList ID="ddlName" runat="server" Width="330px" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Training Definition" Value="0" Selected="true" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" runat="server" ErrorMessage="You must select a name."
                        ControlToValidate="ddlName" Display="None" SetFocusOnError="true" ValidationGroup="AddTraining" />
                </td>
            </tr>
            <tr>
                <td class="fieldName">
                    Label:
                </td>
                <td class="fieldValue">
                    <asp:TextBox ID="txtLabel" runat="server" Width="325px" />
                </td>
            </tr>
            <tr>
                <td class="fieldName">
                    Folder:
                </td>
                <td class="fieldValue">
                    <asp:DropDownList ID="ddlFolders" runat="server" Width="330px" AppendDataBoundItems="true" OnSelectedIndexChanged="DDLFolders_SelectedIndexChanged">
                        <asp:ListItem Text="Raise to Selected Folder" Value="0" Selected="True" />
                    </asp:DropDownList>
                </td>                
            </tr>
            <tr>
                <td class="fieldName" style="vertical-align: top;">
                    <asp:Label ID="lblTrainee" runat="server" Text="Users:" />
                </td>
                <td class="fieldValue">
                    <asp:ListBox ID="lbTrainee" runat="server" Width="330px" SelectionMode="Multiple">
                    </asp:ListBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="formButtons">
                    <asp:Button ID="btnSubmitRecord" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="SubmitRecord" ValidationGroup="AddRecord" />
                    <asp:Button ID="btnSubmitTraining" runat="server" Text="OK" Width="60px" OnClick="Button_Click" CommandArgument="SubmitTraining" ValidationGroup="AddTraining" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="60px" OnClick="Button_Click" CommandArgument="Cancel" />
                </td> 
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" DisplayMode="BulletList" ValidationGroup="AddRecord" ShowSummary="false" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="true" DisplayMode="BulletList" ValidationGroup="AddTraining" ShowSummary="false" />
    </div>
    </form>
</body>
</html>
