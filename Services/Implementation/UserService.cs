using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Helpers;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
using Microsoft.AspNetCore.Mvc;
using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace OnlineLpk12.Services.Implementation
{
    public class UserService : IUserService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly IConfiguration _configuration;
        private readonly ILogService _logService;

        public UserService(OnlineLpk12DbContext context, ILogService logService, IConfiguration configuration)
        {
            _context = context;
            _logService = logService;
            _configuration = configuration;
        }

        public async Task<Result<Token>> Login(LoginUser user)
        {
            Result<Token> result = new Result<Token>();
            try
            {
                var userFromDb = await Task.FromResult(_context.Users.FirstOrDefault(x => x.Username == user.UserName));
                if (userFromDb != null)
                {

                    if (!Convert.ToBoolean(userFromDb.IsActive))
                    {
                        result.Success = false;
                        result.Message = "User is inactive. Contact support for activation.";
                    }
                    else if(!BCrypt.Net.BCrypt.Verify(user.Password, userFromDb.Password))
                    {
                        result.Success = false;
                        result.Message = "Invalid Password!";
                    }
                    else
                    {
                        result.Success = true;
                        result.Message = "User validation success.";
                        var key = Encoding.ASCII.GetBytes(_configuration.GetValue<string>("Key"));
                        Response<string> response = new();
                        var tokenDescriptor = new SecurityTokenDescriptor
                        {
                            Subject = new ClaimsIdentity(new[]
                            {
                            new Claim("id", userFromDb.Id.ToString()),
                            new Claim(JwtRegisteredClaimNames.Email, user.UserName)
                            }),
                            Expires = DateTime.UtcNow.AddHours(24),
                            SigningCredentials = new SigningCredentials
                            (new SymmetricSecurityKey(key),
                            SecurityAlgorithms.HmacSha512Signature)
                        };
                        var tokenHandler = new JwtSecurityTokenHandler();
                        var token = tokenHandler.CreateToken(tokenDescriptor);
                         

                        result.Content = new Token()
                        {
                           accessToken = tokenHandler.WriteToken(token),
                           email = userFromDb.EmailId,
                           id = userFromDb.Id,
                           username = userFromDb.Username,
                           roles = userFromDb.UserType

                        };
                    }
                }
                else
                {
                    result.Success = false;
                    result.Message = "User Not found.";
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
                    Password = BCrypt.Net.BCrypt.HashPassword(inputUser.Password, 8),
                    EmailId = inputUser.EmailId,
                    Username = inputUser.UserName,
                    UserType = Helper.GetUserType(inputUser.IsStudent),
                    IsActive = inputUser.IsStudent
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
        public async Task<Result<string>> CourseMap(int userId, int courseId)
        {
            Result<string> result = new();
            bool isTeacher = await IsUserTeacher(userId);
            if (isTeacher)
            {
                await _context.CourseTeacher.AddAsync(new Data.Models.CourseTeacher()
                {
                    CourseId = courseId,
                    TeacherId = userId,
                });
                //save changes
                await _context.SaveChangesAsync();

                result.Success = true;
                result.Content = "Created a Teacher Course map successfully!";
            }
            else
            {
                int teacherId = await GetTeacherIdByCourseId(courseId);
                await _context.CoursesStudents.AddAsync(new Data.Models.CoursesStudent()
                {
                    CourseId = courseId,
                    StudentId = userId,
                    TeacherId = teacherId
                });
                //save changes
                await _context.SaveChangesAsync();
                result.Success = true;
                result.Content = "Created a  Student Teacher Course map successfully!";
            }
            return result;
        }

        public Data.Models.User GetUserDetailsByUserName(string username)
        {
            try
            {
                return _context.Users.FirstOrDefault(x => x.Username == username);

            }
            catch (Exception ex)
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

        public async Task<bool> IsUserTeacher(int userId)
        {
            try
            {
                var user = await (from usr in _context.Users
                            where usr.Id == userId
                            select usr).FirstOrDefaultAsync();
                return user != null && !string.IsNullOrEmpty(user.UserType) && user.UserType.Trim().ToUpper() == "TEACHER";
            }
            catch(Exception ex)
            {
                _logService.LogError(userId, "IsUserTeacher", "UserService", ex.Message, ex);
                return false;
            }
        }

        public async Task<string> GetUserNameByUserId(int userId)
        {
            try
            {
                var user = await (from usr in _context.Users
                                  where usr.Id == userId
                                  select usr).FirstOrDefaultAsync();
                return user != null && !string.IsNullOrEmpty(user.Username) ? user.Username.ToLower() : string.Empty;
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, "GetUserNameByUserId", "UserService", ex.Message, ex);
                return string.Empty;
            }
        }

        public async Task<Result<EmptyResult>> ForgotPassword(LoginUser user)
        {
            Result<EmptyResult> result = new Result<EmptyResult>();
            try
            {
                var userFromDb = await Task.FromResult(_context.Users.FirstOrDefault(x => x.Username == user.UserName));
                if (userFromDb != null)
                {

                    if (!Convert.ToBoolean(userFromDb.IsActive))
                    {
                        result.Success = false;
                        result.Message = "User is inactive. Contact support for activation.";
                    }

                    else
                    {
                        userFromDb.Password = BCrypt.Net.BCrypt.HashPassword(user.Password, 8);
                        await _context.SaveChangesAsync();
                        result.Success = true;
                        result.Message = "User password updated successfully!.";
                    }
                }
                else
                {
                    result.Success = false;
                    result.Message = "User Not found.";
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return result;
        }
        public async Task<int> GetTeacherIdByCourseId(int courseId)
        {
            try
            {
                var user = await (from usr in _context.CourseTeacher
                                  where usr.CourseId == courseId
                                  select usr).FirstOrDefaultAsync();
                return user.TeacherId;
            }
            catch (Exception ex)
            {
                _logService.LogError(courseId, "GetUserNameByUserId", "UserService", ex.Message, ex);
                return 0;
            }
        }
    }
}
