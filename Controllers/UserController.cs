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
            ResultObject result = new ResultObject();
            try
            {
                var validationMessages = new Dictionary<string, string>();
                var isUsernameExists = await _userService.IsUserNameExists(user.UserName);
                var isEmailIdExists = await _userService.IsEmailIdExists(user.EmailId);
                if (isUsernameExists)
                {
                    validationMessages.Add("UserName", "UserName already exists.");
                }
                if (isEmailIdExists)
                {
                    validationMessages.Add("EmailId", "Email Id already exists.");
                }
                if (validationMessages.Any())
                {
                    result.Status = 400;
                    result.Errors = validationMessages;
                    result.Title = "One or more validation errors occurred.";
                    return BadRequest(result);
                }

                var response = await _userService.RegisterUser(user);
                if (response.Success)
                {
                    result.Status = 200;
                    result.Title = response.Message;
                    return Ok(result);
                }
                else
                {
                    result.Status = 200;
                    result.Title = response.Message;
                    return Ok(result);
                }
            }
            catch (Exception ex)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, "Error occurred while fetching the data.");
            }
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromBody] LoginUser user)
        {
            ResultObject result = new ResultObject();
            try
            {
                var response = await _userService.Login(user);
                if (response.Success)
                {
                    result.Status = 200;
                    result.Title = response.Message;
                    return Ok(result);
                }
                else
                {
                    result.Status = 200;
                    result.Title = response.Message;
                    return Ok(result);
                }
            }
            catch (Exception ex)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, "Error occurred while fetching the data.");
            }
        }


    }
}
