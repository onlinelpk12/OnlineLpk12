using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class StudentQuiz
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public int LessonId { get; set; }
        public int QuizId { get; set; }
        public int QuestionId { get; set; }
        public int SelectedOptionId { get; set; }
        public int AnswerOptionId { get; set; }
    }
}
