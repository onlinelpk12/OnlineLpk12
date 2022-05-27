﻿using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Services.Interface;
using System.Diagnostics;
using System.Reflection;

namespace OnlineLpk12.Services.Implementation
{
    public class StudentService : IStudentService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly ILogService _logService;

        public StudentService(OnlineLpk12DbContext context, ILogService logService)
        {
            this._context = context;
            this._logService = logService;
        }
        public bool SaveAssessmentAnswers(int userId, LessonProgress lessonProgress)
        {
            throw new NotImplementedException();
        }

        public bool SaveLessonProgress(LessonProgress lessonProgress)
        {
            try
            {
                StudentLessonProgress studentLessonProgressFromDb = _context.StudentLessonProgresses.FirstOrDefault(x=> x.StudentId == lessonProgress.StudentId
                    && x.LessonId == lessonProgress.LessonId 
                    && x.LearningOutcome == lessonProgress.LearningOutcome
                    && x.PageNumber == lessonProgress.PageNumber);
                if(studentLessonProgressFromDb == null)
                {
                    StudentLessonProgress studentLessonProgress = new()
                    {
                        StudentId = lessonProgress.StudentId,
                        LessonId = lessonProgress.LessonId,
                        LearningOutcome = lessonProgress.LearningOutcome,
                        PageNumber = lessonProgress.PageNumber,
                        ActivityTimeStamp = DateTime.Now
                    };
                    _context.StudentLessonProgresses.Add(studentLessonProgress);
                }
                else
                {
                    studentLessonProgressFromDb.ActivityTimeStamp = DateTime.Now;
                }
                _context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {

                _logService.LogError(lessonProgress.StudentId, MethodBase.GetCurrentMethod().Name,
                   Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }
    }
}