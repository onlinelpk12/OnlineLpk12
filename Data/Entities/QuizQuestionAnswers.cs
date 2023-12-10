
namespace OnlineLpk12.Data.Entities
{
	public class QuizQuestionAnswers
	{

        public int QuestionId { get; set; } // Foreign key to Question
        public string QuestionName { get; set; } = null!; // Assuming a non-nullable string
        public string AnswerText { get; set; } = null!; // Assuming a non-nullable string
        public bool CorrectOrIncorrect { get; set; }
        public DateTime Timestamp { get; set; }
        public int UserId { get; set; } // Foreign key to User
        public string UserRole { get; set; } = null!; // Assuming a non-nullable string
        public int Lesson { get; set; } 
        // Navigation properties
        public virtual User User { get; set; } = null!;
        public virtual Question Question { get; set; } = null!;
    }
}

