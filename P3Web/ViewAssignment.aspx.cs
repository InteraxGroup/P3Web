using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;
using System.Web.Security;
using System.Configuration;

namespace Paradigm3
{
    public partial class ViewAssignment : SqlViewStatePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool UseSSO = Convert.ToBoolean(ConfigurationManager.AppSettings["UseSSO"]);
                if (UseSSO && Request.Cookies[FormsAuthentication.FormsCookieName] == null)
                {
                    ClientScript.RegisterStartupScript(GetType(), "sessionexpired", "alert('Your Paradigm 3 user session has expired. Please restart your browser and try again');window.close();", true);
                }
                int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
                Get_Reponsible(ItemID, ObjTypeID);
                Get_DueDate(ItemID, ObjTypeID);
                if (!chkEscalate.Checked)
                {
                    Disable_Escalate();
                }
            }
        }

        protected void Get_Reponsible(int ItemID, int ObjTypeID)
        {
            DataTable dt = Record.Get_StepResponsible(ItemID, ObjTypeID);
            if (dt.Rows.Count > 0)
            {
                gvResponsible.DataSource = dt;
                gvResponsible.DataBind();
            }
        }

        protected void Get_DueDate(int ItemID, int ObjTypeID)
        {
            DataTable dt = Record.Get_StepDueInterval(ItemID, ObjTypeID);
            DateTime CreateDate = DateTime.Today;
            if (dt.Rows.Count > 0)
            {
                CreateDate = Convert.ToDateTime(dt.Rows[0]["CreateDate"]);
                int DueInterval = 5;
                if (dt.Rows[0]["DayInterval"] != DBNull.Value)
                {
                    DueInterval = Convert.ToInt32(dt.Rows[0]["DayInterval"]);
                }
                CreateDate = CreateDate.AddDays(DueInterval);
            }
            txtDueDate.Text = CreateDate.AddDays(5).ToShortDateString();
        }

        protected void chkEscalate_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEscalate.Checked)
            {
                txtDueDate.ReadOnly = false;
                //neNumDays.Enabled = true;
                pnlEscalateList.Style.Add("background-color", "#FFF");
                btnAddEscalate.Enabled = true;
                btnRemoveEscalate.Enabled = true;
            }
            else
            {
                Disable_Escalate();
            }
        }

        protected void Disable_Escalate()
        {
            txtDueDate.ReadOnly = true;
            //neNumDays.Enabled = false;
            pnlEscalateList.Style.Add("background-color", "#F0F0F0");
            btnAddEscalate.Enabled = false;
            btnRemoveEscalate.Enabled = false;
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "assignresponsible":                    
                    ClientScript.RegisterStartupScript(GetType(), "assignresponsible", "openSelect('gvResponsible');", true);
                    break;
                case "assignEscalate":
                    ScriptManager.RegisterStartupScript(udpEscalate, udpEscalate.GetType(), "assignescalate", "openSelect('gvEscalate');", true);
                    break;
                case "refreshresponsible":
                    if (Session.Contents["dtSelected"] != null)
                    {
                        int recID = Convert.ToInt32(Request.QueryString["ItemID"]);
                        int recTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
                        DataTable dtResponsible = (DataTable)Session.Contents["dtSelected"];                        

                        for (int i = 0; i < gvResponsible.Rows.Count; i++)
                        {
                            bool IsDuplicate = false;
                            foreach (DataRow drResp in dtResponsible.Rows)
                            {
                                if (gvResponsible.DataKeys[i].Value.ToString() == drResp["ControlID"].ToString())
                                {
                                    IsDuplicate = true;
                                }
                            }

                            if (!IsDuplicate)
                            {
                                DataRow drOldData = dtResponsible.NewRow();
                                drOldData["ControlID"] = gvResponsible.DataKeys[i].Value;
                                drOldData["ControlFullName"] = gvResponsible.Rows[i].Cells[1].Text;
                                drOldData["ControlType"] = gvResponsible.Rows[i].Cells[2].Text;
                                dtResponsible.Rows.Add(drOldData);
                            }                            
                        }
                        dtResponsible.AcceptChanges();

                        gvResponsible.DataSource = dtResponsible.DefaultView.ToTable(true);
                        gvResponsible.DataBind();
                    }
                    break;
                case "refreshescalate":
                    if (Session.Contents["dtSelected"] != null)
                    {
                        DataTable dtEscalate = (DataTable)Session.Contents["dtSelected"];
                        if (gvEscalate.Rows.Count > 0)
                        {
                            for (int i = 0; i < gvResponsible.Rows.Count; i++)
                            {
                                DataRow drOldData = dtEscalate.NewRow();
                                drOldData["ControlID"] = gvEscalate.DataKeys[i].Value;
                                drOldData["ControlFullName"] = gvEscalate.Rows[i].Cells[1].Text;
                                drOldData["ControlType"] = gvEscalate.Rows[i].Cells[2].Text;
                                dtEscalate.Rows.Add(drOldData);
                            }
                            dtEscalate.AcceptChanges();                            
                        }
                        gvEscalate.DataSource = dtEscalate;
                        gvEscalate.DataBind();
                    }
                    break;
                case "submit":                    
                    int ModuleID = 6;
                    int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    int ObjTypeID = Convert.ToInt32(Request.QueryString["ObjTypeID"]);
                    int IsNew = Convert.ToInt32(Request.QueryString["IsNew"]);
                    int ParentGroupID = P3General.Get_ParentGroupID(ModuleID, ItemID);             

                    if (gvResponsible.Rows.Count > 0)
                    {
                        bool IsExist = false;
                        foreach (GridViewRow gvrResp in gvResponsible.Rows)
                        {
                            DataTable dtResp = Record.Get_StepResponsible(ItemID, ObjTypeID);
                            for (int i = 0; i < dtResp.Rows.Count; i++)
                            {
                                string RespID = gvResponsible.DataKeys[gvrResp.RowIndex].Values["ControlID"].ToString();
                                string ControlID = dtResp.Rows[i]["ControlID"].ToString();
                                string RespType = gvrResp.Cells[2].Text;
                                string ControlType = dtResp.Rows[i]["ControlType"].ToString();
                                if (RespID == ControlID && RespType == ControlType)
                                {
                                    IsExist = true;
                                }
                            }

                            if (!IsExist)
                            {
                                int ControlID = Convert.ToInt32(gvResponsible.DataKeys[gvrResp.RowIndex].Value);
                                string ControlFullName = gvrResp.Cells[1].Text;
                                string ControlType = gvrResp.Cells[2].Text;
                                Record.Add_StepResponsible(ModuleID, ItemID, ObjTypeID, ControlID, ControlFullName, ControlType);
                            }                         
                        }                        
                    }

                    // Gather User and Record Information
                    int TabIndex = Convert.ToInt32(Request.QueryString["TabIndex"]);
                    DataSet dsRecord = Record.GetRecord(ModuleID, ItemID, 0);
                    string ItemName = dsRecord.Tables[0].Rows[0]["Name"].ToString(); //Record.Get_RecordName(ModuleID, ItemID);
                    string TabName = dsRecord.Tables[1].Rows[TabIndex]["Caption"].ToString(); //Record.Get_StepName(ObjTypeID);
                    string NextTabName = dsRecord.Tables[1].Rows[TabIndex + 1]["Caption"].ToString(); //Record.Get_StepName(ObjTypeID - 1);                    
                    int ObjID = Convert.ToInt32(dsRecord.Tables[1].Rows[TabIndex]["ObjID"]);//P3General.Get_ObjID(ObjTypeID) - 1;
                    if (HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                    {
                        string authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                        FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie);
                        string UserData = ticket.UserData;
                        string[] UserValues = UserData.Split(',');

                        int UserID = Convert.ToInt32(UserValues[0]);
                        string UserFullName = UserValues[1];

						// Trigger Event
						foreach (GridViewRow gvr in gvResponsible.Rows)
						{
							CheckBox chkSelect = (CheckBox)gvr.Cells[0].FindControl("chkSelect");
							if (chkSelect.Checked)
							{
								if (gvr.Cells[2].Text == "Entity")
								{
									int rIndex = gvr.RowIndex;
									DataTable dtUserResp = Record.Get_UserResp(1, Convert.ToInt32(gvResponsible.DataKeys[rIndex].Value));
									foreach (DataRow drUsr in dtUserResp.Rows)
									{
										int recID = Convert.ToInt32(drUsr["ControlID"]);
										string recName = drUsr["ControlFullName"].ToString();
										Record.Trigger_Event(TabIndex, ModuleID, ItemID, ObjTypeID, ParentGroupID, ItemName, NextTabName, recID, recName);
									}
								}
								else
								{
									int recID = Convert.ToInt32(gvResponsible.DataKeys[gvr.RowIndex].Value);
									string recName = gvr.Cells[1].Text;
									Record.Trigger_Event(TabIndex, 6, ItemID, ObjTypeID, ParentGroupID, ItemName, NextTabName, recID, recName);
								}
							}
						}

						if (IsNew == 0)
						{
							// Complete Step
							Record.Complete_Tab(TabIndex, ModuleID, ItemID, ObjID, UserFullName, UserID, 0);
							// Update History
							Record.Edit_History(ModuleID, ItemID, TabName, "Step Finished", UserFullName);
							// Close Window
							ClientScript.RegisterStartupScript(GetType(), "close", "recordRefresh();window.close();", true);
						}
						else
						{
							string strVar = ModuleID + "," + ItemID + "," + ObjTypeID + "," + ParentGroupID + ",1";
							ClientScript.RegisterStartupScript(GetType(), "openrecord", "openRecordWindow(" + strVar + ");window.close();", true);
						}
					}
					else
					{
						ClientScript.RegisterStartupScript(GetType(), "Abort", "alert('Your session has timed out.  Please log in and try again.');window.opener.location.reload(false);window.close();", true);
					}                    
                    break;
                case "cancel":
                    ClientScript.RegisterStartupScript(GetType(), "close", "window.close();", true);
                    break;
            }
        }
    }
}