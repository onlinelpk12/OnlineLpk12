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
using System.Net;
using System.Net.Mail;

namespace OnlineLpk12.Services.Implementation
{
    public class UserService : IUserService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly IConfiguration _configuration;
        private readonly ILogService _logService;

        private const string FromEmailAddress = "onlinelpk122024@gmail.com";
        private const string GoogleAppPassword = "vbfwzantdganxhbh";
        private const string Subject = "OTP for Password Reset";

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

        public async Task<Result<string>> RegisterUser(RegistrationUser inputUser)
        {
            Result<string> result = new Result<string>();
            try
            {
                Data.Models.User DbUser = new Data.Models.User()
                {
                    FirstName = inputUser.FirstName,
                    LastName = inputUser.LastName,
                    Password = BCrypt.Net.BCrypt.HashPassword(inputUser.Password, 8),
                    EmailId = inputUser.EmailId,
                    Username = inputUser.UserName,
                    UserType = "",
                    IsActive = true
                };
               
                await _context.Users.AddAsync(DbUser);
                await _context.SaveChangesAsync();
                Data.Models.User user = GetUserDetailsByUserName(inputUser.UserName);
                result.Content = user.Id.ToString();
                result.Success = true;
                result.Message = "User registered successfully.";

                string[] roles = inputUser.Roles.Split(",");
                for (int i = 0; i < roles.Length; i++)
                {


                    Data.Models.UserRole userRole = new Data.Models.UserRole()
                    {
                        UserId = user.Id,
                        RoleId = Convert.ToInt32(roles[i])
                    };
                    await _context.UserRoles.AddAsync(userRole);

                }
                await _context.SaveChangesAsync();




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
        public async Task<bool> IsPasswordStrong(string password)
        {
            // Require at least 8 characters
            if (password.Length < 8)
            {
                return false;
            }

            // Require at least one uppercase letter
            bool hasUppercase = false;

            // Require at least one lowercase letter
            bool hasLowercase = false;

            // Require a combination of letters, numbers, and special characters
            bool hasLetter = false;
            bool hasDigit = false;
            bool hasSpecialCharacter = false;

            foreach (char character in password)
            {
                if (char.IsLetter(character))
                {
                    hasLetter = true;

                    if (char.IsUpper(character))
                    {
                        hasUppercase = true;
                    }
                    else if (char.IsLower(character))
                    {
                        hasLowercase = true;
                    }
                }
                else if (char.IsDigit(character))
                {
                    hasDigit = true;
                }
                else if (char.IsSymbol(character) || char.IsPunctuation(character))
                {
                    hasSpecialCharacter = true;
                }
            }

            // Check if the password meets all criteria
            return hasLetter && hasDigit && hasSpecialCharacter && hasUppercase && hasLowercase;
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


        public async Task<Result<string>> SendOTP(string userName)
        {
            Result<string> result = new Result<string>();

            // Assuming the result will contain a single string (email address)
            var ToEmailAddress = await _context.Users
                                            .Where(u => u.Username == userName)
                                            .Select(u => u.EmailId)
                                            .FirstOrDefaultAsync();

            if (ToEmailAddress == null)
            {
                throw new Exception("User does not exists");
            }

            string otp = GenerateRandomOTP();

            result.Content = otp;

            // The HTML body of the email, including the OTP
            string body = $"<h1>Hello</h1><p>Your OTP for password reset is: {otp}</p>";

            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential(FromEmailAddress, GoogleAppPassword),
                EnableSsl = true,
            };
            var mailMessage = new MailMessage
            {
                From = new MailAddress(FromEmailAddress),
                Subject = Subject,
                Body = body,
                IsBodyHtml = true,
            };
            mailMessage.To.Add(ToEmailAddress);

            try
            {
                smtpClient.Send(mailMessage);
                Console.WriteLine("Email sent successfully!");
                return result;
            }
            catch (Exception e)
            {
                Console.WriteLine($"Failed to send email. Error: {e.Message}");
            }

            return result;
        }

        private string GenerateRandomOTP()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }

        // public async Task<Result<EmptyResult>> ForgotPassword(LoginUser user)
        // {
        //     Result<EmptyResult> result = new Result<EmptyResult>();
        //     try
        //     {
        //         var userFromDb = await Task.FromResult(_context.Users.FirstOrDefault(x => x.Username == user.UserName));
        //         if (userFromDb != null)
        //         {

        //             if (!Convert.ToBoolean(userFromDb.IsActive))
        //             {
        //                 result.Success = false;
        //                 result.Message = "User is inactive. Contact support for activation.";
        //             }
        //             //Validation to check if new and old passwords match.
        //             else if (BCrypt.Net.BCrypt.Verify(user.Password, userFromDb.Password))
        //             {
        //                 result.Success = false;
        //                 result.Message = "New password should not match old password.";
        //             }
        //             else
        //             {
        //                 userFromDb.Password = BCrypt.Net.BCrypt.HashPassword(user.Password, 8);
        //                 await _context.SaveChangesAsync();
        //                 result.Success = true;
        //                 result.Message = "User password updated successfully!.";
        //             }
        //         }
        //         else
        //         {
        //             result.Success = false;
        //             result.Message = "User Not found.";
        //         }
        //     }
        //     catch (Exception ex)
        //     {
        //         throw;
        //     }
        //     return result;
        // }
        public async Task<int> GetTeacherIdByCourseId(int courseId)
        {
            try
            {
                var user = await (from usr in _context.CourseTeacher
                                  where usr.CourseId == courseId
                                  select usr).LastOrDefaultAsync();
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
