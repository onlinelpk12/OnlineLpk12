using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface IStudentService
    {
        public bool SaveLessonProgress(LessonProgress lessonProgress);
        public bool SaveAssessmentScore(AssessmentOverview assessmentOverview);
        public bool SaveAssessmentAnswers(int userId, LessonProgress lessonProgress);

    }
}
