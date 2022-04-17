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

        
        [HttpGet("lessons/{userId}")]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.NotFound)]
        [ProducesResponseType(typeof(Response<LessonAndQuizProgressResponse>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetLessons(int userId)
        {
            Response<LessonAndQuizProgressResponse> response = new();

            try
            {
                if (userId <= 0)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Student Id.");
                    return BadRequest(response);
                }
                var result = await _studentProgressService.GetLessonsAndQuizProgress(userId);
                if (result == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Student does not exist.");
                    return NotFound(response);
                }
                if (result.LessonAndQuizStatus != null && result.LessonAndQuizStatus.Any())
                {
                    response.Content = result;
                    return Ok(response);
                }

                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No Lessons found for this student.");
                return NotFound(response);
            }
            catch
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("content/{lessonId}")]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.NotFound)]
        [ProducesResponseType(typeof(Response<LessonAndQuizProgressResponse>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetContentByLesson(int lessonId)
        {
            Response<LessonDetails> response = new();
            try
            {
                if (lessonId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Lesson Id.");
                    return BadRequest(response);
                }
                var result = await _studentProgressService.GetContent(lessonId);
                if (result != null)
                {
                    response.Content = result;
                    return Ok(response);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Content Not found for the given lesson");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("updateLessonStatus")]
        public async Task<IActionResult> UpdateLessonStatus([FromBody] LessonStatusRequest lesson)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            try
            {
                if (lesson == null)
                {
                    validationMessages.Add("Lesson is invalid.");
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }
                if (lesson.LessonId < 1)
                {
                    validationMessages.Add("Enter valid Lesson Id.");
                }
                if (lesson.UserId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }

                if (!validationMessages.Any())
                {
                    var res = await _studentProgressService.IsValidUser(lesson.UserId);
                    if (!res.Success)
                    {
                        validationMessages.Add(res.Message);
                    }
                    else
                    {
                        if (res.Content.UserType != "STUDENT")
                        {
                            validationMessages.Add("Given User is a teacher.");
                        }
                    }
                }
                if (!validationMessages.Any())
                {
                    var res1 = await _studentProgressService.IsValidLesson(lesson.LessonId);
                    if (!res1.Success)
                    {
                        validationMessages.Add(res1.Message);
                    }
                }

                //If there is any validation message, return bad request
                if (validationMessages.Any())
                {
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                await _studentProgressService.UpdateLessonStatus(lesson.LessonId, lesson.UserId);

                response.Content = $"Updated Lesson progress for lesson {lesson.LessonId}, student {lesson.UserId}";
                return Ok(response);
            }
            catch
            {
                response.Message = "One or more errors occurred. Failed updating lesson status.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("quiz")]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(Response<EmptyResult>), (int)HttpStatusCode.NotFound)]
        [ProducesResponseType(typeof(Response<Quiz>), (int)HttpStatusCode.OK)]
        public async Task<IActionResult> GetQuiz([FromQuery] int lessonId, [FromQuery] int? userId)
        {
            Response<Quiz> response = new();
            bool isStudent = true;
            Result<Quiz> result;
            try
            {
                //If Lesson Id is less than 1. Return 'Invalid Lesson Id'
                if (lessonId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Enter valid Lesson Id.");
                    return BadRequest(response);
                }

                //If User Id is passed, check if the User Id is valid/active or not.
                //Get if the user is student or teacher
                if (userId != null)
                {
                    var res = await _studentProgressService.IsValidUser(Convert.ToInt32(userId));
                    if (!res.Success)
                    {
                        response.Message = "One or more validation errors occurred.";
                        response.Errors.Add(res.Message);
                        return BadRequest(response);
                    }
                    isStudent = res.Content.UserType.ToUpper() == "STUDENT";
                }

                //Get Quiz Id by Lesson Id. Return No quiz found if not exists.
                int quizId = await _studentProgressService.GetQuizIdByLessonId(lessonId);
                if (quizId < 1)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Quiz not found for the given Lesson Id.");
                    return NotFound(response);
                }

                //If user is student or if user id is not passed, get quiz questions, options and scores, selected answers(if any)  
                if (isStudent)
                {
                    result = await _studentProgressService.GetQuizForStudent(quizId, userId);
                }
                else //If user is teacher, get quiz questions, options and correct answers.
                {
                    result = await _studentProgressService.GetQuizForTeacher(quizId, userId);
                }

                if (result.Success && result.Content.Questions != null && result.Content.Questions.Any())
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add(!string.IsNullOrEmpty(result.Message) ? result.Message : "Quiz not found for the given lesson.");
                return NotFound(response);
            }
            catch
            {
                response.Message = "One or more errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }

        }

        [HttpPost("quiz")]
        [ProducesResponseType(typeof(Response<SubmitQuiz>), (int)HttpStatusCode.OK)]
        [ProducesErrorResponseType(typeof(Response<EmptyResult>))]
        public async Task<IActionResult> SubmitQuiz([FromBody] SubmitQuiz quiz)
        {
            Response<SubmitQuiz> response = new();
            List<string> validationMessages = new();
            try
            {
                //Validate quiz - Check if quiz is null/ lesson id is valid/ user id is valid/ questions are present
                validationMessages = Helper.ValidateQuiz(quiz);

                //If there are no validaiton messages returned from above method, check questions data with db and check if user is valid
                if (!validationMessages.Any())
                {
                    //Check if the user is valid student 
                    var res = await _studentProgressService.IsValidUser(quiz.UserId);
                    if (!res.Success)
                    {
                        validationMessages.Add(res.Message);
                    }
                    else
                    {
                        if (res.Content.UserType.ToUpper() != "STUDENT")
                            validationMessages.Add("User is not a student.");
                    }

                    //Check questions data with db
                    if (!validationMessages.Any())
                    {
                        var message = await _studentProgressService.ValidateSubmittedQuiz(quiz);
                        if (!string.IsNullOrEmpty(message))
                        {
                            validationMessages.Add(message);
                        }
                    }
                }

                //If there is any validation message, return bad request
                if (validationMessages.Any())
                {
                    response.Errors = validationMessages;
                    response.Message = "One or more validation errors occurred.";
                    return BadRequest(response);
                }

                var result = await _studentProgressService.SubmitQuiz(quiz);
                if (result != null)
                {
                    response.Content = result;
                    return Ok(response);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Failed submitting Quiz");
                return BadRequest(response);
            }
            catch
            {
                response.Message = "One or more errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("allStudentDetails/{userId}")]
        [ProducesResponseType(typeof(Response<List<StudentDetails>>), (int)HttpStatusCode.OK)]
        [ProducesErrorResponseType(typeof(Response<EmptyResult>))]
        public async Task<IActionResult> GetAllStudentsDetails(int userId)
        {
            var response = new Response<List<StudentDetails>>();

            try
            {
                var isTeacher = await _studentProgressService.IsUserTeacher(userId);
                if (!isTeacher)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid teacher details.");
                    return BadRequest(response);
                }

                var result = await _studentProgressService.GetAllStudentDetails();
                if (result == null || !result.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("No student details found.");
                    return NotFound(response);
                }
                response.Content = result;
                return Ok(response);
            }
            catch
            {
                response.Message = "One or more errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}
