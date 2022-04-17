using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
    public interface IUserService
    {
        Task<Result<EmptyResult>> RegisterUser(RegistrationUser user);
        Task<Result<LoginResponse>> Login(LoginUser user);
        public Data.Models.User GetUserDetailsByUserName(string username);
        Task<bool> IsEmailIdExists(string emailId);
        Task<bool> IsUserNameExists(string userName);
    }
}
