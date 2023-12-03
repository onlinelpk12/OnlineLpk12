namespace OnlineLpk12.Data.Entities
{
    public class Assessment
    {
        public int StudentId { get; set; }
        public int LessonId { get; set; }
        public int LearningOutcome { get; set; }
        public List<QuestionAnswer> QuestionAnswers { get; set; }
    }
}
