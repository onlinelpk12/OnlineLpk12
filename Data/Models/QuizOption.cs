using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class QuizOption
    {
        public int Id { get; set; }
        public int QuestionId { get; set; }
        public int OptionNumber { get; set; }
        public string OptionDesc { get; set; } = null!;
    }
}
