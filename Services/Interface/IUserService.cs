using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface IUserService
    {
        Task<Result<EmptyResult>> RegisterUser(RegistrationUser user);
        Task<Result<LoginResponse>> Login(LoginUser user);
        Task<bool> IsEmailIdExists(string emailId);
        Task<bool> IsUserNameExists(string userName);
    }
}
