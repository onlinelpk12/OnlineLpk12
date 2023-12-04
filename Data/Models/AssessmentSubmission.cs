using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class AssessmentSubmission
    {
        public int Id { get; set; }
        public string Question { get; set; } = null!;
        public string Answer { get; set; } = null!;
        public int LessonId { get; set; }
        public int LearningOutcome { get; set; }
        public int StudentId { get; set; }
    }
}
