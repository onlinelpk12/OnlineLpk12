using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Interface;
using System.Linq;
using System.Net;

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
            //return Ok(context.Progresses.ToArray());
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
        public async Task<IActionResult> GetContent(int lessonId)
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

    }
}
