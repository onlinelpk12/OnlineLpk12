using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;

namespace OnlineLpk12.Services.Implementation
{
    public class TeacherService : ITeacherService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly ILogService _logService;

        public TeacherService(OnlineLpk12DbContext context, IHttpClientFactory httpClientFactory, ILogService logService)
        {
            _context = context;
            _httpClientFactory = httpClientFactory;
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
                var data = await (from cs in _context.CoursesStudents
                                  join course in _context.Courses
                                  on cs.CourseId equals course.Id
                                  where cs.TeacherId == userId
                                  select course).Distinct().ToListAsync();


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
                await _logService.LogError(userId, "GetCourses", "TeacherService", ex.Message, ex);
                throw;
            }
        }

        public async Task<Result<List<Student>>> GetStudentsForCourse(int userId, int courseId)
        {
            var result = new Result<List<Student>>()
            {
                Content = new List<Student>()
            };
            try
            {
                var data = (from std in _context.CoursesStudents
                            join user in _context.Users
                            on std.StudentId equals user.Id
                            where std.CourseId == courseId && std.TeacherId == userId
                            select new Student()
                            {
                                Id = user.Id,
                                FirstName = user.FirstName,
                                LastName = user.LastName,
                                UserName = user.Username
                            }).Distinct().ToList();
                result.Content = data;
                return result;
            }
            catch (Exception ex)
            {
                await _logService.LogError(userId, "GetStudentsForCourse", "TeacherService", ex.Message, ex);
                throw;
            }
        }


        public async Task<Result<List<SparcProgram>>> GetSparcList(int userId)
        {
            var result = new Result<List<SparcProgram>>();
            try
            {
                result.Content = (from sp in _context.Sparcs
                                  where sp.UserId == userId
                                  select new SparcProgram()
                                  {
                                      LessonId = sp.LessonId ?? 0,
                                      LearningOutcome = sp.LearningOutcome ?? 0,
                                      UserId = userId
                                  }).ToList();
                return result;
            }
            catch (Exception ex)
            {
                await _logService.LogError(userId, "GetSparcList", "TeacherService", ex.Message, ex);
                throw;
            }
        }
    }
}
