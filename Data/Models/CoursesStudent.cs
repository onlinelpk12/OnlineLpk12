using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class CoursesStudent
    {
        public int Id { get; set; }
        public int CourseId { get; set; }
        public int TeacherId { get; set; }
        public int StudentId { get; set; }
    }
}
