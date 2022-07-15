<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AmtrakSearch.aspx.cs" Inherits="Paradigm3.custom.amtrak.AmtrakSearch" Async="true" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>P3Web: Amtrak - Document Search</title>    
	<link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="../../p3_32.ico" />
    <%--<link href="../../styles/P3Web.css" rel="stylesheet" />--%>
	<link href="amtrakSearch.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<input id="LB1" type="hidden" value="selectList" />
		<input id="LB2" type="hidden" value="selectList" />
		<input id="LB3" type="hidden" value="selectList" />
		<input id="LB4" type="hidden" value="selectList" />
		<input id="LB5" type="hidden" value="selectList" />
		<input id="LB6" type="hidden" value="selectList" />
		<input id="LB7" type="hidden" value="selectList" />
		<asp:UpdatePanel ID="udpSearch" runat="server" UpdateMode="Always">
		<ContentTemplate>
        <div id="container">
			<div id="filters">
			<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
				<div class="amtrakTitleBar">
					Search Filters			
				</div>
				<div class="form-group">
					<div class="btn" onclick="show(0)">Document Type</div>
					<asp:ListBox ID="LBType" runat="server" SelectionMode="Multiple" CssClass="selectList">
					</asp:ListBox>
				</div>
				<div class="form-group">
					<div class="btn" onclick="show(1)">Fleet</div>
					<asp:ListBox ID="LBFleet" runat="server" SelectionMode="Multiple" CssClass="selectList">
					</asp:ListBox>
				</div>
				<div class="form-group">
					<div class="btn" onclick="show(2)">System/Subject</div>
					<asp:ListBox ID="LBSystem" runat="server" SelectionMode="Multiple" CssClass="selectList">
					</asp:ListBox>
				</div>
				<div class="form-group">
					<div class="btn" onclick="show(3)">Location</div>
					<asp:ListBox ID="LBLocation" runat="server" SelectionMode="Multiple" CssClass="selectList">
					</asp:ListBox>
				</div>
				<div class="form-group">
					<div class="btn" onclick="show(4)">External</div>
					<asp:ListBox ID="LBExternal" runat="server" SelectionMode="Multiple" CssClass="selectList">
					</asp:ListBox>
				</div>
				<div class="form-submit">
					<asp:Button ID="ButtonSubmit" runat="server" OnClick="Button_Click" CommandArgument="submit" Text="Submit" CssClass="btn-control" style="margin-bottom: 5px;" />
					<asp:Button ID="ButtonReset" runat="server" OnClick="Button_Click" CommandArgument="reset" Text="Reset" CssClass="btn-control" />
				</div>
			</ContentTemplate>
			</asp:UpdatePanel>
			</div>
			<div id="divider"></div>
			<div id="results">
			<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
				<Triggers>
					<asp:AsyncPostBackTrigger ControlID="ButtonSubmit" EventName="Click" />
					<asp:AsyncPostBackTrigger ControlID="ButtonReset" EventName="Click" />
				</Triggers>
			<ContentTemplate>
				<div class="amtrakTitleBar">
					Search Results
					<asp:Label ID="lblTotal" runat="server"></asp:Label>
				</div>
				<div class="search-results">
					<asp:GridView ID="GVResults" runat="server" DataKeyNames="ItemID,OrigID"
						CssClass="gv"
						AllowPaging="true" 
						PageSize="28"
						PagerSettings-PageButtonCount="5"
						OnPageIndexChanging="GVResults_PageIndexChanging" 
						OnRowDataBound="GVResults_RowDataBound"
						AutoGenerateColumns="false" 
						GridLines="None">
						<HeaderStyle CssClass="gvHeader" />
						<RowStyle CssClass="gvRow" />
						<AlternatingRowStyle CssClass="gvAltRow" />
						<SelectedRowStyle CssClass="gvSelRow" />
						<PagerStyle HorizontalAlign = "Right" CssClass = "gvPager" />
						<Columns>
							<asp:BoundField HeaderText="ID" DataField="OrigID" HeaderStyle-Width="20px" HeaderStyle-HorizontalAlign="Center" />
							<asp:TemplateField HeaderText="Name" HeaderStyle-Width="380px">
								<ItemTemplate>
									<div>
										<%# ((string)Eval("Name")).Length < 50 ? Eval("Name") : ((string)Eval("Name")).Substring(0,50) + "..."%>
									</div>								
								</ItemTemplate>							
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Label" HeaderStyle-Width="305px">
								<ItemTemplate>
									<div>
										<%# Eval("LabelName") == DBNull.Value ? "" : ((string)Eval("LabelName")).Length < 50 ? Eval("LabelName") : ((string)Eval("LabelName")).Substring(0,50) + "..."%>
									</div>							
								</ItemTemplate>							
							</asp:TemplateField>
							<asp:BoundField HeaderText="Version" DataField="Version" HeaderStyle-Width="70px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
							<asp:BoundField HeaderText="Released" DataField="VersionDate" HeaderStyle-Width="100px" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
						</Columns>
					</asp:GridView>
				</div>
				
			</ContentTemplate>
			</asp:UpdatePanel>				
			</div>
        </div>
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
	<script src="amtrakSearch.js"></script>
	<script src="../../scripts/P3Web.js"></script>
</body>
</html>
