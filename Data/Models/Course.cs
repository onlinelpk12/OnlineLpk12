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
        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool IsCourseAvailable { get; set; }

    }
}
