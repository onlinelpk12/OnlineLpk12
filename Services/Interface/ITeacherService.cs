using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface ITeacherService
    {
        Task<Result<List<Course>>> GetCourses(int userId);
        Task<Result<List<Student>>> GetStudentsForCourse(int userId, int courseId);
        Task<Result<List<SparcProgram>>> GetSparcList(int userId);
    }
}
