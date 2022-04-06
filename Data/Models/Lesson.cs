using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class Lesson
    {
        public int Id { get; set; }
        public int LessonNumber { get; set; }
        public string LessonName { get; set; } = null!;
    }
}
