using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace P3Web.exceptionhandler
{
    interface IExceptionHandler
    {
        Task LogExceptionAsync(string message, int userid);
        void LogExceptiontoDB(string message, int userid);

    }
}
