using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
using System.Threading.Tasks;

namespace OnlineLpk12.Services.Interface
{
    public interface IUserService
    {
        Task<Result<string>> RegisterUser(RegistrationUser user);
       // Task<Result<EmptyResult>> ForgotPassword(LoginUser user);
       Task<Result<string>> SendOTP(string userName);
       Task<Result<string>> UpdatePassword(LoginUser request);
        Task<Result<Token>> Login(LoginUser user);
        public Data.Models.User GetUserDetailsByUserName(string username);
        Task<bool> IsEmailIdExists(string emailId);
        Task<bool> IsUserNameExists(string userName);
        Task<bool> IsUserTeacher(int userId);
        Task<bool> IsPasswordStrong(string password);
        Task<string> GetUserNameByUserId(int userId);
        Task<int> GetTeacherIdByCourseId(int courseId);
        Task<Result<string>> CourseMap(int userId, int courseId);
        Task<bool> IsCourseDeveloper(int userId);
    }
}
