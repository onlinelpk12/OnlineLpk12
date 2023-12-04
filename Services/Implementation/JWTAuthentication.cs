using System;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Data.Context;
using System.Diagnostics;
using System.Reflection;

namespace OnlineLpk12.Services.Implementation
{
	public class JWTAuthentication : IJWTAuthentication
	{
        private readonly ILogService _logService;
        private readonly OnlineLpk12DbContext _context;
        public JWTAuthentication(OnlineLpk12DbContext context, ILogService logService)
		{
            _context = context;
            _logService = logService;
        }

        //public Task<Result<Data.Models.User>> IsUserExists(Login user)
        //{
        //    try
        //    {

        //    }
        //    catch (Exception ex)
        //    {
        //        _logService.LogError(0, MethodBase.GetCurrentMethod().Name,
        //           Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
        //        throw;
        //    }
        //}

        public Task<Result<Token>> signIn(Login user)
        {
            throw new NotImplementedException();
        }
    }
}