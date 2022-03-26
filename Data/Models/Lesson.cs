using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class Lesson
    {
        public int LessonId { get; set; }
        public string LessonNumber { get; set; } = null!;
        public string LessonName { get; set; } = null!;
    }
}
