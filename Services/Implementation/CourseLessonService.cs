using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Reflection;

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

        public async Task<Data.Models.CourseLesson> GetLessonById(int lessonId)
        {
            Data.Models.CourseLesson lesson = null;

            try
            {
                lesson = await _context.CourseLessons.FindAsync(lessonId);
            }
            catch (Exception ex)
            {
                await _logService.LogError(0, "GetLessonById", "CourseLessonService", ex.Message, ex);
            }

            return lesson;
        }

        public async Task<(bool, int)> AddLesson(int courseId, Data.Models.CourseLesson courseLesson)
        {
            try
            {
                var course = await _context.Courses.FindAsync(courseId);
                if (course == null)
                {
                    return (false, 0);
                }

                var lesson = new Data.Models.CourseLesson
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

                var coursesLessonSlide = new Data.Models.CoursesLessonSlide
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
                var lesson = await _context.CourseLessons.FindAsync(lessonId);
                if (lesson == null)
                    return false;

                var relatedEntries = _context.CoursesLessonSlides.Where(cls => cls.LessonId == lessonId);
                _context.CoursesLessonSlides.RemoveRange(relatedEntries);
                await _context.SaveChangesAsync();

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

        public async Task<bool> UpdateLesson(int lessonId, Data.Models.CourseLesson courseLesson)
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
        public async Task<Result<List<Data.Entities.LessonSlide>>> GetSlidesToEditById(int courseId, int lessonId)
        {
            var result = new Result<List<Data.Entities.LessonSlide>>()
            {
                Content = new List<Data.Entities.LessonSlide>()
            };
            try
            {
                var data = await (from cls in _context.CoursesLessonSlides
                                  join c in _context.Courses on cls.CourseId equals c.Id
                                  join l in _context.CourseLessons on cls.LessonId equals l.Id
                                  join s in _context.LessonSlides on cls.SlideId equals s.Id
                                  where cls.CourseId == courseId && cls.LessonId == lessonId
                                  select s).ToListAsync();

                foreach (var item in data)
                {
                    result.Content.Add(new Data.Entities.LessonSlide()
                    {
                        Id = item.Id,
                        SlideHtmlFormat = item.SlideHtmlFormat,
                        SlideMarkdownFormat = item.SlideMarkdownFormat,
                        CreatedBy = item.CreatedBy,
                        CreatedAt = item.CreatedAt,
                        ModifiedBy = item.ModifiedBy,
                        ModifiedAt = item.ModifiedAt,
                    });
                }
                return result;
            }
            catch (Exception ex)
            {
                _ = _logService.LogError(courseId, MethodBase.GetCurrentMethod().Name,
                   Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }

    }
}
