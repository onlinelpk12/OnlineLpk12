﻿using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
    public interface IUserService
    {
        Task<Result<string>> RegisterUser(RegistrationUser user);
        Task<Result<EmptyResult>> ForgotPassword(LoginUser user);
        Task<Result<Token>> Login(LoginUser user);
        public Data.Models.User GetUserDetailsByUserName(string username);
        Task<bool> IsEmailIdExists(string emailId);
        Task<bool> IsUserNameExists(string userName);
        Task<bool> IsUserTeacher(int userId);
        Task<string> GetUserNameByUserId(int userId);
        Task<int> GetTeacherIdByCourseId(int courseId);
        Task<Result<string>> CourseMap(int userId, int courseId);
    }
}
