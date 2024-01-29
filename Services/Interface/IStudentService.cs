using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data.Models;
namespace OnlineLpk12.Services.Interface
{
    public interface IStudentService
    {
        public bool SaveLessonProgress(LessonProgress lessonProgress);
        public bool SaveQuizQuestionAnswer(QuizQuestionAnswer quizQuestionAnswers);
        public bool SaveAssessmentScore(AssessmentOverview assessmentOverview);
        public bool SaveAssessmentSubmission(Assessment assessment);

    }
}
