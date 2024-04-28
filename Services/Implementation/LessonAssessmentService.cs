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
    public class LessonAssessmentService : ILessonAssessmentService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly ILogService _logService;
        public LessonAssessmentService(OnlineLpk12DbContext context, ILogService logService)
        {
            _context = context;
            _logService = logService;
        }


        public async Task<Result<String>> createAFAssessmentData(AFAssessment aFAssessment)
        {

            Result<string> result = new Result<string>();
            try
            {
                AFAssessmentData DbAssessmentData = new AFAssessmentData()
                {
                    CourseId = aFAssessment.CourseId,
                    LessonId = aFAssessment.LessonId,
                    Question = aFAssessment.Question,
                    Answer = aFAssessment.Answer,
                    CreatedBy = aFAssessment.CreatedBy,
                    ModifiedBy = aFAssessment.CreatedBy,
                    CreatedAt = DateTime.Now,
                    IsActive = 1
                };
                await _context.AFAssessmentData.AddAsync(DbAssessmentData);
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

        public async Task<Result<String>> deleteAFAssessmentData(int courseId, int lessonId, int assessmentId)
        {

            Result<string> result = new Result<string>();
            try
            {
                //write code here
            }
            catch (Exception ex)
            {
                result.Message = ex.Message;
            }
            return result;
        }

        public async Task<Result<String>> updateAFAssessmentData(int courseId, int lessonId, int assessmentId)
        {

            Result<string> result = new Result<string>();
            try
            {
                //write code here
            }
            catch (Exception ex)
            {
                result.Message = ex.Message;
            }
            return result;
        }


    }
}

