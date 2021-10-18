<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Paradigm3.custom.bayshore.Homepage" Async="true" EnableEventValidation="false" %>

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
                <img src="images/logo.svg" style="position: absolute; top: 20px; left: 10px; height: 60px; width: auto;" />
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="bayshore-content">
                        <div class="bayshore-tabs">
                            <asp:Menu ID="BayShoreMenu" runat="server" 
                                Orientation="Horizontal" 
                                CssClass="bayshore-menu" 
                                StaticItemFormatString="&nbsp;&nbsp;{0}&nbsp;&nbsp;" 
                                OnMenuItemClick="BayShoreMenu_MenuItemClick">
                                <Items>
                                    <asp:MenuItem Text="Home" Value="0" Selected="true"></asp:MenuItem>
                                    <asp:MenuItem Text="Employee Information" Value="1"></asp:MenuItem>
                                    <asp:MenuItem Text="Human Resources" Value="2"></asp:MenuItem>
                                    <asp:MenuItem Text="Health & Safety" Value="3"></asp:MenuItem>
                                    <asp:MenuItem Text="CQ HIP" Value="4"></asp:MenuItem>
                                    <asp:MenuItem Text="Information Services" Value="6"></asp:MenuItem>
                                </Items>                        
                            </asp:Menu>
                        </div>
                        <div class="bayshore-pages">
                            <asp:Panel ID="HomePanel" runat="server" CssClass="bayshore-panel" Visible="true">
                                <div class="bayshore-panel-main">
                                    <h1>Welcome to BayShore Paradigm!</h1>
                                    <h2>How to Use:</h2>
                                    <ul class="bullet-list">
                                        <li>
                                            Select a tab above to view infromation related to specific BayShore departments.
                                        </li>
					                    <li>
						                    Click a link in the main menu to the left to access commonly used file groups and direct links
					                    </li>
					                    <li>
						                    Use the search engine in the toolbar above to locate file by name, number, or content
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
                                    <div>
                                        <h1>Welcome to BayShore Employee Information</h1>
                                        <h3>As a staff member, you can access the external links from each of the tabs listed below</h3>
                                    </div>
                                    <div class="bayshore-panel-content">
                                        <ajax:TabContainer ID="TCEmployeeInfo" runat="server">
                                            <ajax:TabPanel ID="TPBenefits" runat="server" HeaderText="Benefits" CssClass="pc-1">
                                                <ContentTemplate>
                                                    <div style="height: 100%">
                                                        <h2>Benefits Important Links</h2>
                                                        <ul class="bullet-list">
                                                            <li>
                                                                <a href="https://www.ontario.ca/page/learn-about-ohip-plus" target="_blank" title="Learn about OHIP+">2018 OHIP +: Children and Youth Pharmacare</a>
                                                            </li>
                                                            <li>
                                                                <a href="https://infobay.bayshore.ca/" target="_blank" title="Global Site home Page...">Global Site Home Page</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPPayroll" runat="server" HeaderText="Payroll" CssClass="pc-1">
                                                <ContentTemplate>
                                                    <div style="height: 100%;">
                                                        <h2>Payroll Important Links</h2>
                                                        <ul class="bullet-list">
                                                            <li>
                                                                <a href="https://www.canada.ca/en/revenue-agency/services/tax/individuals/topics/about-your-tax-return/tax-return/completing-a-tax-return/deductions-credits-expenses/line-229-other-employment-expenses/work-space-home-expenses/what-changes.html" target="_blank" title="Additional guidelines on home office expenses due to COVID-19 pandemic">
                                                                    Additional guidelines on home office expenses due to COVID-19 pandemic
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/en/revenue-agency/services/forms-publications/publications/it352r2/archived-employees-expenses-including-work-space-home-expenses.html" target="_blank" title="Interpretation bulletin IT – 352R2 - Employee’s Expenses, including Workspace in the Home">
                                                                    Interpretation bulletin IT – 352R2
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/content/dam/cra-arc/formspubs/pbg/t777s/t777s-20f.pdf" target="_blank" title="T777S - French - État des dépenses d'emploi liées au travail à domicile en raison de la COVID-19">
                                                                    T777S - French - État des dépenses d'emploi liées au travail à domicile en raison de la COVID-19
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/content/dam/cra-arc/formspubs/pbg/t777s/t777s-20e.pdf" target="_blank" title="T777S - English - Statement of Employment Expenses for Working at Home Due to COVID-19">
                                                                    T777S - English - Statement of Employment Expenses for Working at Home Due to COVID-19
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/content/dam/cra-arc/formspubs/pbg/t777/t777-19f.pdf" target="_blank" title="T777 - French - État des dépenses d'emploi">
                                                                    T777 - French - État des dépenses d'emploi
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/content/dam/cra-arc/formspubs/pbg/t777/t777-19e.pdf" target="_blank" title="T777 - English - Statement of Employment Expenses">
                                                                    T777 - English - Statement of Employment Expenses
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.revenuquebec.ca/documents/fr/formulaires/tp/TP-64.3%282020-10%29.pdf" target="_blank" title="TP-64.3-V - French - Conditions générales d’emploi">
                                                                    TP-64.3-V - French - Conditions générales d’emploi
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.revenuquebec.ca/documents/en/formulaires/tp/TP-64.3-V%282020-10%29.pdf" target="_blank" title="TP-64.3-V - English - General Employment Conditions">
                                                                    TP-64.3-V - English - General Employment Conditions
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/content/dam/cra-arc/formspubs/pbg/t2200s/t2200s-20f.pdf" target="_blank" title="T2200S - French - Déclaration des conditions d'emploi liées au travail à domicile en raison de la COVID-19">
                                                                    T2200S - French - Déclaration des conditions d'emploi liées au travail à domicile en raison de la COVID-19
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/content/dam/cra-arc/formspubs/pbg/t2200s/t2200s-20e.pdf" target="_blank" title="T2200S - English - Declaration of Conditions of Employment for working at home due to COVID-19">
                                                                    T2200S - English - Declaration of Conditions of Employment for working at home due to COVID-19
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/content/dam/cra-arc/formspubs/pbg/t2200/t2200-19f.pdf" target="_blank" title="T2200 - French - Déclaration des conditions de travail">
                                                                    T2200 - French - Déclaration des conditions de travail
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/content/dam/cra-arc/formspubs/pbg/t2200/t2200-19e.pdf" target="_blank" title="T2200 - English - Declaration of Conditions of Employment">
                                                                    T2200 - English - Declaration of Conditions of Employment
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/en/revenue-agency/services/forms-publications/publications/t4044/employment-expenses.html" target="_blank" title="T4044 - Employment Expenses Guide">
                                                                    T4044 - Employment Expenses Guide
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="http://www.revenuquebec.ca/fr/sepf/formulaires/tp/tp-1015_3/default.aspx" target="_blank" title="Quebec Provincial Tax Exemption Form (French)">
                                                                    Quebec Provincial Tax Exemption Form (French)
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="http://www.revenuquebec.ca/en/sepf/formulaires/tp/tp-1015_3/default.aspx" target="_blank" title="Quebec Provincial Tax Exemption Form (English)">
                                                                    Quebec Provincial Tax Exemption Form (English)
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/en/revenue-agency/services/forms-publications/td1-personal-tax-credits-returns/td1-forms-pay-received-on-january-1-later.html" target="_blank" title="TD1 - English">
                                                                    TD1 Personal Tax Credits Return
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://www.canada.ca/fr/agence-revenu/services/formulaires-publications/td1-declarations-credits-impot-personnels/formulaires-td1-paies-recues-1er-janvier-apres.html" target="_blank" title="TD1 - French">
                                                                    TD1 Déclaration des crédits d'impôt personnels
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="https://infobay.bayshore.ca/" target="_blank" title="Global Site home Page...">
                                                                    Global Site Home Page
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                        </ajax:TabContainer>
                                    </div>                                    
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title">Employee Information HotLinks</div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewEI" runat="server" GridLines="None" 
                                            AutoGenerateColumns="false" 
                                            ShowHeader="false" 
                                            ShowFooter="false" 
                                            CssClass="bayshore-hotlinklist" 
                                            OnRowDataBound="GridView_RowDataBound" 
                                            OnSelectedIndexChanged="GridView_SelectedIndexChanged" 
                                            DataKeyNames="ItemID,OrigID,Status,LabelName,FileExtension,TypeOfPublish">
                                            <RowStyle CssClass="gridview-row" />
                                            <AlternatingRowStyle CssClass="gridview-alt-row" />
                                            <SelectedRowStyle CssClass="gridview-sel-row" />
                                            <EmptyDataTemplate>
                                                <div class="bayshore-emptydata">
                                                    There is currently no data available
                                                </div>                                                
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Image ID="ItemIcon" runat="server" Width="24px" Height="24px" ImageUrl="~/images/docx.png" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>                                
                            </asp:Panel>
                            <asp:Panel ID="HRPanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <div class="bayshore-panel-main">
                                    <h1>Welcome to BayShore Human Resources</h1>
                                    <h3>This page is under construction</h3>
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title">Human Resources HotLinks</div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewHR" runat="server" GridLines="None" 
                                            AutoGenerateColumns="false" 
                                            ShowHeader="false" 
                                            ShowFooter="false" 
                                            CssClass="bayshore-hotlinklist" 
                                            OnRowDataBound="GridView_RowDataBound" 
                                            OnSelectedIndexChanged="GridView_SelectedIndexChanged" 
                                            DataKeyNames="ItemID,OrigID,Status,LabelName,FileExtension,TypeOfPublish">
                                            <RowStyle CssClass="gridview-row" />
                                            <AlternatingRowStyle CssClass="gridview-alt-row" />
                                            <SelectedRowStyle CssClass="gridview-sel-row" />
                                            <EmptyDataTemplate>
                                                <div class="bayshore-emptydata">
                                                    There is currently no data available
                                                </div>                                                
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Image ID="ItemIcon" runat="server" Width="24px" Height="24px" ImageUrl="~/images/docx.png" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>    
                            </asp:Panel>
                            <asp:Panel ID="HSPanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <div class="bayshore-panel-main">
                                    <div>
                                        <h1>Welcome to BayShore Health & Safety</h1>
                                    <h3>
                                        Browse through each topic to learn more about Occupational Health & Safety at BayShore.
                                    </h3>
                                    <p>
                                        The Occupational Health & Safety department ensures legislative compliance, accident prevention and investigation, medical surveillances, 
                                        health & safety training, wellness and critical incident counselling.
                                    </p>
                                    </div>
                                    <div class="bayshore-panel-content">
                                        <ajax:TabContainer ID="TCHS" runat="server">
                                            <ajax:TabPanel ID="TPClinical" runat="server" HeaderText="Clinical" CssClass="pc-2">
                                                <ContentTemplate>
                                                    Clinical
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPPrivacy" runat="server" HeaderText="Privacy" CssClass="pc-2">
                                                <ContentTemplate>
                                                    Privacy
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPQR" runat="server" HeaderText="Quality & Risk" CssClass="pc-2">
                                                <ContentTemplate>
                                                    Quality & Risk
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPPFAC" runat="server" HeaderText="Patient, Family, & Advisory Council" CssClass="pc-2">
                                                <ContentTemplate>
                                                    Patient, Family, & Advisory Council
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                        </ajax:TabContainer>
                                    </div>
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title">Health & Safety HotLinks</div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewHS" runat="server" GridLines="None" 
                                            AutoGenerateColumns="false" 
                                            ShowHeader="false" 
                                            ShowFooter="false" 
                                            CssClass="bayshore-hotlinklist" 
                                            OnRowDataBound="GridView_RowDataBound" 
                                            OnSelectedIndexChanged="GridView_SelectedIndexChanged" DataKeyNames="ItemID,OrigID,Status,LabelName,FileExtension,TypeOfPublish">
                                            <RowStyle CssClass="gridview-row" />
                                            <AlternatingRowStyle CssClass="gridview-alt-row" />
                                            <SelectedRowStyle CssClass="gridview-sel-row" />
                                            <EmptyDataTemplate>
                                                <div class="bayshore-emptydata">
                                                    There is currently no data available
                                                </div>                                                
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Image ID="ItemIcon" runat="server" Width="24px" Height="24px" ImageUrl="~/images/docx.png" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="CQHIPPanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <div class="bayshore-panel-main">
                                    <div>
                                        <h1>Welcome to BayShore CQ HIP</h1>
                                        <h3>This page is under construction</h3>
                                    </div>
                                    <div class="bayshore-panel-content">
                                        <ajax:TabContainer ID="TCCQHIP" runat="server">
                                            <ajax:TabPanel ID="TPClinical2" runat="server" HeaderText="Clinical" CssClass="pc-1">
                                                <ContentTemplate>
                                                    Clinical
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPPrivacy2" runat="server" HeaderText="Privacy" CssClass="pc-1">
                                                <ContentTemplate>
                                                    Privacy
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPQR2" runat="server" HeaderText="Quality & Risk" CssClass="pc-1">
                                                <ContentTemplate>
                                                    Quality & Risk
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPTBD" runat="server" HeaderText="TBD" CssClass="pc-2">
                                                <ContentTemplate>
                                                    To be determined
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                        </ajax:TabContainer>
                                    </div>
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title">CQ HIP HotLinks</div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewCQHIP" runat="server" GridLines="None" 
                                            AutoGenerateColumns="false" 
                                            ShowHeader="false" 
                                            ShowFooter="false" 
                                            CssClass="bayshore-hotlinklist" 
                                            OnRowDataBound="GridView_RowDataBound" 
                                            OnSelectedIndexChanged="GridView_SelectedIndexChanged" DataKeyNames="ItemID,OrigID,Status,LabelName,FileExtension,TypeOfPublish">
                                            <RowStyle CssClass="gridview-row" />
                                            <AlternatingRowStyle CssClass="gridview-alt-row" />
                                            <SelectedRowStyle CssClass="gridview-sel-row" />
                                            <EmptyDataTemplate>
                                                <div class="bayshore-emptydata">
                                                    There is currently no data available
                                                </div>                                                
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Image ID="ItemIcon" runat="server" Width="24px" Height="24px" ImageUrl="~/images/docx.png" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="ISPanel" runat="server" CssClass="bayshore-panel" Visible="false">
                                <div class="bayshore-panel-main">
                                    <h1>Welcome to BayShore Information Services</h1>
                                    <h3>This page is under construction</h3>
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title">Information Services HotLinks</div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewIS" runat="server" GridLines="None" 
                                            AutoGenerateColumns="false" 
                                            ShowHeader="false" 
                                            ShowFooter="false" 
                                            CssClass="bayshore-hotlinklist" 
                                            OnRowDataBound="GridView_RowDataBound" 
                                            OnSelectedIndexChanged="GridView_SelectedIndexChanged" DataKeyNames="ItemID,OrigID,Status,LabelName,FileExtension,TypeOfPublish">
                                            <RowStyle CssClass="gridview-row" />
                                            <AlternatingRowStyle CssClass="gridview-alt-row" />
                                            <SelectedRowStyle CssClass="gridview-sel-row" />
                                            <EmptyDataTemplate>
                                                <div class="bayshore-emptydata">
                                                    There is currently no data available
                                                </div>                                                
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Image ID="ItemIcon" runat="server" Width="24px" Height="24px" ImageUrl="~/images/docx.png" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
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
