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

                    await Initialize_ComponentsAsync(OrigID, ItemID, ModuleID);


                }
            }

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewDocumentAddHeaderFooter.aspx";
        }

        private async Task Initialize_ComponentsAsync(int OrigID, int ParentGroupID, int ModuleID)
        {
            DataTable dt = await Paradigm3.datalayer.Document.Get_HeaderFooterListAsync(OrigID, ModuleID, ParentGroupID);
            DataTable docitemsdt = await Paradigm3.datalayer.Document.Get_AllDocumentItemsAsync(OrigID);
           
            //if (dt.Rows.Count > 0)
            //{
            //    ddlTemplates.DataSource = dt.AsEnumerable().Select(x => x["Name"].ToString()).ToList();
            //   // ddlCustomers.DataSource = ds.Tables[0];
            //   // ddlCustomers.DataTextField = "Name";
            //   // ddlCustomers.DataValueField = "CustomerId";
            //    ddlTemplates.DataBind();
            //}
            if (docitemsdt.Rows.Count > 0)
            {
               string fileExtension = docitemsdt.Rows[0]["FileExtension"].ToString();
               this._fileExtension = fileExtension;
                if (dt.Rows.Count > 0) { }
                switch (fileExtension.ToUpper())
                {
                    case "DOC":
                         this._templateExtension= "doc";
                        // ddlTemplates.DataSource = dt.AsEnumerable().Where(x => x["FileExtension"].ToString() == "doc").ToList().Select(x => x["Name"]);
                        //  ddlTemplates.DataBind();  
                        //ddlTemplates.DataValueField = "ItemID";
                        //ddlTemplates.DataBind();

                        ddlTemplates.DataSource = dt.AsEnumerable().Where(x => x["FileExtension"].ToString() == "doc").ToList().Select(x => x["Name"]);
                        // ddlTemplates.DataSource = dt;
                        ddlTemplates.DataTextField = "Name";
                        ddlTemplates.DataValueField = "ItemID";
                        ddlTemplates.DataBind();
                        break;
                    case "DOCX":
                        //Session["ItemID"] = dt.AsEnumerable().Where(x => x["Status"].ToString() == "9").ToList().Select(x => x["ItemID"]);
                        //  Session["docExtension"] = "docx";
                        this._templateExtension = "docx";
                        //  ddlTemplates.DataSource = dt.AsEnumerable().Where(x => x["FileExtension"].ToString() == "docx").ToList().Select(x => x["Name"]);
                        //  ddlTemplates.DataBind();
                        //ddlTemplates.DataValueField = "ItemID";
                        //ddlTemplates.DataBind();

                        ddlTemplates.DataSource = dt.AsEnumerable().Where(x => x["FileExtension"].ToString() == "docx").ToList().Select(x => x["Name"]);
                        //ddlTemplates.DataSource = dt;
                        ddlTemplates.DataTextField = "Name";
                        ddlTemplates.DataValueField = "ItemID";
                        ddlTemplates.DataBind();
                        break;
                }

                txtDocumentName.Text = docitemsdt.Rows[0]["Name"].ToString();
                Session["ItemID"] = docitemsdt.Rows[0]["ItemID"].ToString();
            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            //int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            //int IsGroup = Convert.ToInt32(Request.QueryString["IsGroup"]);
            //int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
            //int TemplateID = Convert.ToInt32(Session["ItemID"].ToString());
            int TemplateID = Convert.ToInt32(ddlTemplates.SelectedValue.ToString());
            int DocID = Convert.ToInt32(Session["ItemID"].ToString());
            //templateExtension = Session["templateExtension"].ToString();
            string TemplateFileName = TemplateID.ToString().PadLeft(7, '0') + "." + this._templateExtension;
            TemplateFileName = "D" + TemplateFileName;
           
            
            string DocFileName = DocID.ToString().PadLeft(7, '0') + "." + this._fileExtension;
            DocFileName = "D" + DocFileName;

            string DocPath = ConfigurationManager.AppSettings["DocumentPath"];
            string PublicPath = Server.MapPath(ConfigurationManager.AppSettings["PublicPath"]);

            // Copy Template to public folder, create row in DB, then copy file from public to DOCS with new name.
            if (!string.IsNullOrEmpty(txtDocumentName.Text) && ddlTemplates.SelectedIndex >= 0)
            {
                if (File.Exists(DocPath + TemplateFileName))
                {
                    using (FileStream SourceStream = File.Open(DocPath + TemplateFileName, FileMode.Open))
                    {
                        //using (FileStream TempStream = File.Create(PublicPath + TemplateFileName))
                        //{
                        //    await SourceStream.CopyToAsync(TempStream);
                        //}

                        if (File.Exists(DocPath + DocFileName))
                        {
                            try
                            {
                                switch (arg)
                                {
                                    case "Submit":
                                         string filepathFrom = DocPath + TemplateFileName;         
                                         string filepathTo = DocPath + DocFileName;
                                        
                                         AddHeaderFromTo(filepathFrom.Replace("\\\\", "\\"), filepathTo.Replace("\\\\", "\\"));
                                         AddFooterFromTo(filepathFrom.Replace("\\\\", "\\"), filepathTo.Replace("\\\\", "\\"));

                                        break;


                                       
                                      
                                }
                                // Delete temporary file from Public folder
                                //if (File.Exists(PublicPath + TemplateFileName))
                                //{
                                //    File.Delete(PublicPath + TemplateFileName);
                                //}
                                ScriptManager.RegisterStartupScript(udpHeaderFooter, GetType(), "closeDoc", "window.close()", true);
                            }
                            catch (Exception ex)
                            {
                                
                            }
                        }
                    }
                }
            }
        }

        public static void AddHeaderFromTo(string filepathFrom, string filepathTo)
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

                wdDoc.Close();

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
                foreach (var sectPr in sectPrs)
                {
                    // Delete existing references to headers.
                    sectPr.RemoveAllChildren<HeaderReference>();

                    // Create the new header reference node.
                    sectPr.PrependChild<HeaderReference>(new HeaderReference() { Id = rId });
                }
            }
        }

        public static void AddFooterFromTo(string filepathFrom, string filepathTo)
        {
            // Replace header in target document with header of source document.
            using (WordprocessingDocument
                wdDoc = WordprocessingDocument.Open(filepathTo, true))
            {
                MainDocumentPart mainPart = wdDoc.MainDocumentPart;

                // Delete the existing header part.
                mainPart.DeleteParts(mainPart.FooterParts);

                // Create a new header part.
                DocumentFormat.OpenXml.Packaging.FooterPart footerPart =
            mainPart.AddNewPart<FooterPart>();

                // Get Id of the headerPart.
                string rId = mainPart.GetIdOfPart(footerPart);

                // Feed target headerPart with source headerPart.
                using (WordprocessingDocument wdDocSource =
                    WordprocessingDocument.Open(filepathFrom, true))
                {
                    DocumentFormat.OpenXml.Packaging.FooterPart firstFooter =
            wdDocSource.MainDocumentPart.FooterParts.FirstOrDefault();

                    wdDocSource.MainDocumentPart.FooterParts.FirstOrDefault();

                    if (firstFooter != null)
                    {
                        footerPart.FeedData(firstFooter.GetStream());
                    }
                }

                // Get SectionProperties and Replace HeaderReference with new Id.
                IEnumerable<DocumentFormat.OpenXml.Wordprocessing.SectionProperties> sectPrs =
            mainPart.Document.Body.Elements<SectionProperties>();
                foreach (var sectPr in sectPrs)
                {
                    // Delete existing references to headers.
                    sectPr.RemoveAllChildren<FooterReference>();

                    // Create the new header reference node.
                    sectPr.PrependChild<FooterReference>(new FooterReference() { Id = rId });
                }
            }
        }

    }

}