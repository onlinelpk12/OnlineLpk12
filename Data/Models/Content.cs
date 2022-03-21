using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class Content
    {
        public int Id { get; set; }
        public int ContentTypeId { get; set; }
        public string? ContentUrl { get; set; }
        public int LessonId { get; set; }
    }
}
