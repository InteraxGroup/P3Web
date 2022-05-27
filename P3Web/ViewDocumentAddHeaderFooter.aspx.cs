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
        private string _templateExtension = String.Empty;
        private string _fileExtension = String.Empty;
        private bool checkHeaderAppliedStatus = false;
        private bool checkFooterAppliedStatus = false;
        private int count = 0;
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

                    int ItemID = Convert.ToInt32(Request.QueryString["OrigID"]);
                    int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                    // int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
                    int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                    bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
                    await Initialize_ComponentsAsync(OrigID, ItemID, ModuleID, IsGroup);


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
            DataTable dt = await Paradigm3.datalayer.Document.Get_HeaderFooterListAsync(OrigID, ModuleID, ParentGroupID);
           
           

            if (IsGroup)
            {

                DataTable dtGroup = P3General.Get_ItemList(ModuleID, UserID, ParentGroupID.ToString());
                DataTable dtGrp = Paradigm3.datalayer.Document.Get_ParentGroupDetails(ParentGroupID);

                ViewState["grpData"] = dtGroup;
                            Session["templateExtension"] = "docx";
                            dt.DefaultView.RowFilter = "FileExtension = 'docx'";
                            ddlTemplates.DataSource = dt;
                            ddlTemplates.DataTextField = "Name";
                            ddlTemplates.DataValueField = "ItemID";
                            ddlTemplates.DataBind();
                txtDocumentName.Text = dtGrp.Rows[0]["Name"].ToString();

              

            }
            else {
                DataTable dtDoc = await Paradigm3.datalayer.Document.Get_AllDocumentItemsAsync(OrigID);
                ViewState["dtDoc"] = dtDoc;
                string DocName = dtDoc.Rows[0]["Name"].ToString();
                string CurrentVersion = dtDoc.Rows[0]["Version"].ToString();
                if (dtDoc.Rows.Count > 0)
                {
                    string fileExtension = dtDoc.Rows[0]["FileExtension"].ToString();
                    Session["fileExtension"] = fileExtension;
                    if (dt.Rows.Count > 0) { }
                    switch (fileExtension.ToUpper())
                    {
                        case "DOC":
                            Session["templateExtension"] = "doc";
                            dt.DefaultView.RowFilter = "FileExtension = 'doc'";
                            ddlTemplates.DataSource = dt;
                            ddlTemplates.DataTextField = "Name";
                            ddlTemplates.DataValueField = "ItemID";
                            ddlTemplates.DataBind();
                            break;
                        case "DOCX":

                            Session["templateExtension"] = "docx";
                            dt.DefaultView.RowFilter = "FileExtension = 'docx'";
                            ddlTemplates.DataSource = dt;
                            ddlTemplates.DataTextField = "Name";
                            ddlTemplates.DataValueField = "ItemID";
                            ddlTemplates.DataBind();
                            break;
                    }

                    txtDocumentName.Text = dtDoc.Rows[0]["Name"].ToString();

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
                        int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                        // int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
                        int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                        bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
                        DateTime CurrentTime = DateTime.Now;
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int UserStatus = Convert.ToInt32(UserValues[3]);
                        int UserID = Convert.ToInt32(UserValues[0]);
                        string UserFullName = UserValues[1];
                        ApplyHeaderFootertoDocumentItemID();
                        if (checkHeaderAppliedStatus && checkFooterAppliedStatus)
                        {
                            await Paradigm3.datalayer.Document.Edit_Document_HistoryAsync(3, OrigID, txtDocumentName.Text, "", "Applied Header Footer to the document", UserFullName, txtHistory.Text);
                            ScriptManager.RegisterStartupScript(udpHeaderFooter, udpHeaderFooter.GetType(), "myScript", "alert('Applied Header/Footer successfully');window.close();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(udpHeaderFooter, GetType(), "myScript", "alert('Can not applied Header/Footer. Check Error Table')", true);
                        }
                    }
                    break;
            }

        }

        private static Boolean AddHeaderFromTo(string filepathFrom, string filepathTo)
        {
            // Replace header in target document with header of source document.
            using (WordprocessingDocument
                wdDoc = WordprocessingDocument.Open(filepathTo, true))
            {
                MainDocumentPart mainPart = wdDoc.MainDocumentPart;

                // Delete the existing header part.
                mainPart.DeleteParts(mainPart.HeaderParts);

                // Create a new header part.
                DocumentFormat.OpenXml.Packaging.HeaderPart headerPart =
            mainPart.AddNewPart<HeaderPart>();


                // Get Id of the headerPart.
                string rId = mainPart.GetIdOfPart(headerPart);

                // Feed target headerPart with source headerPart.
                using (WordprocessingDocument wdDocSource =
                    WordprocessingDocument.Open(filepathFrom, true))
                {
                    DocumentFormat.OpenXml.Packaging.HeaderPart firstHeader =
            wdDocSource.MainDocumentPart.HeaderParts.FirstOrDefault();

                    wdDocSource.MainDocumentPart.HeaderParts.FirstOrDefault();

                    if (firstHeader != null)
                    {
                        headerPart.FeedData(firstHeader.GetStream());
                    }
                }

                // Get SectionProperties and Replace HeaderReference with new Id.
                IEnumerable<DocumentFormat.OpenXml.Wordprocessing.SectionProperties> sectPrs =
                mainPart.Document.Body.Elements<SectionProperties>();

                try
                {
                    foreach (var sectPr in sectPrs)
                    {
                        // Delete existing references to headers.
                        sectPr.RemoveAllChildren<HeaderReference>();

                        // Create the new header reference node.
                        sectPr.PrependChild<HeaderReference>(new HeaderReference() { Id = rId });
                    }

                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
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

                                //checkHeaderAppliedStatus = AddHeaderFromTo(filepathFrom.Replace("\\\\", "\\"), filepathTo.Replace("\\\\", "\\"));
                                checkFooterAppliedStatus = AddFooterFromTo(filepathFrom.Replace("\\\\", "\\"), filepathTo.Replace("\\\\", "\\"));
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
        public static Boolean AddFooterFromTo(string filepathFrom, string filepathTo)
        {
            // Replace header in target document with header of source document.
            using (WordprocessingDocument
                wdDoc = WordprocessingDocument.Open(filepathTo, true))
            {
                MainDocumentPart mainPart = wdDoc.MainDocumentPart;

                // Delete the existing footer part.
                mainPart.DeleteParts(mainPart.FooterParts);

                // Create a new footer part.
                DocumentFormat.OpenXml.Packaging.FooterPart footerPart =
            mainPart.AddNewPart<FooterPart>();

                // Get Id of the footerPart.
                string rId = mainPart.GetIdOfPart(footerPart);

                // Feed target FooterPart with source headerPart.
                using (WordprocessingDocument wdDocSource =
                    WordprocessingDocument.Open(filepathFrom, true))
                {
                    DocumentFormat.OpenXml.Packaging.FooterPart firstFooter =
                    wdDocSource.MainDocumentPart.FooterParts.FirstOrDefault();  //wdDocSource.MainDocumentPart.FooterParts.First();



                    if (firstFooter != null)
                    {
                        
                        footerPart.FeedData(firstFooter.GetStream());
                    }
                }

                // Get SectionProperties and Replace FooterReference with new Id.
                IEnumerable<DocumentFormat.OpenXml.Wordprocessing.SectionProperties> sectPrs =
               mainPart.Document.Body.Elements<SectionProperties>();

                try
                {
                    foreach (var sectPr in sectPrs)
                    {
                        // Delete existing references to footer.
                          sectPr.RemoveAllChildren<FooterReference>();

                        // Create the new footer reference node.
                        // sectPr.AppendChild<FooterReference>(new FooterReference() { Id = rId });

                        //sectPr.PrependChild<DocumentFormat.OpenXml.Wordprocessing.FooterReference>(new DocumentFormat.OpenXml.Wordprocessing.FooterReference() { Type = DocumentFormat.OpenXml.Wordprocessing.HeaderFooterValues.Default, Id = rId });
                        FooterReference footerReference1 = new FooterReference() { Type = DocumentFormat.OpenXml.Wordprocessing.HeaderFooterValues.Default, Id = "r98" };


                        sectPr.InsertAt(footerReference1, 0);

                    }

                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        protected void ApplyHeaderFootertoDocumentItemID()
        {
            bool IsGroup = Convert.ToBoolean(Request.QueryString["IsGroup"]);
            DataTable dt;
            if (IsGroup)
            {
                dt = (DataTable)ViewState["grpData"];
            }
            else
            { 
                dt = (DataTable)ViewState["dtDoc"]; 
            }
            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int itemID = 0;
            int selectedVersion = DocumentVersion();
            switch (selectedVersion)
            {
                case 1: // All
                    if (ModuleID == 3)
                    {
                        DataRow[] dr = dt.Select();
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
                        for (int i = 0; i < dr.Count(); i++)
                        {
                            itemID = Convert.ToInt32(dr[i]["ItemID"]);
                            ApplyHeaderFootertoDoc(itemID);
                        }
                    }
                   
                    break;
                case 2: // Draft/Open
                    if (ModuleID == 3)
                    {
                        DataRow[] dr = dt.Select("Status= 2");
                        for (int i = 0; i < dr.Count(); i++)
                        {
                            itemID = Convert.ToInt32(dr[i]["ItemID"]);
                            ApplyHeaderFootertoDoc(itemID);
                        }
                    }
                    break;
                case 3: // Collaborate

                    if (ModuleID == 3)
                    {
                        DataRow[] dr = dt.Select("Status= 0");
                        for (int i = 0; i < dr.Count(); i++)
                        {
                            itemID = Convert.ToInt32(dr[i]["ItemID"]);
                            ApplyHeaderFootertoDoc(itemID);
                        }
                    }
                    break;
                case 5: // Review
                    if (ModuleID == 3)
                    {
                        DataRow[] dr = dt.Select("Status= 5");
                        for (int i = 0; i < dr.Count(); i++)
                        {
                            itemID = Convert.ToInt32(dr[i]["ItemID"]);
                            ApplyHeaderFootertoDoc(itemID);
                        }
                    }
                    break;
                case 6: // Ready
                    if (ModuleID == 3)
                    {
                        DataRow[] dr = dt.Select("Status= 6");
                        for (int i = 0; i < dr.Count(); i++)
                        {
                            itemID = Convert.ToInt32(dr[i]["ItemID"]);
                            ApplyHeaderFootertoDoc(itemID);
                        }
                    }

                    break;
                case 7: // Pending
                    if (ModuleID == 3)
                    {
                        DataRow[] dr = dt.Select("Status= 7");
                        for (int i = 0; i < dr.Count(); i++)
                        {
                            itemID = Convert.ToInt32(dr[i]["ItemID"]);
                            ApplyHeaderFootertoDoc(itemID);
                        }
                    }
                    break;
                case 9: // Current
                    if (ModuleID == 3)
                    {
                        DataRow[] dr = dt.Select("Status= 9");
                        for (int i = 0; i < dr.Count(); i++)
                        {
                            itemID = Convert.ToInt32(dr[i]["ItemID"]);
                            ApplyHeaderFootertoDoc(itemID);
                        }
                    }
                    break;
            }


        }
   
        private int DocumentVersion()
        {
            int version = -1;
            if (cbAllversions.Checked)
            {
                version = 1;
            }
            if (cbReadyVersion.Checked)
            {
                version = 6;
            }
            if (cbDraftVersion.Checked)
            {
                version = 2;
            }
            if (cbCollaborateVersion.Checked)
            {
                version = 3;
            }
            if (cbReviewVersion.Checked)
            {
                version = 5;
            }
            if (cbPendingVersion.Checked)
            {
                version = 7;
            }
            if (cbObsoletedVersion.Checked)
            {
                version = 0;
            }
            if (cbCurrentVersion.Checked)
            {
                version = 9;
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
    }

}