using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Paradigm3.custom.bayshore
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BayShoreMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "0":
                    HomePanel.Visible = true;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    FinancePanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "1":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = true;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    FinancePanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "2":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = true;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    FinancePanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "3":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = true;
                    CQHIPPanel.Visible = false;
                    FinancePanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "4":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = true;
                    FinancePanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
                case "5":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    FinancePanel.Visible = true;
                    ISPanel.Visible = false;
                    break;
                case "6":
                    HomePanel.Visible = false;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    FinancePanel.Visible = false;
                    ISPanel.Visible = true;
                    break;
                default:
                    HomePanel.Visible = true;
                    EmployeePanel.Visible = false;
                    HRPanel.Visible = false;
                    HSPanel.Visible = false;
                    CQHIPPanel.Visible = false;
                    FinancePanel.Visible = false;
                    ISPanel.Visible = false;
                    break;
            }
        }
    }
}