<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProperties.aspx.cs" Inherits="Paradigm3.ViewProperties" EnableEventValidation="false" Async="true" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Item Properties</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body class="propertiesBody">
    <form id="formProperties" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="udpProperties" runat="server" ChildrenAsTriggers="true">
    <ContentTemplate>
        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
        <div id="pnlPropertiesContent">
        <asp:TabContainer ID="tcProperties" runat="server" Height="400px">
            <asp:TabPanel ID="generalTab" runat="server" HeaderText="General">
                <ContentTemplate>
                    <div id="pnlTitle">
                        <table style="width: 100%">
                            <tr style="height: 30px">
                                <td class="pName">
                                    Name:
                                </td>
                                <td>
                                    <asp:Label ID="lblName" runat="server" Font-Size="12px" Font-Names="Arial" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td class="pName">
                                    Label:
                                </td>
                                <td>
                                    <asp:Label ID="lblLabel" runat="server" Font-Size="12px" Font-Names="Arial" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="pnlPDetails">
                        <table style="width: 100%">
                            <tr style="height: 20px">
                                <td class="pName">
                                    Type:
                                </td>
                                <td class="pName">
                                    <asp:Label ID="lblType" runat="server"></asp:Label>
                                </td>
                                <td class="pName">
                                    ID/OrigID:
                                </td>
                                <td>
                                    <asp:Label ID="lblIDs" runat="server" Font-Size="12px" Font-Names="Arial" />
                                </td>
                            </tr>
                            <tr style="height: 20px">
                                <td class="pName">
                                    Date Created:
                                </td>
                                <td style="width: 100px; height: 30px; vertical-align: middle">
                                    <asp:Label ID="lblCreatedDate" runat="server" Font-Size="12px" Font-Names="Arial" />
                                </td>
                                <td class="pName">
                                    Created By:
                                </td>
                                <td style="width: 100px; height: 30px; vertical-align: middle">
                                    <asp:Label ID="lblCreatedBy" runat="server" Font-Size="12px" Font-Names="Arial" />
                                </td>
                            </tr>
                            <tr style="height: 20px">
                                <td class="pName">
                                    Last Modified:
                                </td>
                                <td style="width: 100px; height: 30px; vertical-align: middle">
                                    <asp:Label ID="lblModifiedDate" runat="server" Font-Size="12px" Font-Names="Arial" />
                                </td>
                                <td class="pName">
                                    Modified By:
                                </td>
                                <td style="width: 100px; height: 30px; vertical-align: middle">
                                    <asp:Label ID="lblModifiedBy" runat="server" Font-Size="12px" Font-Names="Arial" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="pnlNotes">
                        Notes:
                        <br />
                        <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" ReadOnly="true" CssClass="pNotesField">
                        
                        </asp:TextBox>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="rolesTab" runat="server" HeaderText="Roles">
                <ContentTemplate>
                    <div id="pnlRoles">
                        <div class="roles-main">
                            <div class="roles-left">
                                <asp:GridView ID="gvRoles" runat="server" 
                                    DataKeyNames="CatID"
                                    AutoGenerateColumns="false" 
                                    ShowHeader="false" 
                                    ShowFooter="false" 
                                    GridLines="None" 
                                    Width="100%"
                                    OnRowDataBound="gvRoles_RowDataBound"
                                    OnSelectedIndexChanged="gvRoles_SelectedIndexChanged">
                                    <RowStyle Font-Names="Arial" Font-Size="10pt" />
                                    <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="18px">
                                            <ItemTemplate>
                                                <asp:Image ID="imgRole" runat="server" ImageUrl="~/images/role.png" Width="16px" Height="16px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CatCaption" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="roles-divider"></div>
                            <div class="roles-right">
                                <asp:GridView ID="gvRoleMembers" runat="server" 
                                    DataKeyNames="ID, ControlID, ControlType"
                                    AutoGenerateColumns="false" 
                                    GridLines="None" 
                                    ShowFooter="false"
                                    Width="100%" 
                                    OnRowDataBound="gvRoleMembers_RowDataBound" 
                                    OnSelectedIndexChanged="gvRoleMembers_SelectedIndexChanged">
                                    <HeaderStyle BackColor="#f0f0f0" ForeColor="#000" Height="30px" />
                                    <RowStyle Font-Names="Arial" Font-Size="10pt" />
                                    <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="18px" HeaderStyle-Width="18px">
                                            <ItemTemplate>
                                                <asp:Image ID="imgRoleMember" runat="server" Width="16px" Height="16px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ControlFullName" HeaderText="Name" />
                                        <asp:TemplateField ItemStyle-Width="50px" HeaderStyle-Width="50px" HeaderText="Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMemberType" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ControlType" Visible="false" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="roles-buttons">
                            <div class="roles-buttons-left">
                                <asp:Button ID="btnApplySubItems" runat="server" CommandArgument="ApplyRolesToItems" OnClick="Button_Click" Text="Apply to Sub-Items" Visible="false" Enabled="false" />
                                <asp:Button ID="btnApplySubFolders" runat="server" CommandArgument="ApplyRolesToSubGroups" OnClick="Button_Click" Text="Apply to Sub-Folders" Visible="false" Enabled="false" />
                            </div>
                            <div class="roles-buttons-right">
                                <asp:Button ID="btnAddRoles" runat="server" CommandArgument="AddRoleMembers" Text="Add" Visible="false" OnClick="Button_Click" />
                                <asp:Button ID="btnRemoveRole" runat="server" CommandArgument="RemoveRoleMember" Text="Remove" Visible="false" OnClick="Button_Click" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="eventDateTab" runat="server" HeaderText="Event Date" Visible="false">
                <ContentTemplate>
                    <div class="event-date-main">
                        <div class="event-date-list">
                            <asp:GridView ID="gvEventDates" runat="server" CssClass="event-date-gridView"
                                Width="100%" 
                                AutoGenerateColumns="false" 
                                DataKeyNames="DateID, CatID" GridLines="none" 
                                OnRowDataBound="gvEventDates_RowDataBound" OnSelectedIndexChanged="gvEventDates_SelectedIndexChanged">
                                <HeaderStyle CssClass="event-date-headerRow" />
                                <RowStyle CssClass="event-date-dataRow" />
                                <SelectedRowStyle CssClass="event-date-selectedRow" />
                                <Columns>
                                    <asp:BoundField DataField="DateName" HeaderText="Date Name" />
                                    <asp:BoundField DataField="SetDate" HeaderText="Set Date" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="TriggerDate" HeaderText="Trigger Date" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="DateSettings" HeaderText="Date Settings" />
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="event-date-buttons">
                            <div>
                                <asp:Button ID="btnApplyEventDateToSubItems" runat="server" Text="Apply to all sub-items" Width="160px" Enabled="false" OnClick="Button_Click" CommandArgument="ApplyEventDateToSubItems" />
                            </div>
                            <div>
                                <asp:Button ID="btnEditEventDates" runat="server" Text="Edit..." Width="70px" Enabled="false" OnClick="Button_Click" CommandArgument="EditEventDates" />
                            </div>
                        </div>
                        <asp:Panel ID="pnlEventDateButtons" runat="server" CssClass="event-date-buttons">
                            <div>
                                <asp:Button ID="btnApplyEventDateToSubFolders" runat="server" Text="Apply to all sub-folders" Width="160px" Enabled="false" OnClick="Button_Click" CommandArgument="ApplyEventDateToSubFolders" />
                            </div>
                            <div>
                                &nbsp;
                            </div>
                        </asp:Panel>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="categoriesTab" runat="server" HeaderText="Categories">
                <ContentTemplate>
                    <div class="categories-main">
                        <div id="pnlCatList" runat="server" class="categories-list">
                            <ul>
                                <asp:Repeater ID="rptCategories" runat="server" OnItemDataBound="rptCategories_ItemDataBound">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnCatID" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.CatID")%>' />
                                    <li><asp:CheckBox ID="chkCategory" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CatCaption")%>' Enabled="false" /></li>
                                </ItemTemplate>
                            </asp:Repeater>
                            </ul>                            
                        </div>
                        <div class="categories-buttons">
                            <div>
                                <asp:Button ID="btnApplyCategoriesToSubItems" runat="server" Text="Apply to all sub-items" Width="160px" Enabled="false" OnClick="Button_Click" CommandArgument="ApplyCategoriesToSubItems" />
                            </div>
                            <div>
                                <asp:Button ID="btnApplyCategoriesToSubFolders" runat="server" Text="Apply to all sub-folders" Width="160px" Enabled="false" OnClick="Button_Click" CommandArgument="ApplyCategoriesToSubFolders" />
                            </div>
                        </div>
                    </div>                    
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="historyTab" runat="server" HeaderText="History">
                <ContentTemplate>
                    <div id="pnlHistory">
                        <asp:TextBox ID="txtHistory" runat="server" TextMode="MultiLine" ReadOnly="true" CssClass="pHistoryField">
                        
                        </asp:TextBox>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="trainingTab" runat="server" HeaderText="Training">
                <ContentTemplate>
                    <asp:UpdatePanel ID="udpTraining" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                    <ContentTemplate>
                    <div id="pnlTraining">
                        <asp:GridView ID="gvTraining" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="ItemID, ParentGroupID, Status, ObjTypeID" GridLines="None" OnRowDataBound="gvTraining_RowDataBound">
                            <HeaderStyle  BackColor="#f0f0f0" ForeColor="#000" Font-Bold="false" Font-Size="8pt" Height="20px" BorderColor="#000" BorderStyle="Solid" BorderWidth="1px" />
                            <RowStyle BackColor="#FFFFFF" ForeColor="#000" Font-Size="8pt" Font-Names="Arial" />
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <SelectedRowStyle BackColor="#0078D7" ForeColor="#FFFFFF" />
                            <Columns>
                                <asp:TemplateField HeaderText="" HeaderStyle-Width="24px" ItemStyle-Width="24px">
                                    <ItemTemplate>
                                        <asp:Image ID="ItemIcon" runat="server" ImageUrl="~/images/training.png" Width="20px" Height="20px"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField DataTextField="Name" HeaderText="Name" CommandName="Select">
                                    <HeaderStyle  HorizontalAlign="Left" />
                                    <ControlStyle Font-Underline="false" />
                                </asp:ButtonField>
                                <asp:ButtonField DataTextField="Status" HeaderText="Status" CommandName="Select">
                                    <HeaderStyle  HorizontalAlign="Left" Width="80px" />
                                    <ControlStyle Font-Underline="false" Width="80px" />
                                </asp:ButtonField>
                                <asp:ButtonField DataTextField="VersionDate" HeaderText="Version Date" DataTextFormatString="{0:d}"
                                    CommandName="Select">
                                    <HeaderStyle  HorizontalAlign="Left" Width="90px" />
                                    <ControlStyle Font-Underline="false" Width="90px" />
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="pnlTrainingButtons">
                        <asp:Button ID="btnShowMe" runat="server" Text="Show Me" OnClick="Button_Click" CommandArgument="ShowMe" />
                        <asp:Button ID="btnGoThere" runat="server" Text="Go There" OnClick="Button_Click" CommandArgument="GoThere" />
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </div>
    <div id="pnlPClose" runat="server">
        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="Button_Click" CommandArgument="CloseProperties" />
    </div>
    <asp:Button ID="btnRefreshRoles" runat="server" CommandArgument="UpdateRoleMembers" OnClick="Button_Click"  style="display: none;" />



    <%-- Edit Event Dates Dialog --%>
    <a id="dummyclicker" runat="server" href="#"></a>
    <asp:ModalPopupExtender ID="mpeEditEventDate" runat="server" PopupControlID="pnlEditEventDate" TargetControlID="dummyclicker" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlEditEventDate" runat="server" CssClass="edit-eventdate-modal">
        <asp:Panel ID="pnlEditEventTitleBar" runat="server" CssClass="edit-eventdate-titlebar">
            <span>Manage Date</span>
            <asp:ImageButton ID="btnEditEventClose" runat="server" ImageUrl="~/images/squareclose.png" />
        </asp:Panel>
        <div class="edit-eventdate-spacer">
            <div>Date:</div>
        </div>
        <div class="edit-eventdate-content">
            <div class="eventdate-list">
                <asp:GridView ID="gvDates" runat="server" CssClass="gvDates"
                    DataKeyNames="CatID"
                    Width="250" 
                    GridLines="None" 
                    ShowHeader="false" 
                    ShowFooter="false" 
                    AutoGenerateColumns="false" 
                    OnRowDataBound="gvDates_RowDataBound" 
                    OnSelectedIndexChanged="gvDates_SelectedIndexChanged">
                    <RowStyle CssClass="gvdates-row" />
                    <SelectedRowStyle CssClass="gvDates-selectedRow" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemStyle Width="20px" />
                            <ItemTemplate>
                                <img src="images/eventdate.png" style="width: 18px;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CatCaption" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="eventdate-divider"></div>
            <div class="eventdate-options">
                <div class="date-settings">
                    <fieldset style="display: block; height: 100%; border: 1px solid #dcdcdc; margin-bottom: 10px;">
                        <legend>Date</legend>
                        <asp:RadioButton ID="rbNotSet" runat="server" Text="Not Set" Checked="true" style="display: block; margin-top: 10px;" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
                        <div>&nbsp;</div>
                        <asp:RadioButton ID="rbSetDate" runat="server" Text="Set on the date:" style="display: block;" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
                        <div style="padding-left: 30px;">
                            <asp:TextBox ID="txtSetDate" runat="server" Width="100px"></asp:TextBox>
                            <asp:CalendarExtender ID="ceSetDate" runat="server" TargetControlID="txtSetDate" Format="d" />                           
                        </div>
                        <asp:RadioButton ID="rbSetStatus" runat="server" Text="Based on the status:" style="display: block;" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />                     
                        <div style="padding-left: 30px;">
                            <asp:DropDownList ID="ddlStatus" runat="server" Width="180px">
                                <asp:ListItem Value="2" Text="Draft Date"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Collaborate Date"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Review Date"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Ready Date"></asp:ListItem>
                                <asp:ListItem Value="7" Text="Pending Date"></asp:ListItem>
                                <asp:ListItem Value="9" Text="Current Date"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Obsolete Date"></asp:ListItem>
                            </asp:DropDownList>
                        </div>                     
                    </fieldset>
                </div>
                <div class="frequency-settings">
                    <fieldset style="display: block; height: 100%; border: 1px solid #dcdcdc;">
                        <legend>Frequency</legend>
                        <asp:RadioButton ID="rbOnceOnly" runat="server" Text="Once Only" style="display: block; margin-bottom: 10px;" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
                        <asp:RadioButton ID="rbEvery" runat="server" Text="Every" style="display: block;" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
                        <div style="padding-left: 30px;">
                            <asp:TextBox ID="txtRepeatNum" runat="server" Width="70px" TextMode="Number" Text="1"></asp:TextBox>
                            <asp:DropDownList ID="ddlRepeatPeriod" runat="server" Width="100px">
                                <asp:ListItem Value="3" Text="Day"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Week"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Month"></asp:ListItem>
                                <asp:ListItem Value="6" Text="Year"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </fieldset>
                </div>
                <div class="actionitem-settings">
                    <fieldset style="display: block; height: 100%; border: 1px solid #dcdcdc;">
                        <legend>Action Item</legend>
                        <div style="margin: 10px auto 2px auto;">
                            Trigger Action Item
                        </div>
                        <div>
                            <asp:TextBox ID="txtAITriggerNum" runat="server" TextMode="Number" Width="70px" Text="0"></asp:TextBox>
                            <asp:DropDownList ID="ddlAITriggerPeriod" runat="server" Width="80px">
                                <asp:ListItem Value="3" Text="Day"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Week"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Month"></asp:ListItem>
                                <asp:ListItem Value="6" Text="Year"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlAITriggerWhen" runat="server" Width="80px">
                                <asp:ListItem Value="0" Text="Before"></asp:ListItem>
                                <asp:ListItem Value="1" Text="After"></asp:ListItem>
                            </asp:DropDownList>
                            <span style="display: block; font-size: .9em; color: cornflowerblue; margin-top: 10px;">Note: Calculated AFTER 'set on date' is reached.</span>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
        <div class="edit-eventdate-buttons">
            <asp:Button ID="btnSaveEventDetails" runat="server" Text="Close" OnClick="Button_Click" CommandArgument="SaveEventDateDetails" />
        </div>
    </asp:Panel>
    <asp:Button ID="btnApplyEDTSI" runat="server" style="display: none;" OnClick="btnApplyEDTSI_Click" />
    <asp:Button ID="btnApplyEDTSF" runat="server" style="display: none;" OnClick="btnApplyEDTSF_Click" />
    <asp:Button ID="btnApplyCTSI" runat="server" style="display: none;" OnClick="btnApplyCTSI_Click" />
    <asp:Button ID="btnApplyCTSF" runat="server" style="display: none;" OnClick="btnApplyCTSF_Click" />
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="IMGDIV" runat="server" class="pleaseWait">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/pleasewait.gif" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </form>
</body>
</html>
