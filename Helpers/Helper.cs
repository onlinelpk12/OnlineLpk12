using OnlineLpk12.Data.Entities;
using System.Net.Mail;

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
        public static string ValidateUserWhileRegistering(User user)
        {
            if (user == null)
            {
                return "Enter valid user details";
            }
            if (string.IsNullOrEmpty(user.FirstName))
            {
                return "Enter valid First Name";
            }
            if (string.IsNullOrEmpty(user.LastName))
            {
                return "Enter valid Last Name";
            }
            if (string.IsNullOrEmpty(user.EmailId) || !IsValidEmail(user.EmailId))
            {
                return "Enter valid Email Id";
            }
            if (string.IsNullOrEmpty(user.Password))
            {
                return "Enter valid Password";
            }
            if (user.Password.Length < 8)
            {
                return "Enter password with minimum 8 characters";
            }
            return "";
        }
        private static bool IsValidEmail(string mail)
        {
            try
            {
                MailAddress email = new MailAddress(mail);
                return true;
            }
            catch (FormatException ex)
            {
                return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
