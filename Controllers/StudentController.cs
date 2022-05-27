using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
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

                if(lessonProgress == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid request");
                    return BadRequest(response);
                }

                if(lessonProgress.LessonId < 1)
                {
                    response.Errors.Add("Invalid lesson Id");
                }

                if(lessonProgress.LearningOutcome < 0)
                {
                    response.Errors.Add("Invalid learning outcome");
                }

                if(lessonProgress.PageNumber < 1)
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

                if(assessmentOverview.Score < 0)
                {
                    response.Errors.Add("Invalid score");
                }

                if (assessmentOverview.Score < 0)
                {
                    response.Errors.Add("Invalid score");
                }

                if(assessmentOverview.TotalScore < 0)
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
    }
}
