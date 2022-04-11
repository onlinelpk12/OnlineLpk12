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

        [HttpGet("lessons/{studentId}")]
        public async Task<IActionResult> GetLessons(int studentId)
        {
            try
            {
                if (studentId < 0)
                {
                    return BadRequest("Enter valid Student Id.");
                }
                var result = await _studentProgressService.GetLessons(studentId);
                if (result != null && result.Any())
                {
                    return Ok(result);
                }
                return NotFound("No Lessons found.");
            }
            catch (Exception ex)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, "Error occurred while fetching the data.");
            }
        }

        [HttpGet("content/{lessonId}")]
        public async Task<IActionResult> GetContentByLesson(int lessonId)
        {
            try
            {
                if (lessonId < 0)
                {
                    return BadRequest("Enter valid Lesson Id.");
                }
                var result = await _studentProgressService.GetContent(lessonId);
                if (result != null && result.Contents.Any())
                {
                    return Ok(result);
                }
                return NotFound("Content Not found for the given lesson");
            }
            catch (Exception ex)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, "Error occurred while fetching the data.");
            }
        }

        [HttpGet("quiz")]
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
                if (result != null && result.Questions.Any())
                {
                    response.Content = result;
                    return Ok(result);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Quiz not found for the given lesson.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }

        }

        [HttpPost("quiz/{quizId}")]
        public async Task<IActionResult> SubmitQuiz(int quizId, [FromBody] SubmitQuiz quiz)
        {
            Response<Quiz> response = new Response<Quiz>();
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
                    return Ok(result);
                }
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, "Error occurred while fetching the data.");
            }
        }

    }
}
