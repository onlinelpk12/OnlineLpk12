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

        public async Task<Result> Login(LoginUser user)
        {
            Result result = new Result();
            try
            {
                var userFromDb = await Task.FromResult(_context.Users.FirstOrDefault(x => x.Username == user.UserName && x.Password == user.Password));
                if (userFromDb != null)
                {
                    if (userFromDb.IsActive == 0)
                    {
                        result.Success = false;
                        result.Message = "User is inactive. Contact support for activation.";
                    }
                    else
                    {
                        result.Success = true;
                        result.Message = "User validation success.";
                    }
                }
                else
                {
                    result.Success = false;
                    result.Message = "Invalid Credentials.";
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return result;
        }

        public async Task<Result> RegisterUser(RegistrationUser inputUser)
        {
            Result result = new Result();
            try
            {
                Data.Models.User DbUser = new Data.Models.User()
                {
                    FirstName = inputUser.FirstName,
                    LastName = inputUser.LastName,
                    Password = inputUser.Password,
                    EmailId = inputUser.EmailId,
                    Username = inputUser.UserName,
                    UserType = Helper.GetUserType(inputUser.IsStudent),
                    IsActive = (ulong)(inputUser.IsStudent ? 1 : 0)
                };
                await _context.Users.AddAsync(DbUser);
                await _context.SaveChangesAsync();

                result.Success = true;
                result.Message = "User registered successfully.";
            }
            catch (Exception ex)
            {
                throw;
            }
            return result;
        }
        public async Task<bool> IsEmailIdExists(string emailId)
        {
            try
            {
                return await Task.FromResult(_context.Users.Any(x => x.EmailId == emailId));
            }
            catch
            {
                return false;
            }
        }
        public async Task<bool> IsUserNameExists(string username)
        {
            try
            {
                return await Task.FromResult(_context.Users.Any(x => x.Username == username));
            }
            catch
            {
                return false;
            }
        }
    }
}
