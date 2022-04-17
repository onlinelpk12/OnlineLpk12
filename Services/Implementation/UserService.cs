using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Helpers;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
using Microsoft.AspNetCore.Mvc;

namespace OnlineLpk12.Services.Implementation
{
    public class UserService : IUserService
    {
        private readonly OnlineLpk12DbContext _context;

        public UserService(OnlineLpk12DbContext context)
        {
            this._context = context;
        }

        public async Task<Result<LoginResponse>> Login(LoginUser user)
        {
            Result<LoginResponse> result = new Result<LoginResponse>();
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
                        result.Content = new LoginResponse()
                        {
                            UserName = userFromDb.Username,
                            FirstName = userFromDb.FirstName,
                            LastName = userFromDb.LastName,
                            UserType = userFromDb.UserType,
                            UserId = userFromDb.Id

                        };
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

        public async Task<Result<EmptyResult>> RegisterUser(RegistrationUser inputUser)
        {
            Result<EmptyResult> result = new Result<EmptyResult>();
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

        public Data.Models.User GetUserDetailsByUserName(string username)
        {
            try
            {
                return _context.Users.FirstOrDefault(x => x.Username == username);

            }
            catch(Exception ex)
            {
                return null;
            }
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
