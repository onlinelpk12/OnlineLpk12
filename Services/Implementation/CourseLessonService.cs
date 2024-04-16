using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Services.Interface;

namespace OnlineLpk12.Services.Implementation
{
    public class CourseLessonService : ICourseLessonService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly ILogService _logService;

        public CourseLessonService(OnlineLpk12DbContext context, ILogService logService)
        {
            _context = context;
            _logService = logService;
        }

        public async Task<(bool, int)> AddLesson(int courseId, CourseLesson courseLesson)
        {
            try
            {
                var course = await _context.Courses.FindAsync(courseId);
                if (course == null)
                {
                    return (false, 0);
                }

                var lesson = new CourseLesson
                {
                    LessonName = courseLesson.LessonName,
                    CreatedBy = courseLesson.CreatedBy,
                    CreatedAt = DateTime.UtcNow,
                    ModifiedBy = courseLesson.ModifiedBy,
                    ModifiedAt = DateTime.UtcNow,
                    IsLessonAvailable = courseLesson.IsLessonAvailable
                };

                _context.CourseLessons.Add(lesson);
                await _context.SaveChangesAsync();

                var coursesLessonSlide = new CoursesLessonSlide
                {
                    CourseId = courseId,
                    LessonId = lesson.Id,
                    SlideId = 0 // slide_id set to 0 for now as we don't have any slides while addding a new lesson to a course
                };

                _context.CoursesLessonSlides.Add(coursesLessonSlide);
                await _context.SaveChangesAsync();

                return (true, lesson.Id);
            }
            catch (Exception ex)
            {
                await _logService.LogError(courseLesson.CreatedBy, "AddLesson", "CourseLessonService", ex.Message, ex);
                return (false, 0);
            }
        }

        public async Task<bool> DeleteLesson(int userId, int lessonId)
        {
            try
            {
                var relatedEntries = _context.CoursesLessonSlides.Where(cls => cls.LessonId == lessonId);
                _context.CoursesLessonSlides.RemoveRange(relatedEntries);
                await _context.SaveChangesAsync();

                var lesson = await _context.CourseLessons.FindAsync(lessonId);
                if (lesson == null)
                    return false;

                _context.CourseLessons.Remove(lesson);
                await _context.SaveChangesAsync();

                return true;
            }
            catch (Exception ex)
            {
                await _logService.LogError(userId, "DeleteLesson", "CourseLessonService", ex.Message, ex);
                return false;
            }
        }

        public async Task<bool> UpdateLesson(int lessonId, CourseLesson courseLesson)
        {
            try
            {
                var lesson = await _context.CourseLessons.FindAsync(lessonId);
                if (lesson == null)
                    return false;

                lesson.LessonName = courseLesson.LessonName;
                lesson.ModifiedBy = courseLesson.ModifiedBy;
                lesson.ModifiedAt = DateTime.UtcNow;
                lesson.IsLessonAvailable = courseLesson.IsLessonAvailable;

                _context.Update(lesson);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                await _logService.LogError(courseLesson.ModifiedBy, "UpdateLesson", "CourseLessonService", ex.Message, ex);
                return false;
            }
        }
    }
}
