<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewParaLink.aspx.cs" Inherits="Paradigm3.ViewParaLink" EnableEventValidation="false" Async="true" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Para-Link&reg;</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body class="paraLinkBody">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div id="topBar">
            <div id="toolbar" class="toolbar" style="border-bottom: 1px solid #787878; height: 55px; margin-bottom: 10px;">
                <asp:Panel ID="pnlShowMe" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlShowMeResource1">
                    <asp:ImageButton ID="btnShowMe" runat="server" ImageUrl="~/images/showme.png" OnClick="ImageButton_Click" CommandArgument="ShowMe" meta:resourcekey="btnShowMeResource1" />
                    <br />
                    <asp:Label ID="lblShowMe" runat="server" Text="Show Me" meta:resourcekey="lblShowMeResource1" />
                </asp:Panel>
                <asp:Panel ID="pnlGoThere" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #dcdcdc;" Visible="False" meta:resourcekey="pnlGoThereResource1">
                    <asp:ImageButton ID="btnGoThere" runat="server" ImageUrl="~/images/gothere.png" OnClick="ImageButton_Click" CommandArgument="GoThere" meta:resourcekey="btnGoThereResource1" />
                    <br />
                    <asp:Label ID="lblGoThere" runat="server" Text="Go There" meta:resourcekey="lblGoThereResource1" />
                </asp:Panel>
                <asp:Panel ID="pnlAddPLink" runat="server" CssClass="toolbarButton" Visible="False" meta:resourcekey="pnlAddPLinkResource1">
                    <asp:ImageButton ID="btnAddPLink" runat="server" ImageUrl="~/images/addplink.png" meta:resourcekey="btnAddPLinkResource1" />
                    <br />
                    <asp:Label ID="lblAddPLink" runat="server" Text="Add" meta:resourcekey="lblAddPLinkResource1" />
                </asp:Panel>
                <asp:Panel ID="pnlRemovePLink" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #dcdcdc;" Visible="False" meta:resourcekey="pnlRemovePLinkResource1">
                    <asp:ImageButton ID="btnRemovePLink" runat="server" ImageUrl="~/images/removeplink.png" OnClick="ImageButton_Click" CommandArgument="RemovePLink" meta:resourcekey="btnRemovePLinkResource1" />
                    <br />
                    <asp:Label ID="lblRemovePLink" runat="server" Text="Remove" meta:resourcekey="lblRemovePLinkResource1" />
                </asp:Panel>
                <asp:Panel ID="pnlClose" runat="server" CssClass="toolbarButton" meta:resourcekey="pnlCloseResource1">
                    <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/images/exit.png" OnClick="ImageButton_Click" CommandArgument="Close" meta:resourcekey="btnCloseResource1" />
                    <br />
                    <asp:Label ID="lblClose" runat="server" Text="Close" meta:resourcekey="lblCloseResource1" />
                </asp:Panel>
            </div>
        </div>       
        <div id="pnlPLContent">
            <div class="linkTo">
                Link To:
            </div>
            <div class="linkFrom">
                Link From:
            </div>
            <div class="linkListLeft">
                <asp:GridView ID="gvLinkTo" runat="server" 
                    Width="100%" 
                    AutoGenerateColumns="False" 
                    GridLines="None" 
                    OnRowDataBound="GridView_RowDataBound" 
                    DataKeyNames="PLinkID,ItemID,OrigID,ParentGroupID,ObjTypeID,FileExtension,TypeOfPublish,MyType,LinkedType,LinkedOrigID,LinkedModuleID,ModuleID" 
                    OnSelectedIndexChanged="GridView_SelectedIndexChanged" meta:resourcekey="gvLinkToResource1">
                    <HeaderStyle CssClass="linkListHeader" Height="30px" />
                    <RowStyle BackColor="#FFFFFF" ForeColor="#000000" />
                    <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                    <Columns>
                        <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource1">
                            <HeaderStyle Width="24px" />
                            <ItemStyle Width="24px" />
                            <ItemTemplate>
                                <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" meta:resourcekey="ItemIconResource1"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" meta:resourcekey="BoundFieldResource1">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LabelName" HeaderText="Label" meta:resourcekey="BoundFieldResource2">
                            <HeaderStyle Width="150px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Width="150px" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LinkedModuleID" HeaderText="Module" meta:resourcekey="BoundFieldResource3">
                            <HeaderStyle Width="80px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Width="70px" HorizontalAlign="Left" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                    </Columns>            
                </asp:GridView>
            </div>        
            <div class="linkListRight">
                <asp:GridView ID="gvLinkFrom" runat="server" 
                    Width="100%" 
                    AutoGenerateColumns="False" 
                    GridLines="None" 
                    OnRowDataBound="GridView_RowDataBound" 
                    DataKeyNames="PLinkID,ItemID,OrigID,ParentGroupID,ObjTypeID,FileExtension,TypeOfPublish,MyType,LinkedType,LinkedOrigID,LinkedModuleID,ModuleID" 
                    OnSelectedIndexChanged="GridView_SelectedIndexChanged" meta:resourcekey="gvLinkFromResource1">
                    <HeaderStyle CssClass="linkListHeader" Height="30px" />
                    <RowStyle BackColor="#FFFFFF" ForeColor="#000000" />
                    <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                    <Columns>
                        <asp:TemplateField HeaderText="" meta:resourcekey="TemplateFieldResource2">
                            <HeaderStyle Width="24px" />
                            <ItemStyle Width="24px" />
                            <ItemTemplate>
                                <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px" meta:resourcekey="ItemIconResource2"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" meta:resourcekey="BoundFieldResource4">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LabelName" HeaderText="Label" meta:resourcekey="BoundFieldResource5">
                            <HeaderStyle Width="150px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Width="150px" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ModuleID" HeaderText="Module" meta:resourcekey="BoundFieldResource6">
                            <HeaderStyle Width="80px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Width="70px" HorizontalAlign="Left" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                    </Columns>        
                </asp:GridView>
            </div>
        </div>
        <asp:Panel ID="pnlLinkTypeSelect" runat="server" CssClass="modal-select-type" meta:resourcekey="pnlLinkTypeSelectResource1">
            <div>
                <asp:Label ID="SelectTypeLabel" runat="server" Text="Select New Para-Link Type" meta:resourcekey="SelectTypeLabel"></asp:Label>
            </div>
            <div>
                <asp:RadioButtonList ID="rblLinkType" runat="server" Font-Size="Large" Width="100%" meta:resourcekey="rblLinkTypeResource1">
                    <asp:ListItem Text="Add Item Para-Link" Value="0" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Text="Add Folder Para-Link" Value="1" meta:resourcekey="ListItemResource2"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div>
                <asp:Button ID="btnCommit" runat="server" Text="OK" Width="70px" OnClick="Button_Click" CommandArgument="AddPLink" meta:resourcekey="btnCommitResource1" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" meta:resourcekey="btnCancelResource1" />
            </div>
        </asp:Panel>
		<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
            TargetControlID="btnAddPLink" 
            CancelControlID="btnCancel" 
            PopupControlID="pnlLinkTypeSelect" BackgroundCssClass="modalBackground" BehaviorID="ModalPopupExtender1" DynamicServicePath="">
		</asp:ModalPopupExtender>
        <asp:Button ID="btnRefreshPLinks" runat="server" OnClick="Button_Click" CommandArgument="RefreshLinks" style="display: none;" meta:resourcekey="btnRefreshPLinksResource1" />
    </form>
</body>
</html>
