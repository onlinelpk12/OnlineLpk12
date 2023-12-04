namespace OnlineLpk12.Data.Entities
{
    public class LessonAndQuizProgressResponse
    {
        public int StudentId { get; set; }
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public List<LessonAndQuizStatus> LessonAndQuizStatus { get; set; }
    }
}
