using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class StudentLessonProgress
    {
        public long Id { get; set; }
        public int StudentId { get; set; }
        public int LessonId { get; set; }
        public int LearningOutcome { get; set; }
        public DateTime ActivityTimeStamp { get; set; }
    }
}
