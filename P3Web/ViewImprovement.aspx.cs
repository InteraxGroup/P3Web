using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Threading;
using Paradigm3.datalayer;
using System.Threading.Tasks;
using System.Configuration;

namespace Paradigm3
{
    public partial class ViewImprovement1 : SqlViewStatePage
    {
        protected async void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    string Message = GetLocalResourceObject("SessionTimeout").ToString();
                    ClientScript.RegisterStartupScript(GetType(), "sessiontimeout", "alert('" + Message + "');window.close();", true);
                }

                int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
                int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);

                ViewState["IsUpdated"] = false;
                MenuTabs.Items[0].Selected = true;
                await Initialize_ImprovementAsync(ItemID, ParentGroupID, ObjTypeID);
                EditMode(await CanEdit());
            }            
        }

        #region Initialization

        protected void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewImprovement.aspx";
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);

            //GenerateFields(ItemID, ObjTypeID, ParentGroupID);
            GenerateFieldsAndValues(6, ItemID, ParentGroupID, ObjTypeID);
        }

        protected async Task Initialize_ImprovementAsync(int ItemID, int ParentGroupID, int ObjTypeID)
        {
            DataSet ds = await Task.FromResult(Record.GetRecord(6, ItemID, ObjTypeID));
            ViewState.Add("GenRecord", ds);
            string OrigID = ds.Tables[0].Rows[0]["OrigID"].ToString();
            // Index the selected tab.
            int index = Convert.ToInt32(MenuTabs.SelectedValue);

            // Activate Properties button
            BtnProperties.Attributes.Add("onclick", "openProperties(" + ItemID + ", 6, 0);");
            // Activate ParaLinks button
            BtnParaLink.Attributes.Add("onclick", "openParaLink(" + OrigID + ",6)");
            // Activate Related Action Items button
            string strName = ds.Tables[0].Rows[0]["Name"].ToString();
            BtnRelatedAI.Attributes.Add("onclick", "openRelatedAI(" + Server.UrlEncode(OrigID) + ", 6);");

            // Generate the initial Generator record details and display on the form.
            txtNameData.Text = strName;
            if (ds.Tables[0].Rows[0]["LabelName"] == DBNull.Value)
            {
                txtLabelData.Text = string.Empty;
            }
            else
            {
                txtLabelData.Text = ds.Tables[0].Rows[0]["LabelName"].ToString();
            }

            if (Convert.ToInt32(ds.Tables[0].Rows[0]["Status"]) == 2)
            {
                lblStatusData.Text = "Open";
            }
            else
            {
                lblStatusData.Text = "Complete";
            }
            lblIDData.Text = ItemID.ToString() + "/" + ds.Tables[0].Rows[0]["OrigID"].ToString();
            lblCreatedData.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["CreateDate"]).ToShortDateString();
            if (ds.Tables[0].Rows[0]["Version"] == DBNull.Value)
            {
                lblVersionData.Text = string.Empty;
            }
            else if (ds.Tables[0].Rows[0]["Version"].ToString() == "")
            {
                lblVersionData.Text = string.Empty;
            }
            else
            {
                lblVersionData.Text = "(" + ds.Tables[0].Rows[0]["Version"].ToString() + ")";
            }

            int ExpectedDays = 0;
            foreach (DataRow edr in ds.Tables[1].Rows)
            {
                ExpectedDays = ExpectedDays + 5;
            }

            lblExpectedCompletionData.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["CreateDate"]).AddDays(ExpectedDays).ToShortDateString();

            int TabTypeID = Convert.ToInt32(ds.Tables[1].Rows[index]["ObjTypeID"]);
            DataTable dtResp = await Record.Get_ResponsibleAsync(ItemID, TabTypeID);
            string strResp = string.Empty;
            if (dtResp.Rows.Count > 0)
            {
                int max = (dtResp.Rows.Count - 1);
                int n = 0;
                for (n = 0; n <= max; n++)
                {
                    if (n < max)
                    {
                        strResp = strResp + dtResp.Rows[n]["ControlFullName"].ToString() + ", ";
                    }
                    else
                    {
                        strResp = strResp + dtResp.Rows[n]["ControlFullName"].ToString();
                    }
                }
                txtResponsibleData.Text = strResp;
            }
            else
            {
                txtResponsibleData.Text = string.Empty;
            }
            dtResp.Dispose();

            lblStepName.Text = ds.Tables[1].Rows[index]["Caption"].ToString();

            // Set initial BtnInstructions properties.
            pnlInstructions.Visible = false;
            BtnInstructions.Attributes.Add("onmouseover", "javascript: this.src = 'images/bluedown_mo.png'");
            BtnInstructions.Attributes.Add("onmouseout", "javascript: this.src = 'images/bluedown.png'");

            // Display available Tab icons.
            int TotalTabs = (ds.Tables[1].Rows.Count - 1);
            int i = 0;
            for (i = 0; i <= 15; i++)
            {
                if (i > TotalTabs || Convert.ToInt32(ds.Tables[1].Rows[i]["IsNotApplicable"]) == 1) // Disable and hide tabs higher than total tab count or tab is not applicable
                {
                    MenuTabs.Items[i].ImageUrl = "";
                    MenuTabs.Items[i].Enabled = false;
                }
                else
                {
                    int TabIndex = Convert.ToInt32(MenuTabs.SelectedValue);
                    bool TabCompleted = Convert.ToBoolean(ds.Tables[1].Rows[i]["IsChecked"]);


                    // For each tab within the tab count.
                    if (MenuTabs.Items[i].Enabled == true && TabIndex == i && TabCompleted == false)
                    {
                        MenuTabs.Items[i].ImageUrl = "~/images/selected/selected_" + (i + 1).ToString() + ".jpg";
                    }

                    if (MenuTabs.Items[i].Enabled == true && TabIndex != i && TabCompleted == false)
                    {
                        MenuTabs.Items[i].ImageUrl = "~/images/normal/normal_" + (i + 1) + ".jpg";
                    }

                    if (MenuTabs.Items[i].Enabled == true && TabIndex == i && TabCompleted == true)
                    {
                        MenuTabs.Items[i].ImageUrl = "~/images/selected_complete/selected_complete_" + (i + 1) + ".jpg";
                    }

                    if (MenuTabs.Items[i].Enabled == true && TabIndex != i && TabCompleted == true)
                    {
                        MenuTabs.Items[i].ImageUrl = "~/images/complete/complete_" + (i + 1) + ".jpg";
                    }
                }
            }

            //Display selected Improvement fields panel.

            foreach (var panel in GetControlsOfType<Panel>(form1))
            {
                Panel p = panel;
                if (p.ID == "Panel" + index.ToString())
                {
                    p.Visible = true;
                }
                else
                {
                    p.Visible = false;
                }
            }
            EditMode(await CanEdit());

            pnlProperties.Visible = true;
            pnlParaLink.Visible = true;
            pnlRelatedAI.Visible = true;
            pnlAttachment.Visible = true;
            pnlClose.Visible = true;
        }

        protected void GenerateFieldsAndValues(int ModuleID, int ItemID, int ParentGroupID, int ObjTypeID)
        {
            string UserFullName = string.Empty;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
                //Retrieve http authentication cookie.
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                //Get user information from http cookie.
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                UserFullName = UserValues[1];
            }
            // Define all available Improvement pages in an array
            Panel TargetPanel = new Panel();
            Panel[] tgtPanel = new Panel[50];
            for (int p = 0; p < 50; p++)
            {
                tgtPanel[p] = (Panel)this.FindControl("Panel" + p.ToString());
            }

            // Identify the target panel based on the selected tab.
            DataSet ds = Record.GetRecord(ModuleID, ItemID, ObjTypeID);
            ViewState.Add("GenRecord", ds);
            int TotalTabs = (ds.Tables["Get_TabList"].Rows.Count - 1);
            int i = 0;
            // For each available page in the record...
            for (i = 0; i <= TotalTabs; i++)
            {
                //  Get ObjID for the page.
                int ObjID = Convert.ToInt32(ds.Tables["Get_TabList"].Rows[i]["ObjID"]);
                //  Identify the current Tab
                // Identify the Panel to be used.
                TargetPanel = tgtPanel[i];
                TargetPanel.Controls.Clear();
                TargetPanel.Attributes.Add("style", "position: relative");
                //  Get List of Fields and Values.
                DataTable dtFields = Record.Load_OnePane(ItemID, ObjID, ModuleID, 0);
                //  Populate fields and add to Target Panel.
                foreach (DataRow fdr in dtFields.Rows)
                {
                    int FieldID = Convert.ToInt32(fdr["FieldID"]);
                    bool IsMandatory = Convert.ToBoolean(fdr["IsMandatory"]);
                    string FieldName = fdr["FieldName"].ToString();                   
                    int FieldType = Convert.ToInt32(fdr["FieldType"]);
                    bool IsExternal = Convert.ToBoolean(fdr["IsExternalField"]);
                    object DefaultValue = fdr["DefaultValue"];
                    object FieldValue = string.Empty;
                    int FieldTop = Convert.ToInt32(fdr["DisplayTop"]);
                    int FieldLeft = Convert.ToInt32(fdr["Displayleft"]);
                    int FieldWidth = Convert.ToInt32(fdr["DisplayWidth"]);
                    int FieldHeight = Convert.ToInt32(fdr["DisplayHeight"]);
                    Label lblMandatory = new Label()
                    {
                        Text = "*"
                    };
                    if (IsMandatory && FieldType != 10)
                    {
                        TargetPanel.Controls.Add(lblMandatory);
                    }
                    lblMandatory.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + (FieldLeft - 10).ToString() + "px;color: red;");
                    DataTable dtFieldData = Record.Load_OneFieldData(ItemID, FieldID, 0);
                    switch (FieldType)
                    {
                        case 0: // Single-Line Text
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["TextData"].Equals(DBNull.Value) || dtFieldData.Rows[0]["TextData"].Equals(string.Empty))
                                {
                                    if (fdr["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = string.Empty;
                                    }
                                    else
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = dtFieldData.Rows[0]["TextData"];
                                }
                            }
                            else
                            {
                                FieldValue = string.Empty;
                            }
                            TextBox slTextBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString()
                            };
                            slTextBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            slTextBox.EnableViewState = true;
                            // Add the control to the active panel.                            
                            TargetPanel.Controls.Add(slTextBox);
                            // Set editing properties for the control.
                            slTextBox.ReadOnly = false;
                            break;
                        case 1: // Multi-Line Text
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["MemoData"].Equals(DBNull.Value) || dtFieldData.Rows[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (fdr["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = string.Empty;
                                    }
                                    else
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = dtFieldData.Rows[0]["MemoData"];
                                }
                            }
                            else
                            {
                                FieldValue = string.Empty;
                            }
                            TextBox mlTextBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString()
                            };
                            mlTextBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            mlTextBox.TextMode = TextBoxMode.MultiLine;
                            mlTextBox.EnableViewState = true;
                            // Add the control to the active panel.
                            TargetPanel.Controls.Add(mlTextBox);
                            // Set editing properties for the control.
                            mlTextBox.ReadOnly = false;
                            break;
                        case 2:  // Checkbox
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["NumData"].Equals(DBNull.Value))
                                {
                                    FieldValue = 0;
                                }
                                else
                                {
                                    FieldValue = dtFieldData.Rows[0]["NumData"];
                                }
                            }
                            else
                            {
                                FieldValue = 0;
                            }
                            CheckBox CheckBox = new CheckBox()
                            {
                                ID = FieldID.ToString()
                            };
                            CheckBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            CheckBox.EnableViewState = true;
                            CheckBox.Text = FieldName;
                            CheckBox.TextAlign = TextAlign.Right;
                            // Add the control to the active panel.
                            TargetPanel.Controls.Add(CheckBox);
                            CheckBox.Checked = false;
                            if (Convert.ToInt32(FieldValue) == 1)
                            {
                                CheckBox.Checked = true;
                            }
                            break;
                        case 3: // Dropdown List
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["TextData"].Equals(DBNull.Value) || dtFieldData.Rows[0]["TextData"].Equals(string.Empty))
                                {
                                    if (fdr["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = string.Empty;
                                    }
                                    else
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = dtFieldData.Rows[0]["TextData"];
                                }
                            }
                            else
                            {
                                FieldValue = string.Empty;
                            }
                            DropDownList DDL = new DropDownList()
                            {
                                ID = FieldID.ToString(),
                                AppendDataBoundItems = true
                            };
                            DataTable ddlDT = new DataTable();
                            if (IsExternal)
                            {
                                ddlDT = Record.Get_ExternalFieldData(FieldID);
                            }
                            else
                            {
                                ddlDT = Record.Get_DDLValues(FieldID);
                            }
                            DDL.AppendDataBoundItems = true;
                            DDL.Items.Add(new ListItem("", "0"));
                            DDL.DataSource = ddlDT;
                            DDL.DataTextField = "Caption";
                            DDL.DataValueField = "ID";
                            DDL.DataBind();
                            DDL.Items[0].Selected = true;
                            foreach (ListItem liDV in DDL.Items)
                            {
                                if (FieldValue.Equals(liDV.Text))
                                {
                                    DDL.ClearSelection();
                                    liDV.Selected = true;
                                }
                            }

                            DDL.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            DDL.EnableViewState = true;
                            // Add the control to the active panel.
                            if (IsMandatory)
                            {
                                TargetPanel.Controls.Add(lblMandatory);
                                
                            }
                            TargetPanel.Controls.Add(DDL);
                            // Set editing properties for the control.
                            DDL.Enabled = true;
                            break;
                        case 4:
                        case 16: // Date Field
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["DateData"].Equals(DBNull.Value) || dtFieldData.Rows[0]["DateData"].Equals(Convert.ToDateTime("1900/01/01")))
                                {
                                    if (!fdr["DefaultValue"].Equals(string.Empty) || fdr["DefaultValue"].ToString() != "")
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                    else
                                    {
                                        FieldValue = dtFieldData.Rows[0]["DateData"];
                                    }
                                }
                                else
                                {
                                    FieldValue = dtFieldData.Rows[0]["DateData"];
                                }
                            }
                            else
                            {
                                FieldValue = "MM/dd/yyyy";
                            }
                            TextBox dTextBox = new TextBox()
                            {
                                ID = FieldID.ToString()
                            };
                            if (FieldValue.Equals("MM/dd/yyyy"))
                            {
                                dTextBox.Text = FieldValue.ToString();
                            }
                            else
                            {
                                if (FieldType == 4)
								{
                                    dTextBox.Text = Convert.ToDateTime(FieldValue).ToShortDateString();
                                }
                                else
								{
                                    dTextBox.Text = Convert.ToDateTime(FieldValue).ToString();
                                }
                                
                            }
                            dTextBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            dTextBox.EnableViewState = true;
                            // Add the control to the active panel.
                            TargetPanel.Controls.Add(dTextBox);
                            dTextBox.Enabled = true;
                            AjaxControlToolkit.CalendarExtender calExtend = new AjaxControlToolkit.CalendarExtender()
                            {
                                TargetControlID = dTextBox.ID,
                                Format = Thread.CurrentThread.CurrentCulture.DateTimeFormat.ShortDatePattern
                            };
                            if (FieldType == 16)
							{
                                calExtend.Format = "M/dd/yyyy H:mm:ss tt";
                            }
                            TargetPanel.Controls.Add(calExtend);
                            break;
                        case 5: // User Selection Box
                            ListBox selListBox = new ListBox()
                            {
                                ID = FieldID.ToString(),
                                SelectionMode = ListSelectionMode.Multiple,
                                AppendDataBoundItems = true
                            };
                            TargetPanel.Controls.Add(selListBox);
                            DataTable dtList = Record.Get_SelListValues(ItemID, FieldID, ModuleID);
                            if (dtList.Rows.Count > 0)
                            {
                                foreach (DataRow dl in dtList.Rows)
                                {
                                    selListBox.Items.Add(new ListItem(dl["TextData"].ToString(), dl["NumData"].ToString()));
                                }
                            }
                            selListBox.Enabled = true;
                            selListBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            selListBox.EnableViewState = true;

                            ViewState["selListBox"] = FieldID;
                            // Add User Button
                            ImageButton addBtn = new ImageButton()
                            {
                                ID = "add" + FieldID.ToString(),
                                ImageUrl = "~/images/btnAdd.png",
                                OnClientClick = "javascript:openSelect(" + FieldID.ToString() + ");"
                            };
                            TargetPanel.Controls.Add(addBtn);
                            addBtn.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + (FieldLeft + FieldWidth).ToString() + "px;");

                            // Remove User Button
                            ImageButton remBtn = new ImageButton()
                            {
                                ID = "rem" + FieldID.ToString(),
                                ImageUrl = "~/images/btnRemove.png"
                            };
                            TargetPanel.Controls.Add(remBtn);
                            remBtn.CommandArgument = FieldID.ToString(); ;
                            remBtn.Attributes.Add("style", "position: absolute;top: " + (FieldTop + 16).ToString() + "px;left: " + (FieldLeft + FieldWidth).ToString() + "px;");
                            remBtn.Command += Remove_selListBox_Items;
                            break;
                        case 6: // Rich Text Field
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["MemoData"].Equals(DBNull.Value) || dtFieldData.Rows[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (fdr["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = string.Empty;
                                    }
                                    else
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = P3General.RTFtoText(dtFieldData.Rows[0]["MemoData"].ToString());
                                }
                            }
                            else
                            {
                                FieldValue = string.Empty;
                            }
                            TextBox mlRTFBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString()
                            };
                            mlRTFBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            mlRTFBox.TextMode = TextBoxMode.MultiLine;
                            mlRTFBox.EnableViewState = true;
                            // Add the control to the active panel.
                            TargetPanel.Controls.Add(mlRTFBox);
                            // Set editing properties for the control.
                            mlRTFBox.ReadOnly = false;
                            break;
                        case 7: // Combo List
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["TextData"].Equals(DBNull.Value) || dtFieldData.Rows[0]["TextData"].Equals(string.Empty))
                                {
                                    if (!fdr["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = dtFieldData.Rows[0]["TextData"];
                                }
                            }
                            // Create TextBox
                            TextBox cbxTextBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString(),
                                EnableViewState = true,
                                Enabled = true,
                                ReadOnly = false
                            };
                            // Create Drop Down
                            DropDownList CDD = new DropDownList()
                            {
                                ID = FieldID.ToString() + "_combo",
                                AppendDataBoundItems = true,
                                EnableViewState = true,
                                Enabled = true,
                                AutoPostBack = true
                            };
                            DataTable cddDT = new DataTable();
                            if (IsExternal)
                            {
                                cddDT = Record.Get_ExternalFieldData(FieldID);
                            }
                            else
                            {
                                cddDT = Record.Get_DDLValues(FieldID);
                            }
                            CDD.AppendDataBoundItems = true;
                            CDD.Items.Add(new ListItem("", "0"));
                            CDD.DataSource = cddDT;
                            CDD.DataTextField = "Caption";
                            CDD.DataValueField = "ID";
                            CDD.DataBind();
                            CDD.Items[0].Selected = true;
                            foreach (ListItem liCD in CDD.Items)
                            {
                                if (FieldValue.Equals(liCD.Text))
                                {
                                    CDD.ClearSelection();
                                    liCD.Selected = true;
                                }
                            }
                            cbxTextBox.Attributes.Add("style", "position: absolute;top: " + (FieldTop + 1).ToString() + "px;left: " + (FieldLeft + 1).ToString() + "px;width: " + (FieldWidth - 20).ToString() + "px;height: " + FieldHeight.ToString() + "px;border:none;z-index:100;");
                            CDD.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + (FieldHeight + 4).ToString() + "px;");
                            TargetPanel.Controls.Add(CDD);
                            TargetPanel.Controls.Add(cbxTextBox);

                            // Add Event Handler for CDD
                            CDD.SelectedIndexChanged += new EventHandler(CDD_SelectedIndexChanged);
                            break;
                        case 8: // Numeric Field
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["NumData"].Equals(DBNull.Value))
                                {
                                    if (fdr["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = string.Empty;
                                    }
                                    else
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = dtFieldData.Rows[0]["NumData"];
                                }
                            }
                            else
                            {
                                FieldValue = string.Empty;
                            }
                            TextBox slNumBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString()
                            };
                            slNumBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            slNumBox.EnableViewState = true;
                            // Add the control to the active panel.
                            TargetPanel.Controls.Add(slNumBox);
                            // Set editing properties for the control.
                            slNumBox.ReadOnly = false;
                            break;
                        case 10: // Field Label
                            Label lblName = new Label()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldName
                            };
                            lblName.Attributes.Add("style", "font-size: 8pt; position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px");
                            lblName.EnableViewState = true;
                            TargetPanel.Controls.Add(lblName);
                            break;
                        case 18: // RTF Lock Field
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["MemoData"].Equals(DBNull.Value) || dtFieldData.Rows[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (fdr["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = string.Empty;
                                    }
                                    else
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = P3General.RTFtoText(dtFieldData.Rows[0]["MemoData"].ToString());
                                }
                            }
                            else
                            {
                                FieldValue = string.Empty;
                            }
                            TextBox mlRTFLockBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString(),
                                ToolTip = FieldType.ToString()
                            };
                            mlRTFLockBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            mlRTFLockBox.TextMode = TextBoxMode.MultiLine;
                            mlRTFLockBox.EnableViewState = true;
                            // Add the control to the active panel.
                            TargetPanel.Controls.Add(mlRTFLockBox);
                            // Set editing properties for the control.
                            mlRTFLockBox.ReadOnly = true;
                            // Edit Field Content Button
                            ImageButton edtRtfBtn = new ImageButton()
                            {
                                ID = "add" + FieldID.ToString(),
                                ImageUrl = "~/images/edit_small.png",
                                OnClientClick = "javascript:editContents(" + FieldID.ToString() + ");",
                                BorderColor = System.Drawing.Color.DarkGray,
                                BorderWidth = 1,
                                BorderStyle = BorderStyle.Solid

                            };
                            TargetPanel.Controls.Add(edtRtfBtn);
                            edtRtfBtn.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + (FieldLeft + FieldWidth + 7).ToString() + "px;");
                            break;
                        case 20: // Text Lock Field
                            if (dtFieldData.Rows.Count > 0)
                            {
                                if (dtFieldData.Rows[0]["MemoData"].Equals(DBNull.Value) || dtFieldData.Rows[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (fdr["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = string.Empty;
                                    }
                                    else
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = dtFieldData.Rows[0]["MemoData"];
                                }
                            }
                            else
                            {
                                FieldValue = string.Empty;
                            }
                            TextBox mlTextLockBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString(),
                                ToolTip = FieldType.ToString()
                            };
                            mlTextLockBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            mlTextLockBox.TextMode = TextBoxMode.MultiLine;
                            mlTextLockBox.EnableViewState = true;
                            // Add the control to the active panel.
                            TargetPanel.Controls.Add(mlTextLockBox);
                            // Set editing properties for the control.
                            mlTextLockBox.ReadOnly = true;
                            // Edit Field Content Button
                            ImageButton edtTxtBtn = new ImageButton()
                            {
                                ID = "add" + FieldID.ToString(),
                                ImageUrl = "~/images/edit_small.png",
                                OnClientClick = "javascript:editContents(" + FieldID.ToString() + ");",
                                BorderColor = System.Drawing.Color.DarkGray,
                                BorderWidth = 1,
                                BorderStyle = BorderStyle.Solid

                            };
                            TargetPanel.Controls.Add(edtTxtBtn);
                            edtTxtBtn.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + (FieldLeft + FieldWidth + 7).ToString() + "px;");
                            break;
                        case 30:
                            if (dtFieldData.Rows.Count > 0)
							{
                                if (dtFieldData.Rows[0]["MemoData"].Equals(DBNull.Value) || dtFieldData.Rows[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (fdr["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = string.Empty;
                                    }
                                    else
                                    {
                                        FieldValue = fdr["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = dtFieldData.Rows[0]["MemoData"];
                                }
                            }
                            else
                            {
                                FieldValue = string.Empty;
                            }
                            TextBox slTextLockBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString(),
                                ToolTip = FieldType.ToString()
                            };
                            slTextLockBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px");
                            slTextLockBox.TextMode = TextBoxMode.SingleLine;
                            slTextLockBox.EnableViewState = true;
                            // Add the control to the active panel.
                            TargetPanel.Controls.Add(slTextLockBox);
                            // Set editing properties for the control.
                            slTextLockBox.ReadOnly = true;
                            // Edit Field Content Button
                            ImageButton slEdtTxtBtn = new ImageButton()
                            {
                                ID = "add" + FieldID.ToString(),
                                ImageUrl = "~/images/edit_small.png",
                                BorderColor = System.Drawing.Color.DarkGray,
                                OnClientClick = "showDigitalSignature(" + FieldID + ")",
                                BorderWidth = 1,
                                BorderStyle = BorderStyle.Solid

                            };
                            TargetPanel.Controls.Add(slEdtTxtBtn);
                            slEdtTxtBtn.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + (FieldLeft + FieldWidth + 10).ToString() + "px;");
                            break;
                    }
                }
            }
            ds.Dispose();
        }

        protected async void MenuTabs_MenuItemClick(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            ViewState["EditMode"] = false;
            await Initialize_ImprovementAsync(ItemID, ObjTypeID, ParentGroupID);
        }

        protected void EditMode(int editMode)
        {             
            switch (editMode)
            {
                case 0:
                    //Open for editing
                    LockFields(false);
                    pnlSave.Visible = true;
                    pnlCalculate.Visible = true;
                    pnlEdit.Visible = false;
                    BtnAddResp.ImageUrl = "~/images/btnAdd.png";
                    BtnNotApplicable.Enabled = true;
                    BtnRemoveResp.ImageUrl = "~/images/btnRemove.png";
                    break;
                case 1:
                    //Can be edited                    
                    LockFields(true);
                    pnlSave.Visible = false;
                    pnlCalculate.Visible = false;
                    pnlEdit.Visible = true;                    
                    BtnFinishStep.Enabled = false;
                    BtnNotApplicable.Enabled = false;
                    BtnAddResp.Enabled = false;
                    BtnAddResp.ImageUrl = "~/images/btnAdd_lock.png";
                    BtnRemoveResp.Enabled = false;
                    BtnRemoveResp.ImageUrl = "~/images/btnRemove_lock.png";
                    break;
                case 2:
                    //Cannot be edited
                    LockFields(true);
                    pnlSave.Visible = false;
                    pnlCalculate.Visible = false;
                    pnlEdit.Visible = false;
                    BtnFinishStep.Enabled = false;
                    BtnNotApplicable.Enabled = false;
                    BtnAddResp.Enabled = false;
                    BtnAddResp.ImageUrl = "~/images/btnAdd_lock.png";
                    BtnRemoveResp.Enabled = false;
                    BtnRemoveResp.ImageUrl = "~/images/btnRemove_lock.png";
                    break;
            }
        }

        protected async Task<int> CanEdit()
        {
            // Edit Mode 0 = "Open for Editing"
            // Edit Mode 1 = "Can be edited by user"
            // Edit Mode 2 = "Locked from Editing"
            int EditMode = 2;
            DataSet ds = (DataSet)ViewState["GenRecord"];
            int i = Convert.ToInt32(MenuTabs.SelectedValue);
            string IsNew = Request.QueryString["IsNew"].ToString();
            int IsComplete = Convert.ToInt32(ds.Tables[0].Rows[0]["Status"]);
            bool StepCompleted = Convert.ToBoolean(ds.Tables[1].Rows[i]["IsChecked"]);
            int ItemID = Convert.ToInt32(ds.Tables[0].Rows[0]["ItemID"]);
            int ObjTypeID = Convert.ToInt32(ds.Tables[1].Rows[i]["ObjTypeID"]);

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                string UserFullName = UserValues[1].ToString();
                int UserStatus = Convert.ToInt32(UserValues[3]);
                bool HasEditPermission = await P3General.HasEditPermissionAsync(6, ItemID, UserID);

                if (IsComplete != 0)
				{
					if (IsNew == "1" && Panel0.Visible)
					{
						EditMode = 0;
                        BtnFinishStep.Enabled = true;
					}
					else if (StepCompleted == false)
					{
						if (UserStatus == 1)
						{
							EditMode = 1;
						}
                        else if (i == 0 && Panel0.Visible)
						{                            
                            if (HasEditPermission)
							{
                                EditMode = 1;
							}
                        }
						else
						{
							BtnAddResp.Visible = true;
							BtnAddResp.Enabled = true;
							BtnRemoveResp.Visible = true;
							BtnRemoveResp.Enabled = true;
							DataTable dt = Record.Get_Responsible(ItemID, ObjTypeID);
                            
                            if (HasEditPermission)
							{
                                EditMode = 1;
							}
							if (dt.Rows.Count > 0)
							{
								foreach (DataRow dr in dt.Rows)
								{
									if (UserFullName == dr["ControlFullName"].ToString())
									{
										EditMode = 1;
									}
									else
									{
										int ControlID = Convert.ToInt32(dr["ControlID"]);
										DataTable dtEntityMember = Record.IsEntityMember(ControlID);
										foreach (DataRow dre in dtEntityMember.Rows)
										{
											if (UserID == Convert.ToInt32(dre["ControlID"]))
											{
												EditMode = 1;
											}
										}
									}

								}
							}
						}
					}
				}
			}
			
            ds.Dispose();
            return EditMode;
        }

        protected void LockFields(bool Locked)
        {
            // Identify selected panel.
            int index = Convert.ToInt32(MenuTabs.SelectedValue);
            Panel TargetPanel = new Panel();
            foreach (var panel in GetControlsOfType<Panel>(form1))
            {
                Panel p = panel;
                if (p.ID == "Panel" + index.ToString())
                {
                    TargetPanel = p;
                }
            }

            // create control types
            TextBox tb = new TextBox();
            CheckBox cb = new CheckBox();
            AjaxControlToolkit.ComboBox cbx = new AjaxControlToolkit.ComboBox();
            DropDownList dl = new DropDownList();
            ListBox lb = new ListBox();
            ImageButton ib = new ImageButton();
            AjaxControlToolkit.CalendarExtender ce = new AjaxControlToolkit.CalendarExtender();

            // If the panel is locked...
            if (Locked)
            {
                // For each control in the panel...
                foreach (Control ctrl in TargetPanel.Controls)
                {
                    if (ctrl is TextBox)
                    {
                        tb = (TextBox)ctrl;
                        tb.ReadOnly = true;
                        tb.CssClass = "ro_Control";
                    }
                    else if (ctrl is CheckBox)
                    {
                        cb = (CheckBox)ctrl;
                        cb.Enabled = false;
                        cb.CssClass = "ro_Control";
                    }
                    else if (ctrl is AjaxControlToolkit.ComboBox)
                    {
                        cbx = (AjaxControlToolkit.ComboBox)ctrl;
                        cbx.Enabled = false;
                        cbx.CssClass = "ro_Control";
                    }
                    else if (ctrl is DropDownList)
                    {
                        dl = (DropDownList)ctrl;
                        dl.Enabled = false;
                        dl.CssClass = "ro_Control";
                    }
                    else if (ctrl is ListBox)
                    {
                        lb = (ListBox)ctrl;
                        lb.Enabled = false;
                        lb.CssClass = "ro_Control";
                    }
                    else if (ctrl is ImageButton)
                    {
                        ib = (ImageButton)ctrl;
                        ib.Enabled = false;
                        ib.Visible = false;
                    }
                    else if (ctrl is AjaxControlToolkit.CalendarExtender)
                    {
                        ce = (AjaxControlToolkit.CalendarExtender)ctrl;
                        ce.Enabled = false;
                    }
                }
            }
            else // If the panel is not locked...
            {
                // For each control in the panel...
                foreach (Control ctrl in TargetPanel.Controls)
                {
                    if (ctrl is TextBox)
                    {
                        tb = (TextBox)ctrl;
                        if (tb.ToolTip.Contains("18") || tb.ToolTip.Contains("20") || tb.ToolTip.Contains("30"))
                        {
                            tb.ReadOnly = true;
                            tb.CssClass = "ro_Control";
                        }
                        else
                        {
                            tb.ReadOnly = false;
                            tb.CssClass = "open_Control";
                        }
                    }
                    else if (ctrl is CheckBox)
                    {
                        cb = (CheckBox)ctrl;
                        cb.Enabled = true;
                        cb.CssClass = "open_Control";
                    }
                    else if (ctrl is AjaxControlToolkit.ComboBox)
                    {
                        cbx = (AjaxControlToolkit.ComboBox)ctrl;
                        cbx.Enabled = true;
                        cb.CssClass = "open_Control";
                        cbx.ForeColor = System.Drawing.Color.Black;
                    }
                    else if (ctrl is DropDownList)
                    {
                        dl = (DropDownList)ctrl;
                        dl.Enabled = true;
                        dl.CssClass = "open_Control";
                    }
                    else if (ctrl is ListBox)
                    {
                        lb = (ListBox)ctrl;
                        lb.Enabled = true;
                        lb.CssClass = "open_Control";
                    }
                    else if (ctrl is ImageButton)
                    {
                        ib = (ImageButton)ctrl;
                        ib.Enabled = true;
                        ib.Visible = true;
                    }
                    else if (ctrl is AjaxControlToolkit.CalendarExtender)
                    {
                        ce = (AjaxControlToolkit.CalendarExtender)ctrl;
                        ce.Enabled = true;
                    }
                }
            }
        }

        public static IEnumerable<T> GetControlsOfType<T>(Control root) where T : Control
        {
            if (root is T t)
                yield return t;

            if (root is Control container)
                foreach (Control c in container.Controls)
                    foreach (var i in GetControlsOfType<T>(c))
                        yield return i;
        }

        protected void Remove_selListBox_Items(object sender, EventArgs e)
        {
            // Build Removed item list
            ImageButton remBtn = (ImageButton)sender;
            string strFieldID = remBtn.CommandArgument;
            DataTable dt = new DataTable();
            dt.Columns.Add("ItemID");
            dt.Columns.Add("FieldID");
            dt.Columns.Add("UserID");
            ListBox selListBox = (ListBox)this.FindControl(strFieldID);
            List<ListItem> deletedItems = new List<ListItem>();
            foreach (ListItem item in selListBox.Items)
            {
                if (item.Selected)
                {
                    int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    int FieldID = Convert.ToInt32(strFieldID.Substring(5));
                    int UserID = Convert.ToInt32(item.Value);
                    DataRow dr = dt.NewRow();
                    dr["ItemID"] = ItemID;
                    dr["FieldID"] = FieldID;
                    dr["UserID"] = UserID;
                    dt.Rows.Add(dr);
                    deletedItems.Add(item);
                }
            }

            foreach (ListItem item in deletedItems)
            {
                selListBox.Items.Remove(item);
            }

            string dtVS = strFieldID;
            ViewState[dtVS] = dt;
            dt.Dispose();
        }

        #endregion

        #region Buttons and Other Controls

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "updateuser":
                    string userFieldID = Session.Contents["UserFieldID"].ToString();
                    DataTable dtSelected = (DataTable)Session.Contents["dtSelected"];
                    ListBox lb = (ListBox)FindControl(userFieldID);
                    foreach (DataRow dr in dtSelected.Rows)
                    {
                        string Name = dr["ControlFullName"].ToString();
                        string ID = dr["ControlID"].ToString();
                        lb.Items.Add(new ListItem(Name, ID));
                    }
                    break;
                case "updatefield":
                    string updateFieldID = Session.Contents["UpdateFieldID"].ToString();
                    string UpdatedValue = Session.Contents["UpdatedValue"].ToString();
                    
                    // Get User Information
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');
                        string UserFullName = UserValues[1].ToString();

						// Find Field to Update and update it
						TextBox tb = (TextBox)FindControl(updateFieldID);
						string OldValue = tb.Text;
						string NewValue = UpdatedValue + "\r\n" +
							"[" + UserFullName + " " + DateTime.Now + "]\r\n" +
							"--------------------------------------------\r\n" +
							OldValue;
						tb.Text = NewValue;
						tb.Enabled = false;
						tb.CssClass = "ro_Control";
					}
					else
					{
						ScriptManager.RegisterStartupScript(udpDetails, GetType(), "Abort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
					}                    
                    break;
                case "digitalSignature":
                    string digitalFieldID = hdnDigitalSignatureID.Value;
                    string UserName = txtDSUserName.Text;
                    string Password = txtDSPassword.Text;
                    TextBox tbds = (TextBox)FindControl(digitalFieldID);
                    bool isFIPS = P3Security.IsFIPS();
                    string DigitalSignature = await P3Security.DigitalSignature(UserName, Password, isFIPS);
                    if (DigitalSignature != "No User")
					{
                        string SignatureValue = "Digitally approved by [ " + DigitalSignature + " ] [ " + DateTime.Now.ToString() + " ]";
                        tbds.Text = SignatureValue;
                        tbds.Enabled = false;
                        tbds.CssClass = "ro_Control";
					}
                    else
					{
                        ScriptManager.RegisterStartupScript(udpDetails, GetType(), "AuthFail", "alert('Username or password is incorrect. Please try again');", true);
                    }
                    break;
            }
        }

        protected async void ImageButton_Click(object sender, EventArgs e)
        {
            DataSet dsData = (DataSet)ViewState["GenRecord"];
            //int OrigID = Convert.ToInt32(dsData.Tables["Get_ItemData"].Rows[0]["OrigID"]);
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);           
            int SelectedTab = Convert.ToInt32(MenuTabs.SelectedValue);

            ImageButton btn = (ImageButton)sender;
            string arg = btn.CommandArgument;
            // Determine the currently active Panel.
            int index = Convert.ToInt32(MenuTabs.SelectedValue);
            Panel TargetPanel = new Panel();
            foreach (var panel in GetControlsOfType<Panel>(form1))
            {
                Panel p = panel;
                if (p.ID == "Panel" + index.ToString())
                {
                    TargetPanel = p;
                }
            }

            switch (arg)
            {
                case "SaveItem":
                    // Update main item record              
                    await Edit_RecordAsync(ItemID, "Item Edited");

                    // Update RecordsData table with any new field values.
                    await SaveFieldDataAsync(TargetPanel, ItemID, false);

                    // Set display properties for Save & Edit buttons.
                    bool saveItem = true;
                    ViewState["SaveItem"] = saveItem;
                    pnlSave.Visible = false;
                    pnlCalculate.Visible = false;
                    pnlEdit.Visible = true;
                    BtnFinishStep.Enabled = false;
                    BtnNotApplicable.Enabled = false;
                    LockFields(true);
                    BtnAddResp.Enabled = false;
                    BtnAddResp.Visible = false;
                    BtnAddResp.ImageUrl = "~/images/btnAdd_lock.png";
                    BtnRemoveResp.Enabled = false;
                    BtnRemoveResp.Visible = false;
                    BtnRemoveResp.ImageUrl = "~/images/btnRemove_lock.png";
                    ViewState["EditMode"] = false;
                    break;
                case "EditItem":
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
					{
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int UserID = Convert.ToInt32(UserValues[0]);
                        int UserStatus = Convert.ToInt32(UserValues[3]);
                        pnlSave.Visible = true;
                        pnlCalculate.Visible = true;
                        pnlEdit.Visible = false;
                        string IsNew = Request.QueryString["IsNew"].ToString();

                        if (IsNew == "1" && Panel0.Visible)
                        {
                            BtnFinishStep.Enabled = true;
                        }
                        else
                        {
                            if (UserStatus == 1)
                            {
                                BtnFinishStep.Enabled = true;
                                BtnNotApplicable.Enabled = true;
                            }
                            else
                            {
                                int ObjTypeID = Convert.ToInt32(dsData.Tables["Get_TabList"].Rows[SelectedTab]["ObjID"]);
                                DataTable dtAssigned = Record.Get_TabAssigned(ItemID, ObjTypeID, 6);

                                foreach (DataRow drA in dtAssigned.Rows)
                                {
                                    int ID = Convert.ToInt32(drA["ControlID"]);
                                    if (ID == UserID)
                                    {
                                        BtnFinishStep.Enabled = true;
                                        BtnNotApplicable.Enabled = false;
                                    }
                                }
                            }
                        }
                        BtnAddResp.Enabled = true;
                        BtnAddResp.Visible = true;
                        BtnAddResp.ImageUrl = "~/images/btnAdd.png";
                        BtnRemoveResp.Enabled = true;
                        BtnRemoveResp.Visible = true;
                        BtnRemoveResp.ImageUrl = "~/images/btnRemove.png";
                        LockFields(false);
                        ViewState["EditMode"] = true;
                    }
                    break;
                case "Attach":
                    // Activate Attchments button
                    string objID = dsData.Tables["Get_TabList"].Rows[SelectedTab]["ObjID"].ToString();
                    int recID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    string IsEdit = "0";
                    if (pnlSave.Visible)
                    {
                        IsEdit = "1";
                    }
                    ScriptManager.RegisterStartupScript(udpToolBar, GetType(), "attachments", "openAttachment(" + recID + ", 6, " + objID + ", " + IsEdit + ")", true);
                    break;
                case "Calculate":
                    await Edit_RecordAsync(ItemID, "Item Edited");
                    await SaveFieldDataAsync(TargetPanel, ItemID, true);
                    break;
                case "Close":
                    ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "CloseRecord", "window.close();", true);
                    break;
                case "Print":
                    DataSet pds = (DataSet)ViewState["GenRecord"];
                    Session["PrintData"] = pds;
                    ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "PrintRecord", "printRecord(6);", true);
                    break;
            }
        }

        protected void BtnInstructions_Click(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(MenuTabs.SelectedValue);
            Panel TargetPanel = new Panel();
            foreach (var panel in GetControlsOfType<Panel>(form1))
            {
                Panel p = (Panel)panel;
                if (p.ID == "Panel" + index.ToString())
                {
                    TargetPanel = p;
                }
            }

            string arg = BtnInstructions.CommandArgument;
            switch (arg)
            {
                case "Open":
                    pnlInstructions.Visible = true;
                    BtnInstructions.CommandArgument = "Close";
                    BtnInstructions.ImageUrl = "~/images/blueup.png";
                    BtnInstructions.Attributes.Add("onmouseover", "javascript: this.src = 'images/blueup_mo.png'");
                    BtnInstructions.Attributes.Add("onmouseout", "javascript: this.src = 'images/blueup.png'");
                    //TargetPanel.Attributes.Add("style", "height: 435px");
                    ClientScript.RegisterStartupScript(GetType(), "Smaller", "resizeDetails(smaller);", true);
                    break;
                case "Close":
                    pnlInstructions.Visible = false;
                    BtnInstructions.CommandArgument = "Open";
                    BtnInstructions.ImageUrl = "~/images/bluedown.png";
                    BtnInstructions.Attributes.Add("onmouseover", "javascript: this.src = 'images/bluedown_mo.png'");
                    BtnInstructions.Attributes.Add("onmouseout", "javascript: this.src = 'images/bluedown.png'");
                    ClientScript.RegisterStartupScript(GetType(), "Larger", "resizeDetails(larger);", true);
                    //TargetPanel.Attributes.Add("style", "height: 485px");
                    break;
            }
        }

        protected async void BtnFinishStep_Click(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(MenuTabs.SelectedValue);
            int ModuleID = 6;
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
            DataSet ds = (DataSet)ViewState["GenRecord"];
            int ObjID = Convert.ToInt32(ds.Tables["Get_TabList"].Rows[index]["ObjID"]);
            if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                string UserFullName = UserValues[1].ToString();

				// Identify selected panel.
				Panel TargetPanel = new Panel();
				foreach (var panel in GetControlsOfType<Panel>(form1))
				{
					Panel p = panel;
					if (p.ID == "Panel" + index.ToString())
					{
						TargetPanel = p;
					}
				}

				pnlSave.Visible = false;
				pnlEdit.Visible = false;

				BtnFinishStep.Enabled = false;
				BtnAddResp.Enabled = false;
				BtnAddResp.Visible = false;
				BtnRemoveResp.Enabled = false;
				BtnRemoveResp.Visible = false;
				LockFields(true);

                if (index < (ds.Tables["Get_TabList"].Rows.Count - 1))
				{
                    await SaveFieldDataAsync(TargetPanel, ItemID, false);
                    int nextObjID = Convert.ToInt32(ds.Tables["Get_TabList"].Rows[index + 1]["ObjTypeID"]);
                    if (!ds.Tables["Get_TabList"].Rows[index + 1]["PopUpType"].Equals(DBNull.Value) && !ds.Tables["Get_TabList"].Rows[index + 1]["PopUpType"].Equals(0))
                    {
                        if (ViewState["ErrorState"].ToString() != "true")
                        {
                            string str = index.ToString() + "," + ItemID.ToString() + "," + nextObjID.ToString() + "," + "0";
                            ScriptManager.RegisterStartupScript(udpFinish, udpFinish.GetType(), "Assignment", "openAssignment(" + str + ");", true);
                            ViewState["ErrorState"] = "false";
                        }                        
                    }
                    else
                    {
                        if (Record.Get_Responsible(ItemID, nextObjID).Rows.Count > 0)
                        {
                            foreach (DataRow dr in Record.Get_Responsible(ItemID, nextObjID).Rows)
                            {
                                string ItemName = ds.Tables["Get_ItemData"].Rows[0]["Name"].ToString();
                                string TabName = ds.Tables["Get_TabList"].Rows[index + 1]["Caption"].ToString();

                                if (Convert.ToInt32(dr["ControlType"]) == 6)
                                {
                                    foreach (DataRow dr2 in Record.Get_UserResp(1, Convert.ToInt32(dr["ControlID"])).Rows)
                                    {
                                        int recID = Convert.ToInt32(dr2["ControlID"]);
                                        string recName = dr2["ControlFullName"].ToString();
                                        Record.Trigger_Event(index, 6, ItemID, nextObjID, ParentGroupID, ItemName, TabName, recID, recName);
                                    }
                                }
                                else if (Convert.ToInt32(dr["ControlType"]) == 1)
                                {
                                    int recID = Convert.ToInt32(dr["ControlID"]);
                                    string recName = dr["ControlFullName"].ToString();
                                    Record.Trigger_Event(index, 6, ItemID, nextObjID, ParentGroupID, ItemName, TabName, recID, recName);
                                }
                            }
                        }
                        //await SaveFieldDataAsync(TargetPanel, ItemID, false);
                        if (ViewState["ErrorState"].ToString() != "true")
                        {
                            Record.Complete_Tab(index, ModuleID, ItemID, ObjID, UserFullName, UserID, 0);
                            await Edit_RecordAsync(ItemID, "Step Finished");
                            ViewState["ErrorState"] = "false";
                        }
                    }
                }
				else
				{
                    await SaveFieldDataAsync(TargetPanel, ItemID, false);
                    if (ViewState["ErrorState"].ToString() != "true")
                    {
                        Record.Complete_Tab(index, ModuleID, ItemID, ObjID, UserFullName, UserID, 0);
                        await Edit_RecordAsync(ItemID, "Step Finished");
                        ViewState["ErrorState"] = "false";
                    }
                }
                await Initialize_ImprovementAsync(ItemID, ParentGroupID, ObjTypeID);
				ViewState["SaveItem"] = true;
				ViewState["EditMode"] = false;
				EditMode(await CanEdit());
			}
			else
			{
				ScriptManager.RegisterStartupScript(udpFinish, GetType(), "Abort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
			}            
        }

        protected async void BtnNotApplicable_Click(object sender, EventArgs e)
        {
            // Identify selected panel.
            DataSet ds = (DataSet)ViewState["GenRecord"];
            DataTable dtTabs = ds.Tables[1];
            int CurrentIndex = Convert.ToInt32(MenuTabs.SelectedValue);
            int CurrentObjID = Convert.ToInt32(dtTabs.Rows[CurrentIndex]["ObjID"]);
            int CurrentItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int CurrentParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            int CurrentObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);

            BtnSave.Enabled = false;
            BtnSave.ImageUrl = "~/images/save_lock.png";
            lblSave.ForeColor = System.Drawing.Color.LightGray;

            BtnEdit.Enabled = false;
            BtnEdit.ImageUrl = "~/images/edit_lock.png";
            lblEdit.ForeColor = System.Drawing.Color.LightGray;


            Record.Make_NotApplicable(6, CurrentItemID, CurrentObjID);
            dtTabs.Dispose();
            ds.Dispose();

            BtnFinishStep.Enabled = false;
            BtnNotApplicable.Enabled = false;
            BtnAddResp.Enabled = false;
            BtnAddResp.Visible = false;
            BtnRemoveResp.Enabled = false;
            BtnRemoveResp.Visible = false;

            LockFields(true);
            await Edit_RecordAsync(CurrentItemID, "Step made not applicable");
            await Initialize_ImprovementAsync(CurrentItemID, CurrentParentGroupID, CurrentObjTypeID);
            ViewState["SaveItem"] = true;
            ViewState["EditMode"] = false;
            EditMode(await CanEdit());
        }

        protected async void btnRefreshRecord_Click(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);

            await Initialize_ImprovementAsync(ItemID, ParentGroupID, ObjTypeID);
        }

        protected async void CDD_SelectedIndexChanged(object sender, EventArgs e)
        {

            Panel TargetPanel = new Panel();
            Panel[] Panels = new Panel[50];
            for (int p = 0; p < 50; p++)
            {
                Panels[p] = (Panel)FindControl("Panel" + p.ToString());
            }

            foreach (Panel pnl in Panels)
            {
                if (pnl.Visible)
                {
                    TargetPanel = pnl;
                }
            }

            DropDownList ddl = (DropDownList)sender;
            string[] IDSplit = ddl.ID.Split('_');
            TextBox tb = await Task.FromResult((TextBox)TargetPanel.FindControl(IDSplit[0]));
            tb.Text = ddl.SelectedItem.Text;
            ddl.SelectedValue = "0";
        }

        #endregion

        #region Edit/Save Methods

        protected async Task Edit_RecordAsync(int ItemID, string TaskName)
        {
            DataSet dsData = (DataSet)ViewState["GenRecord"];
            int x = Convert.ToInt32(MenuTabs.SelectedValue);
            int OrigID = Convert.ToInt32(dsData.Tables["Get_ItemData"].Rows[0]["OrigID"]);
            string TabName = dsData.Tables["Get_TabList"].Rows[x]["Caption"].ToString();
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);

                string UserData = ticket.UserData;
                string[] UserValues = UserData.Split(',');
                int UserID = Convert.ToInt32(UserValues[0]);
                string UserFullName = UserValues[1].ToString();
				await Record.Edit_RecordAsync(6, ItemID, UserID, UserFullName);
				Record.Edit_History(6, OrigID, TabName, TaskName, UserFullName);
			}
            else
			{
				ScriptManager.RegisterStartupScript(udpToolBar, GetType(), "Abort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
			}
        }

        protected async Task SaveFieldDataAsync(Panel TargetPanel, int ItemID, bool isCalc)
        {
            int ModuleID = 6;
            int SelectedTab = Convert.ToInt32(MenuTabs.SelectedValue);
            DataSet dsData = (DataSet)ViewState["GenRecord"];
            int ObjID = Convert.ToInt32(dsData.Tables["Get_TabList"].Rows[SelectedTab]["ObjID"]);
            DataTable TabFields = Record.Load_OnePane(ItemID, ObjID, ModuleID, 0);
            int FieldCount = (TabFields.Rows.Count);

            try
            {
                int i = 0;
                for (i = 0; i < FieldCount; i++)
                {
                    int FieldID = Convert.ToInt32(TabFields.Rows[i]["FieldID"]);
                    int FieldType = Convert.ToInt32(TabFields.Rows[i]["FieldType"]);
                    bool IsMandatory = Convert.ToBoolean(TabFields.Rows[i]["IsMandatory"]);                    
                    DataTable dtInternalEvent = Record.Has_InternalEvent(FieldID);
                    await SaveMethodAsync(ModuleID, TargetPanel, ItemID, SelectedTab, dsData, TabFields, i, FieldID, FieldType, dtInternalEvent, IsMandatory);
                }
                await Record.Purge_FieldDataAsync();
                ViewState["IsUpdated"] = false;
                if (!isCalc)
                {                    
                    ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "myScript", "recordRefresh();alert('Item successfully saved');recordRefreshLocal();", true);
                    //EditMode(1);
                }
                else
                {                    
                    ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "myScript", "alert('Calculation complete');recordRefreshLocal();", true);
                    //EditMode(0);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "myScript", "alert('" + ex.Message + "');", true);
            }
        }

        private async Task SaveMethodAsync(int ModuleID, Panel TargetPanel, int ItemID, int SelectedTab, DataSet dsData, DataTable TabFields, int i, int FieldID, int FieldType, DataTable dtInternalEvent, bool IsMandatory)
        {
            ViewState["ErrorState"] = "false";
            if (FieldType != 10)
            {
                bool IsCalcResult = await Record.Get_FieldTypeAsync(FieldID);
                DataRow[] foundrow = dsData.Tables[3].Select("FieldID = " + FieldID + " AND ModuleID = " + ModuleID);
                object initValue = string.Empty;
                object TextValue = string.Empty;
                if (foundrow.Length > 0)
                {
                    int Max = (foundrow.Length);
                    for (int z = 0; z < Max; z++)
                    {
                        switch (FieldType)
                        {
                            case 0:
                            case 7:
                                TextBox slTextBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                                initValue = foundrow[0]["TextData"].ToString();
                                TextValue = slTextBox.Text;
                                if (IsMandatory && string.IsNullOrEmpty(slTextBox.Text))
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (IsCalcResult)
                                {
                                    TextValue = await Record.CalculateFieldAsync(ItemID, FieldID);
                                }
                                if (!initValue.Equals(null) && !TextValue.Equals(initValue))
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                    if (Record.Has_InternalEvent(FieldID).Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (slTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                        }
                                    }
                                }
                                break;
                            case 1:
                            case 20:
                            case 30:
                                TextBox mlTextBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                                initValue = foundrow[0]["MemoData"].ToString();
                                TextValue = mlTextBox.Text;
                                if (IsMandatory && string.IsNullOrEmpty(mlTextBox.Text))
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (!initValue.Equals(null) && !TextValue.Equals(initValue))
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue.ToString(), initValue);
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (mlTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                        }
                                    }
                                }
                                break;
                            case 6:
                            case 18:
                                TextBox mlRTFBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                                initValue = foundrow[0]["MemoData"].ToString();
                                TextValue = mlRTFBox.Text;
                                if (IsMandatory && string.IsNullOrEmpty(mlRTFBox.Text))
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (!TextValue.Equals(initValue))
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, P3General.TextToRTF(TextValue.ToString()), initValue);
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (mlRTFBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                        }
                                    }
                                }
                                break;
                            case 2:
                                CheckBox CheckBox = (CheckBox)TargetPanel.FindControl(FieldID.ToString());
                                initValue = foundrow[0]["NumData"];
                                if (initValue.ToString() == string.Empty)
                                {
                                    initValue = 0;
                                }
                                if (Convert.ToInt32(initValue) == 0)
                                {
                                    if (CheckBox.Checked == true)
                                    {
                                        await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, 1, initValue);
                                    }
                                }
                                else
                                {
                                    if (CheckBox.Checked == false)
                                    {
                                        await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, 0, initValue);
                                    }
                                }
                                break;
                            case 3:
                                DropDownList DDL = (DropDownList)TargetPanel.FindControl(FieldID.ToString());
                                initValue = foundrow[0]["TextData"];
                                if (IsMandatory && DDL.SelectedValue == "0")
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (DDL.Items.Count > 0)
                                {
                                    TextValue = DDL.SelectedItem.Text;
                                }
                                else
                                {
                                    TextValue = initValue;
                                }
                                if (TextValue.Equals(initValue))
                                {
                                    break;
                                }
                                else
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (DDL.SelectedItem.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                        }
                                    }
                                    break;
                                }
                            case 4:
                            case 16:
                                TextBox dTextBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                                initValue = foundrow[0]["DateData"].ToString();
                                TextValue = dTextBox.Text;
                                if (IsMandatory && string.IsNullOrEmpty(dTextBox.Text))
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (IsCalcResult)
                                {
                                    TextValue = await Record.CalculateFieldAsync(ItemID, FieldID);
                                }
                                if (TextValue.Equals("MM/dd/yyyy"))
                                {
                                    TextValue = initValue;
                                }
                                if (TextValue.Equals(initValue))
                                {
                                    break;
                                }
                                else
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (dTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                        }
                                    }
                                    break;
                                }
                            case 5:
                                ListBox selListBox = (ListBox)TargetPanel.FindControl(FieldID.ToString());
                                if (IsMandatory && selListBox.Items.Count == 0)
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (selListBox.Items.Count > 0)
                                {
                                    for (int n = 0; n < selListBox.Items.Count; n++)
                                    {
                                        int UserID = Convert.ToInt32(selListBox.Items[n].Value);
                                        string UserName = selListBox.Items[n].Text;
                                        await Record.Update_UserFieldAsync(ItemID, FieldID, UserID, UserName, ModuleID, 0, 1);
                                    }

                                    if (ViewState[selListBox.ID] != null)
                                    {
                                        DataTable dtRemoved = (DataTable)ViewState[selListBox.ID];
                                        if (dtRemoved.Rows.Count > 0)
                                        {
                                            foreach (DataRow dr in dtRemoved.Rows)
                                            {
                                                int UserID = Convert.ToInt32(dr["UserID"]);
                                                await Record.Update_UserFieldAsync(ItemID, FieldID, UserID, string.Empty, ModuleID, 0, 0);
                                            }
                                        }
                                    }
                                }
                                break;
                            case 8:
                                TextBox slNumBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                                initValue = foundrow[0]["NumData"].ToString();
                                TextValue = slNumBox.Text;
                                if (IsMandatory && string.IsNullOrEmpty(slNumBox.Text))
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (TextValue.Equals(initValue))
                                {
                                    break;
                                }
                                else
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (slNumBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                        }
                                    }
                                    break;
                                }
                        }
                    }
                }
                else
                {
                    DataRow[] newRow;
                    newRow = TabFields.Select("FieldID = " + FieldID);
                    if (newRow[0]["DefaultValue"].Equals(DBNull.Value))
                    {
                        switch (FieldType)
                        {
                            case 0:
                            case 1:
                            case 3:
                            case 6:
                            case 7:
                            case 18:
                            case 20:
                                initValue = string.Empty;
                                break;
                            case 2:
                            case 8:
                                initValue = 0;
                                break;
                            case 4:
                            case 16:
                                initValue = "01/01/1900";
                                break;
                        }
                    }
                    else
                    {
                        initValue = newRow[0]["DefaultValue"];
                    }
                    switch (FieldType)
                    {
                        case 0:
                        case 7:
                            TextBox slTextBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                            TextValue = slTextBox.Text;                            
                            if (IsCalcResult)
                            {
                                TextValue = await Record.CalculateFieldAsync(ItemID, FieldID);
                            }
                            if (TextValue.Equals(initValue))
                            {
                                break;
                            }
                            else
                            {
                                await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                if (dtInternalEvent.Rows.Count > 0)
                                {
                                    int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                    if (slTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                    {
                                        await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                    }
                                }                                
                            }
                            break;
                        case 1:
                        case 6:
                        case 18:
                        case 20:
                        case 30:
                            TextBox mlTextBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                            TextValue = mlTextBox.Text;
                            if (TextValue.Equals(initValue))
                            {
                                break;
                            }
                            else
                            {
                                await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                if (dtInternalEvent.Rows.Count > 0)
                                {
                                    int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                    if (mlTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                    {
                                        await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                    }
                                }
                                break;
                            }
                        case 2:
                            CheckBox CheckBox = (CheckBox)TargetPanel.FindControl(FieldID.ToString());
                            TextValue = "false";
                            if (CheckBox.Checked)
                            {
                                TextValue = "true";
                            }
                            if (initValue.Equals(1))
                            {
                                if (TextValue.ToString() == "false")
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, 0, initValue);
                                }
                            }
                            else
                            {
                                if (TextValue.ToString() == "true")
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, 1, initValue);
                                }
                            }
                            break;
                        case 3:
                            DropDownList DDL = (DropDownList)TargetPanel.FindControl(FieldID.ToString());
                            if (DDL.Items.Count > 0 && DDL.SelectedIndex >= 0)
                            {
                                TextValue = DDL.SelectedItem.Text;
                            }
                            else
                            {
                                TextValue = string.Empty;
                            }
                            if (TextValue.Equals(initValue))
                            {
                                break;
                            }
                            else
                            {
                                await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                if (dtInternalEvent.Rows.Count > 0)
                                {
                                    if (DDL.SelectedItem.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                    }
                                }
                                break;
                            }
                        case 4:
                        case 16:
                            TextBox dTextBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                            TextValue = dTextBox.Text;
                            if (IsCalcResult)
                            {
                                TextValue = await Record.CalculateFieldAsync(ItemID, FieldID);
                            }
                            if (TextValue.Equals("MM/dd/yyyy"))
                            {
                                TextValue = initValue;
                            }
                            if (TextValue.Equals(initValue))
                            {
                                break;
                            }
                            else
                            {
                                if (TextValue.ToString() == "")
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, Convert.ToDateTime("01/01/1900"), initValue);
                                }
                                else if (TextValue.ToString() == string.Empty)
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, Convert.ToDateTime("01/01/1900"), initValue);
                                }
                                else
                                {
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, Convert.ToDateTime(TextValue), initValue);
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (dTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                        }
                                    }
                                }
                                break;
                            }
                        case 5:
                            ListBox selListBox = (ListBox)TargetPanel.FindControl(FieldID.ToString());
                            if (selListBox.Items.Count > 0)
                            {
                                for (int n = 0; n < selListBox.Items.Count; n++)
                                {
                                    int UserID = Convert.ToInt32(selListBox.Items[n].Value);
                                    string UserName = selListBox.Items[n].Text;
                                    await Record.Update_UserFieldAsync(ItemID, FieldID, UserID, UserName, ModuleID, 0, 1);
                                }

                                if (ViewState[selListBox.ID] != null)
                                {
                                    DataTable dtRemoved = (DataTable)ViewState[selListBox.ID];
                                    if (dtRemoved.Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in dtRemoved.Rows)
                                        {
                                            int UserID = Convert.ToInt32(dr["UserID"]);
                                            await Record.Update_UserFieldAsync(ItemID, FieldID, UserID, string.Empty, ModuleID, 0, 0);
                                        }
                                    }
                                }
                            }
                            break;
                        case 8:
                            TextBox slNumBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                            TextValue = slNumBox.Text;
                            if (TextValue.Equals(initValue))
                            {
                                break;
                            }
                            else
                            {
                                await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, Convert.ToInt32(TextValue), initValue);
                                if (dtInternalEvent.Rows.Count > 0)
                                {
                                    int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                    if (slNumBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                    {
                                        await Record.Trigger_Internal_EventAsync(EventID, ItemID);
                                    }
                                }
                                break;
                            }
                    }
                }
            }
        }

        #endregion

    }
}