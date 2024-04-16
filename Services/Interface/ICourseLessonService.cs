using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
    public interface ICourseLessonService
    {
        Task<bool> AddLesson(int courseId, CourseLesson lesson);
        Task<bool> DeleteLesson(int userId, int lessonId);
        Task<bool> UpdateLesson(int lessonId, CourseLesson lesson);
    }
}
