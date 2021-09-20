<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPrintRecord.aspx.cs" Inherits="Paradigm3.ViewPrintRecord" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>P3Web - Print Item</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
	<link href="styles/PrintRecord.css" rel="stylesheet" />
	<script src="scripts/P3Web.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="print-container">
            <div class="print-header">
                <img src="custom/images/banner_logo.png" alt="Company Logo" />
                <span>
                    <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                </span>
            </div>
            <div class="print-item-details">
                <div class="row">
                    <div>Item Name:</div>
                    <div style="flex: 1 1 auto; font-weight: 700;"><asp:Label ID="lblItemName" runat="server">[Item Name]</asp:Label></div>
                </div>
                <div class="row">
                    <div>Parent Folder:</div>
                    <div style="flex: 1 1 auto;"><asp:Label ID="lblItemParentFolder" runat="server">[Item Parent Folder]</asp:Label></div>
                </div>
            </div>
            <div class="print-item-keyinfo">
                <div class="row">
                    <div style="font-weight: 700;">Key Information</div>
                </div>
                <div class="row">
                    <div>Created By:</div>
                    <div><asp:Label ID="lblItemCreatedBy" runat="server">[Created By]</asp:Label></div>
                    <div>Created On:</div>
                    <div><asp:Label ID="lblItemCreatedOn" runat="server">[Created On]</asp:Label></div>
                </div>
                <div class="row">
                    <div>Status:</div>
                    <div><asp:Label ID="lblItemStatus" runat="server">[Status]</asp:Label></div>
                    <div>Completed Date:</div>
                    <div><asp:Label ID="lblItemCompletedDate" runat="server">[Completed Date]</asp:Label></div>
                </div>
            </div>
            <asp:Repeater ID="rptStep" runat="server" OnItemDataBound="rptStep_ItemDataBound">
                <ItemTemplate>
                    <div class="print-item-step">
                        <div class="row">
                            <div style="flex: 1 1 auto; font-weight: 700;">
                                <asp:Label ID="lblStepType" runat="server"></asp:Label>: <%# DataBinder.Eval(Container, "DataItem.Caption")%>
                            </div>
                        </div>
                        <asp:Panel ID="pnlStepDueDate" runat="server" CssClass="row" style="font-size: .8em;" Visible="false">
                            <div>Step Due Date:</div>
                            <div style="flex: 1 1 auto;"><asp:Label ID="lblStepDueDate" runat="server"></asp:Label></div>
                        </asp:Panel>
                        <asp:Panel ID="pnlStepResponsible" runat="server" CssClass="row" style="font-size: .8em;" Visible="false">
                            <div>Step Responsible:</div>
                            <div style="flex: 1 1 auto;"><asp:Label ID="lblStepResponsible" runat="server"></asp:Label></div>
                        </asp:Panel>
                        <asp:Panel ID="pnlStepCompleted" runat="server" CssClass="row" style="font-size: .8em; padding-bottom: 10px; border-bottom: 1px solid #dcdcdc;" Visible="false">
                            <div>Step Completed:</div>
                            <div style="flex: 1 1 auto;"><asp:Label ID="lblStepCompleted" runat="server"></asp:Label></div>
                        </asp:Panel>
                        <asp:Repeater ID="rptStepData" runat="server" OnItemDataBound="rptStepData_ItemDataBound">
                            <ItemTemplate>
                                <div class="row">
                                    <div>
                                        <asp:Label ID="lblFieldName" runat="server"><%# DataBinder.Eval(Container, "DataItem.FieldName")%>:</asp:Label>
                                    </div>
                                    <div style="flex: 1 1 auto;">
                                        <asp:Label ID="lblFieldData" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
