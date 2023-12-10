using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Services.Interface;
using System.Diagnostics;
using System.Net;
using System.Reflection;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private readonly IStudentService _studentService;
        private readonly ILogService _logService;

        public StudentController(IStudentService studentService, ILogService logService)
        {
            this._studentService = studentService;
            this._logService = logService;
        }

        [HttpPost("{userId}/lessonprogress")]
        public async Task<IActionResult> SaveLessonProgress(int userId, LessonProgress lessonProgress)
        {
            Response<SuccessResponse> response = new();
            try
            {
                //If user Id is less than or equal to 0 -> throw bad request error
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                if (lessonProgress == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid request");
                    return BadRequest(response);
                }

                if (lessonProgress.LessonId < 1)
                {
                    response.Errors.Add("Invalid lesson Id");
                }

                if (lessonProgress.LearningOutcome < 0)
                {
                    response.Errors.Add("Invalid learning outcome");
                }

                if (lessonProgress.PageNumber < 1)
                {
                    response.Errors.Add("Invalid page number");
                }

                if (response.Errors.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                bool isSuccess = _studentService.SaveLessonProgress(lessonProgress);

                if (isSuccess)
                {
                    response.Content = new SuccessResponse() { IsSuccess = isSuccess };
                    return Ok(response);
                }

                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Student Progress is not saved");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while saving the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("{userId}/quizresults")]
        public async Task<IActionResult> SaveQuizQuestionAnswer(int userId, [FromBody] QuizQuestionAnswer quizQuestionAnswer)
        {
            Response<SuccessResponse> response = new();
            try
            {
                // Basic user validation
                if (userId <= 0)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter a valid User Id.");
                    return BadRequest(response);
                }

                // Check if the quizQuestionAnswer object is null
                if (quizQuestionAnswer == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid request");
                    return BadRequest(response);
                }

                // The UserId in the quizQuestionAnswer should match the userId parameter
                if (quizQuestionAnswer.UserId != userId)
                {
                    response.Errors.Add("User Id mismatch.");
                }

                // Validate the primary key
                //if (quizQuestionAnswer.QuizQuestionAnswerId < 1)
                //{
                  //  response.Errors.Add("Invalid Quiz Question Answer Id.");
                //}

                // Validate the foreign key to Question
                if (quizQuestionAnswer.QuestionId < 1)
                {
                    response.Errors.Add("Invalid Question Id.");
                }

                // Validate the Lesson
                if (quizQuestionAnswer.Lesson <=0)
                {
                    response.Errors.Add("Invalid Lesson");
                }

                // Additional validation can be performed here...

                // If there are any errors in the validation, return a BadRequest
                if (response.Errors.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                // Assuming _quizService is a service to handle quiz operations
                bool isSuccess =  _studentService.SaveQuizQuestionAnswer(quizQuestionAnswer);

                if (isSuccess)
                {
                    response.Content = new SuccessResponse { IsSuccess = isSuccess };
                    return Ok(response);
                }

                response.Message = "An error occurred while saving the quiz answer.";
                return BadRequest(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "An internal error occurred.";
                response.Errors.Add("Error occurred while saving the quiz answer.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("{userId}/assessmentStatus")]
        public async Task<IActionResult> SaveAssessmentStatus(int userId, AssessmentOverview assessmentOverview)
        {
            Response<SuccessResponse> response = new();
            try
            {
                //If user Id is less than or equal to 0 -> throw bad request error
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                if (assessmentOverview == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid request");
                    return BadRequest(response);
                }

                if (assessmentOverview.LessonId < 1)
                {
                    response.Errors.Add("Invalid lesson Id");
                }

                if (assessmentOverview.LearningOutcome < 0)
                {
                    response.Errors.Add("Invalid learning outcome");
                }

                if (assessmentOverview.Score < 0)
                {
                    response.Errors.Add("Invalid score");
                }

                if (assessmentOverview.Score < 0)
                {
                    response.Errors.Add("Invalid score");
                }

                if (assessmentOverview.TotalScore < 0)
                {
                    response.Errors.Add("Invalid total score");
                }

                if (response.Errors.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                bool isSuccess = _studentService.SaveAssessmentScore(assessmentOverview);

                if (isSuccess)
                {
                    response.Content = new SuccessResponse() { IsSuccess = isSuccess };
                    return Ok(response);
                }

                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Assessment score is not saved");
                return NotFound(response);

            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while saving the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("{userId}/assessmentDetails")]
        public async Task<IActionResult> SaveAssessmentStatus(int userId, Assessment assessment)
        {
            Response<SuccessResponse> response = new();
            try
            {
                //If user Id is less than or equal to 0 -> throw bad request error
                if (userId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid User Id.");
                    return BadRequest(response);
                }

                if (assessment == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid request");
                    return BadRequest(response);
                }

                if (assessment.LessonId < 1)
                {
                    response.Errors.Add("Invalid lesson Id");
                }

                if (assessment.LearningOutcome < 0)
                {
                    response.Errors.Add("Invalid learning outcome");
                }

                if(assessment.QuestionAnswers == null || assessment.QuestionAnswers.Count == 0)
                {
                    response.Errors.Add("Questions and anwers are required");
                }

                if (response.Errors.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                bool isSuccess = _studentService.SaveAssessmentSubmission(assessment);

                if (isSuccess)
                {
                    response.Content = new SuccessResponse() { IsSuccess = isSuccess };
                    return Ok(response);
                }

                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Assessment score is not saved");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while saving the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}
