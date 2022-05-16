using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class Course
    {
        public int Id { get; set; }
        public int? TeacherId { get; set; }
        public int? StudentId { get; set; }
        public string? CourseName { get; set; }
        public string? SemesterYear { get; set; }
    }
}
