using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class AssessmentStatus
    {
        public int Id { get; set; }
        public int LessonId { get; set; }
        public int LearningOutcome { get; set; }
        public string Status { get; set; } = null!;
        public int Score { get; set; }
        public int TotalScore { get; set; }
        public int StudentId { get; set; }
    }
}
