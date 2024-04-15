using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface ICourseService
    {
        Task<Result<List<Course>>> GetCourses(int userId);
        Task<Result<string>> CreateCourse(Course course);
        Task<Result<List<Course>>> GetCoursesById(int userId);
       

    }
}
