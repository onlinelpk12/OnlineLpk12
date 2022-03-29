using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface IUserService
    {
        public bool RegisterUser(Data.Entities.User user);
    }
}
