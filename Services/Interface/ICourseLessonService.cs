using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
    public interface ICourseLessonService
    {
        Task<bool> AddLesson(int courseId, CourseLesson lesson);
        Task<bool> DeleteLesson(int courseId, int lessonId);
        Task<bool> UpdateLesson(int courseId, int lessonId, CourseLesson lesson);
    }
}
