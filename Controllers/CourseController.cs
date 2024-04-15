

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net;
using System.Reflection;
using System.Diagnostics;
using Microsoft.AspNetCore.Authorization;
using OnlineLpk12.Helpers;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseController : ControllerBase
    {
        private readonly ICourseService _courseService;
        private readonly IUserService _userService;
        private readonly ILogService _logService;

        public CourseController(ICourseService courseService, IUserService userService, ILogService logService)
        {
            _courseService = courseService;
            _userService = userService;
            _logService = logService;
        }

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetCourses(int userId)
        {
            Response<List<Course>> response = new();
            try
            {
                //If user Id is less than or equal to 0 -> throw bad request error
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                //Check if the user is teacher or not. If not throw bad request error
                bool isCourseDeveloper = await _userService.IsCourseDeveloper(userId);
                if (!isCourseDeveloper)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Given user is not a teacher.");
                    return BadRequest(response);
                }

                //Get Courses for the teacher
                var result = await _courseService.GetCourses(userId);

                //If there are any courses return them
                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                //If there are no courses return Not found error
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No courses found for this teacher.");
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

        [HttpPost]
        public async Task<IActionResult> CreateCourse([FromBody] Course course)
        {
            Response<string> response = new();
            try
            {
                // Validate the input course object
                var validationErrors = Helper.ValidateCourse(course);
                if (validationErrors.Count > 0)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors = validationErrors;
                    return BadRequest(response);
                }

                // Add the course to the database
                var result = await _courseService.CreateCourse(course);

                // Check if the course creation was successful
                if (result.Success)
                {
                    response.Content = result.Content;
                    return Ok(response);
                }

                // If there were errors during course creation, return bad request with error messages
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add(result.Message);
                return BadRequest(response);
            }
            catch (Exception ex)
            {

                // Set the error response
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while creating the course.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

    }
}
