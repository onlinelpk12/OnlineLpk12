using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Services.Interface;
using System.Net;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Helpers;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentProgressController : ControllerBase
    {
        private readonly IStudentProgressService _studentProgressService;
        public StudentProgressController(IStudentProgressService studentProgressService)
        {
            _studentProgressService = studentProgressService;
        }

        [HttpGet("status")]
        public async Task<IActionResult> GetStatuses()
        {
            try
            {
                var result = await _studentProgressService.GetStatus();
                if (result != null && result.Any())
                {
                    return Ok(result);
                }
                return NotFound("No Statuses found.");
            }
            catch (Exception ex)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, "Error occurred while fetching the data.");
            }
        }

        [HttpGet("lessons/{userId}")]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.NotFound)]
        [ProducesResponseType(typeof(Response<LessonAndQuizProgressResponse>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetLessons(int userId)
        {
            Response<LessonAndQuizProgressResponse> response = new();

            try
            {
                if (userId <= 0)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Student Id.");
                    return BadRequest(response);
                }
                var result = _studentProgressService.GetLessonsAndQuizProgress(userId);
                if (result == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Student does not exist.");
                    return NotFound(response);
                }
                if (result.LessonAndQuizStatus != null && result.LessonAndQuizStatus.Any())
                {
                    response.Content = result;
                    return Ok(response);
                }

                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No Lessons found for this student.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("content/{lessonId}")]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.NotFound)]
        [ProducesResponseType(typeof(Response<LessonAndQuizProgressResponse>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetContentByLesson(int lessonId)
        {
            Response<LessonDetails> response = new();
            try
            {
                if (lessonId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Lesson Id.");
                    return BadRequest(response);
                }
                var result = await _studentProgressService.GetContent(lessonId);
                if (result != null)
                {
                    response.Content = result;
                    return Ok(response);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Content Not found for the given lesson");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("quiz")]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.NotFound)]
        [ProducesResponseType(typeof(Response<Quiz>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetQuiz([FromQuery] int? lessonId, [FromQuery] int? quizId, [FromQuery] int? studentId)
        {
            Response<Quiz> response = new();
            try
            {
                if ((lessonId == null && quizId == null) || (lessonId != null && lessonId < 1 && quizId != null && quizId < 1))
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Lesson Id or Quiz Id.");
                    return BadRequest(response);
                }
                var result = await _studentProgressService.GetQuiz(lessonId, quizId, studentId);
                if (result != null && result.Questions != null && result.Questions.Any())
                {
                    response.Content = result;
                    return Ok(response);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Quiz not found for the given lesson.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }

        }

        [HttpPost("quiz/{quizId}")]
        [ProducesResponseType(typeof(Response<SubmitQuiz>), (int)HttpStatusCode.OK)]
        [ProducesErrorResponseType(typeof(Response<EmptyResult>))]
        public async Task<IActionResult> SubmitQuiz(int quizId, [FromBody] SubmitQuiz quiz)
        {
            Response<SubmitQuiz> response = new Response<SubmitQuiz>();
            try
            {
                var validationMessages = Helper.ValidateQuiz(quiz);
                if (validationMessages.Any())
                {
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                var result = await _studentProgressService.SubmitQuiz(quiz);
                if (result != null)
                {
                    response.Content = result;
                    return Ok(response);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Failed submitting Quiz");
                return BadRequest(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("allStudentDetails/{userId}")]
        [ProducesResponseType(typeof(Response<List<StudentDetails>>), (int)HttpStatusCode.OK)]
        [ProducesErrorResponseType(typeof(Response<EmptyResult>))]
        public async Task<IActionResult> GetAllStudentsDetails(int userId)
        {
            var response = new Response<List<StudentDetails>>();

            try
            {
                var isTeacher = await _studentProgressService.IsUserTeacher(userId);
                if (!isTeacher)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid teacher details.");
                    return BadRequest(response);
                }

                var result = await _studentProgressService.GetAllStudentDetails();
                if (result == null || !result.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("No student details found.");
                    return NotFound(response);
                }
                response.Content = result;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}
