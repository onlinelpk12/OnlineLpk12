using System;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Services.Interface
{
	public interface ILessonService
	{
        Task<Result<string>> UploadLesson(SlideData slideData);
        Task<Result<SlideData>> GetLesson(string lesson, string course);
        Task<Result<string>> uploadAssessmentDetails(AssessmentData slideData);
        Task<Result<AssessmentData>> fetchAssessmentDetails(string lesson, string course);
        Task<Result<List<string>>> LessonList(string course);
    }
}

