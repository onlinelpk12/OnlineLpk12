using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface IUserService
    {
        Task<bool> RegisterUser(User user);
        Task<bool> Login(User user);
    }
}
