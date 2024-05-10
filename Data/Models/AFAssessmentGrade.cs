using System;
namespace OnlineLpk12.Data.Models
{
	public class AFAssessmentGrade
	{
        public int GradeId { get; set; }
        public int AssessmentId { get; set; }
        public int StudentId { get; set; }
        public int TeacherId { get; set; }
        public int SubmissionId { get; set; }
        public string Grade { get; set; }
        public string Comments { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}

