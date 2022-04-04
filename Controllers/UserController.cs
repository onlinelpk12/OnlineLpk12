using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Helpers;
using OnlineLpk12.Services.Interface;
using System.Net;

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
        public async Task<IActionResult> Register([FromBody] User user)
        {
            try
            {
                var validationMessage = Helper.ValidateUserWhileRegistering(user);
                if (!string.IsNullOrEmpty(validationMessage))
                {
                    return BadRequest(validationMessage);
                }

                var result = new Result()
                {
                    Success = await _userService.RegisterUser(user),
                    ErrorMessage = ""
                };
                if (result.Success)
                {
                    return Ok("User registered successfully");
                }
                else
                {
                    return Ok(result.ErrorMessage);
                }
            }
            catch (Exception ex)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, "Error occurred while fetching the data.");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Login([FromBody] User user)
        {
            try
            {
                if (user == null)
                {
                    return BadRequest("Enter valid user details");
                }
                if (string.IsNullOrEmpty(user.EmailId) && !IsValidEmail(user.EmailId))
                {
                    return BadRequest("Enter valid Email Id");
                }
                if (string.IsNullOrEmpty(user.Password))
                {
                    return BadRequest("Enter valid Password");
                }
                if (user.Password.Length < 8)
                {
                    return BadRequest("Enter password with minimum 8 characters");
                }

                var result = new Result()
                {
                    Success = true,
                    ErrorMessage = ""
                };
                if (result.Success)
                {
                    return Ok("User logged in successfully");
                }
                else
                {
                    return Ok(result.ErrorMessage);
                }
            }
            catch (Exception ex)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, "Error occurred while fetching the data.");
            }
        }

        
    }
}
