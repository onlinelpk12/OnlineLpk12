using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
//using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
    public interface IStudentProgressService
    {
        Task UpdateLessonStatus(int lessonId, int userId);
        Task<Result<EmptyResult>> IsValidLesson(int lessonId);
        Task<List<Progress>> GetStatus();
        LessonAndQuizProgressResponse? GetLessonsAndQuizProgress(int userId);
        Task<LessonDetails> GetContent(int lessonId);

        Task<Result<Quiz>> GetQuizForStudent(int quizId, int? studentId);
        Task<Result<Quiz>> GetQuizForTeacher(int quizId, int? studentId);
        Task<SubmitQuiz> SubmitQuiz(SubmitQuiz quiz);

        Task<bool> IsUserTeacher(int userId);
        Task<List<StudentDetails>> GetAllStudentDetails();
        Task<string> ValidateSubmittedQuiz(SubmitQuiz quiz);
        Task<int> GetQuizIdByLessonId(int lessonId);
        Task<Result<Data.Entities.User>> IsValidUser(int userId);
    }
}
