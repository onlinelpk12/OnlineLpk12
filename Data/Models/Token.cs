using System;
namespace OnlineLpk12.Data.Models
{
	public class Token
	{
        
        public int id { get; set; }
        public string accessToken { get; set; }
        public string username { get; set; }
        public string roles { get; set; }
        public string email { get; set; }
        public string? enrolledCourses { get; set; }
    }
}

