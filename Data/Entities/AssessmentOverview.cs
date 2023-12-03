namespace OnlineLpk12.Data.Entities
{
    public class AssessmentOverview
    {
        public int AssessmentId { get; set; }
        public int LessonId { get; set; }
        public int StudentId { get; set; }
        public int LearningOutcome { get; set; }
        public string Status { get; set; }
        public int Score { get; set; }
        public int TotalScore { get; set; }
    }
}
