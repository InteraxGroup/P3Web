using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Paradigm3.custom.amtrak
{
	[Serializable]
	public class AmtrakCategory
	{
		public int CatID { get; set; }
		public string CatCaption { get; set; }
	}
}