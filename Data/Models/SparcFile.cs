using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class SparcFile
    {
        public int Id { get; set; }
        public string FileUrl { get; set; } = null!;
        public string FileName { get; set; } = null!;
        public DateTime DateCreated { get; set; }
        public string Owner { get; set; } = null!;
    }
}
