<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCreateActionItem.aspx.cs" Inherits="P3Web.ViewCreateActionItem" EnableEventValidation="false" Async="true" ValidateRequest="false" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=GetLocalResourceObject("PageResource1.Title") %></title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
    <link href="styles/Pages.css" rel="stylesheet" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
    <style>
        table, th, td {
            margin-left: 0px;
        }

        th, td {
            padding: 0.5px;
        }
    </style>

    <script type="text/javascript">
        function chkboxValidation(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            for (var i = 0; i < chks.length; i++) {
                if (chks[i] != chk && chk.checked) {
                    chks[i].checked = false;
                }
            }
        }
    </script>
</head>
<body class="propertiesBody">
    <form id="formActionItems" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="udpActionItem" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblErrorMessage" runat="server" meta:resourcekey="lblErrorMessageResource1"></asp:Label>
                <div id="pnlPropertiesContent">
                    <asp:TabContainer ID="tcActionItem" runat="server" meta:resourcekey="tcActionItemResource1">
                        <asp:TabPanel ID="tbCreateAI" runat="server" HeaderText="Action Item Settings" meta:resourcekey="tbCreateAIResource1">
                            <ContentTemplate>
                                <div class="u-prop-tabcontent" style="padding: 5px; box-sizing: border-box;">
                                    <div>
                                        <table style="width: 100%; font-family: sans-serif; font-size: 12px;">
                                            <tr>
                                                <td colspan="4" style="width: 140px;">
                                                    <%= GetLocalResourceObject("AICaption") %>
                                                </td>                                                
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:TextBox ID="txtItemCaption" runat="server" CssClass="fieldtextEdit" Width="99%" style="border: 1px solid #000; resize: none; outline: none;" meta:resourcekey="txtItemCaptionResource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="height: 30px">
                                                <td style="width: 120px;">
                                                     <%= GetLocalResourceObject("DaysToCompleteLabel") %>
                                                </td>
                                                <td style="width: 150px;">
                                                    <asp:TextBox ID="txtDays" TextMode="Number" runat="server" min="0" max="1000" step="1" Text="7" style="border: 1px solid #000; outline: none;" meta:resourcekey="txtDaysResource1" />
                                                    <%= GetLocalResourceObject("DaysLabel") %>
                                                </td>
                                                <td style="width: 50px;">
                                                     <%=GetLocalResourceObject("PriorityLabel") %>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlPriority" runat="server" meta:resourcekey="ddlPriorityResource1">
                                                        <Items>
                                                            <asp:ListItem Text="Low" Value="0" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                            <asp:ListItem Selected="True" Text="Normal" Value="1" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                                            <asp:ListItem Text="Urgent" Value="2" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                        </Items>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="font-family: sans-serif; font-size: 12px;">
                                        <%= GetLocalResourceObject("AIMessageLabel") %>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtDetails" runat="server" TextMode="MultiLine" Width="99%" Height="185px" style="border: 1px solid #dcdcdc; border-bottom: 1px solid #000; resize: none; outline: none;" meta:resourcekey="txtDetailsResource1"></asp:TextBox>
                                    </div>
                                    <div style="font-family: sans-serif; font-size: 12px;">
                                        <%= GetLocalResourceObject("AIRecipientLabel") %>
                                    </div>
                                    <div style="font-family: sans-serif; font-size: 14px; display: flex; flex-direction: row; background-color: #f1f1f1; border: 1px solid #dcdcdc;">
                                        <div style="flex: 1 1 auto; padding: 3px; border-right: 1px solid #dcdcdc;">
                                            <%= GetLocalResourceObject("RecipientNameHeader") %>
                                        </div>
                                        <div style="flex: 0 0 100px; padding: 3px;">
                                            <%= GetLocalResourceObject("RecipientTypeHeader") %>
                                        </div>
                                    </div>
                                    <div style="height: 114px; overflow-y: auto; border-left: 1px solid #dcdcdc; border-right: 1px solid #dcdcdc; border-bottom: 1px solid #000;">
                                            <asp:GridView ID="gvRoleMembers" runat="server" Font-Names="sans-serif" Font-Size="14px" BorderStyle="None"
                                                GridLines="None"
                                                ShowHeader="false"
                                                Width="100%" DataKeyNames="ControlID"
                                                AutoGenerateColumns="False"
                                                OnRowDataBound="gvRoleMembers_RowDataBound"
                                                meta:resourcekey="gvRoleMembersResource1">
                                            <RowStyle BorderStyle="None" />
                                            <SelectedRowStyle ForeColor="#ffffff" BackColor="#0078d7" Font-Names="sans-serif" Font-Size="14px" />
                                            <Columns>
                                                <asp:BoundField DataField="ControlFullName" HeaderText="Name" meta:resourcekey="BoundFieldResource1" />
                                                <asp:BoundField DataField="ControlType" HeaderText="Type" meta:resourcekey="BoundFieldResource2" ItemStyle-Width="100px" />    
                                            </Columns>
                                        </asp:GridView>
                                    </div>                           
                                 </div>
                                 <div id="Div2" runat="server">
                                    <div style="padding: 10px; box-sizing: border-box; text-align: right;">
                                        <asp:Button ID="btnAddRoles" runat="server" Width="70px" CommandArgument="AddRoleMembers" Text="Add" OnClick="Button_Click" meta:resourcekey="btnAddRolesResource1" />
                                        <asp:Button ID="btnRemoveRole" runat="server" Width="70px" CommandArgument="RemoveRoleMember" Text="Remove" OnClick="Button_Click" meta:resourcekey="btnRemoveRoleResource1" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>                      
                        <asp:TabPanel ID="tbOptions" runat="server" HeaderText="Options" meta:resourcekey="tbOptionsResource1" Height="486px">
                            <ContentTemplate> 
                                <div class="u-prop-tabcontent" style="border: none;"> 
                                    <div class="u-opt-row" style="flex: 1 1 auto; display: flex; flex-direction: column; align-items: stretch;">
                                        <fieldset style="display: flex;flex-direction: column; justify-content: flex-start; border: 1px solid #dcdcdc;">
                                            <legend> </legend>
                                            <div class="u-opt-row">
                                                <asp:CheckBox ID="cbRequirePwdforAI" runat="server"  onclick="chkboxValidation(this);" Text="Require password confirmation when completing this Action Item." meta:resourcekey="cbRequirePwdforAIResource1" />
                                            </div>
                                            <div class="u-opt-row">
                                                <asp:CheckBox ID="cbRelatedAIAutoComplete" runat="server" onclick="chkboxValidation(this);" Text="After viewing the related item or folder, automatically complete this Action Item." meta:resourcekey="cbRelatedAIAutoCompleteResource1" />
                                            </div>
                                            <div class="u-opt-row">
                                                <asp:CheckBox ID="cbAIAutoComplete" runat="server" onclick="chkboxValidation(this);" Text="After viewing the Action Item, it will be automatically completed." meta:resourcekey="cbAIAutoCompleteResource1"  />
                                            </div>
                                            <div class="u-opt-row">
                                                <asp:CheckBox ID="cbDueDateAutoComplete" runat="server" onclick="chkboxValidation(this);" Text="When due date reached, automatically complete it." meta:resourcekey="cbDueDateAutoCompleteResource1" />
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tbCategories" runat="server" HeaderText="Categories" meta:resourcekey="tbCategoriesResource1" Height="486px">
                            <ContentTemplate>
                            <div class="u-prop-tabcontent" style="border: none;">
                                 <div class="u-prop-gen-row" style="font-family: sans-serif; font-size: 12px;">
                                     <%= GetLocalResourceObject("AICategoryLabel") %>                                        
                                 </div>
                                 <div class="u-prop-gen-row" style="flex: 1 1 auto; align-items: flex-start; padding: 0; overflow-x: hidden; overflow-y: auto;">
                                     <div id="pnlCatList" runat="server" class="categories-list" style="height: 99%;">
                                         <ul>
                                             <asp:Repeater ID="rptCategories" runat="server" OnItemDataBound="rptCategories_ItemDataBound">
                                                 <ItemTemplate>
                                                     <asp:HiddenField ID="hdnCatID" runat="server" Value='<%# DataBinder.Eval(Container, "DataItem.CatID") %>' />
                                                     <li><asp:CheckBox ID="chkCategory" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CatCaption") %>' meta:resourcekey="chkCategoryResource1" /></li>                                </ItemTemplate>
                                             </asp:Repeater>
                                         </ul>                            
                                     </div>
                                 </div>
                            </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                </div>
                <div id="pnlPClose" runat="server" style="padding-top: 17px;">
                    <asp:Button ID="btnSubmit" runat="server" Width="80px" CommandArgument="Submit" OnClick="Button_Click" Text="Submit" meta:resourcekey="btnSubmitResource1" />
                    <asp:Button ID="btnClose" runat="server" Width="80px" CommandArgument="Close" OnClick="Button_Click" Text="Close" meta:resourcekey="btnCloseResource1" />
                </div>
                <asp:Button ID="btnRefreshRoles" runat="server" CommandArgument="UpdateRoleMembers" OnClick="Button_Click" Style="display: none;" meta:resourcekey="btnRefreshRolesResource1" />

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