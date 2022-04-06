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

        public static List<string> ValidateUserWhileRegistering(RegistrationUser user)
        {
            List<string> errors = new List<string>();
            if (user == null)
            {
                errors.Add("Enter valid user details");
                return errors;
            }
            if (string.IsNullOrEmpty(user.FirstName))
            {
                errors.Add("Enter valid First Name");
            }
            if (string.IsNullOrEmpty(user.LastName))
            {
                errors.Add("Enter valid Last Name");
            }
            if (string.IsNullOrEmpty(user.EmailId) || !IsValidEmail(user.EmailId))
            {
                errors.Add("Enter valid Email Id");
            }
            if (string.IsNullOrEmpty(user.UserName))
            {
                errors.Add("Enter valid Username");
            }
            if (string.IsNullOrEmpty(user.Password))
            {
                errors.Add("Enter valid Password");
            }
            if (!string.IsNullOrEmpty(user.Password) && user.Password.Length < 8)
            {
                errors.Add("Enter password with minimum 8 characters");
            }
            return errors;
        }

        public static List<string> ValidateUserWhileLogin(LoginUser user)
        {
            List<string> errors = new List<string>();
            if (user == null)
            {
                errors.Add("Enter valid user details.");
                return errors;
            }
            
            if (string.IsNullOrEmpty(user.UserName))
            {
                errors.Add("Username should not be empty.");
            }
            if (string.IsNullOrEmpty(user.Password))
            {
                errors.Add("Password should not be empty.");
            }
            return errors;
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
