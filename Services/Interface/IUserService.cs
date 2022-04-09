using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface IUserService
    {
        Task<Result<RegistrationUser>> RegisterUser(RegistrationUser user);
        Task<Result<LoginResponse>> Login(LoginUser user);
        Task<bool> IsEmailIdExists(string emailId);
        Task<bool> IsUserNameExists(string userName);
    }
}
