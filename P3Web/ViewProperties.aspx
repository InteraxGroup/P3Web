<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProperties.aspx.cs" Inherits="Paradigm3.ViewProperties" EnableEventValidation="false" Async="true" ValidateRequest="false" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=GetLocalResourceObject("PageResource1.Title") %></title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body class="propertiesBody">
    <form id="formProperties" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="udpProperties" runat="server">
    <ContentTemplate>
        <asp:Label ID="lblErrorMessage" runat="server" meta:resourcekey="lblErrorMessageResource1"></asp:Label>
        <div id="pnlPropertiesContent">
        <asp:TabContainer ID="tcProperties" runat="server" Height="400px" meta:resourcekey="tcPropertiesResource1">
            <asp:TabPanel ID="generalTab" runat="server"  meta:resourcekey="generalTabResource1">
                <ContentTemplate>
                    <div id="pnlTitle">
                        <table style="width: 100%">
                            <tr style="height: 30px">
                                <td class="pName">
                                   <%=GetLocalResourceObject("tbltdText1") %>
                                </td>
                                <td>
                                    <asp:Label ID="lblName" runat="server" Font-Size="12px" Font-Names="Arial" meta:resourcekey="lblNameResource1" />
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td class="pName">
                                     <%=GetLocalResourceObject("tbltdText2") %> 
                                </td>
                                <td>
                                    <asp:Label ID="lblLabel" runat="server" Font-Size="12px" Font-Names="Arial" meta:resourcekey="lblLabelResource1" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="pnlPDetails">
                        <table style="width: 100%">
                            <tr style="height: 20px">
                                <td class="pName">
                                    <%=GetLocalResourceObject("tbltdText3") %>  
                                </td>
                                <td class="pName">
                                    <asp:Label ID="lblType" runat="server" meta:resourcekey="lblTypeResource1"></asp:Label>
                                </td>
                                <td class="pName">
                                   <%=GetLocalResourceObject("tbltdText4") %>  
                                </td>
                                <td>
                                    <asp:Label ID="lblIDs" runat="server" Font-Size="12px" Font-Names="Arial" meta:resourcekey="lblIDsResource1" />
                                </td>
                            </tr>
                            <tr style="height: 20px">
                                <td class="pName">
                                    <%=GetLocalResourceObject("tbltdText5") %>   
                                </td>
                                <td style="width: 100px; height: 30px; vertical-align: middle">
                                    <asp:Label ID="lblCreatedDate" runat="server" Font-Size="12px" Font-Names="Arial" meta:resourcekey="lblCreatedDateResource1" />
                                </td>
                                <td class="pName">
                                     <%=GetLocalResourceObject("tbltdText6") %>   
                                </td>
                                <td style="width: 100px; height: 30px; vertical-align: middle">
                                    <asp:Label ID="lblCreatedBy" runat="server" Font-Size="12px" Font-Names="Arial" meta:resourcekey="lblCreatedByResource1" />
                                </td>
                            </tr>
                            <tr style="height: 20px">
                                <td class="pName">
                                   <%=GetLocalResourceObject("tbltdText7") %>    
                                </td>
                                <td style="width: 100px; height: 30px; vertical-align: middle">
                                    <asp:Label ID="lblModifiedDate" runat="server" Font-Size="12px" Font-Names="Arial" meta:resourcekey="lblModifiedDateResource1" />
                                </td>
                                <td class="pName">
                                   <%=GetLocalResourceObject("tbltdText8") %>
                                </td>
                                <td style="width: 100px; height: 30px; vertical-align: middle">
                                    <asp:Label ID="lblModifiedBy" runat="server" Font-Size="12px" Font-Names="Arial" meta:resourcekey="lblModifiedByResource1" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="pnlNotes">
                         <%=GetLocalResourceObject("tbltdText9") %>
                        <br />
                        <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" ReadOnly="True" CssClass="pNotesField" meta:resourcekey="txtNotesResource1"></asp:TextBox>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="rolesTab" runat="server"  meta:resourcekey="rolesTabResource1">
                <ContentTemplate>
                    <div id="pnlRoles">
                        <div class="roles-main">
                            <div class="roles-left">
                                <asp:GridView ID="gvRoles" runat="server" 
                                    DataKeyNames="CatID"
                                    AutoGenerateColumns="False" 
                                    ShowHeader="False" 
                                    GridLines="None" 
                                    Width="100%"
                                    OnRowDataBound="gvRoles_RowDataBound"
                                    OnSelectedIndexChanged="gvRoles_SelectedIndexChanged" meta:resourcekey="gvRolesResource1">
                                    <RowStyle Font-Names="Arial" Font-Size="10pt" />
                                    <SelectedRowStyle BackColor="#0078D7" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:Image ID="imgRole" runat="server" ImageUrl="~/images/role.png" Width="16px" Height="16px" meta:resourcekey="imgRoleResource1" />
                                            </ItemTemplate>
                                            <ItemStyle Width="18px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CatCaption" meta:resourcekey="BoundFieldResource1" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="roles-divider"></div>
                            <div class="roles-right">
                                <asp:GridView ID="gvRoleMembers" runat="server" 
                                    DataKeyNames="ID,ControlID,ControlType"
                                    AutoGenerateColumns="False" 
                                    GridLines="None"
                                    Width="100%" 
                                    OnRowDataBound="gvRoleMembers_RowDataBound" 
                                    OnSelectedIndexChanged="gvRoleMembers_SelectedIndexChanged" meta:resourcekey="gvRoleMembersResource1">
                                    <HeaderStyle BackColor="#F0F0F0" ForeColor="#000000" Height="30px" />
                                    <RowStyle Font-Names="Arial" Font-Size="10pt" />
                                    <SelectedRowStyle BackColor="#0078D7" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:Image ID="imgRoleMember" runat="server" Width="16px" Height="16px" meta:resourcekey="imgRoleMemberResource1" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="18px" />
                                            <ItemStyle Width="18px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ControlFullName" HeaderText="Name" meta:resourcekey="BoundFieldResource2" />
                                        <asp:TemplateField HeaderText="Type" meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMemberType" runat="server" meta:resourcekey="lblMemberTypeResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="50px" />
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ControlType" Visible="False" meta:resourcekey="BoundFieldResource3" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="roles-buttons">
                            <div class="roles-buttons-left">
                                <asp:Button ID="btnApplySubItems" runat="server" CommandArgument="ApplyRolesToItems" OnClick="Button_Click" Text="Apply to Sub-Items" Visible="False" Enabled="False" meta:resourcekey="btnApplySubItemsResource1" />
                                <asp:Button ID="btnApplySubFolders" runat="server" CommandArgument="ApplyRolesToSubGroups" OnClick="Button_Click" Text="Apply to Sub-Folders" Visible="False" Enabled="False" meta:resourcekey="btnApplySubFoldersResource1" />
                            </div>
                            <div class="roles-buttons-right">
                                <asp:Button ID="btnAddRoles" runat="server" CommandArgument="AddRoleMembers" Text="Add" Visible="False" OnClick="Button_Click" meta:resourcekey="btnAddRolesResource1" />
                                <asp:Button ID="btnRemoveRole" runat="server" CommandArgument="RemoveRoleMember" Text="Remove" Visible="False" OnClick="Button_Click" meta:resourcekey="btnRemoveRoleResource1" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="eventDateTab" runat="server" Visible="False" meta:resourcekey="eventDateTabResource1">
                <ContentTemplate>
                    <div class="event-date-main">
                        <div class="event-date-list">
                            <asp:GridView ID="gvEventDates" runat="server" CssClass="event-date-gridView"
                                Width="100%" 
                                AutoGenerateColumns="False" 
                                DataKeyNames="DateID,CatID" GridLines="None" 
                                OnRowDataBound="gvEventDates_RowDataBound" OnSelectedIndexChanged="gvEventDates_SelectedIndexChanged" meta:resourcekey="gvEventDatesResource1">
                                <HeaderStyle CssClass="event-date-headerRow" />
                                <RowStyle CssClass="event-date-dataRow" />
                                <SelectedRowStyle CssClass="event-date-selectedRow" />
                                <Columns>
                                    <asp:BoundField DataField="DateName" HeaderText="Date Name" meta:resourcekey="BoundFieldResource4" />
                                    <asp:BoundField DataField="SetDate" HeaderText="Set Date" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource5" />
                                    <asp:BoundField DataField="TriggerDate" HeaderText="Trigger Date" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource6" />
                                    <asp:BoundField DataField="DateSettings" HeaderText="Date Settings" meta:resourcekey="BoundFieldResource7" />
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="event-date-buttons">
                            <div>
                                <asp:Button ID="btnApplyEventDateToSubItems" runat="server" Text="Apply to all sub-items" Width="160px" Enabled="False" OnClick="Button_Click" CommandArgument="ApplyEventDateToSubItems" meta:resourcekey="btnApplyEventDateToSubItemsResource1" />
                            </div>
                            <div>
                                <asp:Button ID="btnEditEventDates" runat="server" Text="Edit..." Width="70px" Enabled="False" OnClick="Button_Click" CommandArgument="EditEventDates" meta:resourcekey="btnEditEventDatesResource1" />
                            </div>
                        </div>
                        <asp:Panel ID="pnlEventDateButtons" runat="server" CssClass="event-date-buttons" meta:resourcekey="pnlEventDateButtonsResource1">
                            <div>
                                <asp:Button ID="btnApplyEventDateToSubFolders" runat="server" Text="Apply to all sub-folders" Width="160px" Enabled="False" OnClick="Button_Click" CommandArgument="ApplyEventDateToSubFolders" meta:resourcekey="btnApplyEventDateToSubFoldersResource1" />
                            </div>
                            <div>
                                &nbsp;
                            </div>
                        </asp:Panel>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="categoriesTab" runat="server"  meta:resourcekey="categoriesTabResource1">
                <ContentTemplate>
                    <div class="categories-main">
                        <div id="pnlCatList" runat="server" class="categories-list">
                            <ul>
                                <asp:Repeater ID="rptCategories" runat="server" OnItemDataBound="rptCategories_ItemDataBound">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnCatID" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.CatID") %>' />
                                    <li><asp:CheckBox ID="chkCategory" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CatCaption") %>' Enabled="False" meta:resourcekey="chkCategoryResource1" /></li>
                                </ItemTemplate>
                            </asp:Repeater>
                            </ul>                            
                        </div>
                        <div class="categories-buttons">
                            <div>
                                <asp:Button ID="btnApplyCategoriesToSubItems" runat="server" Text="Apply to all sub-items" Width="160px" Enabled="False" OnClick="Button_Click" CommandArgument="ApplyCategoriesToSubItems" meta:resourcekey="btnApplyCategoriesToSubItemsResource1" />
                            </div>
                            <div>
                                <asp:Button ID="btnApplyCategoriesToSubFolders" runat="server" Text="Apply to all sub-folders" Width="160px" Enabled="False" OnClick="Button_Click" CommandArgument="ApplyCategoriesToSubFolders" meta:resourcekey="btnApplyCategoriesToSubFoldersResource1" />
                            </div>
                        </div>
                    </div>                    
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="historyTab" runat="server"  meta:resourcekey="historyTabResource1">
                <ContentTemplate>
                    <div id="pnlHistory">
                        <asp:TextBox ID="txtHistory" runat="server" TextMode="MultiLine" ReadOnly="True" CssClass="pHistoryField" meta:resourcekey="txtHistoryResource1"></asp:TextBox>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="trainingTab" runat="server"  meta:resourcekey="trainingTabResource1">
                <ContentTemplate>
                    <asp:UpdatePanel ID="udpTraining" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <div id="pnlTraining">
                        <asp:GridView ID="gvTraining" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="ItemID,ParentGroupID,Status,ObjTypeID" GridLines="None" OnRowDataBound="gvTraining_RowDataBound" meta:resourcekey="gvTrainingResource1">
                            <HeaderStyle  BackColor="#F0F0F0" ForeColor="#000000" Font-Bold="False" Font-Size="8pt" Height="20px" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" />
                            <RowStyle BackColor="White" ForeColor="#000000" Font-Size="8pt" Font-Names="Arial" />
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <SelectedRowStyle BackColor="#0078D7" ForeColor="White" />
                            <Columns>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Image ID="ItemIcon" runat="server" ImageUrl="~/images/training.png" Width="20px" Height="20px" meta:resourcekey="ItemIconResource1"/>
                                    </ItemTemplate>
                                    <HeaderStyle Width="24px" />
                                    <ItemStyle Width="24px" />
                                </asp:TemplateField>
                                <asp:ButtonField DataTextField="Name" HeaderText="Name" CommandName="Select" meta:resourcekey="ButtonFieldResource1">
                                    <HeaderStyle  HorizontalAlign="Left" />
                                    <ControlStyle Font-Underline="False" />
                                </asp:ButtonField>
                                <asp:ButtonField DataTextField="Status" HeaderText="Status" CommandName="Select" meta:resourcekey="ButtonFieldResource2">
                                    <HeaderStyle  HorizontalAlign="Left" Width="80px" />
                                    <ControlStyle Font-Underline="False" Width="80px" />
                                </asp:ButtonField>
                                <asp:ButtonField DataTextField="VersionDate" HeaderText="Version Date" DataTextFormatString="{0:d}"
                                    CommandName="Select" meta:resourcekey="ButtonFieldResource3">
                                    <HeaderStyle  HorizontalAlign="Left" Width="90px" />
                                    <ControlStyle Font-Underline="False" Width="90px" />
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="pnlTrainingButtons">
                        <asp:Button ID="btnShowMe" runat="server" Text="Show Me" OnClick="Button_Click" CommandArgument="ShowMe" meta:resourcekey="btnShowMeResource1" />
                        <asp:Button ID="btnGoThere" runat="server" Text="Go There" OnClick="Button_Click" CommandArgument="GoThere" meta:resourcekey="btnGoThereResource1" />
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </div>
    <div id="pnlPClose" runat="server">
        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="Button_Click" CommandArgument="CloseProperties" meta:resourcekey="btnCloseResource1" />
    </div>
    <asp:Button ID="btnRefreshRoles" runat="server" CommandArgument="UpdateRoleMembers" OnClick="Button_Click"  style="display: none;" meta:resourcekey="btnRefreshRolesResource1" />



    <a id="dummyclicker" runat="server" href="#"></a>
    <asp:ModalPopupExtender ID="mpeEditEventDate" runat="server" PopupControlID="pnlEditEventDate" TargetControlID="dummyclicker" BackgroundCssClass="modalBackground" BehaviorID="mpeEditEventDate" DynamicServicePath=""></asp:ModalPopupExtender>
    <asp:Panel ID="pnlEditEventDate" runat="server" CssClass="edit-eventdate-modal" meta:resourcekey="pnlEditEventDateResource1">
        <asp:Panel ID="pnlEditEventTitleBar" runat="server" CssClass="edit-eventdate-titlebar" meta:resourcekey="pnlEditEventTitleBarResource1">
            <asp:Label ID="ManageDateLabel" runat="server" Text="Manage Date" meta:resourcekey="ManageDateLabel"></asp:Label>
            <asp:ImageButton ID="btnEditEventClose" runat="server" ImageUrl="~/images/squareclose.png" meta:resourcekey="btnEditEventCloseResource1" />
        </asp:Panel>
        <div class="edit-eventdate-spacer">
            <div>Date:</div>
        </div>
        <div class="edit-eventdate-content">
            <div class="eventdate-list">
                <asp:GridView ID="gvDates" runat="server" CssClass="gvDates"
                    DataKeyNames="CatID"
                    Width="250px" 
                    GridLines="None" 
                    ShowHeader="False" 
                    AutoGenerateColumns="False" 
                    OnRowDataBound="gvDates_RowDataBound" 
                    OnSelectedIndexChanged="gvDates_SelectedIndexChanged" meta:resourcekey="gvDatesResource1">
                    <RowStyle CssClass="gvdates-row" />
                    <SelectedRowStyle CssClass="gvDates-selectedRow" />
                    <Columns>
                        <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                            <ItemStyle Width="20px" />
                            <ItemTemplate>
                                <img src="images/eventdate.png" style="width: 18px;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CatCaption" meta:resourcekey="BoundFieldResource8" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="eventdate-divider"></div>
            <div class="eventdate-options">
                <div class="date-settings">
                    <fieldset style="display: block; height: 100%; border: 1px solid #dcdcdc; margin-bottom: 5px;">
                        <legend><asp:Label ID="DateLabel" runat="server" Text="Date" meta:resourcekey="DateLabel"></asp:Label></legend>
                        <asp:RadioButton ID="rbNotSet" runat="server" Text="Not Set" Checked="True" style="display: block; margin-top: 10px;" AutoPostBack="True" OnCheckedChanged="RadioButton_CheckedChanged" meta:resourcekey="rbNotSetResource1" />
                        <div>&nbsp;</div>
                        <asp:RadioButton ID="rbSetDate" runat="server" Text="Set on the date:" style="display: block;" AutoPostBack="True" OnCheckedChanged="RadioButton_CheckedChanged" meta:resourcekey="rbSetDateResource1" />
                        <div style="padding-left: 30px;">
                            <asp:TextBox ID="txtSetDate" runat="server" Width="100px" meta:resourcekey="txtSetDateResource1"></asp:TextBox>
                            <asp:CalendarExtender ID="ceSetDate" runat="server" TargetControlID="txtSetDate" BehaviorID="ceSetDate" />                           
                        </div>
                        <asp:RadioButton ID="rbSetStatus" runat="server" Text="Based on the status:" style="display: block;" AutoPostBack="True" OnCheckedChanged="RadioButton_CheckedChanged" meta:resourcekey="rbSetStatusResource1" />                     
                        <div style="padding-left: 30px;">
                            <asp:DropDownList ID="ddlStatus" runat="server" Width="180px" meta:resourcekey="ddlStatusResource1">
                                <asp:ListItem Value="2" Text="Draft Date" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Collaborate Date" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Review Date" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Ready Date" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                <asp:ListItem Value="7" Text="Pending Date" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                <asp:ListItem Value="9" Text="Current Date" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Obsolete Date" meta:resourcekey="ListItemResource7"></asp:ListItem>
                            </asp:DropDownList>
                        </div>                     
                    </fieldset>
                </div>
                <div class="frequency-settings">
                    <fieldset style="display: block; height: 100%; border: 1px solid #dcdcdc;">
                        <legend><asp:Label ID="FrequencyLabel" runat="server" Text="Frequency" meta:resourcekey="FrequencyLabel"></asp:Label></legend>
                        <asp:RadioButton ID="rbOnceOnly" runat="server" Text="Once Only" style="display: block; margin-bottom: 10px;" AutoPostBack="True" OnCheckedChanged="RadioButton_CheckedChanged" meta:resourcekey="rbOnceOnlyResource1" />
                        <asp:RadioButton ID="rbEvery" runat="server" Text="Every" style="display: block;" AutoPostBack="True" OnCheckedChanged="RadioButton_CheckedChanged" meta:resourcekey="rbEveryResource1" />
                        <div style="padding-left: 30px;">
                            <asp:TextBox ID="txtRepeatNum" runat="server" Width="70px" TextMode="Number" Text="1" meta:resourcekey="txtRepeatNumResource1"></asp:TextBox>
                            <asp:DropDownList ID="ddlRepeatPeriod" runat="server" Width="100px" meta:resourcekey="ddlRepeatPeriodResource1">
                                <asp:ListItem Value="3" Text="Day" meta:resourcekey="ListItemResource8"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Week" meta:resourcekey="ListItemResource9"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Month" meta:resourcekey="ListItemResource10"></asp:ListItem>
                                <asp:ListItem Value="6" Text="Year" meta:resourcekey="ListItemResource11"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </fieldset>
                </div>
                <div class="actionitem-settings">
                    <fieldset style="display: block; height: 100%; border: 1px solid #dcdcdc;">
                        <legend><asp:Label ID="ActionItemLabel" runat="server" Text="Action Item" meta:resourcekey="ActionItemLabel"></asp:Label></legend>
                        <div style="margin: 10px auto 2px auto;">
                            <asp:Label ID="TriggerActionItemLabel" runat="server" Text="Trigger Action Item" meta:resourcekey="TriggerActionItemLabel"></asp:Label>
                        </div>
                        <div>
                            <asp:TextBox ID="txtAITriggerNum" runat="server" TextMode="Number" Width="70px" Text="0" meta:resourcekey="txtAITriggerNumResource1"></asp:TextBox>
                            <asp:DropDownList ID="ddlAITriggerPeriod" runat="server" Width="80px" meta:resourcekey="ddlAITriggerPeriodResource1">
                                <asp:ListItem Value="3" Text="Day" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Week" meta:resourcekey="ListItemResource13"></asp:ListItem>
                                <asp:ListItem Value="5" Text="Month" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                <asp:ListItem Value="6" Text="Year" meta:resourcekey="ListItemResource15"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlAITriggerWhen" runat="server" Width="80px" meta:resourcekey="ddlAITriggerWhenResource1">
                                <asp:ListItem Value="0" Text="Before" meta:resourcekey="ListItemResource16"></asp:ListItem>
                                <asp:ListItem Value="1" Text="After" meta:resourcekey="ListItemResource17"></asp:ListItem>
                            </asp:DropDownList>
                            <span style="display: block; font-size: .9em; color: cornflowerblue; margin-top: 10px;"><asp:Label ID="EventDateNoteLabel" runat="server" Text="Note: Calculated AFTER 'set on date' is reached." meta:resourcekey="EventDateNoteLabel"></asp:Label></span>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
        <div class="edit-eventdate-buttons">
            <asp:Button ID="btnSaveEventDetails" runat="server" Text="Close" OnClick="Button_Click" CommandArgument="SaveEventDateDetails" meta:resourcekey="btnSaveEventDetailsResource1" />
        </div>
    </asp:Panel>
    <asp:Button ID="btnApplyEDTSI" runat="server" style="display: none;" OnClick="btnApplyEDTSI_Click" meta:resourcekey="btnApplyEDTSIResource1" />
    <asp:Button ID="btnApplyEDTSF" runat="server" style="display: none;" OnClick="btnApplyEDTSF_Click" meta:resourcekey="btnApplyEDTSFResource1" />
    <asp:Button ID="btnApplyCTSI" runat="server" style="display: none;" OnClick="btnApplyCTSI_Click" meta:resourcekey="btnApplyCTSIResource1" />
    <asp:Button ID="btnApplyCTSF" runat="server" style="display: none;" OnClick="btnApplyCTSF_Click" meta:resourcekey="btnApplyCTSFResource1" />
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="IMGDIV" runat="server" class="pleaseWait">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/pleasewait.gif" meta:resourcekey="Image1Resource1" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </form>
</body>
</html>
