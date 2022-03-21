using System;
using System.Collections.Generic;

namespace OnlineLpk12.Data.Models
{
    public partial class User
    {
        public int Id { get; set; }
        public string UserName { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string FirstName { get; set; } = null!;
        public string? LastName { get; set; }
        public string? EmailId { get; set; }
        public string UserType { get; set; } = null!;
    }
}
