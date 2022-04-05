using System.ComponentModel.DataAnnotations;

namespace OnlineLpk12.Data.Entities
{
    public class LoginUser
    {
        [Required(ErrorMessage = "Enter valid Username.")]
        public string UserName { get; set; }


        [Required(ErrorMessage = "Enter valid Password.")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
