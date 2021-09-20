using System;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;

namespace Paradigm3
{
    public partial class ViewAssessment : SqlViewStatePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("dt");
            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            switch (arg)
            {
                case "Assess":
                    int ItemID = Convert.ToInt32(Request.QueryString["ItemID"]);
                    int ReqID = Convert.ToInt32(Request.QueryString["ReqID"]);
                    int QuesSetID = Convert.ToInt32(Request.QueryString["QuesSetID"]);
                    int OfrdNoOfQues = Record.Get_OfrdNoOfQues(QuesSetID);
                    DataTable dt = Record.Get_Assessment(QuesSetID, OfrdNoOfQues);
                    Session["dt"] = dt;
                    Response.Redirect("~/ViewAssessmentWizard.aspx?ItemID=" + ItemID.ToString() + "&ReqID=" + ReqID.ToString() + "&QuesSetID=" + QuesSetID.ToString());
                    break;
                case "Cancel":
                    ClientScript.RegisterStartupScript(GetType(), "close", "window.close();", true);
                    break;
            }
        }
    }
}