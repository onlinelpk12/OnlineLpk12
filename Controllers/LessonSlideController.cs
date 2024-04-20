using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Services.Interface;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LessonSlideController : ControllerBase
    {
        private readonly ILessonSlideService _lessonSlideService;
        private readonly ILogService _logService;

        public LessonSlideController(ILessonSlideService lessonSlideService, ILogService logService)
        {
            _lessonSlideService = lessonSlideService;
            _logService = logService;
        }

        [HttpPost("add")]
        [AllowAnonymous]
        public async Task<IActionResult> AddSlide([FromQuery] int courseId, [FromQuery] int lessonId, [FromBody] LessonSlide lessonSlide)
        {
            var (success, slideId) = await _lessonSlideService.AddSlide(courseId, lessonId, lessonSlide);
            if (success)
                return Ok(new { success = true, message = "Slide added successfully", slideId });
            else
                return BadRequest(new { success = false, message = "Failed to add slide" });
        }

        [HttpDelete("delete")]
        [AllowAnonymous]
        public async Task<IActionResult> DeleteSlide([FromQuery] int userId, [FromQuery] int slideId)
        {
            var result = await _lessonSlideService.DeleteSlide(userId, slideId);
            if (result)
                return Ok(new { success = true, message = "Slide deleted successfully" });
            else
                return BadRequest(new { success = false, message = "Failed to delete slide" });
        }

        [HttpPut("update")]
        [AllowAnonymous]
        public async Task<IActionResult> UpdateSlide([FromQuery] int slideId, [FromBody] LessonSlide slide)
        {
            var result = await _lessonSlideService.UpdateSlide(slideId, slide);
            if (result)
                return Ok(new { success = true, message = "Slide updated successfully" });
            else
                return BadRequest(new { success = false, message = "Failed to update slide" });
        }
    }
}
