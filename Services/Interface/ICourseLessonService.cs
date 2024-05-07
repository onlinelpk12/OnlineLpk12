using OnlineLpk12.Data.Models;
using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface ICourseLessonService
    {
        Task<Data.Models.CourseLesson> GetLessonById(int lessonId);
        Task<(bool, int)> AddLesson(int courseId, Data.Models.CourseLesson lesson);
        Task<bool> DeleteLesson(int userId, int lessonId);
        Task<bool> UpdateLesson(int lessonId, Data.Models.CourseLesson lesson);
        Task<Result<List<Data.Entities.LessonSlide>>> GetSlidesToEditById(int courseId, int lessonId);
    }
}
