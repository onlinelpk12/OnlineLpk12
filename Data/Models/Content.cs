using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class Content
    {
        public int Id { get; set; }
        public string ContentType { get; set; } = null!;
        public string ContentUrl { get; set; } = null!;
        public int LessonId { get; set; }
    }
}
