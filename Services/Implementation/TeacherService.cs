﻿using Microsoft.EntityFrameworkCore;
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

    }
}