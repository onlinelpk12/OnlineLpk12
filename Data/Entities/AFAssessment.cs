namespace OnlineLpk12.Data.Entities
{
	public class AFAssessment
	{
        public int CourseId { get; set; }
        public int LessonId { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public int CreatedBy { get; set; }
    }
}

