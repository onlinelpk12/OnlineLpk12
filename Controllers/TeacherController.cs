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

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetCourses(int userId)
        {
            Response<List<Course>> response = new();
            try
            {
                //If user Id is less than or equal to 0 -> throw bad request error
                if(userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                //Check if the user is teacher or not. If not throw bad request error
                bool isTeacher = await _userService.IsUserTeacher(userId);
                if (!isTeacher)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Given user is not a teacher.");
                    return BadRequest(response);
                }

                //Get Courses for the teacher
                var result = await _teacherService.GetCourses(userId);
                
                //If there are any courses return them
                if(result.Content != null && result.Content.Any())
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
                _logService.LogError(userId, "GetCourses", "TeacherController", ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
        
        [HttpGet("{userId}/course/{courseId}")]
        public async Task<IActionResult> GetStudentsForCourse(int userId, int courseId)
        {
            Response<List<Student>> response = new();
            try
            {
                //if User Id is less than or equal to 0 -> return bad request error
                if(userId < 1)
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

                //Check if the user is teacher or not. If not throw bad request error
                bool isTeacher = await _userService.IsUserTeacher(userId);
                if (!isTeacher)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Given user is not a teacher.");
                    return BadRequest(response);
                }

                //Get students for the course
                var result = await _teacherService.GetStudentsForCourse(userId, courseId);

                //If there are any courses return them
                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                //If there are no courses return Not found error
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No students found for this course and teacher.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, "GetStudentsForCourse", "TeacherController", ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("{userId}/sparc")]
        public async Task<IActionResult> GetSparcList(int userId)
        {
            Response<List<SparcProgram>> response = new();
            try
            {
                //If user Id is less than or equal to 0 -> throw bad request error
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                //Get sparc programs for the student
                var result = await _teacherService.GetSparcList(userId);

                //If there are any sparc programs return them
                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                //If there are no sparc programs return Not found error
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No sparc programs found for this student.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, "GetSparcList", "TeacherController", ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("{userId}/sparc/lessson/{lessonId}/learningoutcome/{learningOutcome}")]
        public async Task<IActionResult> GetSparcProgram(int userId, int lessonId, int learningOutcome)
        {
            Response<SparcProgram> response = new();
            try
            {
                //If user Id is less than or equal to 0 -> throw bad request error
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                //If lesson Id is less than or equal to 0 -> throw bad request error
                if (lessonId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Lesson Id.");
                    return BadRequest(response);
                }

                //If learning outcome is less than or equal to 0 -> throw bad request error
                if (learningOutcome < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Course Outcome Id.");
                    return BadRequest(response);
                }

                //Get sparc progrem for the given user id, lesson id, learning outcome
                var result = await _teacherService.GetSparcProgram(userId, lessonId, learningOutcome);

                //If there is any sparc progrem return
                if (result.Content != null)
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                //If there is no sparc program return Not found error
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No sparc programs found.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, "GetSparcProgram", "TeacherController", ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("{userId}/lessonprogress")]
        public async Task<IActionResult> GetLessonProgressList(int userId)
        {
            Response<List<LessonProgress>> response = new();
            try
            {
                //If user Id is less than or equal to 0 -> throw bad request error
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                //Get lesson progress for the student
                var result = await _teacherService.GetLessonProgressList(userId);

                //If there is any lesson progress, return them
                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                //If there is no progress saved, return Not found error
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No lesson progress found for this student.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, "GetSparcList", "TeacherController", ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}
