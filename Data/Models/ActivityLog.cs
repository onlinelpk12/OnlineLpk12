using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class ActivityLog
    {
        public int EventId { get; set; }
        public string? UserId { get; set; }
        public string? MethodName { get; set; }
        public string? FileName { get; set; }
        public string? LogLevelType { get; set; }
        public string? Message { get; set; }
        public string? Exception { get; set; }
        public DateTime? ActivityTimeStamp { get; set; }
    }
}
