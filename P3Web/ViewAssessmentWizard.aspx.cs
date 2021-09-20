using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paradigm3.datalayer;
using System.Data;
using System.Collections.Generic;
using System.Web.Security;

namespace Paradigm3
{
    public partial class ViewAssessmentWizard : SqlViewStatePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("answers");
                Session.Remove("Responses");
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            int QuesSetID = Convert.ToInt32(Request.QueryString["QuesSetID"]);
            DataTable dt = (DataTable)Session.Contents["dt"];
            Get_Questions(QuesSetID, dt);
        }

        protected void Get_Questions(int QuesSetID, DataTable dt)
        {
            ViewState["StepControls"] = null;
            //Create wizard
            Wizard wzAssessment = new Wizard
            {
                DisplaySideBar = false,
                Width = 830,
                Height = 320
            };
            wzAssessment.NextButtonClick += new WizardNavigationEventHandler(wzAssessment_NextButtonClick);
            wzAssessment.FinishButtonClick += new WizardNavigationEventHandler(wzAssessment_FinishButtonClick);

            foreach (DataRow dr in dt.Rows)
            {
                // Create wizard step
                WizardStepBase ws = new WizardStep
                {
                    ID = dr["QuesID"].ToString(),
                    Title = dr["QuesText"].ToString()
                };

                // Create question label
                ws.Controls.Add(new LiteralControl("<div class='assessmentLabel'>"));
                Label lblQuestion = new Label
                {
                    ID = "lbl" + dr["QuesID"].ToString(),
                    Text = ws.Title
                };
                ws.Controls.Add(lblQuestion);
                ws.Controls.Add(new LiteralControl("</div>"));                

                // Get Question variables and possible answers
                int QuesID = Convert.ToInt32(dr["QuesID"]);
                int QuesType = Convert.ToInt32(dr["AnswerType"]);
                DataTable dtAnswers = Record.Get_QuesPsbleAnswrs(QuesID);

                ws.Controls.Add(new LiteralControl("<div class='assessmentQuestion'>"));
                switch (QuesType)
                {
                    case 1: // Yes/No
                    case 2: // True/False
                        RadioButtonList rbl = new RadioButtonList
                        {
                            ID = "rbl_" + QuesType + "_" + dr["QuesID"].ToString()
                        };
                        rbl.Items.Add(new ListItem("Yes", "1"));
                        rbl.Items.Add(new ListItem("No", "0"));
                        if (QuesType == 2)
                        {
                            rbl.Items[0].Text = "True";
                            rbl.Items[1].Text = "False";
                        }
                        rbl.SelectedIndexChanged += new EventHandler(RadioButtonList_SelectedIndexChanged);
                        rbl.Style.Add("margin","20px 0 20px 30px");
                        ws.Controls.Add(rbl);
                        if (ViewState["StepControls"] != null)
                        {
                            ViewState["StepControls"] = ViewState["StepControls"] + "," + rbl.ID;
                        }
                        else
                        {
                            ViewState["StepControls"] = rbl.ID;
                        }
                        
                        break;
                    case 3: // Multiple choice: 1 Answer
                    case 4: // Multiple choice: Many Answers
                        CheckBoxList cbl = new CheckBoxList
                        {
                            ID = "cbl_" + QuesType + "_" + dr["QuesID"].ToString(),
                            DataSource = dtAnswers,
                            DataValueField = "AnsIndex",
                            DataTextField = "AnsText",
                        };
                        cbl.DataBind();
                        cbl.SelectedIndexChanged += new EventHandler(CheckBoxList_SelectedIndexChanged);
                        cbl.Style.Add("margin", "20px 0 20px 30px");
                        ws.Controls.Add(cbl);
                        if (ViewState["StepControls"] != null)
                        {
                            ViewState["StepControls"] = ViewState["StepControls"] + "," + cbl.ID;
                        }
                        else
                        {
                            ViewState["StepControls"] = cbl.ID;
                        }
                        break;
                    case 5: // Fill in the blanks.
                        foreach (DataRow ans in dtAnswers.Rows)
                        {
                            TextBox tb = new TextBox
                            {
                                ID = "tb_" + QuesType + "_" + dr["QuesID"].ToString().ToString()
                            };
                            tb.TextChanged += new EventHandler(TextBox_TextChanged);
                            tb.Style.Add("margin", "0 0 10px 20px");
                            ws.Controls.Add(tb);
                            ws.Controls.Add(new LiteralControl("<br />"));
                            if (ViewState["StepControls"] != null)
                            {
                                ViewState["StepControls"] = ViewState["StepControls"] + "," + tb.ID;
                            }
                            else
                            {
                                ViewState["StepControls"] = tb.ID;
                            }
                        }
                        break;
                }
                ws.Controls.Add(new LiteralControl("</div>"));

                // Add step to wizard
                wzAssessment.WizardSteps.Add(ws);
                dtAnswers.Dispose();
            }

            // Add wizard to panel.
            pnlWizard.Controls.Add(wzAssessment);
        }

        protected void PassData(int StepIndex)
        {
            // Return controls from step
            string StepControls = ViewState["StepControls"].ToString();
            string ControlID = string.Empty;
            string Answer = string.Empty;
            string[] ctls = StepControls.Split(',');

            // Get List of responses if one exists
            List<AssessmentResponse> responses = new List<AssessmentResponse>();
            if (Session.Contents["Responses"] != null)
            {
                responses = (List<AssessmentResponse>)Session.Contents["Responses"];
            }

            for (int i = 0; i < ctls.Count(); i++)
            {
                // If controls are in the current step
                if (i == StepIndex)
                {
                    // return control data.
                    ControlID = ctls[i];
                    string[] ControlData = ctls[i].Split('_');
                    string QuestionType = ControlData[0];
                    string QuesTypeInt = ControlData[1];
                    string QuestionID = ControlData[2];
                    DataTable dtAns = (DataTable)Session.Contents["dt"];
                    DataRow[] data = dtAns.Select("QuesID=" + QuestionID);
                    DataRow data1 = data[0];
                    string CorrectAnswer = data1["CrCtAnswrs"].ToString();
                    int NoOfQuesToPass = Convert.ToInt32(data1["NoOfQuesToPass"]);
                    dtAns.Dispose();
                    switch (QuestionType)
                    {
                        case "rbl": // Radiobutton list
                            RadioButtonList rbl = new RadioButtonList
                            {
                                ID = ctls[i]
                            };
                            string rbAnswer = "0";
                            if (ViewState[rbl.ID] != null)
                            {
                                rbAnswer = ViewState[rbl.ID].ToString();
                            }
                            Answer = rbAnswer;
                            break;
                        case "cbl": // Checkbox list
                            CheckBoxList cbl = new CheckBoxList
                            {
                                ID = ctls[i]
                            };
                            string cbAnswer = "0";
                            if (ViewState[cbl.ID] != null)
                            {
                                cbAnswer = ViewState[cbl.ID].ToString();
                            }
                            Answer = cbAnswer;
                            break;
                        case "tb": // Textbox
                            TextBox tb = new TextBox
                            {
                                ID = ctls[i]
                            };
                            string txtAnswer = string.Empty;
                            if (ViewState[tb.ID] != null)
                            {
                                txtAnswer = ViewState[tb.ID].ToString();
                            }
                            Answer = txtAnswer;
                            break;
                    }
                    AssessmentResponse Resp = new AssessmentResponse()
                    {
                        QuestionID = Convert.ToInt32(QuestionID),
                        QuestionType = Convert.ToInt32(QuesTypeInt),
                        QuestionText = Record.Get_QuestionText(Convert.ToInt32(QuestionID)),
                        Response = Answer,
                        CorrectResponse = CorrectAnswer,
                        ToPass = NoOfQuesToPass
                    };

                    responses.Add(Resp);
                }
            }
            Session["Responses"] = responses;
        }

        protected void wzAssessment_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            PassData(e.CurrentStepIndex);
        }

        protected void wzAssessment_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            PassData(e.CurrentStepIndex);
            List<AssessmentResponse> ResponseList = (List<AssessmentResponse>)Session["Responses"];
            int UserID = 0;
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                string authCookie = Request.Cookies[FormsAuthentication.FormsCookieName].Value;
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie);
                string UserData = authTicket.UserData;
                string[] UserValues = UserData.Split(',');
                UserID = Convert.ToInt32(UserValues[0]);
            }
            int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
            int ReqID = Convert.ToInt32(Request.QueryString["ReqID"]);
            int QuesSetID = Convert.ToInt32(Request.QueryString["QuesSetID"]);
            int TotalQuestions = ResponseList.Count;
            int TotalToPass = ResponseList[0].ToPass;
            int TotalCorrect = 0;
            foreach (AssessmentResponse a in ResponseList)
            {
                if (a.Response == a.CorrectResponse)
                {
                    TotalCorrect += 1;
                }
            }
            int ResultID = 2;
            if (TotalCorrect >= TotalToPass)
            {
                ResultID = 1;
            }
            DateTime dtBegin = DateTime.Now;
            DateTime dtEnd = DateTime.Now;
            float time = dtEnd.AddMinutes(5).Minute - (dtBegin.Minute);// * 0.01f;

            Record.Add_AssessmentRecord(UserID, ItemID, ReqID, QuesSetID, TotalQuestions, TotalToPass, TotalCorrect, ResultID, time);
            int NewID = Convert.ToInt32(Session.Contents["NewID"]);

            foreach (AssessmentResponse r in ResponseList)
            {
                string Ques = Record.Get_QuestionText(r.QuestionID);
                bool IsCorrect = false;
                if (r.Response == r.CorrectResponse)
                {
                    IsCorrect = true;
                }
                Record.Add_AssessmentAnswer(NewID, r.QuestionID, Ques, r.Response, IsCorrect, time);
            }

            Response.Redirect("ViewAssessmentResult.aspx?AttemptID=" + NewID.ToString());
        }

        protected void RadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbl = (RadioButtonList)sender;
            string ID = rbl.ID;
            string Responses = string.Empty;
            foreach (ListItem li in rbl.Items)
            {
                if (li.Selected)
                {
                    if (ViewState[ID] == null)
                    {
                        ViewState[ID] = li.Value;
                    }
                    else
                    {
                        ViewState[ID] = ViewState[ID] + "," + li.Value;
                    }
                }
            }
        }

        protected void CheckBoxList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckBoxList cbl = (CheckBoxList)sender;
            string ID = cbl.ID;
            string Responses = string.Empty;
            foreach (ListItem li in cbl.Items)
            {
                if (li.Selected)
                {
                    //ViewState[ID] = ViewState[ID] + ", " + li.Value;
                    if (ViewState[ID] == null)
                    {
                        ViewState[ID] = li.Value;
                    }
                    else
                    {
                        ViewState[ID] = " " + ViewState[ID] + ", " + li.Value + ",";
                    }
                }
            }
        }

        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            TextBox tb = (TextBox)sender;
            string ID = tb.ID;
            string Response = tb.Text;
            ViewState[ID] = Response;            
        }
    }
}