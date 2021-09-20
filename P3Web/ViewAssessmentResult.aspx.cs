using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Paradigm3.datalayer;

namespace Paradigm3
{
    public partial class ViewAssessmentResult : SqlViewStatePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int AttemptID = 0;
                if (Request.QueryString["AttemptID"] != null)
                {
                    AttemptID = Convert.ToInt32(Request.QueryString["AttemptID"]);
                }
                Load_Result(AttemptID);
                    
            }
        }

        protected void Load_Result(int AttemptID)
        {
            DataTable dt = Record.Get_AssessmentResult(AttemptID);
            lblID.Text = "#" + dt.Rows[0]["AttemptID"].ToString();
            lblItemID.Text = dt.Rows[0]["ItemID"].ToString();
            lblTotalQues.Text = dt.Rows[0]["OfrdNoOfQues"].ToString();
            lblTotalCrct.Text = dt.Rows[0]["NoOfCrctAnswer"].ToString();
            lblRequired.Text = dt.Rows[0]["NoOfQuesToPass"].ToString();

            int ResultID = Convert.ToInt32(dt.Rows[0]["ResultID"]);
            string Result = "Unsuccessful";
            lblResult.ForeColor = System.Drawing.Color.Red;
            lblInstruction.Text = "In order to complete this requirement, you must successfully complete the associated competency assessment.  Please try again later.";
            if (ResultID == 1)
            {
                Result = "Successful";
                lblResult.ForeColor = System.Drawing.Color.ForestGreen;
                lblInstruction.Text = "Please remember to finish the associated requirement in the Training record after closing this assessment.";
            }
            lblResult.Text = Result;
            dt.Dispose();
        }
    }
}