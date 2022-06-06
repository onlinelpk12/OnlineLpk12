using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class SparcContent
    {
        public int Id { get; set; }
        public string FileUrl { get; set; } = null!;
        public byte[] Program { get; set; } = null!;
        public DateTime DateModified { get; set; }
        public string Owner { get; set; } = null!;
    }
}
