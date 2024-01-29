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
    public class LessonController : ControllerBase
    {
        private readonly ILessonService _lessonService;
        private readonly ILogService _logService;
        public LessonController(ILessonService lessonService, ILogService logService)
        {

            _lessonService = lessonService;
            _logService = logService;
        }

        [HttpPost("uploadLesson")]
        public async Task<IActionResult> UploadLesson([FromBody] SlideData slideData)
        {
            Response<string> response = new();
            try
            {
               var  result = await _lessonService.UploadLesson(slideData);
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
        [HttpPost("getLesson")]
        public async Task<IActionResult> GetLesson([FromBody] SlideData slideData)
        {
            Response<SlideData> response = new();
            try
            {
                var result = await _lessonService.GetLesson(slideData.LessonName,slideData.CourseName);
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

        [HttpPost("uploadAssessmentDetails")]
        public async Task<IActionResult> UploadAssessmentDetails([FromBody] AssessmentData assessmentData)
        {
            Response<string> response = new();
            try
            {
                var result = await _lessonService.uploadAssessmentDetails(assessmentData);
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
        [HttpPost("fetchAssessmentDetails")]
        public async Task<IActionResult> FetchAssessmentDetails([FromBody] SlideData assessmentData)
        {
            Response<AssessmentData> response = new();
            try
            {
                var result = await _lessonService.fetchAssessmentDetails(assessmentData.LessonName, assessmentData.CourseName);
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
        [HttpGet("getLessonList")]
        public async Task<IActionResult> LessonList([FromQuery] string course)
        {
            Response<List<string>> response = new();
            try
            {
                var result = await _lessonService.LessonList(course);
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

