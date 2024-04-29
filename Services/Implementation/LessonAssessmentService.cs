using System;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using MySqlX.XDevAPI;
using MySqlX.XDevAPI.Common;
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
        public async Task<Result<string>> AssessmentSubmission(int courseId, int lessonId, int studentId,int assessmentId,AFStudentAssessmentSubmission submission)
        {
            Result<string> result = new Result<string>();
            try
            {

                var existingSubmission = await (from cls in _context.AFAssessmentSubmissions
                                                join c in _context.Courses on cls.CourseId equals c.Id
                                                join l in _context.Users on cls.StudentId equals l.Id
                                                join s in _context.CourseLessons on cls.LessonId equals s.Id
                                                join a in _context.AFAssessmentData on cls.AssessmentId equals a.AssessmentId
                                                where cls.CourseId == courseId && cls.LessonId == lessonId && cls.StudentId == studentId && cls.AssessmentId == assessmentId
                                                select cls).FirstOrDefaultAsync();
                if (existingSubmission != null)
                {
                    
                    existingSubmission.IsUpdated = true;
                    existingSubmission.Answer = submission.Answer;
                    existingSubmission.SubmissionDateTime = submission.SubmissionDateTime;
                    _context.AFAssessmentSubmissions.Update(existingSubmission);
                }
                else
                {
                    // Create a new assessment submission
                    AFStudentAssessmentSubmission assessmentSubmission = new AFStudentAssessmentSubmission()
                    {
                        CourseId = courseId,
                        LessonId = lessonId,
                        StudentId = studentId,
                        AssessmentId = assessmentId,
                        Question = submission.Question,
                        Answer = submission.Answer,
                        SubmissionDateTime = DateTime.Now,
                        IsUpdated = false,
                        IsGraded = false,

                    };
                    await _context.AFAssessmentSubmissions.AddAsync(assessmentSubmission);

                }

                
                await _context.SaveChangesAsync();
                result.Success = true;
                result.Message = "Assessment saved successfully.";
                return result;
            }
            catch (Exception ex)
            {
                await _logService.LogError(studentId, "AssessmentSubmission", "LessonAssessmentService", ex.Message, ex);
                result.Success = false;
                result.Message = "Failed to save assessment submission.";
                return result;
            }
        }
        public async Task<Result<List<AFStudentAssessmentSubmission>>> GetAssessmentSubmissions(int courseId, int lessonId, int assessmentId,int studentId)
        {
            Result<List<AFStudentAssessmentSubmission>> result = new Result<List<AFStudentAssessmentSubmission>>();
            try
            {
                var Afassessmentsubmissionsdata = await _context.AFAssessmentSubmissions.Where(y => y.CourseId == courseId && y.LessonId == lessonId && y.AssessmentId==assessmentId && y.StudentId== studentId && y.IsUpdated == true && y.IsGraded == false).ToListAsync();
                result.Content = Afassessmentsubmissionsdata;
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


