using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class SparcProgram
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public byte[] Program { get; set; } = null!;
    }
}
