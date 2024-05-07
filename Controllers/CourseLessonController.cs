using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Services.Implementation;
using OnlineLpk12.Services.Interface;
using System.Diagnostics;
using System.Net;
using System.Reflection;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseLessonController : ControllerBase
    {
        private readonly ICourseLessonService _courseLessonService;
        private readonly ILogService _logService;

        public CourseLessonController(ICourseLessonService courseLessonService, ILogService logService)
        {
            _courseLessonService = courseLessonService;
            _logService = logService;
        }

        [HttpGet("get")]
        [AllowAnonymous]
        public async Task<IActionResult> GetLessonById([FromQuery]int lessonId)
        {
            var lesson = await _courseLessonService.GetLessonById(lessonId);
            if (lesson == null)
                return NotFound();

            return Ok(lesson);
        }

        [HttpPost("add")]
        [AllowAnonymous]
        public async Task<IActionResult> AddLesson([FromQuery]int courseId, [FromBody] Data.Models.CourseLesson courseLesson)
        {
            var (success, lessonId) = await _courseLessonService.AddLesson(courseId, courseLesson);
            if (success)
                return Ok(new { success = true, message = "Lesson added successfully", lessonId });
            else
                return BadRequest(new { success = false, message = "Failed to add lesson" });
        }

        [HttpDelete("delete")]
        [AllowAnonymous]
        public async Task<IActionResult> DeleteLesson([FromQuery] int userId, [FromQuery] int lessonId)
        {
            var result = await _courseLessonService.DeleteLesson(userId, lessonId);
            if (result)
                return Ok(new { success = true, message = "Lesson deleted successfully" });
            else
                return BadRequest(new { success = false, message = "Failed to delete lesson" });
        }

        [HttpPut("update")]
        [AllowAnonymous]
        public async Task<IActionResult> UpdateLesson([FromQuery] int lessonId, [FromBody] Data.Models.CourseLesson courseLesson)
        {
            var result = await _courseLessonService.UpdateLesson(lessonId, courseLesson);
            if (result)
                return Ok(new { success = true, message = "Lesson updated successfully" });
            else
                return BadRequest(new { success = false, message = "Failed to update lesson" });
        }
        [HttpGet("GetSlidesToEditById/{courseId}/{lessonId}")]
        [AllowAnonymous]
        

        public async Task<IActionResult> GetSlidesToEditById(int courseId, int lessonId)
        {
            Response<List<Data.Entities.LessonSlide>> response = new();
            try
            {

                if (courseId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Course Id.");
                    return BadRequest(response);
                }
                if(lessonId < 1)
                {
                    response.Message= "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Lesson Id.");
                    return BadRequest(response);
                }

                var result = await _courseLessonService.GetSlidesToEditById(courseId, lessonId);

                if (result.Content != null && result.Content.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }

                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No Slides found for this Course.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

    }
}
