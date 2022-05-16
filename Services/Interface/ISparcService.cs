using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface ISparcService
    {
        //public Task<Result<SparcProgram>> GetProgram(int userId);
        //public Task<Result<SparcQuery>> GetQuery(int userId);
        public Task<Result<string>> ExecuteSparcRequest(Sparc sparcRequest);
        public Task<Result<string>> SaveSparcProgram(Sparc sparcRequest);
        public Task<Result<List<SparcProgram>>> GetSparcProgramsByUserId(int userId, int lessonId);
    }
}
