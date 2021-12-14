<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Paradigm3.custom.bayshore.Homepage" Async="true" EnableEventValidation="false" meta:resourcekey="PageResource1" %>

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
                <img src='<%= GetLocalResourceObject("BayshoreLogo") %>' style="position: absolute; top: 20px; left: 10px; height: 60px; width: auto;" />
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="bayshore-content">
                        <div class="bayshore-tabs">
                            <asp:Menu ID="BayShoreMenu" runat="server" 
                                Orientation="Horizontal" 
                                CssClass="bayshore-menu" 
                                StaticItemFormatString="&nbsp;&nbsp;{0}&nbsp;&nbsp;" 
                                OnMenuItemClick="BayShoreMenu_MenuItemClick" meta:resourcekey="BayShoreMenuResource1">
                                <Items>
                                    <asp:MenuItem Text="Home" Value="0" Selected="True" meta:resourcekey="MenuItemResource1"></asp:MenuItem>
                                    <asp:MenuItem Text="Employee Information" Value="1" meta:resourcekey="MenuItemResource2"></asp:MenuItem>
                                    <asp:MenuItem Text="Human Resources" Value="2" meta:resourcekey="MenuItemResource3"></asp:MenuItem>
                                    <asp:MenuItem Text="Health & Safety" Value="3" meta:resourcekey="MenuItemResource4"></asp:MenuItem>
                                    <asp:MenuItem Text="CQ HIP" Value="4" meta:resourcekey="MenuItemResource5"></asp:MenuItem>
                                    <asp:MenuItem Text="Information Services" Value="6" meta:resourcekey="MenuItemResource6"></asp:MenuItem>
                                </Items>                        
                            </asp:Menu>
                        </div>
                        <div class="bayshore-pages">
                            <asp:Panel ID="HomePanel" runat="server" CssClass="bayshore-panel" meta:resourcekey="HomePanelResource1">
                                <div class="bayshore-panel-main">       
                                     <h1><%=GetLocalResourceObject("lblHeadertxt") %></h1>
                                 
                                    <h2><%=GetLocalResourceObject("lblHeadertxt2") %></h2>
                                    <ul class="bullet-list">
                                        <li>
                                           <%=GetLocalResourceObject("Homepnltxt1") %> 
                                        </li>
					                    <li>
						                     <%=GetLocalResourceObject("Homepnltxt2") %> 
					                    </li>
					                    <%--<li>
						                  <%=GetLocalResourceObject("Homepnltxt1") %>   
					                    </li>--%>
				                    </ul>
                                    <p>
                                        <strong>   <%=GetLocalResourceObject("Homepnlpara1") %>   </strong>
				                    </p>
                                    <p>
                                         <%=GetLocalResourceObject("Homepnlpara2") %>    <a href="#"><%=GetLocalResourceObject("lblclick") %></a>.<br />
                                         <%=GetLocalResourceObject("Homepnlpara3") %>    <a href="#"><%=GetLocalResourceObject("lblclick") %></a>.<br />
                                         <%=GetLocalResourceObject("Homepnlpara4") %>    <a href="mailto:bayshore.cqrt@bayshorehealth.ca">CQRT</a>
                                    </p>
                                </div>                                
                            </asp:Panel>
                            <asp:Panel ID="EmployeePanel" runat="server" CssClass="bayshore-panel" Visible="False" meta:resourcekey="EmployeePanelResource1">
                                <div class="bayshore-panel-main">
                                    <div>
                                        <h1>  <%=GetLocalResourceObject("Emppnltxt1") %></h1>
                                        <h3> <%=GetLocalResourceObject("Emppnltxt2") %></h3>
                                    </div>
                                    <div class="bayshore-panel-content">
                                        <ajax:TabContainer ID="TCEmployeeInfo" runat="server" meta:resourcekey="TCEmployeeInfoResource1">
                                            <ajax:TabPanel ID="TPBenefits" runat="server"  CssClass="pc-1" meta:resourcekey="TPBenefitsResource1">
                                                <ContentTemplate>
                                                    <div style="height: 100%">
                                                        <h2> <%=GetLocalResourceObject("EmpPnlheaderlbl1") %></h2>
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
                                            <ajax:TabPanel ID="TPPayroll" runat="server"  CssClass="pc-1" meta:resourcekey="TPPayrollResource1">
                                                <ContentTemplate>
                                                    <div style="height: 100%;">
                                                        <h2> <%=GetLocalResourceObject("EmpPnlheaderlbl2") %></h2>
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
                                    <div class="hotlinks-title"> <%=GetLocalResourceObject("EmppnlHotlnktitle") %> </div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewEI" runat="server" GridLines="None" 
                                            AutoGenerateColumns="False" 
                                            ShowHeader="False" 
                                            CssClass="bayshore-hotlinklist" 
                                            OnRowDataBound="GridView_RowDataBound" 
                                            OnSelectedIndexChanged="GridView_SelectedIndexChanged" 
                                            DataKeyNames="ItemID,OrigID,Status,LabelName,FileExtension,TypeOfPublish" meta:resourcekey="GridViewEIResource1">
                                            <RowStyle CssClass="gridview-row" />
                                            <AlternatingRowStyle CssClass="gridview-alt-row" />
                                            <SelectedRowStyle CssClass="gridview-sel-row" />
                                            <EmptyDataTemplate>
                                                <div class="bayshore-emptydata">
                                                    <%=GetLocalResourceObject("EmppnlHotlinktemplate") %> 
                                                </div>                                                
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                                    <ItemTemplate>
                                                        <asp:Image ID="ItemIcon" runat="server" Width="24px" Height="24px" ImageUrl="~/images/docx.png" meta:resourcekey="ItemIconResource1" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" meta:resourcekey="BoundFieldResource1" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>                                
                            </asp:Panel>
                            <asp:Panel ID="HRPanel" runat="server" CssClass="bayshore-panel" Visible="False" meta:resourcekey="HRPanelResource1">
                                <div class="bayshore-panel-main">
                                    <h1> <%=GetLocalResourceObject("HRPnlheaderlbl1") %></h1>
                                    <h3> <%=GetLocalResourceObject("HRPnlheaderlbl2") %></h3>
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title"><%=GetLocalResourceObject("HRpnlHotlnktitle") %> </div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewHR" runat="server" GridLines="None" 
                                            AutoGenerateColumns="False" 
                                            ShowHeader="False" 
                                            CssClass="bayshore-hotlinklist" 
                                            OnRowDataBound="GridView_RowDataBound" 
                                            OnSelectedIndexChanged="GridView_SelectedIndexChanged" 
                                            DataKeyNames="ItemID,OrigID,Status,LabelName,FileExtension,TypeOfPublish" meta:resourcekey="GridViewHRResource1">
                                            <RowStyle CssClass="gridview-row" />
                                            <AlternatingRowStyle CssClass="gridview-alt-row" />
                                            <SelectedRowStyle CssClass="gridview-sel-row" />
                                            <EmptyDataTemplate>
                                                <div class="bayshore-emptydata">
                                                    <%=GetLocalResourceObject("HRpnlHotlinktemplate") %> 
                                                </div>                                                
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                                                    <ItemTemplate>
                                                        <asp:Image ID="ItemIcon" runat="server" Width="24px" Height="24px" ImageUrl="~/images/docx.png" meta:resourcekey="ItemIconResource2" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" meta:resourcekey="BoundFieldResource2" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>    
                            </asp:Panel>
                            <asp:Panel ID="HSPanel" runat="server" CssClass="bayshore-panel" Visible="False" meta:resourcekey="HSPanelResource1">
                                <div class="bayshore-panel-main">
                                    <div>
                                        <h1> <%=GetLocalResourceObject("HSPnlheaderlbl1") %></h1>
                                    <h3>
                                        <%=GetLocalResourceObject("HSPnlheaderlbl2") %> 
                                    </h3>
                                    <p>
                                         <%=GetLocalResourceObject("HSPnlpara1") %>
                                       
                                    </p>
                                    </div>
                                    <div class="bayshore-panel-content">
                                        <ajax:TabContainer ID="TCHS" runat="server" meta:resourcekey="TCHSResource1">
                                            <ajax:TabPanel ID="TPClinical" runat="server" HeaderText="Tab1" CssClass="pc-2" meta:resourcekey="TPClinicalResource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("UnderConstruction") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPPrivacy" runat="server" HeaderText="Tab2" CssClass="pc-2" meta:resourcekey="TPPrivacyResource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("UnderConstruction") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPQR" runat="server" HeaderText="Tab3" CssClass="pc-2" meta:resourcekey="TPQRResource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("UnderConstruction") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPPFAC" runat="server" HeaderText="Tab4" CssClass="pc-2" meta:resourcekey="TPPFACResource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("UnderConstruction") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TabPanel1" runat="server" HeaderText="Tab5" CssClass="pc-2" meta:resourcekey="TabPanel1Resource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("UnderConstruction") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TabPanel2" runat="server" HeaderText="Tab6" CssClass="pc-2" meta:resourcekey="TabPanel2Resource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("UnderConstruction") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TabPanel3" runat="server" HeaderText="Tab7" CssClass="pc-2" meta:resourcekey="TabPanel3Resource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("UnderConstruction") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TabPanel4" runat="server" HeaderText="Tab8" CssClass="pc-2" meta:resourcekey="TabPanel4Resource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("UnderConstruction") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                        </ajax:TabContainer>
                                    </div>
                                </div>
                                </div>
                           </asp:Panel>
                            <asp:Panel ID="CQHIPPanel" runat="server" CssClass="bayshore-panel" Visible="False" meta:resourcekey="CQHIPPanelResource1">
                                <div class="bayshore-panel-main">
                                    <div>
                                        <h1> <%=GetLocalResourceObject("CQHIPPnlheaderlbl1") %></h1>
                                        <h3> <%=GetLocalResourceObject("CQHIPPnlheaderlbl2") %></h3>
                                    </div>
                                    <div class="bayshore-panel-content">
                                        <ajax:TabContainer ID="TCCQHIP" runat="server" meta:resourcekey="TCCQHIPResource1">
                                            <ajax:TabPanel ID="TPClinical2" runat="server" CssClass="pc-1" meta:resourcekey="TPClinical2Resource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("Clinical") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPPrivacy2" runat="server" CssClass="pc-1" meta:resourcekey="TPPrivacy2Resource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("Privacy") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPQR2" runat="server"  CssClass="pc-1" meta:resourcekey="TPQR2Resource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("QualityAndRisk") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                            <ajax:TabPanel ID="TPTBD" runat="server" CssClass="pc-2" meta:resourcekey="TPTBDResource1">
                                                <ContentTemplate>
                                                    <%=GetLocalResourceObject("TBD") %>
                                                </ContentTemplate>
                                            </ajax:TabPanel>
                                        </ajax:TabContainer>
                                    </div>
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title"><%=GetLocalResourceObject("CQHIPpnlHotlnktitle") %> </div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewCQHIP" runat="server" GridLines="None" 
                                            AutoGenerateColumns="False" 
                                            ShowHeader="False" 
                                            CssClass="bayshore-hotlinklist" 
                                            OnRowDataBound="GridView_RowDataBound" 
                                            OnSelectedIndexChanged="GridView_SelectedIndexChanged" DataKeyNames="ItemID,OrigID,Status,LabelName,FileExtension,TypeOfPublish" meta:resourcekey="GridViewCQHIPResource1">
                                            <RowStyle CssClass="gridview-row" />
                                            <AlternatingRowStyle CssClass="gridview-alt-row" />
                                            <SelectedRowStyle CssClass="gridview-sel-row" />
                                            <EmptyDataTemplate>
                                                <div class="bayshore-emptydata">
                                                      <%=GetLocalResourceObject("CQHIPpnlHotlinktemplate") %>
                                                </div>                                                
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
                                                    <ItemTemplate>
                                                        <asp:Image ID="ItemIcon" runat="server" Width="24px" Height="24px" ImageUrl="~/images/docx.png" meta:resourcekey="ItemIconResource3" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" meta:resourcekey="BoundFieldResource3" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="ISPanel" runat="server" CssClass="bayshore-panel" Visible="False" meta:resourcekey="ISPanelResource1">
                                <div class="bayshore-panel-main">
                                    <h1><%=GetLocalResourceObject("ISPnlheaderlbl1") %></h1>
                                    <h3><%=GetLocalResourceObject("ISPnlheaderlbl2") %></h3>
                                </div>
                                <div class="bayshore-panel-hotlinks">
                                    <div class="hotlinks-title"><%=GetLocalResourceObject("ISpnlHotlnktitle") %></div>
                                    <div class="hotlinks-data">
                                        <asp:GridView ID="GridViewIS" runat="server" GridLines="None" 
                                            AutoGenerateColumns="False" 
                                            ShowHeader="False" 
                                            CssClass="bayshore-hotlinklist" 
                                            OnRowDataBound="GridView_RowDataBound" 
                                            OnSelectedIndexChanged="GridView_SelectedIndexChanged" DataKeyNames="ItemID,OrigID,Status,LabelName,FileExtension,TypeOfPublish" meta:resourcekey="GridViewISResource1">
                                            <RowStyle CssClass="gridview-row" />
                                            <AlternatingRowStyle CssClass="gridview-alt-row" />
                                            <SelectedRowStyle CssClass="gridview-sel-row" />
                                            <EmptyDataTemplate>
                                                <div class="bayshore-emptydata">
                                                     <%=GetLocalResourceObject("ISPpnlHotlinktemplate") %> 
                                                </div>                                                
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                                                    <ItemTemplate>
                                                        <asp:Image ID="ItemIcon" runat="server" Width="24px" Height="24px" ImageUrl="~/images/docx.png" meta:resourcekey="ItemIconResource4" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" meta:resourcekey="BoundFieldResource4" />
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
