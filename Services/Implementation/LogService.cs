using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Interface;

namespace OnlineLpk12.Services.Implementation
{
    public class LogService : ILogService
    {
        private readonly OnlineLpk12DbContext _context;
        public LogService(OnlineLpk12DbContext context)
        {
            _context = context;

        }

        public async Task LogError(int userId, string methodName, string fileName, string message, Exception exception)
        {
            try
            {
                string msg = message.Replace("'", "\\'").Replace("\"","");
                string exp = exception.ToString().Replace("'", "\\'").Replace("\"","");
                _context.Database.ExecuteSqlRaw(@$"INSERT INTO ONLINELPK12.ACTIVITY_LOG
                                values ('{userId}','{methodName}','{fileName}','ERROR','{msg}','{exp}',sysdate())");
            }
            catch 
            {
                //throw;
            }
        }
        public async Task LogInfo(int userId, string methodName, string fileName, string message)
        {
            try
            {
               //Used query to get rid of no primary key issue
                _context.Database.ExecuteSqlRaw(@$"INSERT INTO ONLINELPK12.ACTIVITY_LOG
                                values ('{userId}','{methodName}','{fileName}','INFO','{message}','',sysdate())");
            }
            catch 
            {
                //throw;
            }
        }
    }
}
