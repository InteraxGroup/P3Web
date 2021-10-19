<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Paradigm3.Administration.Default" Async="true" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>P3Web - Administration</title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="~/p3_32.ico" />
    <link href="lib/twitter-bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="lib/font-awesome/css/all.min.css" rel="stylesheet" />
	<link href="css/p3webadmin.css" rel="stylesheet" />	
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="pnlAdmin" runat="server" CssClass="container position-relative">
            <div class="bg-dark text-white p-4 rounded shadow">
                <h1 class="display-4">P3Web Administration</h1>
                <asp:HyperLink ID="hlBack" runat="server" CssClass="btn btn-light position-absolute" Text="Back to P3Web" NavigateUrl="~/" style="top: 20px; right: 20px;"></asp:HyperLink>
            </div>
            <ul id="adminmenu" class="nav nav-tabs mt-3">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="tab00" data-bs-toggle="tab" data-bs-target="#configpaths" role="tab" aria-controls="configpaths" aria-selected="true" href="#configpaths">Path Defaults</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab01" data-bs-toggle="tab" data-bs-target="#configdefaults" role="tab" aria-controls="configdefaults" aria-selected="false" href="#configdefaults">Module Defaults</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab02" data-bs-toggle="tab" data-bs-target="#searchdefaults" role="tab" aria-controls="searchdefaults" aria-selected="false" href="#searchdefaults">Search Defaults</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab03" data-bs-toggle="tab" data-bs-target="#directlinks" role="tab" aria-controls="directlinks" aria-selected="false" href="#directlinks">Direct Links</a>
                </li>
                <li class="nav-item" role="presentation" style="display: none;">
                    <a class="nav-link" id="tab04" data-toggle="tab" role="tab" aria-controls="powertools" aria-selected="false" href="#powertools">PowerTools</a>
                </li>
                <li class="nav-item" role="presentation" style="display: none;">
                    <a class="nav-link" id="tab05" data-toggle="tab" role="tab" aria-controls="styledesigner" aria-selected="false" href="#styledesigner">Style Designer</a>
                </li>
            </ul>            
            <div class="tab-content shadow bg-light rounded-bottom border border-top-0 over" style="height: 600px; overflow-x: hidden; overflow-y: auto;">
                <div id="configpaths" class="tab-pane fade show active" role="tabpanel" aria-labelledby="configpaths-tab">
                    <h2 class="bg-white shadow-sm text-center p-2">
                        Default Configuration Paths
                    </h2>                    
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top">Domain(s)</h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtDomain" runat="server" CssClass="form-control" Text="Obiwan" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateDomain" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateDomain_Click" />
                                        </div>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top">P3 Document Path</h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtDocPath" runat="server" CssClass="form-control" Text="D:\P3\data\docs\" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateDocPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateDocPath_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top">Published Document Path</h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtPublishPath" runat="server" CssClass="form-control" Text="~/docs/" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdatePublishPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdatePublishPath_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top">Public Path</h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                             <asp:TextBox ID="txtPublicPath" runat="server" CssClass="form-control custom-control-inline" Text="~/public/" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdatePublicPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdatePublicPath_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top">Indexed Search Path</h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtIndexSearchPath" runat="server" CssClass="form-control custom-control-inline" Text="D:/P3/data/docs/publish" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateIndexSearchPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateIndexSearchPath_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top">Attachments Path</h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtAttachPath" runat="server" CssClass="form-control custom-control-inline" Text="~/attachments/" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateAttachPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateAttachPath_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>
                <div id="configdefaults" class="tab-pane fade" role="tabpanel" aria-labelledby="configdefaults-tab">
                    <asp:UpdatePanel ID="udpDefaults" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                    <ContentTemplate>
                    <h2 class="bg-white shadow-sm text-center p-2">
                        Default Module Settings
                    </h2>
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Default Module</h4>
                                <div class="card-body p-2">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlDefModule" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDefModule_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="Home" Selected="True" />
                                            <asp:ListItem Value="3" Text="Documents" />
                                            <asp:ListItem Value="4" Text="Records" />
                                            <asp:ListItem Value="6" Text="Improvements" />
                                            <asp:ListItem Value="12" Text="Training" />
                                            <asp:ListItem Value="14" Text="Action Items" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Default Document Group</h4>
                                <div class="card-body p-2">
                                    <div class="form-inline">
                                        <asp:TextBox ID="txtDefDocGroup" runat="server" CssClass="form-control custom-control-inline" ReadOnly="true" Text="Management System" />
                                        <asp:Button ID="btnUpdateDefDocGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefDocGroup_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Default Records Group</h4>
                                <div class="card-body p-2">
                                    <div class="form-inline">
                                        <asp:TextBox ID="txtDefRecGroup" runat="server" CssClass="form-control custom-control-inline" ReadOnly="true" Text="Business Records" />
                                        <asp:Button ID="btnUpdateDefRecGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefRecGroup_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Default Improvements Group</h4>
                                <div class="card-body p-2">
                                    <div class="form-inline">
                                        <asp:TextBox ID="txtDefImpGroup" runat="server" CssClass="form-control custom-control-inline" ReadOnly="true" Text="Business Improvements" />
                                        <asp:Button ID="btnUpdateDefImpGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefImpGroup_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Default Training Group</h4>
                                <div class="card-body p-2">
                                    <div class="form-inline">
                                        <asp:TextBox ID="txtDefTrainGroup" runat="server" CssClass="form-control custom-control-inline" ReadOnly="true" Text="Training Records" />
                                        <asp:Button ID="btnUpdateDefTrainGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefTrainGroup_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Default Action Items Group</h4>
                                <div class="card-body p-2">
                                    <div class="form-inline">
                                        <asp:TextBox ID="txtDefAIGroup" runat="server" CssClass="form-control custom-control-inline" ReadOnly="true" Text="Action Items" />
                                        <asp:Button ID="btnUpdateDefAIGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefAIGroup_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Panel ID="pnlUpdateDefaults" runat="server" Width="800" Height="490" CssClass="bg-light border-dark rounded shadow p-0 overflow-hidden" style="z-index: 999;">
                        <div class="d-flex flex-column" style="height: 600px; width: 100%;">
                            <div class="bg-white p-2 rounded-top w-100 border-bottom font-weight-bold">
                                <h2 class="text-center">Set New Default Folder</h2>
                                <div class="bg-light">
                                    <div class="form-group p-2">
                                        <asp:DropDownList ID="ddlDefGroupModule" runat="server" 
                                            AutoPostBack="true" 
                                            CssClass="form-control" Enabled="false">
                                            <asp:ListItem Value="3" Text="Documents"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Records"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="Improvements"></asp:ListItem>
                                            <asp:ListItem Value="12" Text="Training"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="m-2 border bg-white overflow-auto" style="height: 300px;">
                                        <asp:TreeView ID="dgTree" runat="server"
                                            EnableClientScript="false"
                                            NodeIndent="15"
                                            ExpandDepth="1" 
                                            OnTreeNodePopulate="TreeView_TreeNodePopulate" 
                                            OnTreeNodeExpanded="TreeView_TreeNodeExpanded" 
                                            OnTreeNodeCollapsed="TreeView_TreeNodeCollapsed"
                                            OnSelectedNodeChanged="TreeView_SelectedNodeChanged">
                                            <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="12px" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                                            <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                                        </asp:TreeView>
                                    </div>
                                </div>
                                <div class="mt-auto bg-white border-top rounded-bottom">
                                    <div class="container p-2 text-center">
                                        <asp:Button ID="btnSubmitUpdateDefFolder" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmitUpdateDefFolder_Click" />
                                        <asp:Button ID="btnCancelUpdateDefaultFolder" runat="server" CssClass="btn btn-secondary" Text="Cancel" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:ModalPopupExtender ID="mpeUpdateDefaults" runat="server"
                        PopupControlID="pnlUpdateDefaults" 
                        TargetControlID="btnUpdateDefAIGroup" 
                        BackgroundCssClass="modalBackground">
                    </asp:ModalPopupExtender>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="searchdefaults" class="tab-pane fade" role="tabpanel" aria-labelledby="searchdefaults-tab">
                    <asp:UpdatePanel ID="udpSearchDefaults" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                    <ContentTemplate>
                    <h2 class="bg-white shadow-sm text-center p-2">
                        Search Defaults Management
                    </h2>
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Simple Document Search</h4>
                                <div class="card-body p-2 text-center">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlSimpleSearch" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSimpleSearch_SelectedIndexChanged">
                                            <asp:ListItem Value="false" Text="Disabled"></asp:ListItem>
                                            <asp:ListItem Value="true" Text="Enabled"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Default Search Page</h4>
                                <div class="card-body p-2 text-center">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlDefaultSearchTab" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDefaultSearchTab_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="General"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Roles"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Categories"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>                      
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Hide Search to Read-Only</h4>
                                <div class="card-body p-2 text-center">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlHideSearch" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlHideSearch_SelectedIndexChanged">
                                            <asp:ListItem Value="false" Text="Disabled"></asp:ListItem>
                                            <asp:ListItem Value="true" Text="Enabled"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col-4"></div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2">Document Search Field</h4>
                                <div class="card-body p-2 text-center">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlDefaultSearchField" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDefaultSearchField_SelectedIndexChanged">
                                            <asp:ListItem Value="Name" Text="Document Name"></asp:ListItem>
                                            <asp:ListItem Value="LabelName" Text="Document Label"></asp:ListItem>
                                            <asp:ListItem Value="ItemID" Text="Document ID"></asp:ListItem>
                                            <asp:ListItem Value="OrigID" Text="Document Original ID"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4"></div>
                    </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="directlinks" class="tab-pane fade" role="tabpanel" aria-labelledby="directlinks-tab">
                    <asp:UpdatePanel ID="udpDLinks" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                    <ContentTemplate>
                    <h2 class="bg-white shadow-sm text-center">
                        Direct Links Management
                    </h2>
                    <div class="container p-2">
                        <div style="padding-bottom: 10px;">
                            <asp:Button ID="btnAddDLink" runat="server" CssClass="btn btn-primary" Text="Add New Direct Link" />
                        </div>
                        <asp:GridView ID="gvDirectLinks" runat="server" 
                            AutoGenerateColumns="false" 
                            CssClass="table" 
                            GridLines="None" 
                            OnRowDataBound="gvDirectLinks_RowDataBound" 
                            DataKeyNames="GroupID,ModuleID"
                            OnRowEditing="gvDirectLinks_RowEditing" 
                            OnRowUpdating="gvDirectLinks_RowUpdating" 
                            OnRowDeleting="gvDirectLinks_RowDeleting"
                            OnRowCancelingEdit="gvDirectLinks_RowCancelingEdit">
                            <RowStyle CssClass="p-2" />
                            <HeaderStyle CssClass="bg-dark text-white" />
                            <AlternatingRowStyle CssClass="bg-light" />
                            <EditRowStyle CssClass="bg-primary text-white" />
                            <Columns>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" CssClass="form-text" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblName" runat="server" CssClass="form-text" Text='<%# Eval("Name") %>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Module">
                                    <ItemTemplate>
                                        <asp:Label ID="lblModule" runat="server" CssClass="form-text" Text='<%# Eval("ModuleID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                         <asp:Label ID="lblModule" runat="server" CssClass="form-text" Text='<%# Eval("ModuleID") %>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Site ID" ItemStyle-Width="500px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSiteID" runat="server" CssClass="form-text" Text='<%# Eval("SiteID") %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSiteID" runat="server" CssClass="form-control" Text='<%# Eval("SiteID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-sm btn-primary" Text="Edit" CommandName="Edit" />
                                        <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-sm btn-danger" Text="Delete" CommandName="Delete" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-sm btn-success" Text="Save" CommandName="Update" />
                                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-sm btn-light" Text="Cancel" CommandName="Cancel" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <asp:Panel ID="pnlAddDLink" runat="server" Width="800" Height="600" CssClass="bg-light border-dark rounded shadow p-0 overflow-hidden" style="z-index: 999;">
                        <div class="d-flex flex-column" style="height: 600px; width: 100%;">
                            <div class="bg-white p-2 rounded-top w-100 border-bottom font-weight-bold">
                                <h2 class="text-center">Add New Direct Link</h2>
                            </div>
                            <div class="bg-light">
                                <div class="form-group p-2">
                                    <asp:DropDownList ID="ddlDLinkModule" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlDLinkModule_SelectedIndexChanged">
                                        <asp:ListItem Value="3" Text="Documents" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="Records"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="Improvements"></asp:ListItem>
                                        <asp:ListItem Value="12" Text="Training"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="m-2 border bg-white overflow-auto" style="height: 300px;">
                                    <asp:TreeView ID="dlTree" runat="server"
                                        EnableClientScript="false"
                                        NodeIndent="15"
                                        ExpandDepth="1" 
                                        OnTreeNodePopulate="TreeView_TreeNodePopulate" 
                                        OnTreeNodeExpanded="TreeView_TreeNodeExpanded" 
                                        OnTreeNodeCollapsed="TreeView_TreeNodeCollapsed"
                                        OnSelectedNodeChanged="TreeView_SelectedNodeChanged">
                                        <NodeStyle ForeColor="#000000" Font-Bold="false" Font-Names="Arial" Font-Size="12px" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="#FFFFFF" HorizontalPadding="2px" VerticalPadding="0px" />
                                    </asp:TreeView>
                                </div>
                                <div class="form-group p-2 text-center">
                                    <label class="form-label">Enter Site ID (if applicable)</label>
                                    <asp:TextBox ID="txtDLinkSiteID" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mt-auto bg-white border-top rounded-bottom">
                                <div class="container p-2 text-center">
                                    <asp:Button ID="btnSubmitNewDLink" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmitNewDLink_Click" />
                                    <asp:Button ID="btnCancelNewDLink" runat="server" CssClass="btn btn-secondary" Text="Cancel" />
                                </div>
                            </div>
                        </div>                        
                    </asp:Panel>
                    <asp:ModalPopupExtender ID="mpeAddDLink" runat="server" 
                        PopupControlID="pnlAddDlink" 
                        TargetControlID="btnAddDLink" 
                        CancelControlID="btnCancelNewDLink" 
                        BackgroundCssClass="modalBackground">
                    </asp:ModalPopupExtender>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="powertools" class="tab-pane fade" role="tabpanel" aria-labelledby="powertools-tab">
                    <h2 class="bg-white shadow-sm text-center p-2">
                        Paradigm 3 PowerTools
                    </h2>                    
                </div>
                <div id="styledesigner" class="tab-pane fade" role="tabpanel" aria-labelledby="styledesigner-tab">
                    <h2 class="bg-white shadow-sm text-center p-2">
                        Paradigm 3 Style Designer
                    </h2>
                    <div class="container-sm p-0">
                        <asp:UpdatePanel ID="udpSD" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>
                        <div class="row p-1 pl-4 pr-4">
                            <div class="col-4 col-4-sm">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label-sm">Module:</label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="ddlSDModules" runat="server" CssClass="form-control form-control-sm" 
                                            Enabled="false" 
                                            AutoPostBack="true" 
                                            OnSelectedIndexChanged="ddlSDModules_SelectedIndexChanged">
                                        <asp:ListItem Value="4" Text="Records" />
                                        <asp:ListItem Value="6" Text="Improvements" />
                                        <asp:ListItem Value="12" Text="Training" />
                                    </asp:DropDownList>
                                    </div>                                
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label-sm">Style:</label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="ddlSDStyles" runat="server" CssClass="form-control form-control-sm" AppendDataBoundItems="true" Enabled="false">
                                            <asp:ListItem Value="0" Text="" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label-sm">Pages:</label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="ddlSDPages" runat="server" CssClass="form-control form-control-sm" AppendDataBoundItems="true" Enabled="false">
                                            <asp:ListItem Value="0" Text="" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label-sm">Field:</label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="ddlSDFields" runat="server" CssClass="form-control form-control-sm" AppendDataBoundItems="true" Enabled="false">
                                            <asp:ListItem Value="0" Text="" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-8 col-8-sm border rounded">
                                <div class="row">
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDDownloadDB" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Download" OnClick="btnSDDownloadDB_Click" />
                                    </div>
                                    <div class="col-10">
                                        <label class="text-danger font-weight-bold mt-2">
                                            Please backup the database before starting any modification
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDAddStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Add Style" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDRenameStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Rename Style" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDMoveStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Move Style" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDRestoreStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Restore Style" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDCopyStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Copy Style" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDAddPage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Add Page" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDRenamePage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Rename Page" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDReorderPage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Re-Order" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDRestorePage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Restore Pages" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDCopyPage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Copy Page" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDAddField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Add Field" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDRenameField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Rename Field" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDMoveField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Move Field" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDRestoreField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Restore Fields" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDCopyField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Copy Fields" Enabled="false" />
                                    </div>
                                    <div class="col-2 col-2-sm p-1">
                                        <asp:Button ID="btnSDAdjustGrid" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Adjust Grid" Enabled="false" />
                                    </div>
                                </div>
                                <div class="row p-0 pt-3">
                                    <div class="col-3 col-3-sm p-1">
                                        <asp:Button ID="btnSDFormula" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Formula Settings" Enabled="false" />
                                    </div>
                                    <div class="col-3 col-3-sm p-1">
                                        <p style="font-size: 11px; line-height: 12px; padding: 0; margin: 2px 0 0 0;">Select module and style and click the button to set formula</p>
                                    </div>
                                    <div class="col-3 col-3-sm p-1">
                                        <asp:Button ID="btnSDPageRelFomula" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Page Related Foemula" Enabled="false" />
                                    </div>
                                    <div class="col-3 col-3-sm p-1">
                                        <asp:Button ID="btnSDFieldRelFormula" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Field Related Formula" Enabled="false" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row border-bottom shadow-sm p-1 pl-4 pr-2">
                            <div class="col-3 col-3-sm">
                                <asp:CheckBox ID="chkSDIncludeGrid" runat="server" class="form-check-inline" Checked="true" Text="Include GRID Numbering in Design Mode" TextAlign="Right" style="font-size: .75em;" Enabled="false" />
                            </div>
                            <div class="col-3">
                                <asp:CheckBox ID="chkSDIncludeFieldID" runat="server" class="form-check-inline" Checked="true" Text="Include FieldID in Design Mode" TextAlign="Right" style="font-size: .75em;" Enabled="false" />
                            </div>
                            <div class="col-3">
                                <asp:CheckBox ID="chkSDDisplayDeleted" runat="server" class="form-check-inline" Text="Display Only Deleted Fields" TextAlign="Right" Font-Size=".75em" Enabled="false" />
                            </div>
                            <div class="col-3 text-right">
                                <asp:Button ID="btnSDPreview" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Preview" Enabled="false" />
                                <asp:Button ID="btnSDUpload" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Upload" Enabled="false" />
                            </div>
                        </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>                    
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlNotAuthorized" runat="server" CssClass="container" Visible="false">
            <div class="p-2">
                <h1 class="display-4">P3Web Administration</h1>
            </div>
            <h2 class="display-5 p-2">Not Authorized</h2>
            <p class="p-2 m-1 text-xl-left">
                You are not authorized to access the P3Web Administration system. Please log in as a Paradigm 3 Administrator to proceed.
            </p>
            <a class="btn btn-primary m-2" href="../">Go Back</a>
        </asp:Panel>
    </form>
	<script src="lib/twitter-bootstrap/js/bootstrap.min.js"></script>
	<script src="lib/font-awesome/js/all.min.js"></script>
</body>
</html>
