using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Paradigm3.datalayer
{
	public class StepDetails
	{
		public string StepResponsible { get; set; }
		public DateTime StepDueDate { get; set; }
		public bool IsStepCompleted { get; set; }
		public DateTime? StepCompleted { get; set; }
	}
}