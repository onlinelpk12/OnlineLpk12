using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json.Linq;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Helpers;
using OnlineLpk12.Services.Interface;

namespace OnlineLpk12.Services.Implementation
{
    public class LessonService : ILessonService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly ILogService _logService;
        public LessonService(OnlineLpk12DbContext context, ILogService logService)
        {
            _context = context;
            _logService = logService;
        }

        public async Task<Result<AssessmentData>> fetchAssessmentDetails(string lesson, string course)
        {
            Result<AssessmentData> result = new Result<AssessmentData>();
            try
            {
                var assessmentData = await Task.FromResult(_context.AssessmentData.FirstOrDefault(x => x.CourseName == course && x.LessonName == lesson));
                result.Content = new AssessmentData()
                {
                    CourseName = assessmentData.CourseName,
                    LessonName = assessmentData.LessonName,
                    Answers = assessmentData.Answers,
                    Data = assessmentData.Data,
                    Header = assessmentData.Header,
                    Questions = assessmentData.Questions,
                    PageNum = assessmentData.PageNum,
                    Id = assessmentData.Id
                }; ;
                result.Message = "Assessment Data retrived.";
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(1, "Get Assessment", "LessonService", ex.Message, ex);
                result.Message = ex.Message;
                result.Success = false;
                return result;
            }
        }

        public async Task<Result<SlideData>> GetLesson(string lesson, string course)
        {
            Result<SlideData> result = new Result<SlideData>();
            try
            {
                var pdf = await Task.FromResult(_context.SlideData.FirstOrDefault(x => x.CourseName == course && x.LessonName == lesson));
                result.Content = new SlideData()
                {
                    LessonName = pdf.LessonName,
                    CourseName = pdf.CourseName,
                    Id = pdf.Id,
                    Pdf = pdf.Pdf,
                }; ;
                result.Message = "Lesson retrived.";
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(1, "Getlesson", "LessonService", ex.Message, ex);
                result.Message = ex.Message;
                result.Success = false;
                return result;
            }
        }

        public async Task<Result<List<string>>> LessonList(string course)
        {
            Result<List<string>> result = new Result<List<string>>();
            try
            {
                var lessonList = await (from data in _context.SlideData
                                        where data.CourseName == course
                                        select data.LessonName).ToListAsync();
                result.Content = lessonList;
                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(1, "Getlesson", "LessonService", ex.Message, ex);
                result.Message = ex.Message;
                result.Success = false;
                return result;
            }
        }

        public async Task<Result<string>> uploadAssessmentDetails(AssessmentData assessmentData)
        {
            Result<string> result = new Result<string>();
            try
            {
                AssessmentData DbAssessmentData = new AssessmentData()
                {
                    CourseName = assessmentData.CourseName,
                    LessonName = assessmentData.LessonName,
                    Answers = assessmentData.Answers,
                    Data = assessmentData.Data,
                    Header = assessmentData.Header,
                    Questions = assessmentData.Questions,
                    PageNum = assessmentData.PageNum
                };
                await _context.AssessmentData.AddAsync(DbAssessmentData);
                await _context.SaveChangesAsync();
                result.Success = true;
                result.Message = "Assessment saved successfully.";
            }
            catch (Exception ex)
            {
                result.Message = ex.Message;
            }
            return result;
        }

        public async Task<Result<string>> UploadLesson(SlideData slideData)
        {
            Result<string> result = new Result<string>();
            try
            {
                SlideData DbSlideData = new SlideData()
                {
                    CourseName = slideData.CourseName,
                    LessonName = slideData.LessonName,
                    Pdf = slideData.Pdf
                };
                await _context.SlideData.AddAsync(DbSlideData);
                await _context.SaveChangesAsync();
                result.Success = true;
                result.Message = "Lesson saved successfully.";
            }
            catch (Exception ex)
            {
                result.Message = ex.Message;
            }
            return result;
        }

    }
}

