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
    public class SparcController : ControllerBase
    {
        private readonly ISparcService _sparcService;
        public SparcController(ISparcService sparcService)
        {
            _sparcService = sparcService;
        }

        [HttpGet("program/{userId}")]
        public async Task<IActionResult> GetProgram(int userId)
        {
            Response<object> response = new();
            try
            {
                if (userId < 1)
                {
                    return BadRequest();
                }
                var result = await _sparcService.GetProgram(userId);
                if (result.Success)
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                response.Message = "Not Found";
                return NotFound(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }


        [HttpGet("query/{userId}")]
        public async Task<IActionResult> GetQuery(int userId)
        {
            Response<object> response = new();
            try
            {
                if (userId < 1)
                {
                    return BadRequest();
                }
                var result = await _sparcService.GetQuery(userId);
                if (result.Success)
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                response.Message = "Not Found";
                return NotFound(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("execute")]
        [Consumes("application/x-www-form-urlencoded")]
        public async Task<IActionResult> ExecuteSparc([FromForm] Sparc request)
        {
            Response<string> response = new();
            try
            {
                var validationMessages = Helper.ValidateSparcRequest(request);
                if (validationMessages.Any())
                {
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }
                var result = await _sparcService.ExecuteSparcRequest(request);
                response.Content = result.Success ? result.Content : "";
                return Ok(response);
            }
            catch
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}
