using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Helpers;
using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Implementation
{
    public class UserService : IUserService
    {
        private readonly OnlineLpk12DbContext _context;

        public UserService(OnlineLpk12DbContext context)
        {
            this._context = context;
        }

        public async Task<bool> Login(User user)
        {
            try{
                //_context.Users.Find(x => x.EmailId == user.EmailId && x.Password == user.Password);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> RegisterUser(User inputUser)
        {
            try
            {
                GetUser(inputUser.EmailId);
                Data.Models.User DbUser = new Data.Models.User()
                {
                    FirstName = inputUser.FirstName,
                    LastName = inputUser.LastName,
                    Password = inputUser.Password,
                    EmailId = inputUser.EmailId,
                    UserType = Helper.GetUserType(inputUser.IsStudent),
                    IsActive = (ulong)(inputUser.IsStudent ? 1 : 0)
                };
                await _context.Users.AddAsync(DbUser);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool GetUser(string emailId)
        {
            try
            {
                var user = _context.Users.Select(x => x.EmailId == emailId).First();
                if(user == null || !user)
                {
                    return false;
                }
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
    }
}
