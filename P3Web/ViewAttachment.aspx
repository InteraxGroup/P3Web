<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAttachment.aspx.cs" Inherits="Paradigm3.ViewAttachment" EnableEventValidation="false" Async="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Attachments</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <script src="scripts/P3Web.js"></script>
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/Attachment.css" rel="stylesheet" />
</head>
<body class="attachmentBody">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="udpTabs" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnUpload" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <div id="pnlTabList">
                    <asp:Label ID="LBLTabs" runat="server" Text="Display Attachments for Page:" CssClass="tabLabel" />
                    &nbsp;
                    <asp:DropDownList ID="DDLTabs" runat="server" CssClass="tabField" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="DDLTabs_SelectedIndexChanged">
                        <asp:ListItem Text="All Pages" Value ="0" />
                    </asp:DropDownList>
                    <asp:Label ID="lblTabError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="udpAttachments" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DDLTabs" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="btnUpload" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
                <asp:PostBackTrigger ControlID="btnView" />
            </Triggers>
            <ContentTemplate>
                <div id="pnlAttachments">
                    <div class="attachList">
                        <asp:GridView ID="gvAttach" runat="server" Width="690px" AutoGenerateColumns="false" GridLines="None" DataKeyNames="AtchID, AtchExtension, AtchName, AtchSerialNo" OnRowDataBound="GVAttach_RowDataBound" OnSelectedIndexChanged="GVAttach_SelectedIndexChanged">
                            <HeaderStyle Height="20px" BackColor="#F0F0F0" />
                            <RowStyle Height="20px" ForeColor="#000000" />
                            <AlternatingRowStyle ForeColor="#000000" BackColor="#f0f0f0" />
                            <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                            <Columns>
                                <asp:BoundField DataField="AtchName" HeaderText="Attachment Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Font-Size="9pt" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AtchExtension" HeaderText="Type">
                                    <HeaderStyle Width="120px" HorizontalAlign="Left" />
                                    <ItemStyle Width="120px" Font-Size="9pt" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AtchSerialNo" HeaderText="Serial #">
                                    <HeaderStyle Width="80px" HorizontalAlign="Center" />
                                    <ItemStyle Width="80px" Font-Size="9pt" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CreateBy" HeaderText="Attached By">
                                    <HeaderStyle Width="150px" HorizontalAlign="Left" />
                                    <ItemStyle Width="150px" Font-Size="9pt" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CreateDate" HeaderText="Attached On" DataFormatString="{0:d}">
                                    <HeaderStyle Width="100px" HorizontalAlign="Left" />
                                    <ItemStyle Width="100px" Font-Size="9pt" HorizontalAlign="Left" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>    
                </div>
                <div id="pnlView">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" Width="90px" style="margin-bottom: 5px;" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="90px" style="margin-bottom: 5px;" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnView" runat="server" Text="View" Width="90px" style="margin-bottom: 5px;" OnClick="BTNView_Click" />
                    <button id="btnHidden" runat="server" style="display: none;"></button>
                </div>
                <div id="pnlNotes">
                    Notes:<br />
                    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" CssClass="notesField" />
                </div>
                <div id="pnlClose">
                    <div class="update">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="90px" OnClick="btnUpdate_Click" />
                    </div>
                    <div class="close">
                        <asp:Button ID="btnClose" runat="server" Text="Close" Width="90px" OnClick="BTNClose_Click" />
                    </div>                    
                </div>
                <ajax:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                    TargetControlID="btnAdd"
                    PopupControlID="uploader" BackgroundCssClass="modalBackground">
                </ajax:ModalPopupExtender>                
            </ContentTemplate>            
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="udpModal" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnUpload" EventName="Click" />
            </Triggers>
            <ContentTemplate>
            <asp:Panel ID="uploader" runat="server" CssClass="uplmain">
                <div class="uplheader">
                    Upload New Attachment
                </div>
                <div class="uplcontrol">
                    <ajax:AjaxFileUpload ID="FU1" runat="server"
                        Width="480"
                        AutoStartUpload="true" 
                        OnUploadComplete="FU1_UploadComplete" 
                        OnClientUploadError="uploadError" />                                                          
                </div>
                <div class="uplcancel">
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                    &nbsp;
                    <asp:Button ID="btnCancelUpload" runat="server" Text="Cancel" OnClick="btnCancelUpload_Click" />                  
                </div>
            </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="scripts/P3Web.js"></script>
</body>
</html>
