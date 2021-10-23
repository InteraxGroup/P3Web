using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Configuration;
using System.Web.Security;
using System.Threading.Tasks;

namespace Paradigm3
{
    public partial class ViewParaLink : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    Response.Redirect("Default.aspx", false);
                }
                else
				{
                    int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                    int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);

                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        // Get user information from authentication cookie.
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = authTicket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int userStatus = Convert.ToInt32(UserValues[3]);
                        if (userStatus == 1)
                        {
                            pnlAddPLink.Visible = true;
                            pnlRemovePLink.Visible = true;
                        }
                    }
                    await Get_PLinksAsync(OrigID, ModuleID);
                }                
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewParaLink.aspx";
        }

        protected async Task Get_PLinksAsync(int OrigID, int ModuleID)
        {
            gvLinkTo.DataSource = string.Empty;
            gvLinkTo.DataBind();
            gvLinkFrom.DataSource = string.Empty;
            gvLinkFrom.DataBind();

            DataSet ds = await ParaLink.Get_ParaLinksAsync(OrigID, ModuleID);
            DataTable PLinkTo = ds.Tables[0];
            DataTable PLinkFrom = ds.Tables[1];

            gvLinkTo.DataSource = PLinkTo;
            gvLinkTo.DataBind();
            gvLinkFrom.DataSource = PLinkFrom;
            gvLinkFrom.DataBind();
        }

        protected async void ImageButton_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string arg = btn.CommandArgument;
            int ModuleID;
            string ItemID;
            string OrigID;
            string ObjTypeID;
            string ParentGroupID;
            string cmdVariables;
            int LinkedType = 1;

            if (gvLinkTo.SelectedIndex != -1)
            {
                LinkedType = Convert.ToInt32(gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["LinkedType"]);
            }

            switch (arg)
            {
                case "ShowMe":
                    if (gvLinkTo.SelectedIndex != -1)
                    {
                        ModuleID = Convert.ToInt32(gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["LinkedModuleID"]);
                    }
                    else
                    {
                        ModuleID = Convert.ToInt32(gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["ModuleID"]);
                    }

                    if (LinkedType != 0)
                    {
                        switch (ModuleID)
                        {
                            case 3:
                                string FileExtension;
                                int TypeOfPublish;
                                if (gvLinkTo.SelectedIndex != -1)
                                {
                                    ItemID = gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["LinkedOrigID"].ToString();
                                    OrigID = gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["LinkedOrigID"].ToString();
                                    FileExtension = gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["FileExtension"].ToString();
                                    TypeOfPublish = Convert.ToInt32(gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["TypeOfPublish"]);
                                }
                                else
                                {
                                    ItemID = gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["OrigID"].ToString();
                                    OrigID = gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["OrigID"].ToString();
                                    FileExtension = gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["FileExtension"].ToString();
                                    TypeOfPublish = Convert.ToInt32(gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["TypeOfPublish"]);
                                }
                                string PublishPath = ConfigurationManager.AppSettings["PublishPath"];
                                ClientScript.RegisterStartupScript(GetType(), "openparalink", "openDocWindow(" + ItemID + "," + OrigID + ",9,'false'," + PublishPath + ",'" + FileExtension + "'," + TypeOfPublish + ");", true);
                                break;
                            case 4:
                            case 6:
                            case 12:
                                if (gvLinkTo.SelectedIndex != -1)
                                {
                                    ItemID = gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["ItemID"].ToString();
                                    ObjTypeID = gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["ObjTypeID"].ToString();
                                    ParentGroupID = gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["ParentGroupID"].ToString();
                                }
                                else
                                {
                                    ItemID = gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["ItemID"].ToString();
                                    ObjTypeID = gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["ObjTypeID"].ToString();
                                    ParentGroupID = gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["ParentGroupID"].ToString();
                                }
                                cmdVariables = ModuleID + "," + ItemID + "," + ObjTypeID + "," + ParentGroupID + ",0";
                                ClientScript.RegisterStartupScript(GetType(), "openrec", "openRecordWindow(" + cmdVariables + ");", true);
                                break;
                        }
                    }                    
                    break;
                case "GoThere":
                    if (gvLinkTo.SelectedIndex != -1)
                    {
                        ModuleID = Convert.ToInt32(gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["LinkedModuleID"]);
                        if (LinkedType == 0)
                        {
                            ParentGroupID = gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["LinkedOrigID"].ToString();
                            ItemID = "0";
                        }
                        else
                        {
                            ParentGroupID = gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["ParentGroupID"].ToString();
                            ItemID = gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["LinkedOrigID"].ToString();
                        }
                    }
                    else
                    {
                        ModuleID = Convert.ToInt32(gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["ModuleID"]);
                        ParentGroupID = gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["ParentGroupID"].ToString();
                        ItemID = gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["OrigID"].ToString();
                    }
                    Session["ModuleID"] = ModuleID.ToString();
                    Session["GTGroupID"] = ParentGroupID;
                    Session["GTItemID"] = ItemID;
                    Session["IsOrigID"] = "1";
                    ClientScript.RegisterStartupScript(GetType(), "GoThere", "clickGoThere();closeP3Window();", true);
                    break;
                case "RemovePLink":
                    int PLinkID = 0;
                    if (gvLinkTo.SelectedIndex != -1)
                    {
                        PLinkID = Convert.ToInt32(gvLinkTo.DataKeys[gvLinkTo.SelectedIndex].Values["PLinkID"]);
                    }
                    else if (gvLinkFrom.SelectedIndex != -1)
                    {
                        PLinkID = Convert.ToInt32(gvLinkFrom.DataKeys[gvLinkFrom.SelectedIndex].Values["PLinkID"]);
                    }

                    if (PLinkID > 0)
                    {
                        await ParaLink.Remove_ParaLink(PLinkID);
                        ClientScript.RegisterStartupScript(GetType(), "refresh", "document.getElementById('btnRefreshPLinks').click();", true);
                    }
                    break;
                case "RefreshLinks":
                    int QSModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
                    int QSOrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                    await Get_PLinksAsync(QSOrigID, QSModuleID);
                    gvLinkTo.SelectedIndex = -1;
                    gvLinkFrom.SelectedIndex = -1;
                    break;
                case "Close":
                    Page.ClientScript.RegisterStartupScript(GetType(), "Close", "window.close();", true);
                    break;
            }
        }

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridView gv = (GridView)sender;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Image ImgIcon = (Image)e.Row.Cells[0].FindControl("ItemIcon");
                string ModuleID = gv.DataKeys[e.Row.RowIndex].Values["LinkedModuleID"].ToString();
                int LinkedType = Convert.ToInt32(gv.DataKeys[e.Row.RowIndex].Values["LinkedType"]);
                if (gv.ID == "gvLinkFrom")
                {
                    ModuleID = gv.DataKeys[e.Row.RowIndex].Values["ModuleID"].ToString();
                    LinkedType = Convert.ToInt32(gv.DataKeys[e.Row.RowIndex].Values["MyType"]);
                }                
                switch (ModuleID)
                {
                    case "3":
                        e.Row.Cells[3].Text = "Documentation";                        
                        if (LinkedType == 0)
                        {
                            ImgIcon.ImageUrl = "~/images/folder.png";
                        }
                        else
                        {
                            string FileExtension = gv.DataKeys[e.Row.RowIndex].Values["FileExtension"].ToString();
                            switch (FileExtension.ToUpper())
                            {
                                case "DOC":
                                case "DOCX":
                                case "DOCM":
                                case "RTF":
                                    ImgIcon.ImageUrl = "~/images/doc.png";
                                    break;
                                case "XLS":
                                case "XLSX":
                                case "XLSM":
                                case "CSV":
                                    ImgIcon.ImageUrl = "~/images/xls.png";
                                    break;
                                case "PDF":
                                    ImgIcon.ImageUrl = "~/images/pdf.png";
                                    break;
                                case "DWG":
                                    ImgIcon.ImageUrl = "~/images/dwg.png";
                                    break;
                                case "HTM":
                                case "HTML":
                                    ImgIcon.ImageUrl = "~/images/html.png";
                                    break;
                                default:
                                    ImgIcon.ImageUrl = "~/images/item.png";
                                    break;
                            }
                        }
                        break;
                    case "4":
                        e.Row.Cells[3].Text = "Records";
                        if (LinkedType == 0)
                        {
                            ImgIcon.ImageUrl = "~/images/folder.png";
                        }
                        else
                        {
                            ImgIcon.ImageUrl = "~/images/record.png";
                        }                        
                        break;
                    case "6":
                        e.Row.Cells[3].Text = "Improvements";
                        if (LinkedType == 0)
                        {
                            ImgIcon.ImageUrl = "~/images/folder.png";
                        }
                        else
                        {
                            ImgIcon.ImageUrl = "~/images/improvement.png";
                        }                        
                        break;
                    case "12":
                        e.Row.Cells[3].Text = "Training";
                        if (LinkedType == 0)
                        {
                            ImgIcon.ImageUrl = "~/images/folder.png";
                        }
                        else
                        {
                            ImgIcon.ImageUrl = "~/images/training.png";
                        }                        
                        break;
                }

                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
                e.Row.Attributes.Add("onmouseout", "this.style.cursor='cursor'");
            }
        }

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = (GridView)sender;
            if (gv.ID == "gvLinkTo")
            {
                gvLinkFrom.SelectedIndex = -1;
            }
            else
            {
                gvLinkTo.SelectedIndex = -1;
            }
            pnlShowMe.Visible = true;
            pnlGoThere.Visible = true;
        }

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;

            int ModuleID = Convert.ToInt32(Request.QueryString["ModuleID"]);
            int OrigID = Convert.ToInt32(Request.QueryString["OrigID"]);

            switch (arg)
            {
                case "AddPLink":
                    int AddPLinkModuleID = Convert.ToInt32(Session["ModuleID"]);
                    int AddPlinkOrigID = Convert.ToInt32(Request.QueryString["OrigID"]);
                    if (rblLinkType.Items[0].Selected)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "AddPLink", "addParaLink(" + AddPLinkModuleID + "," + AddPlinkOrigID + ");", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "AddPLink", "addGroupParaLink(" + AddPLinkModuleID + "," + AddPlinkOrigID + ");", true);
                    }
                    break;
                case "RefreshLinks":
                    await Get_PLinksAsync(OrigID, ModuleID);
                    gvLinkTo.SelectedIndex = -1;
                    gvLinkFrom.SelectedIndex = -1;
                    break;
            }
        }
    }
}