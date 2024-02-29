using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.ComponentModel.DataAnnotations;

namespace OnlineLpk12.Data.Entities
{
    public class RegistrationUser
    {
        [Required(ErrorMessage = "Enter valid Username.")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Enter valid Email Address.")]
        [EmailAddress(ErrorMessage = "Email address format is invalid.")]
        public string EmailId { get; set; }

        [Required(ErrorMessage = "Enter valid First Name.")]
        public string FirstName { get; set; }

        [Required(ErrorMessage ="Enter valid Last Name.")]
        public string LastName { get; set; }


        [Required(ErrorMessage ="Enter valid Password.")]
        [DataType(DataType.Password)]
        [StringLength(100, ErrorMessage = "Enter password greater than 8 characters.", MinimumLength = 8)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Enter valid data.")]
        public bool IsStudent { get; set; }

        [Required(ErrorMessage = "Enter valid course")]
        public string? EnrolledCourses { get; set; }
    }
}
