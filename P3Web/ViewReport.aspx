7<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewReport.aspx.cs" Inherits="Paradigm3.ViewReport" EnableEventValidation="false" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Saved Report</title>
	<link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="~/p3_32.ico" />
    <link href="styles/P3Web.css" rel="stylesheet" />
    <link href="styles/DocReport.css" rel="stylesheet" />
    <script src="scripts/P3Web.js"></script>
</head>
<body id="rpt" class="reportBody">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="scrollPos" runat="server" />
		<asp:UpdatePanel ID="udpMain" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
			<Triggers>
				<asp:PostBackTrigger ControlID="btnWord" />
				<asp:PostBackTrigger ControlID="btnExcel" />
			</Triggers>
		<ContentTemplate>
            <div id="Panel1" class="rptPanel">
                <div class="pnlLinkTitle" style="font-size: 2em;">
                    <asp:Label ID="lblTitle" runat="server" Text="[Report Title]"></asp:Label>
                </div>                

                <div class="summary">
                    <div>Report Summary</div>
                    <div>Report:</div>
                    <div><asp:Label ID="lblReportName" runat="server"></asp:Label></div>
                    <div>Folder:</div>
                    <div><asp:Label ID="lblReportFolder" runat="server"></asp:Label></div>
                    <div>Items Found:</div>
                    <div><asp:Label ID="lblReport" runat="server"></asp:Label></div>          
                </div>              

                <div id="reportList">
					<div id="exporter">
						<asp:ImageButton ID="btnPrint" runat="server" ToolTip="Print this Report" ImageUrl="~/images/print.png" OnClientClick="javascript:window.print()" />
						<asp:ImageButton ID="btnWord" runat="server" ToolTip="Export to MS Word" ImageUrl="~/images/doc.png" OnClick="btnWord_Click" />
						<asp:ImageButton ID="btnExcel" runat="server" ToolTip="Export to MS Excel" ImageUrl="~/images/xls.png" OnClick="btnExcel_Click" />
					</div>
                    <asp:GridView ID="GridView1" runat="server"
                        OnRowDataBound="GridView1_RowDataBound" 
                        OnRowCreated="GridView1_RowCreated"
						AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" 
                        PageSize="23"
                        Width="100%"
                        Font-Names="Arial"
                        Font-Size="12px"
                        GridLines="None"
                        BorderWidth="1px" 
                        BorderStyle="Solid" 
                        BackColor="#000000" 
                        CellPadding="5">
                        <HeaderStyle CssClass="tblHdrRow" />
                        <RowStyle CssClass="gridViewRowRpt" />
                        <SelectedRowStyle CssClass="gridViewSelRowRpt" />
                        <AlternatingRowStyle CssClass="gridViewAltRowRpt" />
						<PagerSettings Mode="NumericFirstLast" PageButtonCount="10"  FirstPageText="<<" LastPageText=">>" />
						<PagerStyle HorizontalAlign="Right" CssClass="grid-pager" />
                        <EmptyDataTemplate>
                            There is no data to report.
                        </EmptyDataTemplate>
                </asp:GridView>
                </div>
            </div>
		</ContentTemplate>
		</asp:UpdatePanel>
    </form>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            var elem = document.getElementById("rpt");
            var val = document.getElementById("scrollPos").value;
            if (elem !== null) {
                setReportScrollPos(val);
            }
        }        
    </script>
</body>
</html>
