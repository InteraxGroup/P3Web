using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Web.Security;

namespace Paradigm3.custom.Biotium
{
	public partial class HomePage : SqlViewStatePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				ShowShortCuts();
			}
		}

		private void ShowShortCuts()
		{
			pnlShortcuts.Visible = false;
			if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
			{
				pnlShortcuts.Visible = true;
			}
		}
	}
}