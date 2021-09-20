<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCopy.aspx.cs" Inherits="Paradigm3.ViewCopy"  Async="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Copy</title>
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
                <asp:Label ID="lblTitle" runat="server"/>
            </div>
           
           <div style="display:flex; flex-direction:row;">
                
                <div style="padding-left:10px" >    
                   <label class="formLabel">Copy Name:  </label>
                    <asp:TextBox ID="txt_CopyName" style="font-weight:bold" runat="server" ReadOnly="true" Enabled="false"/>
                </div>
                <div id="dv_copyFrom"  runat="server" style="padding-left:10px">
                    <label class="formLabel">Copy from:  </label>
                     <asp:DropDownList runat="server" ID="ddl_CopyVersion" CssClass="form-control"></asp:DropDownList>
                    
                </div>
                <div  id="dv_copyAs"  runat="server" style="padding-left:10px">
                   <label  class="formLabel">Copy as:  </label>
                        <asp:DropDownList runat="server" ID="ddl_CopyType" CssClass="form-control">
                         <%--   <asp:ListItem Value="1">Draft</asp:ListItem>
                            <asp:ListItem Value="2">Collaborate</asp:ListItem>--%>
                        </asp:DropDownList>
                </div>
                    </div>
                <div style="flex: 1 1 auto; width: 100%; border: 1px solid #dcdcdc; background-color: #fff; overflow: auto; padding: 5px 0; box-sizing: border-box;">
                    <asp:TreeView ID="p3Tree" runat="server"
                        EnableClientScript="false"
                        NodeIndent="15"
                        ExpandDepth="1"
                        OnTreeNodePopulate="P3Tree_TreeNodePopulate"
                        OnSelectedNodeChanged="P3Tree_SelectedNodeChanged">
                        <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="10pt" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
                <div style="flex: 0 0 50px; width: 100%; box-sizing: border-box; display: flex; align-items: flex-end;">
                    <asp:TextBox ID="txtFolderName" runat="server" ReadOnly="true" Width="99%" Height="30px" />
                </div>
           
            <div class="modify-buttons">
                <div class="chkBox"><asp:CheckBox ID="chkProperties" runat="server" Text="Retain Properties settings of copied item(s)" TextAlign="Right" /></div>
                <button id="frmbtnSubmit" runat="server" type="button" onclick="javascript:document.getElementById('msg').style.display='block';">Submit</button>
                &nbsp;
                <button type="button" onclick="javascript:window.close();">Close</button>
            </div>
        </div>
        <div id="msg" class="modify-modal-background">
            <div class="modify-modal-body">
                <div class="modify-modal-message">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
                <div class="modify-modal-buttons">
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Yes" Width="70px" />
                    &nbsp;
                    <button type="button" style="width: 70px;" onclick="javascript:document.getElementById('msg').style.display='none';">No</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
