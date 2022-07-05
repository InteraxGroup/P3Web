using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paradigm3.datalayer;
using System.Threading.Tasks;
using System.Data;
using System.Web.Security;
using System.Configuration;
using System.IO;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;

namespace P3Web
{
    public partial class ViewDocumentAddHeaderFooter : SqlViewStatePage
    {
        private bool checkHeaderAppliedStatus = false;
        private bool checkFooterAppliedStatus = false;
        private int count = 0;
        private bool _applyAllSubFolders = false;
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
                    if (IsGroup)
                    {
                        int GroupID = Convert.ToInt32(Request.QueryString["OrigID"]);
                        int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                        await Initialize_ComponentsAsync(0, GroupID, ModuleID, IsGroup);
                    }
                    else
                    {
                        int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                        int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                        await Initialize_ComponentsAsync(OrigID, 0, ModuleID, IsGroup);
                    }
                }
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewDocumentAddHeaderFooter.aspx";
        }

        private async Task Initialize_ComponentsAsync(int OrigID, int ParentGroupID, int ModuleID, bool IsGroup)
        {
            int UserID = 0;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                //Retrieve http authentication cookie.
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                //Get user information from http cookie.
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
            }
            DataTable dt = await Paradigm3.datalayer.Document.Get_HeaderFooterListAsync();

            if (IsGroup)
            {
                DataTable dtGroup = P3General.Get_ItemList(ModuleID, UserID, ParentGroupID.ToString());
                DataTable dtGrp = Paradigm3.datalayer.Document.Get_ParentGroupDetails(ParentGroupID);
                string fileExtension = dtGroup.Rows[0]["FileExtension"].ToString();
                Session["fileExtension"] = fileExtension;

                if (fileExtension.ToUpper() == "DOCX")
                {
                    ViewState["grpData"] = dtGroup;
                    Session["templateExtension"] = "docx";
                    dt.DefaultView.RowFilter = "FileExtension = 'docx'";
                    ddlTemplates.DataSource = dt;
                    ddlTemplates.DataTextField = "Name";
                    ddlTemplates.DataValueField = "ItemID";
                    ddlTemplates.DataBind();
                    txtDocumentName.Text = dtGrp.Rows[0]["Name"].ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(udpHeaderFooter, udpHeaderFooter.GetType(), "myScript", "alert('Only DOCX extension type document supported!'); window.close();", true);
                }
            }
            else
            {
                DataTable dtDoc = await Paradigm3.datalayer.Document.Get_AllDocumentItemsAsync(OrigID);
                ViewState["dtDoc"] = dtDoc;
                if (dtDoc.Rows.Count > 0)
                {
                    string fileExtension = dtDoc.Rows[0]["FileExtension"].ToString();
                    Session["fileExtension"] = fileExtension;
                
                    if (fileExtension.ToUpper() == "DOCX")
                    {
                            Session["templateExtension"] = "docx";
                            dt.DefaultView.RowFilter = "FileExtension = 'docx'";
                            ddlTemplates.DataSource = dt;
                            ddlTemplates.DataTextField = "Name";
                            ddlTemplates.DataValueField = "ItemID";
                            ddlTemplates.DataBind();
                            txtDocumentName.Text = dtDoc.Rows[0]["Name"].ToString();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(udpHeaderFooter, udpHeaderFooter.GetType(), "myScript", "alert('Only DOCX extension type document supported!'); window.close();", true);
                    }
                }
            }
        }

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "Close":

                    Page.ClientScript.RegisterStartupScript(GetType(), "closeStatus", "closeP3Window();", true);
                    break;

                case "Submit":
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);

                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        string UserFullName = UserValues[1];

                        if (_applyAllSubFolders)
                        {
                            ApplytoAllSubgroupFolders();
                        }              
                        
                        ApplytoItemsOnly();
                        
                        if (checkHeaderAppliedStatus && checkFooterAppliedStatus)
                        {
                            await Paradigm3.datalayer.Document.Update_HistoryAsync(3, OrigID, UserFullName, txtHistory.Text);
                            ScriptManager.RegisterStartupScript(udpHeaderFooter, udpHeaderFooter.GetType(), "myScript", "alert('Successfully applied Header/Footer to item/s: " + count + "'); window.close();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(udpHeaderFooter, GetType(), "myScript", "alert('Can not applied Header/Footer. Check error log')", true);
                        }
                    }
                    break;
            }

        }

        private void ApplyHeaderFootertoDoc(int ItemID)
        {

            int TemplateID = Convert.ToInt32(ddlTemplates.SelectedValue.ToString());
            int DocID = ItemID;
            string templateExtension = Session["templateExtension"].ToString();
            string fileExtension = Session["templateExtension"].ToString();
            string TemplateFileName = TemplateID.ToString().PadLeft(7, '0') + "." + templateExtension;
            TemplateFileName = "D" + TemplateFileName;


            string DocFileName = DocID.ToString().PadLeft(7, '0') + "." + fileExtension;
            DocFileName = "D" + DocFileName;

            string DocPath = ConfigurationManager.AppSettings["DocumentPath"];
            string PublicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"]);
            if (!templateExtension.Equals("doc"))
            {
                // Copy Template to public folder, create row in DB, then copy file from public to DOCS with new name.
                if (!string.IsNullOrEmpty(txtDocumentName.Text) && ddlTemplates.SelectedIndex >= 0)
                {
                    if (File.Exists(DocPath + TemplateFileName))
                    {

                        if (File.Exists(DocPath + DocFileName))
                        {
                            try
                            {

                                string filepathFrom = DocPath + TemplateFileName;
                                string filepathTo = DocPath + DocFileName;

                                checkHeaderAppliedStatus = PrependHeader(filepathFrom.Replace("\\\\", "\\"), filepathTo.Replace("\\\\", "\\"));
                                checkFooterAppliedStatus = PrependFooter(filepathFrom.Replace("\\\\", "\\"), filepathTo.Replace("\\\\", "\\"));                   

                                count++;
                            }
                            catch (Exception ex)
                            {

                            }
                        }

                    }

                }
            }
            else
            {

                ScriptManager.RegisterStartupScript(udpHeaderFooter, GetType(), "myScript", "alert('Header/Footer or Document extension should be DOCX!')", true);
            }
        }

        public bool PrependHeader(string headerTemplatePath, string documentPath)
        {
            try
            {
                // Open docx where append header
                using (var wdDoc = WordprocessingDocument.Open(documentPath, true))
                {
                    var mainPart = wdDoc.MainDocumentPart;

                    // Remove exist header
                    mainPart.DeleteParts(mainPart.HeaderParts);

                    // Create new header
                    var headerParts = mainPart.AddNewPart<HeaderPart>();

                    // Get Id of new header
                    var rId = mainPart.GetIdOfPart(headerParts);

                    // Open the header document to be copied
                    using (var wdDocSource = WordprocessingDocument.Open(headerTemplatePath, true))
                    {
                        var firstHeader = wdDocSource.MainDocumentPart.HeaderParts.FirstOrDefault();
                        if (firstHeader != null)
                        {
                            // Copy content of header
                            headerParts.FeedData(firstHeader.GetStream());

                            // Keep formatting
                            foreach (var childElement in headerParts.Header.Descendants<Paragraph>())
                            {
                                var paragraph = (Paragraph)childElement;
                                if (paragraph.ParagraphProperties.SpacingBetweenLines == null)
                                {
                                    paragraph.ParagraphProperties.SpacingBetweenLines = new SpacingBetweenLines
                                    {
                                        After = "0"
                                    };
                                    paragraph.ParagraphProperties.ParagraphStyleId = new ParagraphStyleId
                                    {
                                        Val = "No Spacing"
                                    };
                                }
                            }

                            // Create list of Parts ID needed to new header
                            var listToAdd = new List<KeyValuePair<Type, Stream>>();
                            foreach (var idPart in firstHeader.Parts)
                            {
                                var part = firstHeader.GetPartById(idPart.RelationshipId);
                                if (part is ImagePart)
                                {
                                    headerParts.AddNewPart<ImagePart>("image/png", idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(ImagePart), part.GetStream()));
                                }
                                else if (part is DiagramStylePart)
                                {
                                    headerParts.AddNewPart<DiagramStylePart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramStylePart), part.GetStream()));
                                }
                                else if (part is DiagramColorsPart)
                                {
                                    headerParts.AddNewPart<DiagramColorsPart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramColorsPart),
                                        part.GetStream()));
                                }
                                else if (part is DiagramDataPart)
                                {
                                    headerParts.AddNewPart<DiagramDataPart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramDataPart), part.GetStream()));
                                }
                                else if (part is DiagramLayoutDefinitionPart)
                                {
                                    headerParts.AddNewPart<DiagramStylePart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramStylePart), part.GetStream()));
                                }
                                else if (part is DiagramPersistLayoutPart)
                                {
                                    headerParts.AddNewPart<DiagramPersistLayoutPart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramPersistLayoutPart),
                                        part.GetStream()));
                                }
                            }
                            var i = 0;
                            foreach (var idPart in headerParts.Parts)
                            {
                                var part = headerParts.GetPartById(idPart.RelationshipId);
                                if (part.GetType() == listToAdd[i].Key)
                                {
                                    part.FeedData(listToAdd[i].Value);
                                }
                                i++;
                            }
                        }
                        else
                        {
                            mainPart.DeleteParts(mainPart.HeaderParts);
                            var sectToRemovePrs = mainPart.Document.Body.Descendants<SectionProperties>();
                            foreach (var sectPr in sectToRemovePrs)
                            {
                                // Delete reference of header
                                sectPr.RemoveAllChildren<HeaderReference>();
                            }
                            return true;
                        }
                    }

                    // Get all sections, and past header to each section (Page)
                    var sectPrs = mainPart.Document.Body.Descendants<SectionProperties>();
                    foreach (var sectPr in sectPrs)
                    {
                        // Delete old reference
                        sectPr.RemoveAllChildren<HeaderReference>();
                        // Add new header reference
                        sectPr.PrependChild(new HeaderReference { Id = rId });
                    }

                    return true;
                }

            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool PrependFooter(string footerTemplatePath, string documentPath)
        {
            try
            {
                // Open docx where append footer
                using (var wdDoc = WordprocessingDocument.Open(documentPath, true))
                {
                    var mainPart = wdDoc.MainDocumentPart;

                    // Remove exist footer
                    mainPart.DeleteParts(mainPart.FooterParts);

                    // Create new footer
                    var footerParts = mainPart.AddNewPart<FooterPart>();

                    // Get Id of new footer
                    var rId = mainPart.GetIdOfPart(footerParts);

                    // Open the footer document to be copied
                    using (var wdDocSource = WordprocessingDocument.Open(footerTemplatePath, true))
                    {
                        var firstFooter = wdDocSource.MainDocumentPart.FooterParts.LastOrDefault();
                        if (firstFooter != null)
                        {
                            // Copy content of footer
                            footerParts.FeedData(firstFooter.GetStream());
                            // Keep formatting
                            foreach (var childElement in footerParts.Footer.Descendants<Paragraph>())
                            {
                                var paragraph = (Paragraph)childElement;
                                if (paragraph.ParagraphProperties.SpacingBetweenLines == null)
                                {
                                    paragraph.ParagraphProperties.SpacingBetweenLines = new SpacingBetweenLines
                                    {
                                        After = "0"
                                    };
                                    paragraph.ParagraphProperties.ParagraphStyleId = new ParagraphStyleId
                                    {
                                        Val = "No Spacing"
                                    };
                                }
                            }
                            // Create list of Parts ID needed to new footer
                            var listToAdd = new List<KeyValuePair<Type, Stream>>();
                            foreach (var idPart in firstFooter.Parts)
                            {
                                var part = firstFooter.GetPartById(idPart.RelationshipId);
                                if (part is ImagePart)
                                {
                                    footerParts.AddNewPart<ImagePart>("image/png", idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(ImagePart), part.GetStream()));
                                }
                                else if (part is DiagramStylePart)
                                {
                                    footerParts.AddNewPart<DiagramStylePart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramStylePart), part.GetStream()));
                                }
                                else if (part is DiagramColorsPart)
                                {
                                    footerParts.AddNewPart<DiagramColorsPart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramColorsPart),
                                        part.GetStream()));
                                }
                                else if (part is DiagramDataPart)
                                {
                                    footerParts.AddNewPart<DiagramDataPart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramDataPart), part.GetStream()));
                                }
                                else if (part is DiagramLayoutDefinitionPart)
                                {
                                    footerParts.AddNewPart<DiagramStylePart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramStylePart), part.GetStream()));
                                }
                                else if (part is DiagramPersistLayoutPart)
                                {
                                    footerParts.AddNewPart<DiagramPersistLayoutPart>(idPart.RelationshipId);
                                    listToAdd.Add(new KeyValuePair<Type, Stream>(typeof(DiagramPersistLayoutPart),
                                        part.GetStream()));
                                }
                            }
                            // Foreach ID, copy stream to new footer
                            var i = 0;
                            foreach (var idPart in footerParts.Parts)
                            {
                                var part = footerParts.GetPartById(idPart.RelationshipId);
                                if (part.GetType() == listToAdd[i].Key)
                                {
                                    part.FeedData(listToAdd[i].Value);
                                }
                                i++;
                            }
                        }
                        else
                        {
                            mainPart.DeleteParts(mainPart.FooterParts);
                            var sectToRemovePrs = mainPart.Document.Body.Descendants<SectionProperties>();
                            foreach (var sectPr in sectToRemovePrs)
                            {
                                // Delete reference of footer
                                sectPr.RemoveAllChildren<FooterReference>();
                            }

                        }
                    }

                    // Get all sections, and past footer to each section (Page)
                    var sectPrs = mainPart.Document.Body.Descendants<SectionProperties>();
                    foreach (var sectPr in sectPrs)
                    {
                        // Delete old reference
                        sectPr.RemoveAllChildren<FooterReference>();
                        // Add new footer reference
                        sectPr.PrependChild(new FooterReference { Id = rId });
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        protected async void ApplytoAllSubgroupFolders()
        {

            bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);

            if (IsGroup)
            {

                if (_applyAllSubFolders)
                {
                    int GroupID = Convert.ToInt32(Request.QueryString["OrigID"]);
                    int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                    int UserID = Convert.ToInt32(Request.QueryString["UserID"]);

                    DataTable dtGrpList = await Paradigm3.datalayer.Document.Get_AllSubgroupsAsync(GroupID);

                    if (dtGrpList.Rows.Count > 0)
                    {
                        for (int i = 0; i < dtGrpList.Rows.Count; i++)
                        {
                            int ParentGroupID = Convert.ToInt32(dtGrpList.Rows[i]["GroupID"]);
                            DataTable dtGroup = P3General.Get_ItemList(ModuleID, UserID, ParentGroupID.ToString());
                            ApplyHeaderFootertoDocumentItemID(dtGroup);
                        }

                    }

                    else
                    {
                        DataTable dt = (DataTable)ViewState["grpData"];
                        ApplyHeaderFootertoDocumentItemID(dt);
                    }
                }
            }
            else
            {

            }
        }

        protected void ApplytoItemsOnly()
        {
            bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);

            if (IsGroup)
            {
                DataTable dt = (DataTable)ViewState["grpData"];
                ApplyHeaderFootertoDocumentItemID(dt);
            }
            else
            {
                DataTable dt = (DataTable)ViewState["dtDoc"];
                ApplyHeaderFootertoDocumentItemID(dt);
            }
        }
        protected void ApplyHeaderFootertoDocumentItemID(DataTable dt)
        {
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int itemID = 0;
            List<int> selectedVersion = DocumentVersion();

            foreach (int version in selectedVersion)
            {
                switch (version)
                {
                    case 1: // All
                        if (ModuleID == 3)
                        {
                            DataRow[] dr = dt.Select();
                            if (dr.Length > 0)
                            {
                                for (int i = 0; i < dr.Count(); i++)
                                {
                                    itemID = Convert.ToInt32(dr[i]["ItemID"]);
                                    ApplyHeaderFootertoDoc(itemID);
                                }
                            }
                        break;
                    case 0: // Obsolete
                        if (ModuleID == 3)
                        {
                            DataRow[] dr = dt.Select("Status= 0");
                            if (dr.Length > 0)
                            {
                                for (int i = 0; i < dr.Count(); i++)
                                {
                                    itemID = Convert.ToInt32(dr[i]["ItemID"]);
                                    ApplyHeaderFootertoDoc(itemID);
                                }
                            }                      
                        }
                        break;
                    case 2: // Draft/Open
                        if (ModuleID == 3)
                        {
                            DataRow[] dr = dt.Select("Status= 2");
                            if (dr.Length > 0)
                            {
                                for (int i = 0; i < dr.Count(); i++)
                                {
                                    itemID = Convert.ToInt32(dr[i]["ItemID"]);
                                    ApplyHeaderFootertoDoc(itemID);
                                }
                            }
                        }
                        break;
                    case 3: // Collaborate

                        if (ModuleID == 3)
                        {
                            DataRow[] dr = dt.Select("Status= 0");
                            if (dr.Length > 0)
                            {
                                for (int i = 0; i < dr.Count(); i++)
                                {
                                    itemID = Convert.ToInt32(dr[i]["ItemID"]);
                                    ApplyHeaderFootertoDoc(itemID);
                                }
                            }
                           
                        }
                        break;
                    case 5: // Review
                        if (ModuleID == 3)
                        {
                            DataRow[] dr = dt.Select("Status= 5");
                            if (dr.Length > 0)
                            {
                                for (int i = 0; i < dr.Count(); i++)
                                {
                                    itemID = Convert.ToInt32(dr[i]["ItemID"]);
                                    ApplyHeaderFootertoDoc(itemID);
                                }
                            }
                          
                        }
                        break;
                    case 6: // Ready
                        if (ModuleID == 3)
                        {
                            DataRow[] dr = dt.Select("Status= 6");
                            if (dr.Length > 0)
                            {
                                for (int i = 0; i < dr.Count(); i++)
                                {
                                    itemID = Convert.ToInt32(dr[i]["ItemID"]);
                                    ApplyHeaderFootertoDoc(itemID);
                                }
                            }
                        }
                        break;
                    case 7: // Pending
                        if (ModuleID == 3)
                        {
                            DataRow[] dr = dt.Select("Status= 7");
                            if (dr.Length > 0)
                            {
                                for (int i = 0; i < dr.Count(); i++)
                                {
                                    itemID = Convert.ToInt32(dr[i]["ItemID"]);
                                    ApplyHeaderFootertoDoc(itemID);
                                }
                            }
                        }
                        break;
                    case 9: // Current
                        if (ModuleID == 3)
                        {
                            DataRow[] dr = dt.Select("Status= 9");
                            if (dr.Length > 0)
                            {
                                for (int i = 0; i < dr.Count(); i++)
                                {
                                    itemID = Convert.ToInt32(dr[i]["ItemID"]);
                                    ApplyHeaderFootertoDoc(itemID);
                                }
                            }
                        }
                        break;
                }
            }
        }

        private List<int> DocumentVersion()
        {
            List<int> version = new List<int>();
            if (cbAllversions.Checked)
            {
                version.Add(1);
            }
            if (cbReadyVersion.Checked)
            {
                version.Add(6);
            }
            if (cbDraftVersion.Checked)
            {
                version.Add(2);
            }
            if (cbCollaborateVersion.Checked)
            {
                version.Add(3);
            }
            if (cbReviewVersion.Checked)
            {
                version.Add(5);
            }
            if (cbPendingVersion.Checked)
            {
                version.Add(7);
            }
            if (cbObsoletedVersion.Checked)
            {
                version.Add(0);
            }
            if (cbCurrentVersion.Checked)
            {
                version.Add(9);
            }
            return version;

        }

        protected void cbReviewVersion_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void cbAllversions_CheckedChanged(object sender, EventArgs e)
        {

            if (cbAllversions.Checked)
            {
                cbCollaborateVersion.Enabled = false;
                cbCurrentVersion.Enabled = false;
                cbDraftVersion.Enabled = false;
                cbObsoletedVersion.Enabled = false;
                cbPendingVersion.Enabled = false;
                cbReadyVersion.Enabled = false;
                cbReviewVersion.Enabled = false;
            }

            else
            {

                cbCollaborateVersion.Enabled = true;
                cbCurrentVersion.Enabled = true;
                cbDraftVersion.Enabled = true;
                cbObsoletedVersion.Enabled = true;
                cbPendingVersion.Enabled = true;
                cbReadyVersion.Enabled = true;
                cbReviewVersion.Enabled = true;

            }
        }

        protected void chkbxApplySubFolder_CheckedChanged(object sender, EventArgs e)
        {
            bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);

            if (IsGroup)
            {

                if (chkbxApplySubFolder.Checked)
                {
                    _applyAllSubFolders = true;
                }
            }
            else
            {
                chkbxApplySubFolder.Enabled = false;
            }
        }
    }

}