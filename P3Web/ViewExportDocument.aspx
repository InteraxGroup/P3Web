<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewExportDocument.aspx.cs" Inherits="P3Web.ViewExportDocument" Async="true" meta:resourcekey="PageResource1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=GetLocalResourceObject("PageResource1.Title") %> </title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <script src="scripts/P3Web.js" type="text/javascript"></script>

   <%-- code to select one radio button at a time --%>
    <script type="text/javascript">
        function checkRadioBtnExportItem(id) {
            var gv = document.getElementById('<%=grdvwItems.ClientID%>');    
            for (var i = 1; i < gv.rows.length; i++) {
                var radioBtn = gv.rows[i].cells[0].getElementsByTagName("input");
                
                // Check if the id not same
                if (radioBtn[0].id != id.id) {
                    radioBtn[0].checked = false;                   
                }    
            }
        }
    </script>
</head>

<body class="statusBody">
    <div style="height: 600px">
        <form id="form1" runat="server">
            <div class="pnlStatusWindow">
                <div class="pnlStatusTitle">
                    <%=GetLocalResourceObject("pnlStatusTitle") %>
                </div>
                <div class="pnlStatusVersion">
                    <span style="font-size: 1.35em;"><%=GetLocalResourceObject("pnlStatusVersion") %>
                        <asp:Label ID="lblVersion" runat="server" Font-Bold="True" meta:resourcekey="lblVersionResource1" /></span>
                </div> 
                <div style="overflow: scroll; height=100px;">
                    <asp:GridView ID="grdvwItems" runat="server" AutoGenerateColumns="False" OnRowDataBound="grdvwItems_RowDataBound" DataKeyNames="ItemID"
                        OnSelectedIndexChanged="grdvwItems_OnSelectedIndexChanged" GridLines="None" CssClass="gridExportItem" meta:resourcekey="grdvwItemsResource1">
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <input name="rbSelect" type="radio" value='<%# Eval("ItemID") %>'  onclick="javascript.checkRadioBtnExportItem(this)"/>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:BoundField ItemStyle-Width="150px" DataField="StatusText" HeaderText="Status" meta:resourcekey="BoundFieldResource1" >
                                <ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ItemStyle-Width="150px" DataField="Version" HeaderText="Version" meta:resourcekey="BoundFieldResource2" >
                                <ItemStyle Width="150px"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
                <br />
                <div class="pnlStatusButtons" style="position: fixed; bottom: 6px; right: 13px;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="Button_Click" CommandArgument="Submit" meta:resourcekey="btnSubmitResource1" />
                    &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Close" OnClientClick="window.close();" meta:resourcekey="btnCancelResource1" />
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
    </div>
</body>
</html>