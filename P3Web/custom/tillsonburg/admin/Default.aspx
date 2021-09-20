<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Paradigm3.custom.tillsonburg.admin.Default" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Tillsonburg Administration</title>
	<link href="../tillsonburg.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="tillsonburg-header">
			<img src="../image.png" />
        </div>
		 <asp:UpdatePanel ID="udpMenu" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
				<div id="pnlMenu">
					<asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="tillsonburg-menu" StaticItemFormatString="&nbsp;{0}&nbsp;" OnMenuItemClick="Menu1_MenuItemClick">
						<Items>
							<asp:MenuItem Text="Messages" Value="0" />
							<asp:MenuItem Text="Hot Links" Value="1" />
						</Items>
					</asp:Menu>
				</div>
			</ContentTemplate>
		</asp:UpdatePanel>
		<asp:UpdatePanel ID="udpMultiView" runat="server" UpdateMode="Conditional">
			<Triggers>
				<asp:AsyncPostBackTrigger ControlID="Menu1" EventName="MenuItemClick" />
			</Triggers>
			<ContentTemplate>
				<div id="pnlMultiView">
					<asp:MultiView ID="MultiView1" runat="server">
						<asp:View ID="View1" runat="server">
							<div class="pageInfoView">
								<h1 style="margin-top: 10px;">Message Editor</h1>
								<p>Use this tool to update messages that are displayed on the P3Web main page.</p>
							</div>
							<div style="height: 20px; padding-left: 10px; margin-top: 20px;">
								<asp:Label ID="lblSelect" runat="server" Text="Please select a message box to edit:" />
							</div>
		                    <div style="padding-left: 10px;">
								<asp:DropDownList ID="ddlTabSelect" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTabSelect_SelectedIndexChanged">
									<asp:ListItem Text="(Select Page)" Value="0" Selected="True" />
									<asp:ListItem Text="Home Page" Value="1" />
									<asp:ListItem Text="Employee Information Page" Value="2" />
									<asp:ListItem Text="General Information Page" Value="3" />                           
								</asp:DropDownList>
								<asp:DropDownList ID="ddlMessageSelect" runat="server" OnSelectedIndexChanged="ddlMessageSelect_SelectedIndexChanged" AutoPostBack="true" Enabled="false">
									<asp:ListItem Text="(Select Message)" Value="0" Selected="True" />
								</asp:DropDownList>
								<asp:Button ID="btnSubmit" runat="server" Text="Submit" Visible="false" OnClick="btnSubmit_Click" />
							</div>
							<div style="margin-top: 10px; padding-left: 10px;">
								<asp:Label ID="lblTextItem" runat="server" Font-Bold="true" Font-Size="X-Large" ForeColor="#598ad7" />
								<br /><br />
								<asp:TextBox ID="edtTextItem" runat="server" Width="900px" Height="200px" TextMode="MultiLine" Visible="false"></asp:TextBox>
								<asp:HtmlEditorExtender ID="EEtxtEditor" runat="server" TargetControlID="edtTextItem" DisplaySourceTab="true" EnableSanitization="false">
									<Toolbar>
										<ajax:FontNameSelector />
										<ajax:FontSizeSelector />
										<ajax:HorizontalSeparator />
										<ajax:Undo />
										<ajax:Redo />
										<ajax:HorizontalSeparator />
										<ajax:Bold />
										<ajax:Italic />
										<ajax:Underline />
										<ajax:StrikeThrough />
										<ajax:Superscript />
										<ajax:Subscript />
										<ajax:HorizontalSeparator />
										<ajax:JustifyLeft />
										<ajax:JustifyCenter />
										<ajax:JustifyRight />
										<ajax:JustifyFull />
										<ajax:HorizontalSeparator />
										<ajax:InsertOrderedList />
										<ajax:InsertUnorderedList />
										<ajax:HorizontalSeparator />
										<ajax:CreateLink />
										<ajax:UnLink />
										<ajax:HorizontalSeparator />
										<ajax:Cut />
										<ajax:Copy />
										<ajax:Paste />
										<ajax:HorizontalSeparator />
										<ajax:BackgroundColorSelector />
										<ajax:ForeColorSelector />
										<ajax:HorizontalSeparator />
										<ajax:Indent />
										<ajax:Outdent />
										<ajax:InsertHorizontalRule />
									</Toolbar>
								</asp:HtmlEditorExtender>
							</div>
						</asp:View>
						<asp:View ID="View2" runat="server">
							<div class="pageInfoView">
								<h1 style="margin-top: 10px;">Hot Links</h1>
								<p>Use this tool to add, remove, or edit the "Hot Links" List on the P3Web Home Page.</p>
							</div>
							<div style="height: 40px; margin-top: 10px; padding-left: 10px;">
								<asp:Button ID="btnAddHotLink" runat="server" Text="Add New HotLink" OnClick="btnAddHotLink_Click" />
								<asp:Button ID="btnPurgeHotLinks" runat="server" Text="Purge Hot Links" OnClick="btnPurgeHotLinks_Click" />
								<asp:Button ID="btnListHotLinks" runat="server" Text="Manage Hot Links" OnClick="btnListHotLinks_Click" />
								<asp:ConfirmButtonExtender ID="cbtnPurgeHotLinks" runat="server"
									TargetControlID="btnPurgeHotLinks"
									ConfirmText="This will permanently delete ALL Hot Links from the database.  Do you wish to proceed?"/>
							</div>
							<div style="padding-left: 10px">
								<asp:Label ID="lblSelectType" runat="server" Text="Select Type of HotLink" Visible="false" />
								<br />
								<asp:DropDownList ID="ddlHLType" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlHLType_SelectedIndexChanged" Visible="false">
									<asp:ListItem Value="0" Text="(Select)" Selected="True" />
									<asp:ListItem Value="1" Text="Document Link" />
									<asp:ListItem Value="2" Text="Folder Link" />
									<asp:ListItem Value="3" Text="External Link" />
								</asp:DropDownList>
							</div>
							<div style="padding-left: 10px;">
								<asp:MultiView ID="HLMultiView" runat="server">
									<asp:View ID="vwBlank" runat="server">
									</asp:View>
									<asp:View ID="vwDocHL" runat="server">
										<div style="padding: 20px 0px 10px 0px">
												<div>
													<asp:Label ID="lblDocID" runat="server" Text="OrigID" />
												</div>
												<div>
													<asp:TextBox ID="txtDocID" runat="server" Width="90px" TextMode="Number" />
													<asp:Button ID="btnDocIDSearch" runat="server" Text="Search" OnClick="btnDocIDSearch_Click" />
													<asp:Button ID="btnDocIDClear" runat="server" Text="Clear" OnClick="btnDocIDClear_Click" />
												</div>
											<br />
											<asp:GridView ID="gvDocList" runat="server" AutoGenerateColumns="false" BorderWidth="0px" GridLines="None">
												<Columns>
													<asp:BoundField DataField="OrigID" HeaderText="Doc ID">
														<HeaderStyle Width="80px" BackColor="#CCCCCC" HorizontalAlign="Left" />
														<ItemStyle Width="80px" HorizontalAlign="Left" />
													</asp:BoundField>
													<asp:BoundField DataField="Name" HeaderText="Document Name">
														<HeaderStyle Width="350px" BackColor="#CCCCCC" HorizontalAlign="Left" />
														<ItemStyle Width="350px" HorizontalAlign="Left" />
													</asp:BoundField>
													<asp:BoundField DataField="Version" HeaderText="Version">
														<HeaderStyle Width="80px" BackColor="#CCCCCC" HorizontalAlign="Left" />
														<ItemStyle Width="80px" HorizontalAlign="Left" />
													</asp:BoundField>
													<asp:BoundField DataField="GroupName" HeaderText="Parent Folder">
														<HeaderStyle Width="350px" BackColor="#CCCCCC" HorizontalAlign="Left" />
														<ItemStyle Width="350px" HorizontalAlign="Left" />
													</asp:BoundField>
												</Columns>
											</asp:GridView>
											<br />
											<asp:Button ID="btnDocIDInsert" runat="server" Text="Insert" OnClick="btnDocIDInsert_Click" Visible="false" />
										</div>
									</asp:View>
									<asp:View ID="vwGroupHL" runat="server">
										<div style="padding: 20px 0px 10px 0px">
											<div>
												<asp:Label ID="lblGroupID" runat="server" Text="GroupID" />
											</div>
											<div>
												<asp:TextBox ID="txtGroupID" runat="server" Width="90px" TextMode="Number" />
												<asp:Button ID="btnGroupIDSearch" runat="server" Text="Search" OnClick="btnGroupIDSearch_Click" />
												<asp:Button ID="btnGroupIDClear" runat="server" Text="Clear" OnClick="btnGroupIDClear_Click" />
											</div>
											<br />
											<asp:GridView ID="gvGroupList" runat="server" AutoGenerateColumns="false" BorderWidth="0px" GridLines="None">
												<Columns>
													<asp:BoundField DataField="GroupID" HeaderText="Group ID">
														<HeaderStyle Width="80px" BackColor="#CCCCCC" />
														<ItemStyle Width="80px" HorizontalAlign="Center" />
													</asp:BoundField>
													<asp:BoundField DataField="Name" HeaderText="Group Name">
														<HeaderStyle Width="350px" BackColor="#CCCCCC" HorizontalAlign="Left" />
														<ItemStyle Width="350px" HorizontalAlign="Left" />
													</asp:BoundField>
													<asp:BoundField DataField="ParentGroupID" HeaderText="Parent GroupID">
														<HeaderStyle Width="350px" BackColor="#CCCCCC" HorizontalAlign="Left" />
														<ItemStyle Width="350px" HorizontalAlign="Left" />
													</asp:BoundField>
												</Columns>
											</asp:GridView>
											<br />
											<asp:Button ID="btnGroupIDInsert" runat="server" Text="Insert" OnClick="btnGroupIDInsert_Click"/>
										</div>
									</asp:View>
									<asp:View ID="vwHLHL" runat="server">
										<div style="padding: 20px 0px 10px 0px">
											<div style="display: inline-block; margin-right: 10px;">
												<div>
													<asp:Label ID="lblDisplayName" runat="server" Text="Enter HotLink Display Name" />
												</div>
												<div>
													<asp:TextBox ID="txtHLName" runat="server" Width="250px" />
												</div>
											</div>
											<div style="display: inline-block; margin-right: 10px;">
												<div>
													<asp:Label ID="lblURLProtocol" runat="server" Text="Protocol" />
												</div>
												<div>
													<asp:DropDownList ID="ddlURLProtocol" runat="server">
														<asp:ListItem Value="0" Text="http://" Selected="True" />
														<asp:ListItem Value="1" Text="https://" />
		                                            </asp:DropDownList>
												</div>
											</div>
											<div style="display: inline-block;">
												<div>
													<asp:Label ID="lblURL" runat="server" Text="Enter Link Destination" />
												</div>
												<div>
													<asp:TextBox ID="txtURL" runat="server" Width="400px" Text="www." />
												</div>
											</div>
											<div style="margin-top: 10px;">
												<asp:Button ID="btnHLInsert" runat="server" Text="Insert" OnClick="btnHLInsert_Click" />
												<asp:Button ID="btnHLClear" runat="server" Text="Clear" OnClick="btnHLClear_Click" />
											</div>											                         
										</div>
									</asp:View>
									<asp:View ID="vwListHotLinks" runat="server">
										<div>
											<asp:SqlDataSource ID="dsHotLink" runat="server" 
												ConnectionString="<%$ ConnectionStrings:Paradigm3 %>" 
												DeleteCommand="DELETE FROM [zz_HotLink] WHERE [ID] = @ID"
												SelectCommand="SELECT * FROM [zz_HotLink] ORDER BY [LinkName]">
												<DeleteParameters>
													<asp:Parameter Name="ID" Type="Int32" />
												</DeleteParameters>
											</asp:SqlDataSource>
											<asp:GridView ID="gvListHL" runat="server" Width="800px" AutoGenerateColumns="false" GridLines="None"
												BorderWidth="3px" BorderStyle="Groove" BorderColor="#787878" DataKeyNames="ID" DataSourceID="dsHotLink" >
												<HeaderStyle BackColor="#787878" Height="24px" Font-Underline="false" />
												<RowStyle BackColor="#FFFFFF" ForeColor="#000000" />
												<AlternatingRowStyle BackColor="#CCCCCC" ForeColor="#000000" />
												<Columns>													
													<asp:TemplateField>
														<HeaderStyle Width="50px" ForeColor="#FFFFFF" HorizontalAlign="Left" />
														<ItemStyle Width="50px" HorizontalAlign="Left" />
														<HeaderTemplate>
															ID
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label ID="lblID" runat="server" text='<%# Eval ("ID") %>' />
														</ItemTemplate>                                                    
													</asp:TemplateField>
													<asp:TemplateField>
														<HeaderStyle Width="150px" ForeColor="#FFFFFF" HorizontalAlign="Left" />
														<ItemStyle Width="150px" HorizontalAlign="Left" />
														<HeaderTemplate>
															Type
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label ID="lblType" runat="server" text='<%# ComputeHLType(Convert.ToInt32(Eval ("Type"))) %>' />
														</ItemTemplate>
													</asp:TemplateField>
													<asp:TemplateField>
														<HeaderStyle Width="700px" ForeColor="#FFFFFF" HorizontalAlign="Left" />
														<ItemStyle Width="700px" HorizontalAlign="Left" />
														<HeaderTemplate>
															Link Name
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label ID="lblName" runat="server" text='<%# Eval ("LinkName") %>' />
														</ItemTemplate>
													</asp:TemplateField>
													<asp:TemplateField>
														<HeaderStyle Width="50px" ForeColor="#FFFFFF" />
														<ItemStyle Width="50px" HorizontalAlign="Center" />
														<ItemTemplate>
															<asp:ImageButton ID="btnDeleteHL" runat="server" ImageUrl="~/custom/tillsonburg/delete.png"
																Width="24px" Height="24px" ToolTip="Delete HotLink" CommandName="Delete" />
														</ItemTemplate>
													</asp:TemplateField>
												</Columns>
												<EmptyDataTemplate>
													There are currently no HotLinks in the database.
												</EmptyDataTemplate>
											</asp:GridView>
										</div>
									</asp:View>
								</asp:MultiView>
								<br />
								<asp:Label ID="lblHLStatus" runat="server" />
							</div>                   
						</asp:View>
					</asp:MultiView>
				</div>
			</ContentTemplate>    
		</asp:UpdatePanel>
		<asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="IMGDIV" runat="server" class="tillsonburg-pleasewait">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/pleasewait.gif" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </form>
</body>
</html>
