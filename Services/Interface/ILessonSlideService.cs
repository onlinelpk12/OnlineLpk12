using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
    public interface ILessonSlideService
    {
        Task<LessonSlide> GetSlideById(int slideId);
        Task<(bool, int)> AddSlide(int courseId, int lessonId, LessonSlide slide);
        Task<bool> DeleteSlide(int userId, int slideId);
        Task<bool> UpdateSlide(int slideId, LessonSlide slide);
    }
}
