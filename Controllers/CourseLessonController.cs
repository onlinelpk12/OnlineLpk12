using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Services.Implementation;
using OnlineLpk12.Services.Interface;

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

        [HttpPost("add")]
        [AllowAnonymous]
        public async Task<IActionResult> AddLesson([FromQuery]int courseId, [FromBody] CourseLesson courseLesson)
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
        public async Task<IActionResult> UpdateLesson([FromQuery] int lessonId, [FromBody] CourseLesson courseLesson)
        {
            var result = await _courseLessonService.UpdateLesson(lessonId, courseLesson);
            if (result)
                return Ok(new { success = true, message = "Lesson updated successfully" });
            else
                return BadRequest(new { success = false, message = "Failed to update lesson" });
        }
    }
}
