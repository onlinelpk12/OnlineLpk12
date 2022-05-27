using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Text;
using System.Diagnostics;
using System.Reflection;

namespace OnlineLpk12.Services.Implementation
{
    public class TeacherService : ITeacherService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly ILogService _logService;

        public TeacherService(OnlineLpk12DbContext context, ILogService logService)
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
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                   Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
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
                var data = await (from std in _context.CoursesStudents
                                  join user in _context.Users
                                  on std.StudentId equals user.Id
                                  where std.CourseId == courseId && std.TeacherId == userId
                                  select new Student()
                                  {
                                      Id = user.Id,
                                      FirstName = user.FirstName,
                                      LastName = user.LastName,
                                      UserName = user.Username
                                  }).Distinct().ToListAsync();
                result.Content = data;
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }

        public async Task<Result<List<SparcProgram>>> GetSparcList(int userId)
        {
            var result = new Result<List<SparcProgram>>();
            try
            {
                result.Content = await (from sp in _context.Sparcs
                                        join gr in _context.SparcGrades
                                        on sp.Id equals gr.SparcId
                                        where sp.UserId == userId && sp.IsGrading == (sbyte)0
                                        select new SparcProgram()
                                        {
                                            LessonId = sp.LessonId ?? 0,
                                            LearningOutcome = sp.LearningOutcome ?? 0,
                                            UserId = userId,
                                            ActivityTime = sp.ActivityTimeStamp.ToString("MM/dd/yyyy hh:mm:ss tt"),
                                            Grade = !string.IsNullOrEmpty(gr.Grade) && gr.Grade != "NA" ? gr.Grade : "Not yet graded",
                                        }).OrderByDescending(x => x.ActivityTime).ToListAsync();
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                   Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }

        public async Task<Result<SparcProgram>> GetSparcProgram(int userId, int lessonId, int learningOutcome)
        {
            var result = new Result<SparcProgram>();
            try
            {
                var data = await (from sp in _context.Sparcs
                                  where sp.UserId == userId && sp.LessonId == lessonId
                                  && sp.LearningOutcome == learningOutcome
                                  orderby sp.ActivityTimeStamp descending
                                  select new SparcProgram()
                                  {
                                      LessonId = sp.LessonId ?? 0,
                                      LearningOutcome = sp.LearningOutcome ?? 0,
                                      UserId = userId,
                                      ActivityTime = sp.ActivityTimeStamp.ToString("MM/dd/yyyy hh:mm:ss tt"),
                                      Program = sp.Program != null ? Encoding.Default.GetString(sp.Program) : ""
                                  }).FirstOrDefaultAsync();
                result.Content = data;
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }

        public async Task<Result<List<LessonProgress>>> GetLessonProgressList(int userId)
        {
            var result = new Result<List<LessonProgress>>();
            try
            {
                result.Content = await (from sp in _context.StudentLessonProgresses
                                        where sp.StudentId == userId
                                        orderby sp.ActivityTimeStamp descending
                                        select new LessonProgress()
                                        {
                                            LessonId = sp.LessonId,
                                            LearningOutcome = sp.LearningOutcome,
                                            PageNumber = sp.PageNumber,
                                            StudentId = userId,
                                            ActivityTime = sp.ActivityTimeStamp.ToString("MM/dd/yyyy hh:mm:ss tt")
                                        }).ToListAsync();
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }

        public async Task<Result<List<AssessmentOverview>>> GetAssessments(int userId)
        {
            var result = new Result<List<AssessmentOverview>>();
            try
            {
                var data = await (from assm in _context.AssessmentStatuses
                                  where assm.StudentId == userId
                                  select new AssessmentOverview()
                                  {
                                      AssessmentId = assm.Id,
                                      LearningOutcome = assm.LearningOutcome,
                                      LessonId = assm.LessonId,
                                      Status = !string.IsNullOrEmpty(assm.Status) ? assm.Status : "Not yet started",
                                      Score = assm.Score,
                                      TotalScore = assm.TotalScore,
                                      StudentId = assm.StudentId
                                  }).ToListAsync();
                if (data != null)
                {
                    result.Content = data;
                    result.Success = true;
                }
                else
                {
                    result.Success = false;
                }
                return result;

            }
            catch (Exception ex)
            {
                await _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }

        public async Task<Result<Assessment>> GetAssessmentDetails(int userId, int lessonId, int learningOutcome)
        {
            var result = new Result<Assessment>();
            try
            {
                var data = await (from assment in _context.AssessmentSubmissions
                                  where assment.StudentId == userId &&
                                  assment.LessonId == lessonId &&
                                  assment.LearningOutcome == learningOutcome
                                  select assment).ToListAsync();

                if (data != null)
                {
                    Assessment assessment = new()
                    {
                        LessonId = lessonId,
                        LearningOutcome = learningOutcome,
                        StudentId = userId,
                        QuestionAnswers = new List<QuestionAnswer>()
                    };
                    foreach (var item in data)
                    {
                        assessment.QuestionAnswers.Add(new QuestionAnswer()
                        {
                            Question = item.Question,
                            Answer = item.Answer
                        });
                    }
                    result.Success = true;
                    result.Content = assessment;
                }
                else
                {
                    result.Success = false;
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
