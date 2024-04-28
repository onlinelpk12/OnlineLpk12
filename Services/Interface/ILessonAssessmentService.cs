using System;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
	public interface ILessonAssessmentService
	{
        Task<Result<string>> createAFAssessmentData(AFAssessment aFAssessment);
        Task<Result<string>> deleteAFAssessmentData(int courseId, int lessonId, int assessmentId);
        Task<Result<string>> updateAFAssessmentData(int courseId, int lessonId, int assessmentId);
        Task<Result<List<AFAssessmentData>>> GetAllAssessments(int courseId, int lessonId);

    }
}

