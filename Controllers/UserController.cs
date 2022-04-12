using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Helpers;
using OnlineLpk12.Services.Interface;
using System.Net;
using System.Text;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            this._userService = userService;
        }

        [HttpPost("Register")]
        [ProducesResponseType(typeof(Response<EmptyResult>),(int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(Response<EmptyResult>),(int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.InternalServerError)]
        public async Task<IActionResult> Register([FromBody] RegistrationUser user)
        {
            Response<EmptyResult> response = new();
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
                if (isUsernameExists)
                {
                    validationMessages.Add("UserName already exists.");
                }
                if (isEmailIdExists)
                {
                    validationMessages.Add("Email Address already exists.");
                }
                if (validationMessages.Any())
                {
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                var result = await _userService.RegisterUser(user);
                response.Message = result.Message;
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
        public async Task<IActionResult> Login([FromBody] LoginUser user)
        {
            Response<LoginResponse> response = new();
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
                    response.Message = "One or more validation errors occurred.";
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


    }
}
