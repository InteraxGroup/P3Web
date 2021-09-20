<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewParaLink.aspx.cs" Inherits="Paradigm3.ViewParaLink" EnableEventValidation="false" Async="true" %>

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
        <div id="toolbar">
            <asp:Panel ID="pnlShowMe" runat="server" CssClass="toolbarButton" Visible="false">
                <asp:ImageButton ID="btnShowMe" runat="server" ImageUrl="~/images/showme.png" OnClick="ImageButton_Click" CommandArgument="ShowMe" />
                <br />
                <asp:Label ID="lblShowMe" runat="server" Text="Show Me" />
            </asp:Panel>
            <asp:Panel ID="pnlGoThere" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="false">
                <asp:ImageButton ID="btnGoThere" runat="server" ImageUrl="~/images/gothere.png" OnClick="ImageButton_Click" CommandArgument="GoThere" />
                <br />
                <asp:Label ID="lblGoThere" runat="server" Text="Go There" />
            </asp:Panel>
            <asp:Panel ID="pnlAddPLink" runat="server" CssClass="toolbarButton" Visible="false">
                <asp:ImageButton ID="btnAddPLink" runat="server" ImageUrl="~/images/addplink.png" />
                <br />
                <asp:Label ID="lblAddPLink" runat="server" Text="Add" />
            </asp:Panel>
            <asp:Panel ID="pnlRemovePLink" runat="server" CssClass="toolbarButton" style="border-right: 1px solid #999999;" Visible="false">
                <asp:ImageButton ID="btnRemovePLink" runat="server" ImageUrl="~/images/removeplink.png" OnClick="ImageButton_Click" CommandArgument="RemovePLink" />
                <br />
                <asp:Label ID="lblRemovePLink" runat="server" Text="Remove" />
            </asp:Panel>
            <asp:Panel ID="pnlClose" runat="server" CssClass="toolbarButton">
                <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/images/exit.png" OnClick="ImageButton_Click" CommandArgument="Close" />
                <br />
                <asp:Label ID="lblClose" runat="server" Text="Close" />
            </asp:Panel>
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
                    AutoGenerateColumns="false" 
                    GridLines="None" 
                    OnRowDataBound="GridView_RowDataBound" 
                    DataKeyNames="PLinkID,ItemID,OrigID,ParentGroupID,ObjTypeID,FileExtension,TypeOfPublish,MyType,LinkedType,LinkedOrigID,LinkedModuleID,ModuleID" 
                    OnSelectedIndexChanged="GridView_SelectedIndexChanged">
                    <HeaderStyle  BackColor="#F0F0F0" Font-Bold="false" Font-Size="Small" Height="20px" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" />
                    <RowStyle BackColor="#FFFFFF" ForeColor="#000000" />
                    <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <HeaderStyle Width="24px" BackColor="#F0F0F0" />
                            <ItemStyle Width="24px" />
                            <ItemTemplate>
                                <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name">
                            <HeaderStyle ForeColor="#000000" Height="30px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LabelName" HeaderText="Label">
                            <HeaderStyle ForeColor="#000000" Height="30px" Width="150px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Width="150px" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LinkedModuleID" HeaderText="Module">
                            <HeaderStyle ForeColor="#000000" Height="30px" Width="80px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Width="70px" HorizontalAlign="Left" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                    </Columns>            
                </asp:GridView>
            </div>        
            <div class="linkListRight">
                <asp:GridView ID="gvLinkFrom" runat="server" 
                    Width="100%" 
                    AutoGenerateColumns="false" 
                    GridLines="None" 
                    OnRowDataBound="GridView_RowDataBound" 
                    DataKeyNames="PLinkID,ItemID,OrigID,ParentGroupID,ObjTypeID,FileExtension,TypeOfPublish,MyType,LinkedType,LinkedOrigID,LinkedModuleID,ModuleID" 
                    OnSelectedIndexChanged="GridView_SelectedIndexChanged">
                    <HeaderStyle  BackColor="#F0F0F0" Font-Bold="false" Font-Size="Small" Height="20px" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" />
                    <RowStyle BackColor="#FFFFFF" ForeColor="#000000" />
                    <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <HeaderStyle Width="24px" BackColor="#F0F0F0" />
                            <ItemStyle Width="24px" />
                            <ItemTemplate>
                                <asp:Image ID="ItemIcon" runat="server" Width="20px" Height="20px"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name">
                            <HeaderStyle ForeColor="#000000" Height="30px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LabelName" HeaderText="Label">
                            <HeaderStyle ForeColor="#000000" Height="30px" Width="150px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Width="150px" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ModuleID" HeaderText="Module">
                            <HeaderStyle ForeColor="#000000" Height="30px" Width="80px" HorizontalAlign="Left" />
                            <ItemStyle Height="20px" Width="70px" HorizontalAlign="Left" Font-Size=".8em" Font-Underline="false" />
                        </asp:BoundField>
                    </Columns>        
                </asp:GridView>
            </div>
        </div>
        <asp:Panel ID="pnlLinkTypeSelect" runat="server" CssClass="modal-select-type">
            <div>
                Select New Para-Link Type
            </div>
            <div>
                <asp:RadioButtonList ID="rblLinkType" runat="server" Font-Size="Large" Width="100%">
                    <asp:ListItem Text="Add Item Para-Link" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Add Folder Para-Link" Value="1"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div>
                <asp:Button ID="btnCommit" runat="server" Text="OK" Width="70px" OnClick="Button_Click" CommandArgument="AddPLink" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" />
            </div>
        </asp:Panel>
		<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
            TargetControlID="btnAddPLink" 
            CancelControlID="btnCancel" 
            PopupControlID="pnlLinkTypeSelect" BackgroundCssClass="modalBackground">
		</asp:ModalPopupExtender>
        <asp:Button ID="btnRefreshPLinks" runat="server" OnClick="Button_Click" CommandArgument="RefreshLinks" style="display: none;" />
    </form>
</body>
</html>
