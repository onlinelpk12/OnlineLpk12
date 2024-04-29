using System;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
	public interface ILessonAssessmentService
	{
        Task<Result<string>> createAFAssessmentData(AFAssessment aFAssessment);
        Task<bool> deleteAFAssessmentData(int assessmentId);
        Task<bool> updateAFAssessmentData(int assessmentId, AFAssessment aFAssessment);
        Task<Result<List<AFAssessmentData>>> GetAllAssessments(int courseId, int lessonId);
        Task<Result<string>> AssessmentSubmission(int courseId,int lessonId,int studentId,int assessmentId, AFStudentAssessmentSubmission submission);
        Task<Result<List<AFStudentAssessmentSubmission>>> GetAssessmentSubmissions(int courseId, int lessonId, int assessmnetId, int studentId);
    }
}

