using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class SparcQuery
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public byte[] Query { get; set; } = null!;
    }
}
