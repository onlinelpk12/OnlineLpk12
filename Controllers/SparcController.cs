using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Helpers;
using OnlineLpk12.Services.Interface;
using System.Net;
using System.Reflection;
using System.Diagnostics;
using Microsoft.AspNetCore.Cors;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SparcController : ControllerBase
    {
        private readonly ISparcService _sparcService;
        private readonly ILogService _logService;
        public SparcController(ISparcService sparcService, ILogService logService)
        {
            _sparcService = sparcService;
            _logService = logService;
        }

        //[HttpGet("program/{userId}")]
        //public async Task<IActionResult> GetProgram(int userId)
        //{
        //    Response<object> response = new();
        //    try
        //    {
        //        if (userId < 1)
        //        {
        //            return BadRequest();
        //        }
        //        var result = await _sparcService.GetProgram(userId);
        //        if (result.Success)
        //        {
        //            response.Content = result.Content;
        //            return Ok(response);
        //        }
        //        response.Message = "Not Found";
        //        return NotFound(response);
        //    }
        //    catch (Exception ex)
        //    {
        //        response.Message = "One or more validation errors occurred.";
        //        response.Errors.Add("Error occurred while fetching the data.");
        //        return StatusCode((int)HttpStatusCode.InternalServerError, response);
        //    }
        //}


        //[HttpGet("query/{userId}")]
        //public async Task<IActionResult> GetQuery(int userId)
        //{
        //    Response<object> response = new();
        //    try
        //    {
        //        if (userId < 1)
        //        {
        //            return BadRequest();
        //        }
        //        var result = await _sparcService.GetQuery(userId);
        //        if (result.Success)
        //        {
        //            response.Content = result.Content;
        //            return Ok(response);
        //        }
        //        response.Message = "Not Found";
        //        return NotFound(response);
        //    }
        //    catch (Exception ex)
        //    {
        //        response.Message = "One or more validation errors occurred.";
        //        response.Errors.Add("Error occurred while fetching the data.");
        //        return StatusCode((int)HttpStatusCode.InternalServerError, response);
        //    }
        //}

        /// <summary>
        /// Executes the sparc request
        /// Execution of sparc program / Submitting the Query / Getting answer sets
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
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
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                _logService.LogError(request.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        /// <summary>
        /// Save the sparc program
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("save")]
        [Consumes("application/x-www-form-urlencoded")]
        public async Task<IActionResult> SaveSparcProgram([FromForm] Sparc request)
        {
            Response<string> response = new();
            try
            {
                if(request == null)
                {
                    response.Errors = new List<string>() { "Request is invalid." };
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }
                
                var result = await _sparcService.SaveSparcProgram(request);
                response.Content = result.Message;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                _logService.LogError(request.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        /// <summary>
        /// Gets the sparc programs by user id and kesson id
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="lessonId"></param>
        /// <returns></returns>
        [HttpGet("{userId}/lesson/{lessonId}")]
        public async Task<IActionResult> GetSparcProgramsByUserId(int userId, int lessonId)
        {
            Response<object> response = new();
            try
            {
                if(userId == 0)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid User Id.");
                    return BadRequest(response);
                }
                var result = await _sparcService.GetSparcProgramsByUserId(userId, lessonId);
                if(result != null && result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                else
                {
                    response.Message = "No Sparc programs found for the user";
                    return NotFound(response);
                }
            }
            catch(Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        /// <summary>
        /// Submits the grade for the sparc program
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("submitgrade")]
        [Consumes("application/x-www-form-urlencoded")]
        public async Task<IActionResult> SubmitSparcGrade([FromForm] Sparc request)
        {
            Response<string> response = new();
            try
            {
                if (request == null)
                {
                    response.Errors = new List<string>() { "Request is invalid." };
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }
                if (string.IsNullOrEmpty(request.Grade))
                    response.Errors.Add("Grade is empty. Invalid Grade");
                if (request.LessonId < 1)
                    response.Errors.Add("Invalid Lesson Id");
                if (request.LearningOutcome < 1)
                    response.Errors.Add("Invalid Learning Outcome");
                if (request.UserId < 1)
                    response.Errors.Add("Invalid User Id");

                if(response.Errors.Count > 0)
                {
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                var result = await _sparcService.SubmitSparcGrade(request);
                response.Content = result.Message;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                _logService.LogError(request.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}
