using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface ISparcFileSystemService
    {
        Task<Result<bool>> CheckFolderExistence(int userId, string folderName, string parentUrl);
        Task CreateFolder(int userId, string folderName, string parentUrl);
        Task CreateFile(int userId, string fileName, string folderUrl);
    }
}
