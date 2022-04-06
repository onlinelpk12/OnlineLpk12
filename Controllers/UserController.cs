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
        public async Task<IActionResult> Register([FromBody] RegistrationUser user)
        {
            Response response = new Response();
            try
            {
                var validationMessages = Helper.ValidateUserWhileRegistering(user);
                if (validationMessages.Any())
                {
                    response.Status = (int)HttpStatusCode.BadRequest;
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
                    response.Status = (int)HttpStatusCode.BadRequest;
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                var result = await _userService.RegisterUser(user);
                response.Status = (int)HttpStatusCode.OK;
                response.Message = result.Message;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Status = (int)HttpStatusCode.InternalServerError;
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromBody] LoginUser user)
        {
            Response response = new Response();
            try
            {
                var validationMessages = Helper.ValidateUserWhileLogin(user);
                if (validationMessages.Any())
                {
                    response.Status = (int)HttpStatusCode.BadRequest;
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }
                var result = await _userService.Login(user);
                if (result.Success)
                {
                    response.Status = 200;
                    response.Message = response.Message;
                    return Ok(response);
                }
                else
                {
                    response.Status = 400;
                    response.Message = response.Message;
                    response.Errors.Add(response.Message);
                    return BadRequest(response);
                }
            }
            catch (Exception ex)
            {
                response.Status = (int)HttpStatusCode.InternalServerError;
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }


    }
}
