using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net;
using System.Reflection;
using System.Diagnostics;
using Microsoft.AspNetCore.Authorization;
using OnlineLpk12.Helpers;
using MySqlX.XDevAPI.Common;
using System.Security.Claims;
using OnlineLpk12.Services.Implementation;

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
        [AllowAnonymous]
        public async Task<IActionResult> GetCourses(int userId)
        {
            Response<List<Course>> response = new();
            try
            { 
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                var result = await _courseService.GetCourses(userId);

                
                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No courses found for this User.");
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

        [HttpPost("CreateCourse")]
        [Authorize(Roles = "Course Developer")]
        
        public async Task<IActionResult> CreateCourse([FromBody] Course course)
        {
            Response<string> response = new();
            try
            {
                
                var validationErrors = Helper.ValidateCourse(course);
                if (validationErrors.Count > 0)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors = validationErrors;
                    return BadRequest(response);
                }
                                
                var result = await _courseService.CreateCourse(course);

                if (result.Success)
                {
                    response.Content = result.Content;
                    return Ok(response);
                }

                
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add(result.Message);
                return BadRequest(response);
            }
            catch (Exception ex)
            {

                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while creating the course.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
        [HttpGet("GetCoursesById/{userId}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetCoursesById(int userId)
        {
            Response<List<Course>> response = new();
            try
            {
                
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }
                bool isCourseDeveloper = await _userService.IsCourseDeveloper(userId);
                if (!isCourseDeveloper)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Given user is not a Course Developer.");
                    return BadRequest(response);
                }

                var result = await _courseService.GetCoursesById(userId);

                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No courses found for this Course Developer.");
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
        [HttpDelete("DeleteCourse/{courseId}")]
        [Authorize(Roles = "Course Developer")]
        public async Task<IActionResult> DeleteCourse( int courseId)
        {
            
            try
            {
                
                var deleteResult = await _courseService.DeleteCourse(courseId);

                
                if (deleteResult.Success)
                {
                    return Ok("Course deleted successfully");
                }

                
                return BadRequest(deleteResult.Message);
            }
            catch (Exception ex)
            {
                
                _logService.LogError(courseId, nameof(DeleteCourse), GetType().FullName, ex.Message, ex);

                return StatusCode((int)HttpStatusCode.InternalServerError, "An error occurred while deleting the course.");
            }
        }
        [HttpGet("GetLessonsToEditById/{courseId}")]
        [Authorize(Roles = "Course Developer")]
        
        public async Task<IActionResult> GetLessonsToEditById(int courseId)
        {
            Response<List<CourseLesson>> response = new();
            try
            {

                if (courseId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Course Id.");
                    return BadRequest(response);
                }

                var result = await _courseService.GetLessonsToEditById(courseId);

                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }

                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No Lessons found for this Course.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(courseId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
        [HttpPut("UpdateCourse")]
        [Authorize(Roles = "Course Developer")]
        public async Task<IActionResult> UpdateCourse([FromQuery] int courseId, [FromBody] Course course)
        {
            var result = await _courseService.UpdateCourse(courseId, course);
            if (result)
                return Ok(new { success = true, message = "CourseName updated successfully" });
            else
                return BadRequest(new { success = false, message = "Failed to update CourseName" });
        }

    }
}
