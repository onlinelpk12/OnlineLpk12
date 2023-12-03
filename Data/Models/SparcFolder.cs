using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class SparcFolder
    {
        public int Id { get; set; }
        public string FolderUrl { get; set; } = null!;
        public string FolderName { get; set; } = null!;
        public DateTime DateCreated { get; set; }
        public string Owner { get; set; } = null!;
        public string? ParentUrl { get; set; }
    }
}
