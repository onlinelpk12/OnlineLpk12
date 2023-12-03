using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class Quiz
    {
        public int QuestionId { get; set; }
        public int QuestionOrder { get; set; }
        public string Question { get; set; } = null!;
        public int Answer { get; set; }
        public int QuizId { get; set; }
        public int LessonId { get; set; }
    }
}
