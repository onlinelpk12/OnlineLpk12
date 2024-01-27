using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OnlineLpk12.Data.Models
{
	public partial class QuizQuestionAnswer
	{
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int QuizQuestionAnswerId { get; set; } // Primary key
        public int QuestionId { get; set; } // Foreign key to Question
        public string QuestionName { get; set; } = null!; // Assuming a non-nullable string
        public string AnswerText { get; set; } = null!; // Assuming a non-nullable string
        public bool CorrectOrIncorrect { get; set; }
        public DateTime Timestamp { get; set; }
        public int UserId { get; set; } // Foreign key to User
        public string UserRole { get; set; } = null!; // Assuming a non-nullable string
        public int Lesson { get; set; }


    }
}

