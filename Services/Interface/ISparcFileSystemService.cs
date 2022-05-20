namespace OnlineLpk12.Services.Interface
{
    public interface ISparcFileSystemService
    {
        Task CreateFolder(int userId, string folderName, string parentUrl);
        Task CreateFile(int userId, string fileName, string folderUrl);
    }
}
