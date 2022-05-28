using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net;
using System.Reflection;
using System.Diagnostics;

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

        /// <summary>
        /// Gets list of all courses for the teacher
        /// Throws Bad Request error if user is not teacher
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
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
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
        
        /// <summary>
        /// Gets the list of students for the course 
        /// Throws bad request if the user is not teacher
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="courseId"></param>
        /// <returns></returns>
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
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        /// <summary>
        /// Gets the list of sparc programs for the corresponding user
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
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
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        /// <summary>
        /// Gets the sparc program for the corresponding user id, lesson id and learning outcome
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="lessonId"></param>
        /// <param name="learningOutcome"></param>
        /// <returns></returns>
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
                if (learningOutcome < 0)
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
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        /// <summary>
        /// Gets the list of lessons progress based on the userid
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
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
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        /// <summary>
        /// Gets the list of assessments overview based on the student id
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        [HttpGet("{userId}/assessment")]
        public async Task<IActionResult> GetAssessments(int userId)
        {
            Response<List<AssessmentOverview>> response = new();
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
                var result = await _teacherService.GetAssessments(userId);

                //If there is any lesson progress, return them
                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                //If there is no progress saved, return Not found error
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No assessments found for this student.");
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
        
        /// <summary>
        /// Get the assessment details for the corresponding student id, lesson id and learning outcome
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="lessonId"></param>
        /// <param name="learningOutcome"></param>
        /// <returns></returns>
        [HttpGet("{userId}/assessment/lessson/{lessonId}/learningoutcome/{learningOutcome}")]
        public async Task<IActionResult> GetAssessmentDetails(int userId, int lessonId, int learningOutcome)
        {
            Response<Assessment> response = new();
            try
            {
                //If user Id is less than or equal to 0 -> throw bad request error
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                //If lesson id is less than or equal to 0 -> throw bad request error
                if (lessonId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Lesson Id.");
                    return BadRequest(response);
                }

                //If learningoutcome is less than 0 -> throw bad request error
                if (learningOutcome < 0)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid learning outcome.");
                    return BadRequest(response);
                }

                //Get lesson progress for the student
                var result = await _teacherService.GetAssessmentDetails(userId, lessonId, learningOutcome);

                //If there is any lesson progress, return them
                if (result.Content != null && result.Success)
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                //If there is no progress saved, return Not found error
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No assessments found for this student.");
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
    }
}
