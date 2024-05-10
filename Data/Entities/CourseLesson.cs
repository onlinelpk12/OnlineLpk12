namespace OnlineLpk12.Data.Entities
{
    public class CourseLesson
    {
        public int Id { get; set; }
        public string LessonName { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool IsLessonAvailable { get; set; }
    }
}
