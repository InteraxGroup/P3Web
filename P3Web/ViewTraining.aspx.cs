using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using Paradigm3.datalayer;
using System.Threading;
using System.Configuration;
using System.Threading.Tasks;
using System.Globalization;
using System.Text.RegularExpressions;

namespace Paradigm3
{
    public partial class ViewTraining : SqlViewStatePage
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

                MenuTabs.Items[0].Selected = true;
                await Initialize_Training(ItemID, ParentGroupID);
            }
        }

        #region Initialization

        protected async void Page_Init(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
            await GenerateFieldsAndValuesAsync(12, ItemID, ParentGroupID, ObjTypeID);
        }

        protected async Task Initialize_Training(int ItemID, int ParentGroupID)
        {
            // Get Improvement Data and add to ViewState.
            int ObjTypeID = P3General.Get_ObjTypeID(12, ParentGroupID);
            DataSet ds = Record.GetRecord(12, ItemID, ObjTypeID);
            DataTable dtTrainLink = Record.Get_TrainingLinks(ItemID);
            ViewState.Add("TrainRecord", ds);
            string OrigID = ds.Tables[0].Rows[0]["OrigID"].ToString();

            // Index the selected tab.
            int index = Convert.ToInt32(MenuTabs.SelectedValue);

            // Activate Properties button
            BtnProperties.Attributes.Add("onclick", "openProperties(" + ItemID + ", 12, 0);");
            // Activate ParaLinks button
            BtnParaLink.Attributes.Add("onclick", "openParaLink(" + OrigID + ",12)");
            // Activate Related Action Items button
            string strName = ds.Tables[0].Rows[0]["Name"].ToString();            
            BtnRelatedAI.Attributes.Add("onclick", "openRelatedAI(" + Server.UrlEncode(OrigID) + ", 12);");

            // Activate Training Link Button
            if (dtTrainLink.Rows.Count > 0)
            {
				pnlTrainLink.Visible = true;
                BtnTrainLink.Attributes.Add("onclick", "openTrainingLinks(" + ItemID + ");");
            }
            else
            {
				pnlTrainLink.Visible = false;
                BtnTrainLink.Attributes.Remove("onclick");
            }

            // Generate the initial Training record details and display on the form.
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

            int TabTypeID = Convert.ToInt32(ds.Tables[1].Rows[index]["ObjTypeID"]);
            DataTable dtResp = Record.Get_Responsible(ItemID, TabTypeID);
            string strResp = string.Empty;
            txtTraineeData.Text = ds.Tables[0].Rows[0]["UserFullName"].ToString();
            dtResp.Dispose();

            lblStepName.Text = "Requirement: " + ds.Tables[1].Rows[index]["Caption"].ToString();
            
            // Set initial BtnInstructions properties.
            pnlReqNotes.Visible = false;
            BtnInstructions.Attributes.Add("onmouseover", "javascript: this.src = 'images/bluedown_mo.png'");
            BtnInstructions.Attributes.Add("onmouseout", "javascript: this.src = 'images/bluedown.png'");
            if (ds.Tables[1].Rows[index]["Notes"] != DBNull.Value)
            {
                txtReqNotes.Text = ds.Tables[1].Rows[index]["Notes"].ToString();
            }
            else
            {
                txtReqNotes.Text = string.Empty;
            }

            // Display available Tab icons.
            int TotalTabs = (ds.Tables[1].Rows.Count - 1);
            for (int i = 0; i <= 15; i++)
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

            //Display selected Improvement fields panel.
            foreach (var panel in await GetControlsOfTypeAsync(form1))
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

			// Display Assessment toolbar button if assessment is available and has not yet been passed.
			int UserID = 0;
			int ReqID = Convert.ToInt32(ds.Tables[1].Rows[index]["ReqID"]);
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
				FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
				string UserData = ticket.UserData;
				string[] UserValues = UserData.Split(',');
				UserID = Convert.ToInt32(UserValues[0]);
			}
			if (Record.Has_Assessment(ReqID) && !Record.Has_Passed(UserID, ItemID, ReqID))
			{
				pnlAssessment.Visible = true;
				string QuesSetID = Record.Get_QuesSetID(Convert.ToInt32(ds.Tables[1].Rows[index]["ReqID"]));
				string strQuesSetVar = ItemID + "," + ds.Tables[1].Rows[index]["ReqID"].ToString() + "," + QuesSetID;
				BtnAssessment.Attributes.Add("onclick", "openAssessment(" + strQuesSetVar + ")");
			}
			else
			{
				pnlAssessment.Visible = false;
				BtnAssessment.Attributes.Remove("onclick");
			}
			pnlClose.Visible = true;
        }

        private async Task<DataSet> GetRecordAsync(int ModuleID, int ItemID, int ObjTypeID)
        {
            return await Task.Run(() => { return Record.GetRecord(ModuleID, ItemID, ObjTypeID); });
        }

        protected async Task GenerateFieldsAndValuesAsync(int ModuleID, int ItemID, int ParentGroupID, int ObjTypeID)
        {
            // Define all available Improvement pages in an array
            Panel TargetPanel = new Panel();
            Panel[] tgtPanel = new Panel[50];
            for (int p = 0; p < 50; p++)
            {
                tgtPanel[p] = (Panel)FindControl("Panel" + p.ToString());
            }

            // Identify the target panel based on the selected tab.
            DataSet ds = await GetRecordAsync(ModuleID, ItemID, ObjTypeID);
            ViewState.Add("TrainRecord", ds);
            int TotalTabs = (ds.Tables["Get_TabList"].Rows.Count - 1);
            int i = 0;
            // For each available page in the record...
            for (i = 0; i <= TotalTabs; i++)
            {
                //  Get ObjID & ReqID for the page.
                int ObjID = Convert.ToInt32(ds.Tables["Get_TabList"].Rows[i]["ObjID"]);
                int ReqID = Convert.ToInt32(ds.Tables["Get_TabList"].Rows[i]["ReqID"]);

                //  Identify the current Tab and panel to be used
                TargetPanel = tgtPanel[i];
                TargetPanel.Controls.Clear();
                TargetPanel.Attributes.Add("style", "position: relative");

                //  Get List of Fields and Values.
                DataTable dtFields = Record.Load_OnePane(ItemID, ObjID, ModuleID, ReqID);
                if (dtFields.Rows.Count > 0)
                {
                    //  Populate fields and add to Target Panel.
                    foreach (DataRow fdr in dtFields.Rows)
                    {
                        int FieldID = Convert.ToInt32(fdr["FieldID"]);
                        bool IsMandatory = Convert.ToBoolean(fdr["IsMandatory"]);
                        string FieldName = fdr["FieldName"].ToString();
                        int FieldType = Convert.ToInt32(fdr["FieldType"]);
                        bool IsExternal = Convert.ToBoolean(fdr["IsExternalField"]);
                        object DefaultValue = fdr["DefaultValue"];
                        object FieldValue = null;
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
                        DataTable dtFieldData = Record.Load_OneFieldData(ItemID, FieldID, ReqID);
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
                                    ID = FieldID.ToString() + "_" + ReqID.ToString(),
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
                                    ID = FieldID.ToString() + "_" + ReqID.ToString(),
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
                                    ID = FieldID.ToString() + "_" + ReqID.ToString()
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
                                    ID = FieldID.ToString() + "_" + ReqID.ToString(),
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
                                DDL.DataSource = ddlDT;
                                DDL.DataTextField = "Caption";
                                DDL.DataValueField = "ID";
                                DDL.DataBind();
                                foreach (ListItem liDV in DDL.Items)
                                {
                                    if (FieldValue.Equals(liDV.Text))
                                    {
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
                                    ID = FieldID.ToString() + "_" + ReqID.ToString(),
									ValidationGroup = "DateFields"
                                };
                                if (FieldValue != null && FieldValue.Equals("MM/dd/yyyy"))
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
                                    ID = "add" + FieldID.ToString() + "_" + ReqID.ToString(),
                                    ImageUrl = "~/images/btnAdd.png",
                                    OnClientClick = "javascript:openSelect(" + FieldID.ToString() + "_" + ReqID.ToString() + ");"
                                };
                                TargetPanel.Controls.Add(addBtn);
                                addBtn.Attributes.Add("style", "position: absolute;top: " + FieldTop.ToString() + "px;left: " + (FieldLeft + FieldWidth).ToString() + "px;");

                                // Remove User Button
                                ImageButton remBtn = new ImageButton()
                                {
                                    ID = "rem" + FieldID.ToString() + "_" + ReqID.ToString(),
                                    ImageUrl = "~/images/btnRemove.png"
                                };
                                TargetPanel.Controls.Add(remBtn);
                                remBtn.CommandArgument = FieldID.ToString() + "_" + ReqID.ToString();
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
                                    ID = FieldID.ToString() + "_" + ReqID.ToString(),
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
                                    ToolTip = FieldID.ToString(),
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
                                    ID = FieldID.ToString() + "_" + ReqID.ToString(),
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
                                    ID = FieldID.ToString() + "_" + ReqID.ToString(),
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
                                string rtfID = FieldID.ToString() + "_" + ReqID.ToString();
                                TextBox mlRTFLockBox = new TextBox()
                                {
                                    ID = rtfID,
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
                                    ID = "add" + rtfID,
                                    ImageUrl = "~/images/edit_small.png",
                                    OnClientClick = "javascript:editContents('" + rtfID + "');",
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

                                string txtID = FieldID.ToString() + "_" + ReqID.ToString();
                                TextBox mlTextLockBox = new TextBox()
                                {
                                    ID = txtID,
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
                                    ID = "add" + txtID,
                                    ImageUrl = "~/images/edit_small.png",
                                    OnClientClick = "javascript:editContents('" + txtID + "');",
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
                    pnlCalculate.Visible = true;
                    pnlEdit.Visible = false;
                    BtnFinishStep.Enabled = true;
                    break;
                case 1:
                    //Can be edited
                    await LockFieldsAsync(true);
                    pnlSave.Visible = false;
                    pnlCalculate.Visible = false;
                    pnlEdit.Visible = true;
                    BtnFinishStep.Enabled = false;
                    break;
                case 2:
                    //Cannot be edited
                    await LockFieldsAsync(true);
                    pnlSave.Visible = false;
                    pnlCalculate.Visible = false;
                    pnlEdit.Visible = false;
                    BtnFinishStep.Enabled = false;
                    break;
            }
        }

        protected async Task<int> CanEditAsync()
        {
            // Edit Mode 0 = "Open for Editing"
            // Edit Mode 1 = "Can be edited by user"
            // Edit Mode 2 = "Locked from Editing"
            int EditMode = 2;
            DataSet ds = (DataSet)ViewState["TrainRecord"];
            int i = Convert.ToInt32(MenuTabs.SelectedValue);
            string IsNew = Request.QueryString["IsNew"].ToString();
            int IsComplete = Convert.ToInt32(ds.Tables[0].Rows[0]["Status"]);
            bool StepCompleted = Convert.ToBoolean(ds.Tables[1].Rows[i]["IsChecked"]);
            int ItemID = Convert.ToInt32(ds.Tables[0].Rows[0]["ItemID"]);
            int OrigID = Convert.ToInt32(ds.Tables[0].Rows[0]["OrigID"]);
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

                bool HasRecEditPermission = await P3General.HasEditPermissionAsync(12, OrigID, UserID);

                if (IsNew == "1" && Panel0.Visible)
                {
                    EditMode = 0;
                }
                else if (StepCompleted == false)
                {
                    switch (UserStatus)
                    {
                        case 1: // Administrator
                            EditMode = 1;
                            break;
                        case 0: // Normal User
                            if (HasRecEditPermission)
                            {
                                EditMode = 1;
                            }
                            break;
                        case -1: // Restricted User
                            string RRecUser = ConfigurationManager.AppSettings["RestrictedUser"];
                            if (RRecUser == "Edit")
                            {
                                if (HasRecEditPermission == true)
                                {
                                    EditMode = 1;
                                }
                            }
                            break;
                    }
                }
            }
			else
			{
				EditMode = 2;
			}
            ds.Dispose();
            return EditMode;
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
            AjaxControlToolkit.ComboBox cbx = new AjaxControlToolkit.ComboBox();
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
                        string[] fieldSplit = tb.ID.Split('_');
                        // Get Record Data
                        DataSet ds = (DataSet)ViewState["TrainRecord"];
                        DataRow[] dr = ds.Tables[2].Select("FieldID = " + fieldSplit[0]);
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

        protected async void MenuTabs_MenuItemClick(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(MenuTabs.SelectedItem.Value);
            DataSet ds = (DataSet)ViewState["TrainRecord"];
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            ViewState["EditMode"] = false;
            await Initialize_Training(ItemID, ParentGroupID);
        }

        public static IEnumerable<T> GetControlsOfType<T>(Control root) where T : Control
        {
            T t = root as T;
            if (t != null)
                yield return t;

            if (root is Control container)
            {
                foreach (Control c in container.Controls)
                {
                    foreach (var i in GetControlsOfType<T>(c))
                    {
                        yield return i;
                    }
                }
            }
        }

        private async Task<IEnumerable<Panel>> GetControlsOfTypeAsync(Control root)
        {
            return await Task.Run(() => { return GetControlsOfType<Panel>(root); });
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
            ListBox selListBox = (ListBox)FindControl(strFieldID);
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

        protected async void ImageButton_Click(object sender, EventArgs e)
        {
            DataSet dsData = (DataSet)ViewState["TrainRecord"];
            int SelectedTab = Convert.ToInt32(MenuTabs.SelectedValue);

            //int OrigID = Convert.ToInt32(dsData.Tables["Get_ItemData"].Rows[0]["OrigID"]);
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            //int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
            //int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);

            ImageButton btn = (ImageButton)sender;
            string arg = btn.CommandArgument;

            // Determine the currently active Panel.
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

            switch (arg)
            {
                case "SaveItem":
					// Update main item record in Items12.                    
					await Edit_RecordAsync(ItemID, "Item Edited");

					// Update RecordsData table with any new field values.
					try
					{
						await SaveFieldDataAsync(TargetPanel, ItemID, false);

						// Set display properties for Save & Edit buttons.
						bool saveItem = true;
						ViewState["SaveItem"] = saveItem;
						pnlSave.Visible = false;
						pnlCalculate.Visible = false;
						pnlEdit.Visible = true;
						BtnFinishStep.Enabled = false;
						await LockFieldsAsync(true);
						ViewState["EditMode"] = false;
					}
					catch (Exception ex)
					{
						ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "myScript", "alert('" + ex.Message + "');", true);
					}
					break;
                case "EditItem":
                    pnlSave.Visible = true;
                    pnlCalculate.Visible = true;
                    pnlEdit.Visible = false;
                    BtnFinishStep.Enabled = true;
                    await LockFieldsAsync(false);
                    ViewState["EditMode"] = true;
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
                    ScriptManager.RegisterStartupScript(udpToolBar, GetType(), "attachments", "openAttachment(" + recID + ", 12, " + objID + ", " + IsEdit + ")", true);
                    break;
                case "Calculate":
                    await Edit_RecordAsync(ItemID, "Item Edited");
                    await SaveFieldDataAsync(TargetPanel, ItemID, true);
                    break;
                case "CloseItem":
                    ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "Close", "window.close();", true);
                    break;
                case "Print":
                    DataSet pds = (DataSet)ViewState["TrainRecord"];
                    Session["PrintData"] = pds;
                    ScriptManager.RegisterStartupScript(udpToolBar, udpToolBar.GetType(), "PrintRecord", "printRecord(12);", true);
                    break;
            }
        }

        protected async void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "FinishRequirement":
                    // Get Record Information
                    DataSet ds = (DataSet)ViewState["TrainRecord"];
                    int index = Convert.ToInt32(MenuTabs.SelectedValue);
                    int ModuleID = 12;
                    int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);
                    int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    int ObjID = Convert.ToInt32(ds.Tables["Get_TabList"].Rows[index]["ObjID"]);
                    int ReqID = Convert.ToInt32(ds.Tables["Get_TabList"].Rows[index]["ReqID"]);

                    // Get User Information
                    if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');
                        int UserID = Convert.ToInt32(UserValues[0]);
                        string UserFullName = UserValues[1].ToString();

						//  Identify Selected Panel
						Panel TargetPanel = new Panel();
						foreach (var panel in await GetControlsOfTypeAsync(form1))
						{
							Panel p = (Panel)panel;
							if (p.ID == "Panel" + index.ToString())
							{
								TargetPanel = p;
							}
						}

						// If Requirement has assessment
						if (Record.Has_Assessment(ReqID) && !Record.Has_Passed(UserID, ItemID, ReqID))
						{
                            if (ViewState["ErrorState"].ToString() != "true")
                            {
                                // Get Assessment ID and open assessment
                                string QuesSetID = Record.Get_QuesSetID(ReqID);
                                string strQuesSetVar = ItemID + "," + ReqID.ToString() + "," + QuesSetID;
                                ScriptManager.RegisterStartupScript(udpFinish, udpFinish.GetType(), "Assessment", "openAssessment(" + strQuesSetVar + ");", true);
                                ViewState["ErrorState"] = "false";
                            }                            
						}
						else
						{
							// Lock Form
							pnlSave.Visible = false;
							pnlEdit.Visible = false;
							BtnFinishStep.Enabled = false;
							await LockFieldsAsync(true);

                            // Complete Requirement
                            await SaveFieldDataAsync(TargetPanel, ItemID, false);
                            if (ViewState["ErrorState"].ToString() != "true")
                            {
                                Record.Complete_Tab(index, ModuleID, ItemID, ObjID, UserFullName, UserID, ReqID);
                                await Edit_RecordAsync(ItemID, "Step Finished");
                                // If all Requirements complete, complete record
                                bool IsComplete = true;
                                DataTable dtTrainSteps = Record.Get_TrainingSteps(ItemID);
                                foreach (DataRow dr in dtTrainSteps.Rows)
                                {
                                    if (Convert.ToBoolean(dr["IsChecked"]) == false)
                                    {
                                        IsComplete = false;
                                    }
                                }
                                if (IsComplete)
                                {
                                    Record.Complete_Item(12, ItemID);
                                }
                                ViewState["ErrorState"] = "false";
                            }							

							// Reset Form
							await Initialize_Training(ItemID, ParentGroupID);
							ViewState["SaveItem"] = true;
							ViewState["EditMode"] = false;
							await EditModeAsync(await CanEditAsync());
						}
					}
					else
					{
						ScriptManager.RegisterStartupScript(udpFinish, GetType(), "Abort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
					}                    
                    break;
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
                        ScriptManager.RegisterStartupScript(udpDetails, GetType(), "AuthFail", "alert('Username or password is incorrect. Please try again');", true);
                    }
                    break;
            }
        }

        protected async void BTNInstructions_Click(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(MenuTabs.SelectedValue);
            Panel TargetPanel = new Panel();
            foreach (var panel in await GetControlsOfTypeAsync(form1))
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
                    pnlReqNotes.Visible = true;
                    BtnInstructions.CommandArgument = "Close";
                    BtnInstructions.ImageUrl = "~/images/blueup.png";
                    BtnInstructions.Attributes.Add("onmouseover", "javascript: this.src = 'images/blueup_mo.png'");
                    BtnInstructions.Attributes.Add("onmouseout", "javascript: this.src = 'images/blueup.png'");
                    break;
                case "Close":
                    pnlReqNotes.Visible = false;
                    BtnInstructions.CommandArgument = "Open";
                    BtnInstructions.ImageUrl = "~/images/bluedown.png";
                    BtnInstructions.Attributes.Add("onmouseover", "javascript: this.src = 'images/bluedown_mo.png'");
                    BtnInstructions.Attributes.Add("onmouseout", "javascript: this.src = 'images/bluedown.png'");
                    break;
            }
        }

        protected async void btnRefreshRecord_Click(object sender, EventArgs e)
        {
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ParentGroupID = Convert.ToInt32(Request.QueryString["ParentGroupID"]);

            await Initialize_Training(ItemID, ParentGroupID);
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
            DataSet dsData = (DataSet)ViewState["TrainRecord"];
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

				//Record.Edit_Record(12, ItemID, UserID, UserFullName);
				await Record.Edit_RecordAsync(12, ItemID, UserID, UserFullName);
				//Record.Edit_History(12, OrigID, TabName, TaskName, UserFullName);
				await Record.Edit_HistoryAsync(12, OrigID, TabName, TaskName, UserFullName);
			}
            else
			{
				ScriptManager.RegisterStartupScript(udpToolBar, GetType(), "Abort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
			}
        }

        protected async Task SaveFieldDataAsync(Panel TargetPanel, int ItemID, bool IsCalc)
        {
            int ModuleID = 12;
            int SelectedTab = Convert.ToInt32(MenuTabs.SelectedValue);
            DataSet dsData = (DataSet)ViewState["TrainRecord"];
            int ObjID = Convert.ToInt32(dsData.Tables["Get_TabList"].Rows[SelectedTab]["ObjID"]);
            int ReqID = Convert.ToInt32(dsData.Tables["Get_TabList"].Rows[SelectedTab]["ReqID"]);
            DataTable TabFields = Record.Load_OnePane(ItemID, ObjID, ModuleID, ReqID);

            int FieldCount = (TabFields.Rows.Count - 1);

            try
            {
                for (int i = 0; i < FieldCount; i++)
                {
                    int FieldID = Convert.ToInt32(TabFields.Rows[i]["FieldID"]);
                    DataTable dtInternalEvent = await Record.Has_InternalEventAsync(FieldID);

                    int FieldType = Convert.ToInt32(TabFields.Rows[i]["FieldType"]);
                    bool IsMandatory = Convert.ToBoolean(TabFields.Rows[i]["IsMandatory"]);                    
                    await SaveMethodAsync(ModuleID, TargetPanel, ItemID, SelectedTab, dsData, TabFields, i, FieldID, FieldType, dtInternalEvent, ReqID, IsMandatory);
					ViewState["IsUpdated"] = false;
				}
                await Record.Purge_FieldDataAsync();
                if (!IsCalc)
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
				throw ex;
			}
        }

        private async Task SaveMethodAsync(int ModuleID, Panel TargetPanel, int ItemID, int SelectedTab, DataSet dsData, DataTable TabFields, int i, int FieldID, int FieldType, DataTable dtInternalEvent, int ReqID, bool IsMandatory)
        {
            string fielddata = FieldID.ToString() + "_" + ReqID.ToString();
            ViewState["ErrorState"] = "false";
            object initValue = string.Empty;
            object TextValue = string.Empty;
            if (FieldType != 10)
            {
                bool IsCalcResult = await Record.Get_FieldTypeAsync(FieldID);
                DataRow[] foundrow;
                foundrow = dsData.Tables[3].Select("FieldID = " + FieldID + " AND ModuleID = " + ModuleID);
                if (foundrow.Length > 0)
                {
                    for (int z = 0; z < foundrow.Length; z++)
                    {
                        switch (FieldType)
                        {
                            case 0:
                            case 7:
                                TextBox slTextBox = (TextBox)TargetPanel.FindControl(fielddata);
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
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
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
                                TextBox mlTextBox = (TextBox)TargetPanel.FindControl(fielddata);
                                initValue = foundrow[0]["MemoData"].ToString();
                                TextValue = mlTextBox.Text;
                                if (IsMandatory && string.IsNullOrEmpty(mlTextBox.Text))
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (!initValue.Equals(null) && !TextValue.Equals(initValue))
                                {
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, TextValue.ToString(), initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
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
                                TextBox mlRTFBox = (TextBox)TargetPanel.FindControl(fielddata);
                                initValue = foundrow[0]["MemoData"].ToString();
                                TextValue = mlRTFBox.Text;
                                if (IsMandatory && string.IsNullOrEmpty(mlRTFBox.Text))
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (!TextValue.Equals(initValue))
                                {
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, P3General.TextToRTF(TextValue.ToString()), initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, P3General.TextToRTF(TextValue.ToString()), initValue);
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
                                CheckBox CheckBox = (CheckBox)TargetPanel.FindControl(fielddata);
                                initValue = foundrow[0]["NumData"];
                                if (initValue.ToString() == string.Empty)
                                {
                                    initValue = 0;
                                }
                                if (Convert.ToInt32(initValue) == 0)
                                {
                                    if (CheckBox.Checked == true)
                                    {
                                        //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, 1, initValue);
                                        await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, 1, initValue);
                                    }
                                }
                                else
                                {
                                    if (CheckBox.Checked == false)
                                    {
                                        //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, 0, initValue);
                                        await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, 0, initValue);
                                    }
                                }
                                break;
                            case 3:
                                DropDownList DDL = (DropDownList)TargetPanel.FindControl(fielddata);
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
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
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
                                TextBox dTextBox = (TextBox)TargetPanel.FindControl(fielddata);
                                initValue = foundrow[0]["DateData"].ToString();
                                TextValue = dTextBox.Text;
                                if (IsMandatory && string.IsNullOrEmpty(dTextBox.Text))
                                {
                                    ViewState["ErrorState"] = "true";
                                    throw new Exception("Mandatory Field Missing Value");
                                }
                                if (string.IsNullOrEmpty(TextValue.ToString()))
								{
									throw new Exception("Invalid date string detected in one of your fields.  Please check your values and try again.  This process has been terminated.");
								}
								else
								{
									if (IsCalcResult)
									{
										TextValue = await Record.CalculateFieldAsync(ItemID, FieldID);
									}
									if (TextValue.Equals("MM/dd/yyyy"))
									{
										TextValue = initValue;
									}
								}

								if (TextValue.Equals(initValue))
                                {
                                    break;
                                }
                                else
                                {
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
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
                                ListBox selListBox = (ListBox)TargetPanel.FindControl(fielddata);
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
                                        //Record.Update_UserField(ItemID, FieldID, UserID, UserName, ModuleID, ReqID, 1);
                                        await Record.Update_UserFieldAsync(ItemID, FieldID, UserID, UserName, ModuleID, ReqID, 1);
                                    }

                                    if (ViewState[selListBox.ID] != null)
                                    {
                                        DataTable dtRemoved = (DataTable)ViewState[selListBox.ID];
                                        if (dtRemoved.Rows.Count > 0)
                                        {
                                            foreach (DataRow dr in dtRemoved.Rows)
                                            {
                                                int UserID = Convert.ToInt32(dr["UserID"]);
                                                //Record.Update_UserField(ItemID, FieldID, UserID, string.Empty, ModuleID, ReqID, 0);
                                                await Record.Update_UserFieldAsync(ItemID, FieldID, UserID, string.Empty, ModuleID, ReqID, 0);
                                            }
                                        }
                                    }
                                }
                                break;
                            case 8:
                                TextBox slNumBox = (TextBox)TargetPanel.FindControl(fielddata);
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
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
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
                            TextBox slTextBox = (TextBox)TargetPanel.FindControl(fielddata);
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
                                //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, slTextBox.Text, initValue);
                                await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, slTextBox.Text, initValue);
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
                            TextBox mlTextBox = (TextBox)TargetPanel.FindControl(fielddata);
                            TextValue = mlTextBox.Text;
                            if (TextValue.Equals(initValue))
                            {
                                break;
                            }
                            else
                            {
                                //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
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
                            CheckBox CheckBox = (CheckBox)TargetPanel.FindControl(fielddata);
                            TextValue = "false";
                            if (CheckBox.Checked)
                            {
                                TextValue = "true";
                            }
                            if (initValue.Equals(1))
                            {
                                if (TextValue.ToString() == "false")
                                {
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, 0, initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, 0, initValue);
                                }
                            }
                            else
                            {
                                if (TextValue.ToString() == "true")
                                {
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, 1, initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, 1, initValue);
                                }
                            }
                            break;
                        case 3:
                            DropDownList DDL = (DropDownList)TargetPanel.FindControl(fielddata);
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
                                //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
                                await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, TextValue, initValue);
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
                            TextBox slDateBox = (TextBox)TargetPanel.FindControl(fielddata);
                            TextValue = slDateBox.Text;
							if (string.IsNullOrEmpty(TextValue.ToString()))
							{
								throw new Exception("Invalid date string detected in one of your fields.  Please check your values and try again.  This process has been terminated.");
							}
							else
							{
								if (IsCalcResult)
								{
									TextValue = await Record.CalculateFieldAsync(ItemID, FieldID);
								}
								if (TextValue.Equals("MM/dd/yyyy"))
								{
									TextValue = initValue;
								}
							}
                            
                            if (TextValue.Equals(initValue))
                            {
                                break;
                            }
                            else
                            {
                                if (TextValue.ToString() == "")
                                {
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, Convert.ToDateTime("01/01/1900"), initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, Convert.ToDateTime("01/01/1900"), initValue);
                                }
                                else if (TextValue.ToString() == string.Empty)
                                {
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, Convert.ToDateTime("01/01/1900"), initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, Convert.ToDateTime("01/01/1900"), initValue);
                                }
                                else
                                {
                                    //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, Convert.ToDateTime(TextValue), initValue);
                                    await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, Convert.ToDateTime(TextValue), initValue);
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
                            ListBox selListBox = (ListBox)TargetPanel.FindControl(fielddata);
                            if (selListBox.Items.Count > 0)
                            {
                                for (int n = 0; n < selListBox.Items.Count; n++)
                                {
                                    int UserID = Convert.ToInt32(selListBox.Items[n].Value);
                                    string UserName = selListBox.Items[n].Text;
                                    //Record.Update_UserField(ItemID, FieldID, UserID, UserName, ModuleID, ReqID, 1);
                                    await Record.Update_UserFieldAsync(ItemID, FieldID, UserID, UserName, ModuleID, ReqID, 1);
                                }

                                if (ViewState[selListBox.ID] != null)
                                {
                                    DataTable dtRemoved = (DataTable)ViewState[selListBox.ID];
                                    if (dtRemoved.Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in dtRemoved.Rows)
                                        {
                                            int UserID = Convert.ToInt32(dr["UserID"]);
                                            //Record.Update_UserField(ItemID, FieldID, UserID, string.Empty, ModuleID, ReqID, 0);
                                            await Record.Update_UserFieldAsync(ItemID, FieldID, UserID, string.Empty, ModuleID, ReqID, 0);
                                        }
                                    }
                                }
                            }
                            break;
                        case 8:
                            TextBox slNumBox = (TextBox)TargetPanel.FindControl(fielddata);
                            if (slNumBox.Text != null && slNumBox.Text != string.Empty)
                            {
                                TextValue = slNumBox.Text;
                            }
                            else
                            {
                                TextValue = 0;
                            }

                            if (TextValue.Equals(initValue))
                            {
                                break;
                            }
                            else
                            {
                                //Record.Modify_FieldData(ModuleID, ItemID, FieldID, FieldType, Convert.ToInt32(TextValue), initValue);
                                await Record.Modify_FieldDataAsync(ModuleID, ItemID, FieldID, FieldType, Convert.ToInt32(TextValue), initValue);
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
        }

		#endregion

	}
}