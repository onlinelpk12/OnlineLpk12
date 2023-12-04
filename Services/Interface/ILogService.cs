namespace OnlineLpk12.Services.Interface
{
    public interface ILogService
    {
        Task LogError(int userId, string methodName, string fileName, string message, Exception exception);
        Task LogInfo(int userId, string methodName, string fileName, string message);
    }
}
