using System;
using Microsoft.AspNetCore.Authorization;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Helpers;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Services.Implementation;

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
        public async Task<IActionResult> deleteAFAssessmentData([FromBody] int courseId, int lessonId, int assessmentId)
        {
            Response<string> response = new();
            try
            {
                var result = await _lessonAssessmentService.deleteAFAssessmentData(courseId, lessonId, assessmentId);
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

        [HttpPut("update")]
        [Authorize(Roles = "Course Developer")]
        [AllowAnonymous]
        public async Task<IActionResult> updateAFAssessmentData([FromBody] int courseId, int lessonId, int assessmentId)
        {
            Response<string> response = new();
            try
            {
                var result = await _lessonAssessmentService.updateAFAssessmentData(courseId, lessonId, assessmentId);
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

        [HttpGet("getAllAssessments")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAll(int courseId, int lessonId)
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
    }
}

