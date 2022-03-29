using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Helpers;

namespace OnlineLpk12.Services.Implementation
{
    public class UserService : IUserService
    {
        private readonly OnlineLpk12DbContext _context;

        public UserService(OnlineLpk12DbContext context)
        {
            this._context = context;
        }
        public bool RegisterUser(Data.Entities.User inputUser)
        {
            try
            {
                Data.Models.User DbUser = new Data.Models.User()
                {
                    FirstName = inputUser.FirstName,
                    LastName = inputUser.LastName,
                    Password = inputUser.Password,
                    EmailId = inputUser.EmailId,
                    UserType = Helper.GetUserType(inputUser.IsStudent),
                    IsActive = (ulong)(inputUser.IsStudent ? 1 : 0)
                };
                _context.Users.Add(DbUser);
                _context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
