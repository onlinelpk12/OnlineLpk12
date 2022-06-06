using OnlineLpk12.Data.Entities;

namespace OnlineLpk12.Services.Interface
{
    public interface ISparcFileSystemService
    {
        Task<Result<bool>> CheckFolderExistence(int userId, string username, string folderName, string parentUrl);
        Task<Result<string>> CreateFolder(int userId, string username, string folderName, string parentUrl);
        Task<Result<string>> DeleteFolder(int userId, string username, string folderName, string parentUrl);

        Task<Result<bool>> IsFileExists(int userId, string username, string fileName, string folderUrl);
        Task<Result<string>> CreateFile(int userId, string username, string fileName, string folderUrl);
        Task<Result<string>> DeleteFile(int userId, string username, string fileName, string folderUrl);

        Task<Result<string>> GetAllFoldersFilesAccessible(int userId, string username);
        Task GetFolderContains(int userId, string folderName, string parentUrl);
        Task<Result<string>> SaveFileContent(int userId, string username, string fileName, string folderUrl, string program);
        Task<Result<SparcContent>> GetFileContent(int userId, string username, string fileName, string folderUrl);

    }
}
