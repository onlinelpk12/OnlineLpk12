using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Helpers;
using OnlineLpk12.Services.Interface;
using System.Net;
using System.Diagnostics;
using System.Reflection;
using System.Text;

namespace OnlineLpk12.Controllers
{

    //This file is no longer used. These were developed as per the initial design
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly ILogService _logService;
        public UserController(IUserService userService, ILogService logService)
        {
            this._userService = userService;
            _logService = logService;
        }

        [HttpPost("Register")]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.InternalServerError)]
        [AllowAnonymous]
        public async Task<IActionResult> Register([FromBody] RegistrationUser user)
        {
            Response<string> response = new();
            try
            {
                var validationMessages = Helper.ValidateUserWhileRegistering(user);
                if (validationMessages.Any())
                {
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }
                var isUsernameExists = await _userService.IsUserNameExists(user.UserName);
                var isEmailIdExists = await _userService.IsEmailIdExists(user.EmailId);

                var ispasswordstrong = await _userService.IsPasswordStrong(user.Password);
                if (isUsernameExists)
                {
                    validationMessages.Add("UserName already exists.");
                }
                if (isEmailIdExists)
                {
                    validationMessages.Add("Email Address already exists.");
                }

                if (!ispasswordstrong)
                {
                    validationMessages.Add("Password should be at least 8 characters long and include atleast one Upper case and one lowercase combination of letters, numbers, and special characters.");
                }

                if (validationMessages.Any())
                {
                    response.Errors = validationMessages;
                    //response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                var result = await _userService.RegisterUser(user);
                response.Message = result.Message;
                response.Content = result.Content;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Errors.Add("Error occurred while fetching the data.");
                response.Message = "One or more errors occurred.";
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("Login")]
        [ProducesResponseType(typeof(Response<LoginResponse>), (int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.InternalServerError)]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] LoginUser user)
        {
            Response<Token> response = new();
            try
            {
                var validationMessages = Helper.ValidateUserWhileLogin(user);
                if (validationMessages.Any())
                {
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }
                var result = await _userService.Login(user);
                if (result.Success)
                {
                    response.Message = result.Message;
                    response.Content = result.Content;
                    return Ok(response);
                }
                else
                {
                    response.Message = result.Message;
                    response.Errors.Add(result.Message);
                    return BadRequest(response);
                }
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

 [HttpGet("SendOTP")]
        [AllowAnonymous]
        public async Task<IActionResult> SendOTP([FromQuery] string userName)
        {
            if (userName == null)
            {
                return BadRequest("Enter valid User Id.");
            }

            //var response = new ContentResult();n

            try
            {
                var result = await _userService.SendOTP(userName);

                if (result.Content != null && result.Content.Any())
                {
                    return Ok(result.Content);
                }

                return NotFound("OTP not sent");
            }
            catch (Exception ex)
            {

                return StatusCode((int)HttpStatusCode.InternalServerError, "Error occurred while fetching the data.");
            }
        }

        [HttpPost("UpdatePassword")]
        [AllowAnonymous]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.InternalServerError)]
        public async Task<IActionResult> UpdatePassword([FromBody] LoginUser request)
        {
            Response<string> response = new();
            try
            {
                // Validate the request
                var validationMessages = Helper.ValidateUserWhileLogin(request);
                if (validationMessages.Any())
                {
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }
                var result = await _userService.UpdatePassword(request);
                if (result.Success)
                {
                    response.Message = result.Message;
                    response.Content = result.Content;
                    return Ok(response);
                }
                else
                {
                    response.Message = "New Password should be different from Old Password.";  
                    response.Errors.Add(result.Message);
                    return BadRequest(response);
                  

                }
            }
            
        catch (Exception ex)
            {
                response.Errors.Add("Error occurred while updating the password.");
                response.Message = "An error occurred while updating the password.";
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        // [HttpPost("ForgotPassword")]
        // [ProducesResponseType(typeof(Response<LoginResponse>), (int)HttpStatusCode.OK)]
        // [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        // [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.InternalServerError)]
        // [AllowAnonymous]
        // public async Task<IActionResult> ForgotPassword([FromBody] LoginUser user)
        // {
        //     Response<EmptyResult> response = new();
        //     try
        //     {
        //         var validationMessages = Helper.ValidateUserWhileLogin(user);
        //         if (validationMessages.Any())
        //         {
        //             response.Errors = validationMessages;
        //             response.Message = "One or more validation errors occurred.";
        //             return BadRequest(response);
        //         }   
        //         var result = await _userService.ForgotPassword(user);
        //         if (result.Success)
        //         {
        //             response.Message = result.Message;
        //             return Ok(response);
        //         }
        //         else
        //         {
        //             response.Message = "New Password should be different from Old Password.";  //error message added for a bug fix
        //             response.Errors.Add(result.Message);
        //             return BadRequest(response);
        //         }
        //     }
        //     catch (Exception ex)
        //     {
        //          response.Message = "One or more validation errors occurred.";
        //        response.Errors.Add("Error occurred while fetching the data.");
        //        return StatusCode((int)HttpStatusCode.InternalServerError, response);
        //    }
        // }
        
        [HttpGet("{userId}/course/{courseId}")]
        [AllowAnonymous]
        public async Task<IActionResult> TeacherStudentsForCourse(int userId, int courseId)
        {
            Response<List<Student>> response = new();
            try
            {
                //if User Id is less than or equal to 0 -> return bad request error
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                //if Course Id is less than or equal to 0 -> return bad request error
                if (courseId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Course Id.");
                    return BadRequest(response);
                }

               
                //Get students for the course
                var result = await _userService.CourseMap(userId, courseId);

                //If there are any courses return them
                if (result.Content != null && result.Content.Any())
                {
                    return Ok(result);
                }
                //If there are no courses return Not found error
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No students found for this course and teacher.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

    }
}
