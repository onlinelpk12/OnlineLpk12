using System;
namespace OnlineLpk12.Data.Entities
{
    public class AFAssessmentSubmission
    {
        public int SubmissionId { get; set; }
        public int CourseId { get; set; }
        public int LessonId { get; set; }
        public int AssessmentId { get; set; }
        public int StudentId { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; } 
        public DateTime SubmissionDateTime { get; set; }
        public int IsUpdated { get; set; }
        public int IsGraded { get; set; }
    }
}
