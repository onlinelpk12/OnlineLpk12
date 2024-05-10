namespace OnlineLpk12.Data.Models
{
    public class LessonSlide
    {
        public int Id { get; set; }
        public string SlideHtmlFormat { get; set; }
        public string SlideMarkdownFormat { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedAt { get; set; }
    }
}
