using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class SparcFolderFileAccess
    {
        public int Id { get; set; }
        public string Owner { get; set; } = null!;
        public string FolderUrl { get; set; } = null!;
        public string? FileUrl { get; set; }
        public sbyte HasAccess { get; set; }
    }
}
