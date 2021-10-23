using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Web.Security;
using System.Threading;
using System.Threading.Tasks;
using System.Configuration;

namespace Paradigm3
{
    public partial class ViewRecord : SqlViewStatePage
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
                    int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
                    int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);

                    ViewState["IsUpdated"] = false;
                    MenuTabs.Items[0].Selected = true;
                    await Initialize_RecordAsync(ItemID, ParentGroupID, ObjTypeID);
                    await EditModeAsync(await CanEditAsync());
                }                
            }
        }

        #region Initialize Record

        protected async void Page_Init(object sender, EventArgs e)
        {
            Session["SourcePage"] = "ViewRecord.aspx";
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);

            await GenerateFieldsAndValuesAsync(4, ItemID, ObjTypeID, ParentGroupID);
        }

        private async Task<DataSet> GetRecordAsync(int ModuleID, int ItemID, int ObjTypeID)
        {
            return await Task.Run(() => { return Record.GetRecord(ModuleID, ItemID, ObjTypeID); });
        }

        protected async Task Initialize_RecordAsync(int ItemID, int ParentGroupID, int ObjTypeID)
        {
            // Get Record Data and add to ViewState.
            DataSet ds = await GetRecordAsync(4, ItemID, ObjTypeID);
            ViewState["GenRecord"] = ds;
            string OrigID = ds.Tables[0].Rows[0]["OrigID"].ToString();

            // Index the selected tab.
            int index = Convert.ToInt32(MenuTabs.SelectedValue);

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
            await EditModeAsync(await CanEditAsync());

            pnlProperties.Visible = true;
            pnlParaLink.Visible = true;
            pnlRelatedAI.Visible = true;
            pnlAttachment.Visible = true;
            pnlClose.Visible = true;

            // Activate Properties button
            BtnProperties.Attributes.Add("onclick", "openProperties(" + ItemID + ", 4, 0);");
            // Activate ParaLinks button
            BtnParaLink.Attributes.Add("onclick", "openParaLink(" + OrigID + ",4)");
            // Activate Related Action Items button
            string strName = ds.Tables[0].Rows[0]["Name"].ToString();
            BtnRelatedAI.Attributes.Add("onclick", "openRelatedAI(" + Server.UrlEncode(OrigID) + ", 4);");

            // Generate the initial record details and display on the form.
            txtNameData.Text = strName;
            txtLabelData.Text = string.Empty;
            if (ds.Tables[0].Rows[0]["LabelName"].ToString().Length > 0)
            {
                txtLabelData.Text = ds.Tables[0].Rows[0]["LabelName"].ToString();
            }

            lblStatusData.Text = "Complete";
            if (ds.Tables[0].Rows[0]["Status"].ToString().Length > 0 && Convert.ToInt32(ds.Tables[0].Rows[0]["Status"]) == 2)
            {
                lblStatusData.Text = "Open";
            }

            lblIDData.Text = ItemID.ToString() + "/" + ds.Tables[0].Rows[0]["OrigID"].ToString();
            lblCreatedData.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["CreateDate"]).ToShortDateString();
            lblVersionData.Text = string.Empty;
            if (ds.Tables[0].Rows[0]["Version"].ToString().Length > 0)
            {
                lblVersionData.Text = "(" + ds.Tables[0].Rows[0]["Version"].ToString() + ")";
            }
            lblStepName.Text = string.Empty;
            if (ds.Tables[1].Rows[index]["Caption"].ToString().Length > 0)
            {
                lblStepName.Text = ds.Tables[1].Rows[index]["Caption"].ToString();
            }

            // Set initial BtnInstructions properties.
            pnlInstructions.Visible = false;
            BtnInstructions.Attributes.Add("onmouseover", "javascript: this.src = 'images/bluedown_mo.png'");
            BtnInstructions.Attributes.Add("onmouseout", "javascript: this.src = 'images/bluedown.png'");

            // Display available Tab icons.
            int TotalTabs = (ds.Tables[1].Rows.Count - 1);
            int i = 0;
            for (i = 0; i <= 15; i++)
            {
                if (i > TotalTabs) // Disable and hide tabs higher than total tab count
                {
                    MenuTabs.Items[i].ImageUrl = "";
                    MenuTabs.Items[i].Enabled = false;
                }
                else if (Convert.ToInt32(ds.Tables[1].Rows[i]["IsNotApplicable"]) == 1)
                {
                    MenuTabs.Items[i].Enabled = false;
                    MenuTabs.Items[i].ImageUrl = "~/images/disabled/disabled_" + (i + 1).ToString() + ".jpg";
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
        }

        protected async Task GenerateFieldsAndValuesAsync(int ModuleID, int ItemID, int ParentGroupID, int ObjTypeID)
        {
            // Define all available Record pages in an array
            Panel TargetPanel = new Panel();
            Panel[] tgtPanel = new Panel[50];
            for (int p = 0; p < 50; p++)
            {
                tgtPanel[p] = (Panel)FindControl("Panel" + p.ToString());
            }

            // Identify the target panel based on the selected tab.
            DataSet ds = await GetRecordAsync(ModuleID, ItemID, ObjTypeID);//Record.GetRecord(ModuleID, ItemID, ObjTypeID);
            ViewState.Add("GenRecord", ds);
            int TotalTabs = (ds.Tables["Get_TabList"].Rows.Count - 1);
            int i = 0;
            // For each available page in the record...
            for (i = 0; i <= TotalTabs; i++)
            {
                //  Get ObjID for the page.
                int ObjID = Convert.ToInt32(ds.Tables["Get_TabList"].Rows[i]["ObjID"]);
                //  Identify the current Tab & Panel to be used.
                TargetPanel = tgtPanel[i];
                TargetPanel.Controls.Clear();
                TargetPanel.Attributes.Add("style", "position: relative");
                //  Get List of Fields and Values.
                DataRow[] FieldRows = ds.Tables[2].Select("ObjID = " + ObjID);
                //  Populate fields and add to Target Panel.
                for (int fr = 0; fr < FieldRows.Length; fr++)
                {
                    int FieldID = Convert.ToInt32(FieldRows[fr]["FieldID"]);
                    bool IsMandatory = Convert.ToBoolean(FieldRows[fr]["IsMandatory"]);
                    string FieldName = FieldRows[fr]["FieldName"].ToString();
                    int FieldType = Convert.ToInt32(FieldRows[fr]["FieldType"]);
                    bool IsExternal = Convert.ToBoolean(FieldRows[fr]["IsExternalField"]);
                    object DefaultValue = FieldRows[fr]["DefaultValue"];
                    object FieldValue = string.Empty;
                    int FieldTop = Convert.ToInt32(FieldRows[fr]["DisplayTop"]);
                    int FieldLeft = Convert.ToInt32(FieldRows[fr]["Displayleft"]);
                    int FieldWidth = Convert.ToInt32(FieldRows[fr]["DisplayWidth"]);
                    int FieldHeight = Convert.ToInt32(FieldRows[fr]["DisplayHeight"]);
                    DataRow[] drFieldData = ds.Tables[3].Select("FieldID = " + FieldID);
                    Label lblMandatory = new Label()
                    {
                        Text = "*"
                    };
                    if (IsMandatory && FieldType != 10)
                    {
                        TargetPanel.Controls.Add(lblMandatory);
                    }
                    lblMandatory.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + (FieldLeft - 10).ToString() + "px;color: red;");
                    switch (FieldType)
                    {
                        case 0: // Single-Line Text
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["TextData"].Equals(DBNull.Value) || drFieldData[0]["TextData"].Equals(string.Empty))
                                {
                                    if (!FieldRows[fr]["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = drFieldData[0]["TextData"];
                                }
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
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["MemoData"].Equals(DBNull.Value) || drFieldData[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (!FieldRows[fr]["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = drFieldData[0]["MemoData"];
                                }
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
                            FieldValue = 0;
                            if (drFieldData.Length > 0)
                            {
                                if (!drFieldData[0]["NumData"].Equals(DBNull.Value))
                                {
                                    FieldValue = drFieldData[0]["NumData"];
                                }
                            }
                            CheckBox CheckBox = new CheckBox()
                            {
                                ID = FieldID.ToString()
                            };
                            CheckBox.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px;width: " + FieldWidth.ToString() + "px;height: " + FieldHeight.ToString() + "px;font-size: 8pt;");
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
                        //case 7: // Combo List
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["TextData"].Equals(DBNull.Value) || drFieldData[0]["TextData"].Equals(string.Empty))
                                {
                                    if (!FieldRows[fr]["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = drFieldData[0]["TextData"];
                                }
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
                            TargetPanel.Controls.Add(DDL);
                            // Set editing properties for the control.
                            DDL.Enabled = true;
                            break;
                        case 4:
                        case 16: // Date Field
                            FieldValue = "MM/dd/yyyy";
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["DateData"].Equals(DBNull.Value) || drFieldData[0]["DateData"].Equals(Convert.ToDateTime("1900/01/01")))
                                {
                                    if (!FieldRows[fr]["DefaultValue"].Equals(DBNull.Value) || FieldRows[fr]["DefaultValue"].Equals(string.Empty))
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = drFieldData[0]["DateData"];
                                }
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
                                dTextBox.Text = Convert.ToDateTime(FieldValue).ToShortDateString();
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
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["MemoData"].Equals(DBNull.Value) || drFieldData[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (!FieldRows[fr]["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    if (P3General.IsRichTextString(drFieldData[0]["MemoData"].ToString()))
                                    {
                                        FieldValue = P3General.RTFtoText(drFieldData[0]["MemoData"].ToString());
                                    }
                                    else
                                    {
                                        FieldValue = drFieldData[0]["MemoData"].ToString();
                                    }
                                }
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
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["TextData"].Equals(DBNull.Value) || drFieldData[0]["TextData"].Equals(string.Empty))
                                {
                                    if (!FieldRows[fr]["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = drFieldData[0]["TextData"];
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
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["NumData"].Equals(DBNull.Value))
                                {
                                    if (!FieldRows[fr]["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = drFieldData[0]["NumData"];
                                }
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
                            Label lblFieldName = new Label()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldName,
                                ToolTip = FieldID.ToString()
                            };
                            lblFieldName.Attributes.Add("style", "font-size: 8pt; position: absolute;top: " + FieldTop.ToString() + "px;left: " + FieldLeft.ToString() + "px");
                            lblFieldName.EnableViewState = true;
                            TargetPanel.Controls.Add(lblFieldName);
                            break;
                        case 18: // RTF Lock Field
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["MemoData"].Equals(DBNull.Value) || drFieldData[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (!FieldRows[fr]["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    if (P3General.IsRichTextString(drFieldData[0]["MemoData"].ToString()))
                                    {
                                        FieldValue = P3General.RTFtoText(drFieldData[0]["MemoData"].ToString());
                                    }
                                    else
                                    {
                                        FieldValue = drFieldData[0]["MemoData"].ToString();
                                    }
                                }
                            }
                            TextBox mlRTFLockBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString(),
                                ToolTip = FieldID.ToString()
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
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["MemoData"].Equals(DBNull.Value) || drFieldData[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (!FieldRows[fr]["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    if (P3General.IsRichTextString(drFieldData[0]["MemoData"].ToString()))
                                    {
                                        FieldValue = P3General.RTFtoText(drFieldData[0]["MemoData"].ToString());
                                    }
                                    else
                                    {
                                        FieldValue = drFieldData[0]["MemoData"].ToString();
                                    }
                                }
                            }
                            TextBox mlTextLockBox = new TextBox()
                            {
                                ID = FieldID.ToString(),
                                Text = FieldValue.ToString(),
                                ToolTip = FieldID.ToString(),
                                Enabled = true
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
                            if (drFieldData.Length > 0)
                            {
                                if (drFieldData[0]["MemoData"].Equals(DBNull.Value) || drFieldData[0]["MemoData"].Equals(string.Empty))
                                {
                                    if (FieldRows[fr]["DefaultValue"].Equals(DBNull.Value))
                                    {
                                        FieldValue = string.Empty;
                                    }
                                    else
                                    {
                                        FieldValue = FieldRows[fr]["DefaultValue"];
                                    }
                                }
                                else
                                {
                                    FieldValue = drFieldData[0]["MemoData"];
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

        protected async Task EditModeAsync(int editMode)
        {
            switch (editMode)
            {
                case 0:
                    //Open for editing
                    await LockFieldsAsync(false);
                    pnlSave.Visible = true;
                    pnlEdit.Visible = false;
                    pnlCalculate.Visible = true;
                    break;
                case 1:
                    //Can be edited
                    await LockFieldsAsync(true);
                    pnlSave.Visible = false;
                    pnlEdit.Visible = true;
                    pnlCalculate.Visible = false;
                    break;
                case 2:
                    //Cannot be edited
                    await LockFieldsAsync(true);
                    pnlSave.Visible = false;
                    pnlEdit.Visible = false;
                    pnlCalculate.Visible = false;
                    break;
                default:
                    break;
            }
        }

        private async Task<int> CanEditAsync()
        {
            // Edit Mode 0 = "Open for Editing"
            // Edit Mode 1 = "Can be edited by user"
            // Edit Mode 2 = "Locked from Editing"
            int EditMode = 2;
            string IsNew = Request.QueryString["IsNew"].ToString();

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
                if (IsNew == "1" && Panel0.Visible)
                {
                    EditMode = 0;
                }
                else
				{
                    EditMode = 1;
				}
            }            
            return await Task.FromResult(EditMode);
        }

        protected async Task LockFieldsAsync(bool Locked)
        {            
            // Identify selected panel.
            int index = Convert.ToInt32(MenuTabs.SelectedValue);
            Panel TargetPanel = new Panel();
            foreach (var panel in await GetControlsOfTypeAsync(form1))
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
            AjaxControlToolkit.DropDownExtender dde = new AjaxControlToolkit.DropDownExtender();
            DropDownList dl = new DropDownList();
            ListBox lb = new ListBox();
            ImageButton ib = new ImageButton();
            AjaxControlToolkit.CalendarExtender ce = new AjaxControlToolkit.CalendarExtender();

            // If the panel is locked...
            if (Locked == true)
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
                    else if (ctrl is AjaxControlToolkit.DropDownExtender)
                    {
                        dde = (AjaxControlToolkit.DropDownExtender)ctrl;
                        dde.Enabled = false;
                        //dde.CssClass = "ro_Control";
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
                        // Get Record Data
                        DataSet ds = (DataSet)ViewState["GenRecord"];
                        DataRow[] dr = ds.Tables[2].Select("FieldID = " + tb.ID);
                        int FieldType = 0;
                        if (dr.Length > 0)
                        {
                            FieldType = Convert.ToInt32(dr[0]["FieldType"]);
                        }
                        if (FieldType.Equals("18") || FieldType.Equals("20"))
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
                        cb.CssClass = "ro_Control";
                        cb.ForeColor = System.Drawing.Color.Black;
                    }
                    else if (ctrl is AjaxControlToolkit.DropDownExtender)
                    {
                        dde = (AjaxControlToolkit.DropDownExtender)ctrl;
                        dde.Enabled = true;
                        //cb.CssClass = "open_Control";
                        //cb.ForeColor = System.Drawing.Color.Black;
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

        private async Task<IEnumerable<Panel>> GetControlsOfTypeAsync(Control root)
        {
            return await Task.Run(() => { return GetControlsOfType<Panel>(root); });
        }

        private static IEnumerable<T> GetControlsOfType<T>(Control root) where T : Control
        {
            if (root is T t)
            {
                yield return t;
            }

            if (root is Control container)
                foreach (Control c in container.Controls)
                    foreach (var i in GetControlsOfType<T>(c))
                        yield return i;
        }

        private void Remove_selListBox_Items(object sender, EventArgs e)
        {
            // Build Removed item list
            ImageButton remBtn = (ImageButton)sender;
            string strFieldID = remBtn.CommandArgument;
            DataTable dt = new DataTable();
            dt.Columns.Add("ItemID");
            dt.Columns.Add("FieldID");
            dt.Columns.Add("UserID");
            ListBox selListBox = (ListBox)FindControl(strFieldID);
            List<ListItem> deletedItems = new List<ListItem>();
            foreach (ListItem item in selListBox.Items)
            {
                if (item.Selected)
                {
                    int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    int FieldID = Convert.ToInt32(strFieldID.Substring(3));
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

        #region Menu Methods

        protected async void MenuTabs_MenuItemClick(object sender, EventArgs e)
        {
            //int index = Convert.ToInt32(MenuTabs.SelectedItem.Value);
            //DataSet ds = (DataSet)ViewState["genRecord"];
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            ViewState["EditMode"] = false;
            await Initialize_RecordAsync(ItemID, ObjTypeID, ParentGroupID);
        }

        #endregion

        #region Buttons and Other Controls

        protected async void ImageButton_Click(object sender, EventArgs e)
        {
            DataSet dsData = (DataSet)ViewState["GenRecord"];
            int OrigID = Convert.ToInt32(dsData.Tables["Get_ItemData"].Rows[0]["OrigID"]);
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int saveParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            int saveObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);

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
                    // Update main item record in Items4.                   
                    
                    await EditRecordAsync(ItemID, "Item Edited");

                    // Update RecordsData table with any new field values.
                    await SaveFieldDataAsync(TargetPanel, ItemID, false);

                    // Set display properties for Save & Edit buttons.
                    bool saveItem = true;
                    ViewState["SaveItem"] = saveItem;
                    pnlSave.Visible = false;
                    pnlCalculate.Visible = false;
                    pnlEdit.Visible = true;
                    ViewState["EditMode"] = false;
                    break;
                case "EditItem":
                    await LockFieldsAsync(false);
                    pnlSave.Visible = true;
                    pnlCalculate.Visible = true;
                    pnlEdit.Visible = false;                    
                    ViewState["EditMode"] = true;
                    break;
                case "Calculate":
                    await EditRecordAsync(ItemID, "Item Edited");
                    await SaveFieldDataAsync(TargetPanel, ItemID, true);
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
                    ScriptManager.RegisterStartupScript(udpToolBar, GetType(), "attachments", "openAttachment(" + recID + ", 4, " + objID + ", " + IsEdit + ")", true);
                    break;
                case "Print":
                    DataSet pds = (DataSet)ViewState["GenRecord"];
                    Session["PrintData"] = pds;
                    ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "PrintRecord", "printRecord(4);", true);
                    break;
            }
        }

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            await Task.Delay(1);
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
						ScriptManager.RegisterStartupScript(udpToolBar, GetType(), "Abort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
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
                        ScriptManager.RegisterStartupScript(udpPageData, GetType(), "AuthFail", "alert('Username or password is incorrect. Please try again');", true);
                    }
                    break;
            }
        }

        protected async void btnRefreshRecord_Click(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);

            await Initialize_RecordAsync(ItemID, ParentGroupID, ObjTypeID);
        }

        protected async void BtnInstructions_Click(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(MenuTabs.SelectedValue);
            Panel TargetPanel = new Panel();
            await Task.Delay(1);
            foreach (var panel in GetControlsOfType<Panel>(form1))
            {
                Panel p = panel;
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
                    break;
                case "Close":
                    pnlInstructions.Visible = false;
                    BtnInstructions.CommandArgument = "Open";
                    BtnInstructions.ImageUrl = "~/images/bluedown.png";
                    BtnInstructions.Attributes.Add("onmouseover", "javascript: this.src = 'images/bluedown_mo.png'");
                    BtnInstructions.Attributes.Add("onmouseout", "javascript: this.src = 'images/bluedown.png'");
                    break;
            }
        }

        protected void CDD_SelectedIndexChanged(object sender, EventArgs e)
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
            TextBox tb = (TextBox)TargetPanel.FindControl(IDSplit[0]);
            tb.Text = ddl.SelectedItem.Text;
            ddl.SelectedValue = "0";
        }

        #endregion

        #region Edit/Save Methods

        private async Task EditRecordAsync(int ItemID, string TaskName)
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

				await Record.Edit_RecordAsync(4, ItemID, UserID, UserFullName);
				await Record.Edit_HistoryAsync(4, OrigID, TabName, TaskName, UserFullName);
			}
            else
			{
				ScriptManager.RegisterStartupScript(udpToolBar, GetType(), "Abort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
			}
        }

        private async Task SaveFieldDataAsync(Panel TargetPanel, int ItemID, bool isCalc)
        {
            int ModuleID = 4;
            int SelectedTab = Convert.ToInt32(MenuTabs.SelectedValue);
            DataSet dsData = (DataSet)ViewState["GenRecord"];
            int ObjID = Convert.ToInt32(dsData.Tables["Get_TabList"].Rows[SelectedTab]["ObjID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
            DataTable TabFields = Record.Load_OnePane(ItemID, ObjID, ModuleID, 0);

            int FieldCount = (TabFields.Rows.Count);
            int i = 0;

            try
            {
                for (i = 0; i < FieldCount; i++)
                {
                    int FieldID = Convert.ToInt32(TabFields.Rows[i]["FieldID"]);
                    DataTable dtInternalEvent = await Record.Has_InternalEventAsync(FieldID);

                    int FieldType = Convert.ToInt32(TabFields.Rows[i]["FieldType"]);
                    bool IsMandatory = Convert.ToBoolean(TabFields.Rows[i]["IsMandatory"]);
                    //object initValue = string.Empty;
                    //object TextValue = string.Empty;                    
                    await SaveMethodAsync(ModuleID, TargetPanel, ItemID, SelectedTab, dsData, TabFields, i, FieldID, FieldType, dtInternalEvent, IsMandatory);                    
                }
                await Record.Purge_FieldDataAsync();
                if (!isCalc)
                {
                    ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "myScript", "recordRefresh();alert('Item successfully saved');recordRefreshLocal();", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "myScript", "alert('Calculation complete');recordRefreshLocal();", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "myScript", "alert('" + ex.Message + "<br />Stack Trace: " + ex.StackTrace + "');recordRefreshLocal();", true);
            }
            finally
            {
                await Initialize_RecordAsync(ItemID, ParentGroupID, ObjTypeID);
                ViewState["IsUpdated"] = false;
                await EditModeAsync(1);
            }
        }

        private async Task SaveMethodAsync(int ModuleID, Panel TargetPanel, int ItemID, int SelectedTab, DataSet dsData, DataTable TabFields, int i, int FieldID, int FieldType, DataTable dtInternalEvent, bool IsMandatory)
        {
            object initValue = string.Empty;
            object TextValue = string.Empty;
            ViewState["ErrorState"] = "false";
            if (FieldType != 10)
            {                
                bool IsCalcResult = await Record.Get_FieldTypeAsync(FieldID);
                DataRow[] foundrow;
                foundrow = dsData.Tables[3].Select("FieldID = " + FieldID + " AND ModuleID = " + ModuleID);
                if (foundrow.Length > 0)
                {
                    int Max = (foundrow.Length - 1);
                    for (int z = 0; z <= Max; z++)
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
                                    if (Record.Has_InternalEvent(FieldID).Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (slTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            Record.Trigger_Internal_Event(EventID, ItemID);
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
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (mlTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            Record.Trigger_Internal_Event(EventID, ItemID);
                                        }
                                    }
                                }
                                break;
                            case 6:
                            case 18:
                                TextBox mlRTFBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                                initValue = foundrow[0]["MemoData"].ToString();
                                TextValue = mlRTFBox.Text;
                                TextValue = P3General.TextToRTF(TextValue.ToString());
                                if (IsMandatory && string.IsNullOrEmpty(mlRTFBox.Text))
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (!TextValue.Equals(initValue))
                                {
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (mlRTFBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            Record.Trigger_Internal_Event(EventID, ItemID);
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
                                TextValue = 0;
                                if (initValue.Equals(0))
                                {
                                    if (CheckBox.Checked)
                                    {
                                        TextValue = 1;
                                    }
                                }
                                break;
                            case 3:
                            //case 7:
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
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (DDL.SelectedItem.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            Record.Trigger_Internal_Event(EventID, ItemID);
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
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (dTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            Record.Trigger_Internal_Event(EventID, ItemID);
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
                                        Record.Update_UserField(ItemID, FieldID, UserID, UserName, ModuleID, 0, 1);
                                    }

                                    if (ViewState[selListBox.ID] != null)
                                    {
                                        DataTable dtRemoved = (DataTable)ViewState[selListBox.ID];
                                        if (dtRemoved.Rows.Count > 0)
                                        {
                                            foreach (DataRow dr in dtRemoved.Rows)
                                            {
                                                int UserID = Convert.ToInt32(dr["UserID"]);
                                                Record.Update_UserField(ItemID, FieldID, UserID, string.Empty, ModuleID, 0, 0);
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(udpDetails, udpDetails.GetType(), "noitems", "javascript:alert('No Items found');", true);
                                }
                                break;
                            case 8:
                                TextBox slNumBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                                initValue = foundrow[0]["NumData"].ToString();
                                if (slNumBox.Text == string.Empty)
                                {
                                    TextValue = 0;
                                }
                                else
                                {
                                    TextValue = Convert.ToInt32(slNumBox.Text);
                                }
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
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (slNumBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            Record.Trigger_Internal_Event(EventID, ItemID);
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
                                if (dtInternalEvent.Rows.Count > 0)
                                {
                                    int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                    if (slTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                    {
                                        Record.Trigger_Internal_Event(EventID, ItemID);
                                    }
                                }
                                break;
                            }
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
                                if (dtInternalEvent.Rows.Count > 0)
                                {
                                    int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                    if (mlTextBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                    {
                                        Record.Trigger_Internal_Event(EventID, ItemID);
                                    }
                                }
                                break;
                            }
                        case 2:
                            CheckBox CheckBox = (CheckBox)TargetPanel.FindControl(FieldID.ToString());
                            TextValue = 0;
                            if (CheckBox.Checked)
                            {
                                TextValue = 1;
                            }
                            break;
                        case 3:
                        //case 7:
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
                                if (dtInternalEvent.Rows.Count > 0)
                                {
                                    if (DDL.SelectedItem.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        Record.Trigger_Internal_Event(EventID, ItemID);
                                    }
                                }
                                break;
                            }
                        case 4:
                        case 16:
                            TextBox slDateBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                            TextValue = slDateBox.Text;
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
                                if (TextValue.ToString() == string.Empty)
                                {
                                    TextValue = Convert.ToDateTime("01/01/1900");
                                }
                                else
                                {
                                    TextValue = Convert.ToDateTime(TextValue);
                                    if (dtInternalEvent.Rows.Count > 0)
                                    {
                                        int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                        if (slDateBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                        {
                                            Record.Trigger_Internal_Event(EventID, ItemID);
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
                                    Record.Update_UserField(ItemID, FieldID, UserID, UserName, ModuleID, 0, 1);
                                }

                                if (ViewState[selListBox.ID] != null)
                                {
                                    DataTable dtRemoved = (DataTable)ViewState[selListBox.ID];
                                    if (dtRemoved.Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in dtRemoved.Rows)
                                        {
                                            int UserID = Convert.ToInt32(dr["UserID"]);
                                            Record.Update_UserField(ItemID, FieldID, UserID, string.Empty, ModuleID, 0, 0);
                                        }
                                    }
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(udpDetails, udpDetails.GetType(), "TEST", "javascript:alert('No Items found');", true);
                            }
                            break;
                        case 8:
                            TextBox slNumBox = (TextBox)TargetPanel.FindControl(FieldID.ToString());
                            if (slNumBox.Text == string.Empty)
                            {
                                TextValue = 0;
                            }
                            else
                            {
                                TextValue = Convert.ToInt32(slNumBox.Text);
                            }                            
                            if (TextValue.Equals(initValue))
                            {
                                break;
                            }
                            else
                            {
                                TextValue = Convert.ToInt32(TextValue);
                                if (dtInternalEvent.Rows.Count > 0)
                                {
                                    int EventID = Convert.ToInt32(dtInternalEvent.Rows[0]["EventID"]);
                                    if (slNumBox.Text == dtInternalEvent.Rows[0]["CompText"].ToString())
                                    {
                                        Record.Trigger_Internal_Event(EventID, ItemID);
                                    }
                                }
                                break;
                            }
                    }
                }
                await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
            }
        }

        #endregion

    }
}