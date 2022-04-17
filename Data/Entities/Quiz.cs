namespace OnlineLpk12.Data.Entities
{
    public class Quiz
    {
        public int QuizId { get; set; }
        public int LessonId { get; set; }
        public string LessonName { get; set; }
        public int? UserId { get; set; }
        public bool IsTeacher { get; set; }
        public int? Score { get; set; }
        public string Status { get; set; }
        public List<Question> Questions { get; set; } 
    }
}
