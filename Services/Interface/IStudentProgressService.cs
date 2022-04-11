using OnlineLpk12.Data.Entities;
//using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
    public interface IStudentProgressService
    {
        Task<List<Progress>> GetStatus();
        LessonAndQuizProgressResponse GetLessonsAndQuizProgress(string username);
        Task<LessonDetails> GetContent(int lessonId);

        Task<Quiz> GetQuiz(int? lessonId, int? quizId, int? studentId);
        Task<SubmitQuiz> SubmitQuiz(SubmitQuiz quiz);
    }
}
