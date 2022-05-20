namespace OnlineLpk12.Data.Entities
{
    public class LessonProgress
    {
        public int StudentId { get; set; }
        public int LessonId { get; set; }
        public int LearningOutcome { get; set; }
        public int PageNumber { get; set; }
        public DateTime ActivityTime { get; set; }
    }
}
