using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class Quiz
    {
        public int Id { get; set; }
        public int LessonId { get; set; }
        public int QuestionId { get; set; }
        public string Question { get; set; } = null!;
        public string Options { get; set; } = null!;
        public string? Answer { get; set; }
    }
}
