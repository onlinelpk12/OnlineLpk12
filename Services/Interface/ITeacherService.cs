using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface ITeacherService
    {
        Task<Result<List<Course>>> GetCourses(int userId);
    }
}
