using System;
namespace OnlineLpk12.Data.Models
{
	public class AFAssessmentData
	{
        public int AssessmentId { get; set; }
        public int CourseId { get; set; }
        public int LessonId { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedAt { get; set; }
        public int IsActive { get; set; }
    }
}

