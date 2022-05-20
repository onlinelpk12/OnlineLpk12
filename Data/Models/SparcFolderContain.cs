using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class SparcFolderContain
    {
        public int Id { get; set; }
        public string FolderUrl { get; set; } = null!;
        public string FileUrl { get; set; } = null!;
    }
}
