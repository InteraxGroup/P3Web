<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAttachment.aspx.cs" Inherits="Paradigm3.ViewAttachment" EnableEventValidation="false" Async="true" meta:resourcekey="PageResource1" %>

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
        <asp:UpdatePanel ID="udpTabs" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnUpload" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <div id="pnlTabList">
                    <asp:Label ID="LBLTabs" runat="server" Text="Display Attachments for Page:" CssClass="tabLabel" meta:resourcekey="LBLTabsResource1" />
                    &nbsp;
                    <asp:DropDownList ID="DDLTabs" runat="server" CssClass="tabField" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="DDLTabs_SelectedIndexChanged" meta:resourcekey="DDLTabsResource1">
                        <asp:ListItem Text="All Pages" Value ="0" meta:resourcekey="ListItemResource1" />
                    </asp:DropDownList>
                    <asp:Label ID="lblTabError" runat="server" ForeColor="Red" Font-Bold="True" meta:resourcekey="lblTabErrorResource1"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="udpAttachments" runat="server" UpdateMode="Conditional">
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
                        <asp:GridView ID="gvAttach" runat="server" Width="690px" AutoGenerateColumns="False" GridLines="None" DataKeyNames="AtchID,AtchExtension,AtchName,AtchSerialNo" OnRowDataBound="GVAttach_RowDataBound" OnSelectedIndexChanged="GVAttach_SelectedIndexChanged" meta:resourcekey="gvAttachResource1">
                            <HeaderStyle Height="20px" BackColor="#F0F0F0" />
                            <RowStyle Height="20px" ForeColor="Black" />
                            <AlternatingRowStyle ForeColor="Black" BackColor="#F0F0F0" />
                            <SelectedRowStyle BackColor="#0078D7" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="AtchName" HeaderText="Attachment Name" meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Font-Size="9pt" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AtchExtension" HeaderText="Type" meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Width="120px" HorizontalAlign="Left" />
                                    <ItemStyle Width="120px" Font-Size="9pt" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AtchSerialNo" HeaderText="Serial #" meta:resourcekey="BoundFieldResource3">
                                    <HeaderStyle Width="80px" HorizontalAlign="Center" />
                                    <ItemStyle Width="80px" Font-Size="9pt" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CreateBy" HeaderText="Attached By" meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle Width="150px" HorizontalAlign="Left" />
                                    <ItemStyle Width="150px" Font-Size="9pt" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CreateDate" HeaderText="Attached On" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource5">
                                    <HeaderStyle Width="100px" HorizontalAlign="Left" />
                                    <ItemStyle Width="100px" Font-Size="9pt" HorizontalAlign="Left" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>    
                </div>
                <div id="pnlView">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" Width="90px" style="margin-bottom: 5px;" meta:resourcekey="btnAddResource1" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="90px" style="margin-bottom: 5px;" OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource1" />
                    <asp:Button ID="btnView" runat="server" Text="View" Width="90px" style="margin-bottom: 5px;" OnClick="BTNView_Click" meta:resourcekey="btnViewResource1" />
                    <button id="btnHidden" runat="server" style="display: none;"></button>
                </div>
                <div id="pnlNotes">
                    Notes:<br />
                    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" CssClass="notesField" meta:resourcekey="txtNotesResource1" />
                </div>
                <div id="pnlClose">
                    <div class="update">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="90px" OnClick="btnUpdate_Click" meta:resourcekey="btnUpdateResource1" />
                    </div>
                    <div class="close">
                        <asp:Button ID="btnClose" runat="server" Text="Close" Width="90px" OnClick="BTNClose_Click" meta:resourcekey="btnCloseResource1" />
                    </div>                    
                </div>
                <ajax:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                    TargetControlID="btnAdd"
                    PopupControlID="uploader" BackgroundCssClass="modalBackground" BehaviorID="ModalPopupExtender1" DynamicServicePath="">
                </ajax:ModalPopupExtender>                
            </ContentTemplate>            
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="udpModal" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnUpload" EventName="Click" />
            </Triggers>
            <ContentTemplate>
            <asp:Panel ID="uploader" runat="server" CssClass="uplmain" meta:resourcekey="uploaderResource1">
                <div class="uplheader">
                    Upload New Attachment
                </div>
                <div class="uplcontrol">
                    <ajax:AjaxFileUpload ID="FU1" runat="server"
                        Width="480px"
                        AutoStartUpload="True" 
                        OnUploadComplete="FU1_UploadComplete" 
                        OnClientUploadError="uploadError" AllowedFileTypes="" MaximumNumberOfFiles="0" meta:resourcekey="FU1Resource1" />                                                          
                </div>
                <div class="uplcancel">
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" meta:resourcekey="btnUploadResource1" />
                    &nbsp;
                    <asp:Button ID="btnCancelUpload" runat="server" Text="Cancel" OnClick="btnCancelUpload_Click" meta:resourcekey="btnCancelUploadResource1" />                  
                </div>
            </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="scripts/P3Web.js"></script>
</body>
</html>
