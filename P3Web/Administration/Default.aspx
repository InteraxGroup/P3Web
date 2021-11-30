<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Paradigm3.Administration.Default" Async="true" EnableEventValidation="false" meta:resourcekey="PageResource2" %>

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
        <asp:Panel ID="pnlAdmin" runat="server" CssClass="container position-relative" meta:resourcekey="pnlAdminResource1">
            <div class="bg-dark text-white p-4 rounded shadow mt-2">
                <h1 class="display-4"><%= GetLocalResourceObject("P3WebAdminLabel") %></h1>
                <asp:HyperLink ID="hlBack" runat="server" CssClass="btn btn-light position-absolute" Text="Back to P3Web" NavigateUrl="~/" style="top: 20px; right: 20px;" meta:resourcekey="hlBackResource1"></asp:HyperLink>
            </div>
            <ul id="adminmenu" class="nav nav-tabs mt-3">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="tab00" data-bs-toggle="tab" data-bs-target="#configpaths" role="tab" aria-controls="configpaths" aria-selected="true" href="#configpaths"><%= GetLocalResourceObject("PathDefaultsLabel") %></a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab01" data-bs-toggle="tab" data-bs-target="#configdefaults" role="tab" aria-controls="configdefaults" aria-selected="false" href="#configdefaults"><%= GetLocalResourceObject("ModuleDefaultsLabel") %></a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab02" data-bs-toggle="tab" data-bs-target="#searchdefaults" role="tab" aria-controls="searchdefaults" aria-selected="false" href="#searchdefaults"><%= GetLocalResourceObject("SearchDefaultsLabel") %></a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab03" data-bs-toggle="tab" data-bs-target="#directlinks" role="tab" aria-controls="directlinks" aria-selected="false" href="#directlinks"><%= GetLocalResourceObject("DirectLinksLabel") %></a>
                </li>
                <li class="nav-item" role="presentation" style="display: none;">
                    <a class="nav-link" id="tab04" data-bs-toggle="tab" data-bs-target="#powertools" role="tab" aria-controls="powertools" aria-selected="false" href="#powertools">PowerTools</a>
                </li>
                <li class="nav-item" role="presentation" style="display: none;">
                    <a class="nav-link" id="tab05" data-bs-toggle="tab" data-bs-target="#styledesigner" role="tab" aria-controls="styledesigner" aria-selected="false" href="#styledesigner">Style Designer</a>
                </li>
            </ul>            
            <div class="tab-content shadow bg-light rounded-bottom border border-top-0 over" style="height: 600px; overflow-x: hidden; overflow-y: auto;">
                <div id="configpaths" class="tab-pane fade show active" role="tabpanel" aria-labelledby="configpaths-tab">
                    <h2 class="bg-white shadow-sm text-center p-2">
                        <%= GetLocalResourceObject("PathDefaultsTitle") %>
                    </h2>                    
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top"><%= GetLocalResourceObject("DomainsLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtDomain" runat="server" CssClass="form-control" Text="Obiwan" meta:resourcekey="txtDomainResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateDomain" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateDomain_Click" meta:resourcekey="btnUpdateDomainResource1" />
                                        </div>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top"><%= GetLocalResourceObject("DocPathLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtDocPath" runat="server" CssClass="form-control" Text="D:\P3\data\docs\" meta:resourcekey="txtDocPathResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateDocPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateDocPath_Click" meta:resourcekey="btnUpdateDocPathResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top"><%= GetLocalResourceObject("PublishedPathLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtPublishPath" runat="server" CssClass="form-control" Text="~/docs/" meta:resourcekey="txtPublishPathResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdatePublishPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdatePublishPath_Click" meta:resourcekey="btnUpdatePublishPathResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top"><%= GetLocalResourceObject("PublicPathLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                             <asp:TextBox ID="txtPublicPath" runat="server" CssClass="form-control custom-control-inline" Text="~/public/" meta:resourcekey="txtPublicPathResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdatePublicPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdatePublicPath_Click" meta:resourcekey="btnUpdatePublicPathResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top"><%= GetLocalResourceObject("IndexedPathLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtIndexSearchPath" runat="server" CssClass="form-control custom-control-inline" Text="D:/P3/data/docs/publish" meta:resourcekey="txtIndexSearchPathResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateIndexSearchPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateIndexSearchPath_Click" meta:resourcekey="btnUpdateIndexSearchPathResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white rounded-top"><%= GetLocalResourceObject("AttachPathLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtAttachPath" runat="server" CssClass="form-control custom-control-inline" Text="~/attachments/" meta:resourcekey="txtAttachPathResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateAttachPath" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateAttachPath_Click" meta:resourcekey="btnUpdateAttachPathResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>
                <div id="configdefaults" class="tab-pane fade" role="tabpanel" aria-labelledby="configdefaults-tab">
                    <asp:UpdatePanel ID="udpDefaults" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <h2 class="bg-white shadow-sm text-center p-2">
                        <%= GetLocalResourceObject("ModuleDefaultsTitle") %>
                    </h2>
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-light"><%= GetLocalResourceObject("DefaultModuleLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlDefModule" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDefModule_SelectedIndexChanged" meta:resourcekey="ddlDefModuleResource1">
                                            <asp:ListItem Value="0" Text="Home" Selected="True" meta:resourcekey="ListItemResource1" />
                                            <asp:ListItem Value="3" Text="Documents" meta:resourcekey="ListItemResource2" />
                                            <asp:ListItem Value="4" Text="Records" meta:resourcekey="ListItemResource3" />
                                            <asp:ListItem Value="6" Text="Improvements" meta:resourcekey="ListItemResource4" />
                                            <asp:ListItem Value="12" Text="Training" meta:resourcekey="ListItemResource5" />
                                            <asp:ListItem Value="14" Text="Action Items" meta:resourcekey="ListItemResource6" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-light"><%= GetLocalResourceObject("DefaultDocGroupLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtDefDocGroup" runat="server" CssClass="form-control" ReadOnly="True" Text="Management System" meta:resourcekey="txtDefDocGroupResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateDefDocGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefDocGroup_Click" meta:resourcekey="btnUpdateDefDocGroupResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-light"><%= GetLocalResourceObject("DefaultRecGroupLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">                                            
                                            <asp:TextBox ID="txtDefRecGroup" runat="server" CssClass="form-control" ReadOnly="True" Text="Business Records" meta:resourcekey="txtDefRecGroupResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateDefRecGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefRecGroup_Click" meta:resourcekey="btnUpdateDefRecGroupResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-light"><%= GetLocalResourceObject("DefaultImpGroupLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtDefImpGroup" runat="server" CssClass="form-control" ReadOnly="True" Text="Business Improvements" meta:resourcekey="txtDefImpGroupResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateDefImpGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefImpGroup_Click" meta:resourcekey="btnUpdateDefImpGroupResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-light"><%= GetLocalResourceObject("DefaultTrainGroupLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtDefTrainGroup" runat="server" CssClass="form-control" ReadOnly="True" Text="Training Records" meta:resourcekey="txtDefTrainGroupResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateDefTrainGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefTrainGroup_Click" meta:resourcekey="btnUpdateDefTrainGroupResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-light"><%= GetLocalResourceObject("DefaultAIGroupLabel") %></h4>
                                <div class="card-body p-2">
                                    <div class="row p-2">
                                        <div class="col-9 p-1">
                                            <asp:TextBox ID="txtDefAIGroup" runat="server" CssClass="form-control custom-control-inline" ReadOnly="True" Text="Action Items" meta:resourcekey="txtDefAIGroupResource1" />
                                        </div>
                                        <div class="col p-1 text-center">
                                            <asp:Button ID="btnUpdateDefAIGroup" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnUpdateDefAIGroup_Click" meta:resourcekey="btnUpdateDefAIGroupResource1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Panel ID="pnlUpdateDefaults" runat="server" Width="800px" Height="490px" CssClass="bg-light border-dark rounded shadow p-0 overflow-hidden" style="z-index: 999;" meta:resourcekey="pnlUpdateDefaultsResource1">
                        <div class="d-flex flex-column" style="height: 600px; width: 100%;">
                            <div class="bg-white p-2 rounded-top w-100 border-bottom font-weight-bold">
                                <h2 class="text-center">Set New Default Folder</h2>
                                <div class="bg-light">
                                    <div class="form-group p-2">
                                        <asp:DropDownList ID="ddlDefGroupModule" runat="server" 
                                            AutoPostBack="True" 
                                            CssClass="form-control" Enabled="False" meta:resourcekey="ddlDefGroupModuleResource1">
                                            <asp:ListItem Value="3" Text="Documents" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Records" meta:resourcekey="ListItemResource8"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="Improvements" meta:resourcekey="ListItemResource9"></asp:ListItem>
                                            <asp:ListItem Value="12" Text="Training" meta:resourcekey="ListItemResource10"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="m-2 border bg-white overflow-auto" style="height: 300px;">
                                        <asp:TreeView ID="dgTree" runat="server"
                                            EnableClientScript="False"
                                            NodeIndent="15"
                                            ExpandDepth="1" 
                                            OnTreeNodePopulate="TreeView_TreeNodePopulate" 
                                            OnTreeNodeExpanded="TreeView_TreeNodeExpanded" 
                                            OnTreeNodeCollapsed="TreeView_TreeNodeCollapsed"
                                            OnSelectedNodeChanged="TreeView_SelectedNodeChanged" meta:resourcekey="dgTreeResource1">
                                            <NodeStyle ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="12px" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                                            <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                                        </asp:TreeView>
                                    </div>
                                </div>
                                <div class="mt-auto bg-white border-top rounded-bottom">
                                    <div class="container p-2 text-center">
                                        <asp:Button ID="btnSubmitUpdateDefFolder" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmitUpdateDefFolder_Click" meta:resourcekey="btnSubmitUpdateDefFolderResource1" />
                                        <asp:Button ID="btnCancelUpdateDefaultFolder" runat="server" CssClass="btn btn-secondary" Text="Cancel" meta:resourcekey="btnCancelUpdateDefaultFolderResource1" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:ModalPopupExtender ID="mpeUpdateDefaults" runat="server"
                        PopupControlID="pnlUpdateDefaults" 
                        TargetControlID="btnUpdateDefAIGroup" 
                        BackgroundCssClass="modalBackground" BehaviorID="mpeUpdateDefaults" DynamicServicePath="">
                    </asp:ModalPopupExtender>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="searchdefaults" class="tab-pane fade" role="tabpanel" aria-labelledby="searchdefaults-tab">
                    <asp:UpdatePanel ID="udpSearchDefaults" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <h2 class="bg-white shadow-sm text-center p-2">
                        <%= GetLocalResourceObject("SearchDefaultsTitle") %>
                    </h2>
                    <div class="row p-2">
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white"><%= GetLocalResourceObject("SimpleDocSearchLabel") %></h4>
                                <div class="card-body p-2 text-center">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlSimpleSearch" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlSimpleSearch_SelectedIndexChanged" meta:resourcekey="ddlSimpleSearchResource1">
                                            <asp:ListItem Value="false" Text="Disabled" meta:resourcekey="ListItemResource11"></asp:ListItem>
                                            <asp:ListItem Value="true" Text="Enabled" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white"><%= GetLocalResourceObject("DefaultSearchPageLabel") %></h4>
                                <div class="card-body p-2 text-center">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlDefaultSearchTab" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDefaultSearchTab_SelectedIndexChanged" meta:resourcekey="ddlDefaultSearchTabResource1">
                                            <asp:ListItem Value="0" Text="General" meta:resourcekey="ListItemResource13"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Roles" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Categories" meta:resourcekey="ListItemResource15"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>                      
                        <div class="col-4">
                            <div class="card shadow-sm rounded h-100">
                                <h4 class="card-title text-center p-2 bg-dark text-white"><%= GetLocalResourceObject("HideSearchLabel") %></h4>
                                <div class="card-body p-2 text-center">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlHideSearch" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlHideSearch_SelectedIndexChanged" meta:resourcekey="ddlHideSearchResource1">
                                            <asp:ListItem Value="false" Text="Disabled" meta:resourcekey="ListItemResource16"></asp:ListItem>
                                            <asp:ListItem Value="true" Text="Enabled" meta:resourcekey="ListItemResource17"></asp:ListItem>
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
                                <h4 class="card-title text-center p-2 bg-dark text-white"><%= GetLocalResourceObject("DocSearchFieldLabel") %></h4>
                                <div class="card-body p-2 text-center">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlDefaultSearchField" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDefaultSearchField_SelectedIndexChanged" meta:resourcekey="ddlDefaultSearchFieldResource1">
                                            <asp:ListItem Value="Name" Text="Document Name" meta:resourcekey="ListItemResource18"></asp:ListItem>
                                            <asp:ListItem Value="LabelName" Text="Document Label" meta:resourcekey="ListItemResource19"></asp:ListItem>
                                            <asp:ListItem Value="ItemID" Text="Document ID" meta:resourcekey="ListItemResource20"></asp:ListItem>
                                            <asp:ListItem Value="OrigID" Text="Document Original ID" meta:resourcekey="ListItemResource21"></asp:ListItem>
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
                    <asp:UpdatePanel ID="udpDLinks" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <h2 class="bg-white shadow-sm text-center p-2">
                        <%= GetLocalResourceObject("DirectLinksTitle") %>
                    </h2>
                    <div class="container p-2">
                        <div style="padding-bottom: 10px;">
                            <asp:Button ID="btnAddDLink" runat="server" CssClass="btn btn-primary" Text="Add New Direct Link" meta:resourcekey="btnAddDLinkResource1" />
                        </div>
                        <asp:GridView ID="gvDirectLinks" runat="server" 
                            AutoGenerateColumns="False" 
                            CssClass="table" 
                            GridLines="None" 
                            OnRowDataBound="gvDirectLinks_RowDataBound" 
                            DataKeyNames="GroupID,ModuleID"
                            OnRowEditing="gvDirectLinks_RowEditing" 
                            OnRowUpdating="gvDirectLinks_RowUpdating" 
                            OnRowDeleting="gvDirectLinks_RowDeleting"
                            OnRowCancelingEdit="gvDirectLinks_RowCancelingEdit" meta:resourcekey="gvDirectLinksResource1">
                            <AlternatingRowStyle CssClass="bg-light" />
                            <Columns>
                                <asp:TemplateField HeaderText="Name" meta:resourcekey="TemplateFieldResource1">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblName" runat="server" CssClass="form-text" meta:resourcekey="lblNameResource1" Text='<%# Eval("Name") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" CssClass="form-text" meta:resourcekey="lblNameResource2" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Module" meta:resourcekey="TemplateFieldResource2">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblModule" runat="server" CssClass="form-text" meta:resourcekey="lblModuleResource1" Text='<%# Eval("ModuleID") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblModule" runat="server" CssClass="form-text" meta:resourcekey="lblModuleResource2" Text='<%# Eval("ModuleID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Site ID" meta:resourcekey="TemplateFieldResource3">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSiteID" runat="server" CssClass="form-control" meta:resourcekey="txtSiteIDResource1" Text='<%# Eval("SiteID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSiteID" runat="server" CssClass="form-text" meta:resourcekey="lblSiteIDResource1" Text='<%# Eval("SiteID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="500px" />
                                </asp:TemplateField>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                                    <EditItemTemplate>
                                        <asp:Button ID="btnSave" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success" meta:resourcekey="btnSaveResource1" Text="Save" />
                                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-light" meta:resourcekey="btnCancelResource1" Text="Cancel" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-primary" meta:resourcekey="btnEditResource1" Text="Edit" />
                                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger" meta:resourcekey="btnDeleteResource1" Text="Delete" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="150px" />
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle CssClass="bg-primary text-white" />
                            <HeaderStyle CssClass="bg-dark text-white" />
                            <RowStyle CssClass="p-2" />
                        </asp:GridView>
                    </div>
                    <asp:Panel ID="pnlAddDLink" runat="server" Width="800px" Height="600px" CssClass="bg-light border-dark rounded shadow p-0 overflow-hidden" style="z-index: 999;" meta:resourcekey="pnlAddDLinkResource1">
                        <div class="d-flex flex-column" style="height: 600px; width: 100%;">
                            <div class="bg-white p-2 rounded-top w-100 border-bottom font-weight-bold">
                                <h2 class="text-center">Add New Direct Link</h2>
                            </div>
                            <div class="bg-light">
                                <div class="form-group p-2">
                                    <asp:DropDownList ID="ddlDLinkModule" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlDLinkModule_SelectedIndexChanged" meta:resourcekey="ddlDLinkModuleResource1">
                                        <asp:ListItem Value="3" Text="Documents" Selected="True" meta:resourcekey="ListItemResource22"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="Records" meta:resourcekey="ListItemResource23"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="Improvements" meta:resourcekey="ListItemResource24"></asp:ListItem>
                                        <asp:ListItem Value="12" Text="Training" meta:resourcekey="ListItemResource25"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="m-2 border bg-white overflow-auto" style="height: 300px;">
                                    <asp:TreeView ID="dlTree" runat="server"
                                        EnableClientScript="False"
                                        NodeIndent="15"
                                        ExpandDepth="1" 
                                        OnTreeNodePopulate="TreeView_TreeNodePopulate" 
                                        OnTreeNodeExpanded="TreeView_TreeNodeExpanded" 
                                        OnTreeNodeCollapsed="TreeView_TreeNodeCollapsed"
                                        OnSelectedNodeChanged="TreeView_SelectedNodeChanged" meta:resourcekey="dlTreeResource1">
                                        <NodeStyle ForeColor="Black" Font-Bold="False" Font-Names="Arial" Font-Size="12px" Font-Underline="False" ImageUrl="~/images/folder.png" NodeSpacing="0px" VerticalPadding="0px" />
                                        <SelectedNodeStyle BackColor="#0078D7" ForeColor="White" HorizontalPadding="2px" VerticalPadding="0px" />
                                    </asp:TreeView>
                                </div>
                                <div class="form-group p-2 text-center">
                                    <label class="form-label">Enter Site ID (if applicable)</label>
                                    <asp:TextBox ID="txtDLinkSiteID" runat="server" CssClass="form-control" meta:resourcekey="txtDLinkSiteIDResource1"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mt-auto bg-white border-top rounded-bottom">
                                <div class="container p-2 text-center">
                                    <asp:Button ID="btnSubmitNewDLink" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmitNewDLink_Click" meta:resourcekey="btnSubmitNewDLinkResource1" />
                                    <asp:Button ID="btnCancelNewDLink" runat="server" CssClass="btn btn-secondary" Text="Cancel" meta:resourcekey="btnCancelNewDLinkResource1" />
                                </div>
                            </div>
                        </div>                        
                    </asp:Panel>
                    <asp:ModalPopupExtender ID="mpeAddDLink" runat="server" 
                        PopupControlID="pnlAddDlink" 
                        TargetControlID="btnAddDLink" 
                        CancelControlID="btnCancelNewDLink" 
                        BackgroundCssClass="modalBackground" BehaviorID="mpeAddDLink" DynamicServicePath="">
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
                    <div class="container p-0">
                        <asp:UpdatePanel ID="udpSD" runat="server">
                        <ContentTemplate>
                        <div class="row ps-1 pt-0 pe-3 pb-0">
                            <div class="col-3">
                                <div class="row p-1">
                                    <label class="col-3 col-form-label-sm">Module:</label>
                                    <div class="col-9">
                                        <asp:DropDownList ID="ddlSDModules" runat="server" CssClass="form-control" 
                                            Enabled="False" 
                                            AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddlSDModules_SelectedIndexChanged" meta:resourcekey="ddlSDModulesResource1">
                                        <asp:ListItem Value="4" Text="Records" meta:resourcekey="ListItemResource26" />
                                        <asp:ListItem Value="6" Text="Improvements" meta:resourcekey="ListItemResource27" />
                                        <asp:ListItem Value="12" Text="Training" meta:resourcekey="ListItemResource28" />
                                    </asp:DropDownList>
                                    </div>                                
                                </div>
                                <div class="row p-1">
                                    <label class="col-3 col-form-label-sm">Style:</label>
                                    <div class="col-9">
                                        <asp:DropDownList ID="ddlSDStyles" runat="server" CssClass="form-control form-control-sm" AppendDataBoundItems="True" Enabled="False" meta:resourcekey="ddlSDStylesResource1">
                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource29" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row p-1">
                                    <label class="col-3 col-form-label-sm">Pages:</label>
                                    <div class="col-9">
                                        <asp:DropDownList ID="ddlSDPages" runat="server" CssClass="form-control form-control-sm" AppendDataBoundItems="True" Enabled="False" meta:resourcekey="ddlSDPagesResource1">
                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource30" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row p-1">
                                    <label class="col-3 col-form-label-sm">Field:</label>
                                    <div class="col-9">
                                        <asp:DropDownList ID="ddlSDFields" runat="server" CssClass="form-control form-control-sm" AppendDataBoundItems="True" Enabled="False" meta:resourcekey="ddlSDFieldsResource1">
                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource31" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col border rounded">
                                <div class="row p-1">
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDDownloadDB" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Download" OnClick="btnSDDownloadDB_Click" meta:resourcekey="btnSDDownloadDBResource1" />
                                    </div>
                                    <div class="col-10">
                                        <label class="text-danger font-weight-bold p-1">
                                            Please backup the database before starting any modification
                                        </label>
                                    </div>
                                </div>
                                <div class="row p-1">
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDAddStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Add Style" Enabled="False" meta:resourcekey="btnSDAddStyleResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDRenameStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Rename Style" Enabled="False" meta:resourcekey="btnSDRenameStyleResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDMoveStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Move Style" Enabled="False" meta:resourcekey="btnSDMoveStyleResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDRestoreStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Restore Style" Enabled="False" meta:resourcekey="btnSDRestoreStyleResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDCopyStyle" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Copy Style" Enabled="False" meta:resourcekey="btnSDCopyStyleResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="row p-1">
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDAddPage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Add Page" Enabled="False" meta:resourcekey="btnSDAddPageResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDRenamePage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Rename Page" Enabled="False" meta:resourcekey="btnSDRenamePageResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDReorderPage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Re-Order" Enabled="False" meta:resourcekey="btnSDReorderPageResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDRestorePage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Restore Pages" Enabled="False" meta:resourcekey="btnSDRestorePageResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDCopyPage" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Copy Page" Enabled="False" meta:resourcekey="btnSDCopyPageResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="row p-1">
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDAddField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Add Field" Enabled="False" meta:resourcekey="btnSDAddFieldResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDRenameField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Rename Field" Enabled="False" meta:resourcekey="btnSDRenameFieldResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDMoveField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Move Field" Enabled="False" meta:resourcekey="btnSDMoveFieldResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDRestoreField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Restore Fields" Enabled="False" meta:resourcekey="btnSDRestoreFieldResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDCopyField" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Copy Fields" Enabled="False" meta:resourcekey="btnSDCopyFieldResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDAdjustGrid" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Adjust Grid" Enabled="False" meta:resourcekey="btnSDAdjustGridResource1" />
                                    </div>
                                </div>
                                <div class="row p-1">
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDFormula" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Formula Settings" Enabled="False" meta:resourcekey="btnSDFormulaResource1" />
                                    </div>
                                    <div class="col-4">
                                        <span class="mt-2" style="font-size: .7em;">Select module and style and click the button to set formula</span>
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDPageRelFomula" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Page Formulae" Enabled="False" meta:resourcekey="btnSDPageRelFomulaResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        <asp:Button ID="btnSDFieldRelFormula" runat="server" CssClass="btn btn-sm btn-outline-primary btn-block" Text="Field Formulae" Enabled="False" meta:resourcekey="btnSDFieldRelFormulaResource1" />
                                    </div>
                                    <div class="col-2 d-grid gap-2">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row border-bottom shadow-sm p-1">
                            <div class="col-3">
                                <asp:CheckBox ID="chkSDIncludeGrid" runat="server" class="form-check-inline" Checked="True" Text="Include GRID Number in Design View" style="font-size: .75em;" Enabled="False" meta:resourcekey="chkSDIncludeGridResource1" />
                            </div>
                            <div class="col-3">
                                <asp:CheckBox ID="chkSDIncludeFieldID" runat="server" class="form-check-inline" Checked="True" Text="Include FieldID in Design View" style="font-size: .75em;" Enabled="False" meta:resourcekey="chkSDIncludeFieldIDResource1" />
                            </div>
                            <div class="col-3">
                                <asp:CheckBox ID="chkSDDisplayDeleted" runat="server" class="form-check-inline" Text="Show Deleted Fields Only" Font-Size="0.75em" Enabled="False" meta:resourcekey="chkSDDisplayDeletedResource1" />
                            </div>
                            <div class="col-3 text-end">
                                <asp:Button ID="btnSDPreview" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Preview" Enabled="False" meta:resourcekey="btnSDPreviewResource1" />
                                <asp:Button ID="btnSDUpload" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Upload" Enabled="False" meta:resourcekey="btnSDUploadResource1" />
                            </div>
                        </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>                    
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlNotAuthorized" runat="server" CssClass="container" Visible="False" meta:resourcekey="pnlNotAuthorizedResource1">
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
</body>
</html>