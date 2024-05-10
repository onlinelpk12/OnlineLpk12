using System;
using Microsoft.AspNetCore.Authorization;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Helpers;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Services.Implementation;
using System.Diagnostics;
using System.Reflection;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LessonAssessmentController : ControllerBase
    {
        private readonly ILessonAssessmentService _lessonAssessmentService;
        private readonly ILogService _logService;
        public LessonAssessmentController(ILessonAssessmentService lessonAssessmentService, ILogService logService)
        {

            _lessonAssessmentService = lessonAssessmentService;
            _logService = logService;
        }

        
        [HttpPost("add")]
        [Authorize(Roles = "Course Developer")]
        [AllowAnonymous]
        public async Task<IActionResult> createAFAssessmentData([FromBody] AFAssessment aFAssessment)
        {
            Response<string> response = new();
            try
            {
                var result = await _lessonAssessmentService.createAFAssessmentData(aFAssessment);
                response.Message = result.Message;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Errors.Add("Error occurred while fetching the data.");
                response.Message = "One or more errors occurred.";
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpDelete("delete")]
        [Authorize(Roles = "Course Developer")]
        [AllowAnonymous]
        public async Task<IActionResult> deleteAFAssessmentData( [FromQuery]  int assessmentId)
        {
            var result = await _lessonAssessmentService.deleteAFAssessmentData(assessmentId);
            if (result)
                return Ok(new { success = true, message = "Assessment deleted successfully" });
            else
                return BadRequest(new { success = false, message = "Failed to delete assessment" });
        }

        [HttpPut("update")]
        [Authorize(Roles = "Course Developer")]
        [AllowAnonymous]
        public async Task<IActionResult> updateAFAssessmentData([FromQuery] int assessmentId, [FromBody] AFAssessment aFAssessment)
        {
            Response<string> response = new();
            try
            {
                var result = await _lessonAssessmentService.updateAFAssessmentData(assessmentId, aFAssessment);
                if (result)
                    return Ok(new { success = true, message = "Assessment updated successfully" });
                else
                    return BadRequest(new { success = false, message = "Failed to update assessment" });
            }
            catch (Exception ex)
            {
                response.Errors.Add("Error occurred while fetching the data.");
                response.Message = "One or more errors occurred.";
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("getAllAssessments")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllAssessments(int courseId, int lessonId)
        {
            Response<List<AFAssessmentData>> response = new();
            try
            {
                Result<List<AFAssessmentData>> result = await _lessonAssessmentService.GetAllAssessments(courseId, lessonId);
                response.Content = result.Content;
                response.Message = result.Message;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Errors.Add("Error occurred while fetching the data.");
                response.Message = "One or more errors occurred.";
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("AssessmentSubmission")]
        [AllowAnonymous]
        public async Task<IActionResult> AssessmentSubmission(int courseId, int lessonId, int studentId, int assessmentId, [FromBody] AFStudentAssessmentSubmission submission)
        {
            Response<string> response = new();
            try
            {
                var result = await _lessonAssessmentService.AssessmentSubmission(courseId, lessonId, studentId, assessmentId, submission);
                response.Message = result.Message;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Errors.Add("Error occurred while submission.");
                response.Message = "One or more errors occurred.";
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
        

        [HttpGet("GetAssessmentsubmissions")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAssessmentSubmissions(int courseId, int lessonId, int assessmnetId, int studentId)
        {
            Response<List<AFStudentAssessmentSubmission>> response = new();
            try
            {
                var result = await _lessonAssessmentService.GetAssessmentSubmissions(courseId, lessonId, assessmnetId,studentId);

                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }

                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No assessment submissions found for this Lesson.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(lessonId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }


         [HttpPost("addGrade")]
        [AllowAnonymous]
        public async Task<IActionResult> createAFAssessmentGrade([FromQuery] int courseId, [FromQuery] int lessonId, [FromQuery] int studentId, [FromQuery] int assessmentId, [FromQuery] int submissionId, [FromBody] AFAssessmentGrading aFAssessmentGrading)
        {
            Response<string> response = new();
            try
            {
                var result = await _lessonAssessmentService.createAFAssessmentGrade(courseId, lessonId, studentId, assessmentId, submissionId, aFAssessmentGrading);
                response.Message = result.Message;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Errors.Add("Error occurred while saving the data.");
                response.Message = "One or more errors occurred.";
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("getAssessmentGrades")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAssessmentGrade(int courseId, int lessonId, int assessmentId)
        {
            Response<List<AFAssessmentGrade>> response = new();
            try
            {
                Result<List<AFAssessmentGrade>> result = await _lessonAssessmentService.getAssessmentGrades(courseId, lessonId, assessmentId);
                response.Content = result.Content;
                response.Message = result.Message;
                return Ok(response);
            }
            catch (Exception ex)
            {
                response.Errors.Add("Error occurred while fetching the data.");
                response.Message = "One or more errors occurred.";
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}

