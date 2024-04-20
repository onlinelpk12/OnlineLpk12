using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Services.Interface;

namespace OnlineLpk12.Services.Implementation
{
    public class LessonSlideService : ILessonSlideService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly ILogService _logService;

        public LessonSlideService(OnlineLpk12DbContext context, ILogService logService)
        {
            _context = context;
            _logService = logService;
        }

        public async Task<(bool, int)> AddSlide(int courseId, int lessonId, LessonSlide lessonSlide)
        {
            try
            {
                var course = await _context.Courses.FindAsync(courseId);
                if (course == null)
                {
                    return (false, 0);
                }

                var lesson = await _context.CourseLessons.FindAsync(lessonId);
                if (lesson == null)
                {
                    return (false, 0);
                }

                var slide = new LessonSlide
                {
                    SlideHtmlFormat = lessonSlide.SlideHtmlFormat,
                    SlideMarkdownFormat = lessonSlide.SlideMarkdownFormat,
                    CreatedBy = lessonSlide.CreatedBy,
                    CreatedAt = DateTime.UtcNow,
                    ModifiedBy = lessonSlide.ModifiedBy,
                    ModifiedAt = DateTime.UtcNow
                };

                _context.LessonSlides.Add(slide);
                await _context.SaveChangesAsync();

                var courseLessonSlide = new CoursesLessonSlide
                {
                    CourseId = courseId,
                    LessonId = lessonId,
                    SlideId = slide.Id,
                };

                _context.CoursesLessonSlides.Add(courseLessonSlide);
                await _context.SaveChangesAsync();

                return (true, slide.Id);
            }
            catch (Exception ex)
            {
                await _logService.LogError(lessonSlide.CreatedBy, "AddSlide", "SlideService", ex.Message, ex);
                return (false, 0);
            }
        }

        public async Task<bool> DeleteSlide(int userId, int slideId)
        {
            try
            {
                var slide = await _context.LessonSlides.FindAsync(slideId);
                if (slide == null)
                    return false;

                var relatedEntries = _context.CoursesLessonSlides.Where(cls => cls.SlideId == slideId);
                _context.CoursesLessonSlides.RemoveRange(relatedEntries);

                _context.LessonSlides.Remove(slide);
                await _context.SaveChangesAsync();

                return true;
            }
            catch (Exception ex)
            {
                await _logService.LogError(userId, "DeleteSlide", "SlideService", ex.Message, ex);
                return false;
            }
        }

        public async Task<bool> UpdateSlide(int slideId, LessonSlide lessonSlide)
        {
            try
            {
                var existingSlide = await _context.LessonSlides.FindAsync(slideId);
                if (existingSlide == null)
                    return false;

                existingSlide.SlideHtmlFormat = lessonSlide.SlideHtmlFormat;
                existingSlide.SlideMarkdownFormat = lessonSlide.SlideMarkdownFormat;
                existingSlide.ModifiedBy = lessonSlide.ModifiedBy;
                existingSlide.ModifiedAt = DateTime.UtcNow;

                _context.Update(existingSlide);
                await _context.SaveChangesAsync();

                return true;
            }
            catch (Exception ex)
            {
                await _logService.LogError(lessonSlide.ModifiedBy, "UpdateSlide", "SlideService", ex.Message, ex);
                return false;
            }
        }
    }
}
