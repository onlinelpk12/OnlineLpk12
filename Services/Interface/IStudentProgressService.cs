using OnlineLpk12.Data.Entities;
//using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
    public interface IStudentProgressService
    {
        Task<List<Progress>> GetStatus();
        Task<List<Lessons>> GetLessons(int studentId);
        Task<Lessons> GetContent(int lessonId);
        Task<Quiz> GetQuiz(int? lessonId, int? quizId, int? studentId);
        Task<SubmitQuiz> SubmitQuiz(SubmitQuiz quiz);
    }
}
