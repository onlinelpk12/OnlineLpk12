using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Data.Entities
{
    public class CoursesLessonSlide
    {
        public int Id { get; set; }
        public int CourseId { get; set; }
        public int LessonId { get; set; }
        public int SlideId { get; set; }


        // Navigation properties
        public Course Course { get; set; }
        public CourseLesson CourseLesson { get; set; }
        public LessonSlide LessonSlide { get; set; }
    }
}
