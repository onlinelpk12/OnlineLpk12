using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Text;
using System.Diagnostics;
using System.Reflection;
using OnlineLpk12.Helpers;

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
                        Year = item.Year
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
                //check if user is a courseDeveloper then only he can create course

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
                        Year = item.Year
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



    }
}