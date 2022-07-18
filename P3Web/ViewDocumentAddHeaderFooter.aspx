<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDocumentAddHeaderFooter.aspx.cs" Inherits="P3Web.ViewDocumentAddHeaderFooter"  EnableEventValidation="false" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paradigm 3 -- Apply Header/Footer </title>
    <link id="favicon" runat="server" rel="shortcut icon" type="image/ico" href="p3_32.ico" />
	<link href="styles/Document.css" rel="stylesheet" />
	<link href="styles/P3Web.css" rel="stylesheet" />
	<script src="scripts/P3Web.js"></script>

    <script language="javascript" type="text/javascript">
        function oncheckchange(checked) {
            var chk1 = document.getElementById('cbCollaborateVersion');
            var chk2 = document.getElementById('cbCurrentVersion');
            var chk3 = document.getElementById('cbDraftVersion');
            var chk4 = document.getElementById('cbObsoletedVersion');
            var chk5 = document.getElementById('cbPendingVersion');
            var chk6 = document.getElementById('cbReadyVersion');
            var chk7 = document.getElementById('cbReviewVersion');
            chk1.disabled = checked;
            chk2.disabled = checked;
            chk3.disabled = checked;
            chk4.disabled = checked;
            chk5.disabled = checked;
            chk6.disabled = checked;
            chk7.disabled = checked;

        }
    </script>

</head>
<body class="headerfooterBody">
      <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="udpHeaderFooter" runat="server">
            <ContentTemplate>
        <div>
            <div class="modify-title">
                <asp:Label ID="lblTitle" runat="server" Text="Apply Header/Footer"/>
            </div>           
             <div class="u-opt-row" style="flex: 1 1 auto; display: flex; flex-direction: column; ">          
                 <fieldset style="display: flex;flex-direction: column; justify-content: flex-start; border: 1px solid #dcdcdc;">
                
                    <asp:label class="formLabel" ID="lblTemplateName" runat="server" Font-Bold="true" Text="Select a Header/Footer to apply"/>
                    <asp:DropDownList runat="server" ID="ddlTemplates"></asp:DropDownList>                    
               
              </fieldset> 
            </div>
            <div class="u-opt-row" style="flex: 1 1 auto; display: flex; flex-direction: column;">
                <fieldset style="display: flex;flex-direction: column; justify-content: flex-start; border: 1px solid #dcdcdc;">
                <asp:Label class="formLabel" runat="server" Font-Bold="true">Name</asp:Label>
                 
                <asp:TextBox ID="txtDocumentName" runat="server"  ReadOnly="true" Width="99%" Height="30px" />
                    </fieldset>
            </div> 
             
                 <div class="u-opt-row" style="flex: 1 1 auto; display: flex; flex-direction: column;">
                     <%-- <fieldset style="display: flex;flex-direction: column; justify-content: flex-start; border: 1px solid #dcdcdc;">
                            <p style="font-weight:bold" class="formLabel">Following options are only applicable on MS Excel files only</p> 
                 <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="formLabel">
                     <asp:ListItem Enabled="false" Value="1" > Apply Header/Footer from first sheet</asp:ListItem>
                    <asp:ListItem ID="rbAllSheets"  Value="2" Enabled="false"> Apply Header/Footer from all sheets</asp:ListItem>
    
                  </asp:RadioButtonList>
                          </fieldset>--%>
           
            </div>
             <div class="u-prop-tabcontent" style="border: none;"> 
                                    <div class="u-opt-row" style="flex: 1 1 auto; display: flex; flex-direction: column;">
                                        <fieldset style="display: flex;flex-direction: column; justify-content: flex-start; border: 1px solid #dcdcdc;">
                                            <legend>  <asp:CheckBox ID="cbAllversions" runat="server" OnClick="oncheckchange(this.checked);"  Text="All Version" CssClass="formLabel" OnCheckedChanged="cbAllversions_CheckedChanged"/> </legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                         <div class="u-opt-row">
                                                <asp:CheckBox ID="cbCurrentVersion"  runat="server"    Text="Current Version" CssClass="formLabel" />
                                            </div>
                                          
                                           
                                                    </td>
                                                    <td>
                                                         <div class="u-opt-row">
                                                <asp:CheckBox ID="cbReadyVersion" runat="server"   Text="Ready Version" CssClass="formLabel"/>
                                            </div>
                                                    </td>
                                                    <td>
 
                                            <div class="u-opt-row">
                                                <asp:CheckBox ID="cbDraftVersion" runat="server"   Text="Draft Version" CssClass="formLabel" />
                                            </div>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                         <div class="u-opt-row">
                                                <asp:CheckBox ID="cbCollaborateVersion" runat="server"   Text="Collaborate Version" CssClass="formLabel"/>
                                            </div>
                                                    </td>
                                                    <td>
                                                        <div class="u-opt-row">
                                                <asp:CheckBox ID="cbReviewVersion" runat="server"   Text="Review Version" CssClass="formLabel" OnCheckedChanged="cbReviewVersion_CheckedChanged" />
                                            </div>

                                                    </td>
                                                    <td>
                                                          <div class="u-opt-row">
                                                <asp:CheckBox ID="cbPendingVersion" runat="server"    Text="Pending Version" CssClass="formLabel"/>
                                            </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                         <div class="u-opt-row">
                                                <asp:CheckBox ID="cbObsoletedVersion" runat="server"    Text="Obsolete Version/Completed Item" CssClass="formLabel"/>
                                            </div>
                                        </td>
                                    </tr>
                                </table> 
                            </fieldset>
                            <div id="pnlHistory">
                                <fieldset style="border: 1px solid #dcdcdc; margin: 5px;">
                                    <p style="font-weight:bold" class="formLabel">Notes for History</p>
                                    <asp:TextBox ID="txtHistory" runat="server" TextMode="MultiLine" CssClass="hfHistoryField" meta:resourcekey="txtHistoryResource1"></asp:TextBox>
                                </fieldset>
                            </div>

                             <div class="u-opt-row">
                                                <asp:CheckBox ID="chkbxApplySubFolder" runat="server"  Text="Apply to Sub-Folder and Items" CssClass="formLabel" OnCheckedChanged="chkbxApplySubFolder_CheckedChanged" />
                                            </div>
                            <div id="pnlPClose" runat="server" style="padding: 10px 5px; text-align: right;">
                                <asp:Button ID="btnSubmit" runat="server" Width="80px" CommandArgument="Submit" OnClick="Button_Click" Text="Apply" meta:resourcekey="btnSubmitResource1" />
                                <asp:Button ID="btnClose" runat="server" Width="80px" OnClientClick="window.close();"  Text="Close" meta:resourcekey="btnCloseResource1" />
                            </div>
                        </div>
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
</body>
</html>
