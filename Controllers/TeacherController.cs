using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TeacherController : ControllerBase
    {
        private readonly ITeacherService _teacherService;
        private readonly IUserService _userService;
        private readonly ILogService _logService;

        public TeacherController(ITeacherService teacherService, IUserService userService, ILogService logService)
        {
            _teacherService = teacherService;
            _userService = userService;
            _logService = logService;
        }

        [HttpGet("courses/{userId}")]
        public async Task<IActionResult> GetCourses(int userId)
        {
            Response<List<Course>> response = new();
            try
            {
                if(userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                bool isTeacher = await _userService.IsUserTeacher(userId);
                if (!isTeacher)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Given user is not a teacher.");
                    return BadRequest(response);
                }

                var result = await _teacherService.GetCourses(userId);
                if(result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No courses found for this teacher.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, "GetCourses", "TeacherController", ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}
