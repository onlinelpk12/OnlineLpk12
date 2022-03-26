namespace OnlineLpk12.Data.Entities
{
    public class Lessons
    {
        public int StudentId { get; set; }
        public int LessonId { get; set; }
        public string LessonNumber { get; set; }
        public string LessonName { get; set; }
        public string LessonProgressStatus { get; set; }
        public string QuizStatus { get; set; }
        public List<LessonContent> Contents { get; set; }
    }
}
