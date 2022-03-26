using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Implementation
{
    public class StudentProgressService : IStudentProgressService
    {
        private readonly OnlineLpk12DbContext  _context;
        public StudentProgressService(OnlineLpk12DbContext context)
        {
            _context = context;
        }
        public async Task<List<Progress>> GetStatus()
        {
            var data = new List<Progress>();
            try
            {
                return _context.Progresses.ToList();
                //data.Add(new Progress() { Id = 0, ProgressStatus = "Not Started" });
                //data.Add(new Progress() { Id = 1, ProgressStatus = "In Progress" });
                //data.Add(new Progress() { Id = 2, ProgressStatus = "Completed" });
            }
            catch (Exception ex)
            {
                throw;
            }
            return data;
        }

        public async Task<List<Lessons>> GetLessons(int studentId)
        {
            var lessons = new List<Lessons>();
            try
            {
                lessons.Add(new Lessons()
                {
                    StudentId = studentId,
                    LessonId = 1,
                    LessonNumber = "1",
                    LessonName = "Lesson One",
                    LessonProgressStatus = "Completed",
                    QuizStatus = "Completed"
                });
                lessons.Add(new Lessons()
                {
                    StudentId = studentId,
                    LessonId = 2,
                    LessonNumber = "2",
                    LessonName = "Lesson Two",
                    LessonProgressStatus = "In Progress",
                    QuizStatus = "In Progress"
                });
                lessons.Add(new Lessons()
                {
                    StudentId = studentId,
                    LessonId = 3,
                    LessonNumber = "3",
                    LessonName = "Lesson Three",
                    LessonProgressStatus = "Not Started",
                    QuizStatus = "Not Started"
                });
            }
            catch (Exception ex)
            {
                throw;
            }
            return lessons;
        }

        public async Task<Lessons> GetContent(int lessonId)
        {
            var lesson = new Lessons()
            {
                LessonId = lessonId,
                LessonName = "Lesson One",
                LessonNumber = "1",
                Contents = new List<LessonContent>()
            };
            try
            {
                lesson.Contents.Add(new LessonContent()
                {
                    ContentId = 1,
                    ContentType = "Powerpoint",
                    ContentUrl = "Url"
                });
                lesson.Contents.Add(new LessonContent()
                {
                    ContentId = 2,
                    ContentType = "Video",
                    ContentUrl = "Url"
                });
            }
            catch (Exception ex)
            {
                throw;
            }
            return lesson;
        }
    }
}
