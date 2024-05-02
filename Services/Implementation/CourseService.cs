using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Text;
using System.Diagnostics;
using System.Reflection;
using OnlineLpk12.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace OnlineLpk12.Services.Implementation
{
    public class CourseService : ICourseService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly ILogService _logService;
        

        public CourseService(OnlineLpk12DbContext context, ILogService logService)
        {
            _context = context;
            _logService = logService;
        }

        public async Task<Result<List<Course>>> GetCourses(int userId)
        {
            var result = new Result<List<Course>>()
            {
                Content = new List<Course>()
            };
            try
            {
                var data = await (from cs in _context.Courses
                                  select cs).ToListAsync();


                foreach (var item in data)
                {
                    result.Content.Add(new Course()
                    {
                        CourseId = item.Id,
                        CourseName = item.CourseName.Trim(),
                        Semester = item.Semester.Trim(),
                        Year = item.Year,
                        IsCourseAvailable=item.IsCourseAvailable
                    });
                }
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                   Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }
        public async Task<Result<string>> CreateCourse(Course course)
        {
            var result = new Result<string>();

            try
            {
                // Validate the input course object
                var validationErrors = Helper.ValidateCourse(course);
                if (validationErrors.Count > 0)
                {
                    result.Success = false;
                    return result;
                }
                

                // Add the course to the database context
                Data.Models.Course course1 = new Data.Models.Course()
                {
                    CourseName = course.CourseName,
                    Semester = course.Semester,
                    Year = course.Year,
                    CreatedBy = course.CreatedBy,
                    CreatedAt = DateTime.Now,
                    ModifiedBy = course.ModifiedBy,
                    ModifiedAt = DateTime.Now,
                    IsCourseAvailable=true
    };
                _context.Courses.Add(course1);
                await _context.SaveChangesAsync();

                // Set the success result
                result.Success = true;
                result.Content = "Course created successfully";
                return result;
            }
            catch (Exception ex)
            {
                // Log the exception
                _logService.LogError(course.CourseId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);

                // Set the error result
                result.Success = false;
                return result;
            }
        }
        public async Task<Result<List<Course>>> GetCoursesById(int userId)
        {
            var result = new Result<List<Course>>()
            {
                Content = new List<Course>()
            };
            try
            {
                var data = await (from cs in _context.Courses
                                  where cs.CreatedBy == userId
                                  select cs).ToListAsync();

                foreach (var item in data)
                {
                    result.Content.Add(new Course()
                    {
                        CourseId = item.Id,
                        CourseName = item.CourseName.Trim(),
                        Semester = item.Semester.Trim(),
                        Year = item.Year,
                        IsCourseAvailable=item.IsCourseAvailable
                    });
                }
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                   Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }
        public async Task<Result<string>> DeleteCourse(int courseId)
        {
            var result = new Result<string>();
            try
            {
                var course = await (from cs in _context.Courses
                                    where cs.Id == courseId
                                    select cs).FirstOrDefaultAsync();
                if (course == null)
                {
                    result.Message = "Course not found.";
                    return result;
                }

                _context.Courses.Remove(course);
                await _context.SaveChangesAsync();

                result.Success = true;
                result.Content = "Course deleted successfully";
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(courseId, nameof(DeleteCourse), GetType().FullName, ex.Message, ex);
                result.Message = "An error occurred while deleting the course.";
                return result;
            }
        }
        public async Task<Result<List<CourseLesson>>> GetLessonsToEditById(int courseId)
        {
            var result = new Result<List<CourseLesson>>()
            {
                Content = new List<CourseLesson>()
            };
            try
            {
                var data = await (from cls in _context.CoursesLessonSlides
                                  join c in _context.Courses on cls.CourseId equals c.Id
                                  join l in _context.CourseLessons on cls.LessonId equals l.Id
                                  where cls.CourseId == courseId
                                  select l).ToListAsync();

                foreach (var item in data)
                {
                    result.Content.Add(new CourseLesson()
                    {
                        Id = item.Id,
                        LessonName = item.LessonName,
                        CreatedBy = item.CreatedBy,
                        CreatedAt = item.CreatedAt,
                        ModifiedBy = item.ModifiedBy,
                        ModifiedAt = item.ModifiedAt,
                        IsLessonAvailable = item.IsLessonAvailable
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
        public async Task<bool> UpdateCourse(int courseId, Course course)
        {
            try
            {
                var course1 = await _context.Courses.FindAsync(courseId);
                if (course1 == null)
                    return false;

                course1.CourseName = course.CourseName;
                course1.ModifiedBy = course.ModifiedBy;
                course1.ModifiedAt = DateTime.Now;
                course1.IsCourseAvailable = course.IsCourseAvailable;

                _context.Update(course1);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                await _logService.LogError(course.ModifiedBy, "UpdateCourse", "CourseService", ex.Message, ex);
                return false;
            }
        }

    }
}