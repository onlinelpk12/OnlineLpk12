using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface ISparcService
    {
        public Task<Result<Object>> GetProgram(int userId);

        public Task<Result<string>> ExecuteSparcRequest(Sparc sparcRequest);
    }
}
