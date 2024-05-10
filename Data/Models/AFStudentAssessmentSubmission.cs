using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
namespace OnlineLpk12.Data.Models
{
    public class AFStudentAssessmentSubmission
    {
        public int SubmissionId { get; set; }
        public int CourseId { get; set; }
        public int LessonId { get; set; }
        public int AssessmentId { get; set; }
        public int StudentId { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public DateTime SubmissionDateTime { get; set; }
        
        public bool IsUpdated { get; set; }
        
        public bool IsGraded { get; set; }
    }
}
