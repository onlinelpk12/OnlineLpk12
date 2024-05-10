using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class UserRole
    {
        public int RoleId { get; set; }
        public int UserId { get; set; }

        public virtual Role Role { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}
