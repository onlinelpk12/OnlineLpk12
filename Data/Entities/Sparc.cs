namespace OnlineLpk12.Data.Entities
{
    public class Sparc
    {
        public string Grade { get; set; }
        public int UserId { get; set; }
        public int LessonId { get; set; }
        public int LearningOutcome { get; set; }
        public string Action { get; set; }
        public string Editor { get; set; }
        public string Query { get; set; }
        public string FileUrl { get; set; }
        public bool IsGrading { get; set; }
    }
}
