using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class Course
    {
        public int Id { get; set; }
        public string CourseName { get; set; } = null!;
        public string Semester { get; set; } = null!;
        public int Year { get; set; }
    }
}
