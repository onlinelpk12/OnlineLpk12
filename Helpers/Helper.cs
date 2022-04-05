using OnlineLpk12.Data.Entities;
using System.Net.Mail;
using System.Text;

namespace OnlineLpk12.Helpers
{
    public static class Helper
    {

        public const string UserType_Student = "STUDENT";
        public const string UserType_Teacher = "TEACHER";
        public static string GetUserType(bool isStudent)
        {
            return isStudent ? UserType_Student : UserType_Teacher;
        }
        
    }
}
