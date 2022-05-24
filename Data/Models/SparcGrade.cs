using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class SparcGrade
    {
        public int Id { get; set; }
        public int LessonId { get; set; }
        public int LearningOutcome { get; set; }
        public int SparcId { get; set; }
        public int StudentId { get; set; }
        public string Grade { get; set; } = null!;
        public DateTime ActivityTimeStamp { get; set; }
    }
}
