using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class StudentProgress
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public int LessonId { get; set; }
        public int LessonStatusId { get; set; }
        public int QuizId { get; set; }
        public int QuizStatusId { get; set; }
        public decimal QuizScore { get; set; }
    }
}
