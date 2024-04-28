using System;
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

    }
}

