using System;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using MySqlX.XDevAPI;
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
                AFAssessmentData assessmentData = new AFAssessmentData()
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
                await _context.AFAssessmentData.AddAsync(assessmentData);
                await _context.SaveChangesAsync();
                result.Success = true;
                result.Content = Convert.ToString(assessmentData.AssessmentId);
                result.Message = "Assessment saved successfully.";
            }
            catch (Exception ex)
            {
                result.Message = ex.Message;
            }
            return result;
        }

        public async Task<bool> deleteAFAssessmentData( int assessmentId)
        {

            try
            {
                var assessment = await _context.AFAssessmentData.FindAsync(assessmentId);
                if (assessment == null)
                    return false;


                _context.AFAssessmentData.Remove(assessment);
                await _context.SaveChangesAsync();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> updateAFAssessmentData(int assessmentId, AFAssessment aFAssessment)
        {
            try
            {
                var assessment = await _context.AFAssessmentData.FindAsync(assessmentId);
                if (assessment == null)
                    return false;

                assessment.CourseId = aFAssessment.CourseId;
                assessment.LessonId = aFAssessment.LessonId;
                assessment.Question = aFAssessment.Question;
                assessment.Answer = aFAssessment.Answer;
                assessment.ModifiedBy = aFAssessment.ModifiedBy;
                assessment.ModifiedAt = DateTime.Now;

                _context.Update(assessment);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                await _logService.LogError(aFAssessment.ModifiedBy, "UpdateLessonAssessment", "LessonAssessmentService", ex.Message, ex);
                return false;
            }
        }

        public async Task<Result<List<AFAssessmentData>>> GetAllAssessments(int courseId, int lessonId)
        {
            Result<List<AFAssessmentData>> result = new Result<List<AFAssessmentData>>();
            try
            {
                var AfassessmentData = await _context.AFAssessmentData.Where(y => y.CourseId == courseId && y.LessonId == lessonId).ToListAsync();
                result.Content = AfassessmentData;
                result.Message = "Lesson Data retrived.";
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


    }
}

