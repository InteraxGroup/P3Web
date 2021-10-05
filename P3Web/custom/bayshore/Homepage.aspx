<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Paradigm3.custom.bayshore.Homepage" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bayshore.css" rel="stylesheet" />    
</head>
<body>   
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="bayshore">
            <div class="bayshore-banner">
                <img src="images/bayshore-logo.png" />
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="bayshore-content">
                        <div class="bayshore-tabs">
                            <asp:Menu ID="BayShoreMenu" runat="server" Orientation="Horizontal" CssClass="bayshore-menu" StaticItemFormatString="&nbsp;{0}&nbsp" OnMenuItemClick="BayShoreMenu_MenuItemClick">
                                <Items>
                                    <asp:MenuItem Text="Home" Value="0" Selected="true"></asp:MenuItem>
                                    <asp:MenuItem Text="Employee Information" Value="1"></asp:MenuItem>
                                    <asp:MenuItem Text="Human Resources" Value="2"></asp:MenuItem>
                                    <asp:MenuItem Text="Health & Safety" Value="3"></asp:MenuItem>
                                    <asp:MenuItem Text="CQ HIP" Value="4"></asp:MenuItem>
                                    <asp:MenuItem Text="Finance" Value="5"></asp:MenuItem>
                                    <asp:MenuItem Text="Information Services" Value="6"></asp:MenuItem>
                                </Items>                        
                            </asp:Menu>
                        </div>
                        <div class="bayshore-pages">
                            <asp:Panel ID="HomePanel" runat="server" CssClass="bayshore-panel" Visible="true">
                                <div class="bayshore-panel-main">
                                    <h1 style="text-align: center;">Welcome to BayShore Paradigm!</h1>
                                    <h2>How to Use:</h2>
                                    <ul>
                                        <li>
                                            Select a tab above to view infromation related to specific BayShore departments.
                                        </li>
					                    <li>
						                    Click a link in the main menu to the left to access commonly used file groups and direct links
					                    </li>
					                    <li>
						                    Use the search engine in the toolbar above to locate file by name, number, or content
					                    </li>
					                    <li>
						                    Click the “Login” link  at the top right to access additional resources
					                    </li>
				                    </ul>
                                    <p>
					                    <strong>Please note that although you are able to print documents from within this web site, a printed copy of the document may not reflect the current, electronic version. Any copies appearing in paper form should always be checked against the electronic version prior to use</strong>
				                    </p>
                                    <p>
                                        For help with Paradigm, please <a href="#">click here</a>.<br />
                                        To access quick training guides, <a href="#">click here</a>.<br />
                                        If you need additional help, please contact <a href="bayshore.cqrt@bayshorehealth.ca">CQRT</a>
                                    </p>
                                </div>                                
                            </asp:Panel>
                            <asp:Panel ID="EmployeePanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <div class="bayshore-panel-main">
                                    <h1>Employee Information</h1>
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title">Employee Information HotLinks</div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewEIHotLinks" runat="server">

                                        </asp:GridView>
                                    </div>
                                </div>                                
                            </asp:Panel>
                            <asp:Panel ID="HRPanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <h1>Human Resources</h1>
                            </asp:Panel>
                            <asp:Panel ID="HSPanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <div class="bayshore-panel-main">
                                    <h1>Welcome to Bayshore Health & Safety</h1>
                                    <h3>
                                        Browse through each topic to learn more about Occupational Health & Safety at BayShore.
                                    </h3>
                                    <p>
                                        The Occupational Health &Safety department ensures legislative compliance, accident prevention and investigation, medical surveillances, 
                                        health & safety training, wellness and critical incident counselling.
                                    </p>
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title">Health & Safety HotLinks</div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewHSHotLinks" runat="server">

                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="CQHIPPanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <h1>CQ HIP</h1>
                            </asp:Panel>
                            <asp:Panel ID="FinancePanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <h1>Finance</h1>
                            </asp:Panel>
                            <asp:Panel ID="ISPanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <h1>Information Services</h1>
                            </asp:Panel>
                        </div>               
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
    <script src="bayshore.js"></script>
</body>
</html>
