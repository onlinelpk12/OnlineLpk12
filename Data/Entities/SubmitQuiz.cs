namespace OnlineLpk12.Data.Entities
{
    public class SubmitQuiz
    {
        public int QuizId { get; set; }
        public int LessonId { get; set; }
        public int StudentId { get; set; }
        public int Score { get; set; }
        public QuizStatus Status { get; set; }
        public List<SubmitQuestion> Questions { get; set; }
    }
}
