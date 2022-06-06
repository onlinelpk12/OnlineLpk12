using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
//using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Data.Entities;
using System.Reflection;
using System.Diagnostics;
using System.Text;

namespace OnlineLpk12.Services.Implementation
{
    public class SparcFileSystemService : ISparcFileSystemService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly ILogService _logService;
        private readonly IUserService _userService;
        public SparcFileSystemService(OnlineLpk12DbContext context, ILogService logService, IUserService userService)
        {
            _context = context;
            _logService = logService;
            _userService = userService;
        }

        public async Task<Result<bool>> CheckFolderExistence(int userId, string username, string folderName, string parentUrl)
        {
            Result<bool> result = new();
            try
            {
                //set the folder url
                string folderUrl = Path.Combine(parentUrl, folderName);

                //check if the folder already exists in the table
                var folder = await (from foldr in _context.SparcFolders
                                    where foldr.Owner.ToLower() == username.ToLower() &&
                                    foldr.FolderUrl.ToLower() == folderUrl.ToLower()
                                    select foldr).FirstOrDefaultAsync();


                if (folder == null) //If no folder exists return true
                {
                    result.Success = true;
                    result.Content = true;
                }
                else  //If any folder exists return false
                {
                    result.Success = true;
                    result.Content = false;
                }
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Success = false;
                result.Content = false;
            }
            return result;
        }

        public async Task<Result<string>> CreateFolder(int userId, string username, string folderName, string parentUrl)
        {
            Result<string> result = new();
            try
            {
                //set the folder url
                string folderUrl = Path.Combine(parentUrl, folderName);

                //insert into folder table
                await _context.SparcFolders.AddAsync(new SparcFolder()
                {
                    FolderUrl = folderUrl,
                    FolderName = folderName,
                    DateCreated = DateTime.Now,
                    Owner = username,
                    ParentUrl = parentUrl
                });

                //insert into access table
                await _context.SparcFolderFileAccesses.AddAsync(new SparcFolderFileAccess()
                {
                    Owner = username,
                    FolderUrl = folderUrl,
                    HasAccess = 1
                });

                //save changes
                await _context.SaveChangesAsync();

                result.Success = true;
                result.Content = "Created a folder successfully!";
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Success = false;
                result.Content = "Error occurred while creating folder!";
            }
            return result;
        }

        public async Task<Result<string>> DeleteFolder(int userId, string username, string folderName, string parentUrl)
        {
            Result<string> result = new();
            try
            {
                //set the folder url
                string folderUrl = Path.Combine(parentUrl, folderName);

                //Sparc Folders
                //Get all the folders and sub folders from sparc folders table
                var spFolders = await (from fl in _context.SparcFolders
                                       where fl.Owner.ToLower() == username.ToLower() &&
                                       !string.IsNullOrWhiteSpace(fl.ParentUrl) &&
                                       fl.FolderUrl.ToLower().Contains(folderUrl.ToLower())
                                       select fl).ToListAsync();
                if (spFolders != null && spFolders.Any())
                    _context.SparcFolders.RemoveRange(spFolders);

                //Sparc Folder Contains
                //Get all the files present in the current and sub folders from sparc folder contains table and delete
                var spContains = await (from fc in _context.SparcFolderContains
                                        where fc.Owner.ToLower() == username.ToLower() &&
                                        fc.FolderUrl.ToLower().Contains(folderUrl.ToLower())
                                        select fc).ToListAsync();
                if (spContains != null && spContains.Any())
                    _context.SparcFolderContains.RemoveRange(spContains);

                //Sparc Files
                //Get all teh files from Sparc Files table and delete
                var spFiles = await (from sfl in _context.SparcFiles
                                     where sfl.Owner.ToLower() == username.ToLower() &&
                                     sfl.FileUrl.ToLower().Contains(folderUrl.ToLower())
                                     select sfl).ToListAsync();
                if (spFiles != null && spFiles.Any())
                    _context.SparcFiles.RemoveRange(spFiles);

                //Sparc Folder File Access
                //Get all the folders, sub folders and files from sparc folder file access table
                var spAccess = await (from fa in _context.SparcFolderFileAccesses
                                      where fa.Owner.ToLower() == username.ToLower() &&
                                      fa.FolderUrl.ToLower().Contains(folderUrl.ToLower()) &&
                                      fa.HasAccess == 1
                                      select fa).ToListAsync();
                if (spAccess != null && spAccess.Any())
                    _context.SparcFolderFileAccesses.RemoveRange(spAccess);

                //Sparc Content
                //Get all the files of the given folder and sub folders from sparc content table and delete
                var spContents = await (from spc in _context.SparcContents
                                        where spc.Owner.ToLower() == username.ToLower() &&
                                        spc.FileUrl.Contains(folderUrl.ToLower())
                                        select spc).ToListAsync();
                if (spContents != null && spContents.Any())
                    _context.SparcContents.RemoveRange(spContents);

                //save changes
                await _context.SaveChangesAsync();

                result.Success = true;
                result.Content = "Deleted folder successfully!";
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Success = false;
                result.Content = "Error occurred while deleting folder!";
            }
            return result;
        }

        public async Task<Result<bool>> IsFileExists(int userId, string username, string fileName, string folderUrl)
        {
            Result<bool> result = new();
            try
            {
                //set the file url
                string fileUrl = Path.Combine(folderUrl, fileName);

                //check if the file already exists in the table
                var file = await (from fl in _context.SparcFiles
                                  where fl.Owner.ToLower() == username.ToLower() &&
                                  fl.FileUrl.ToLower() == fileUrl.ToLower()
                                  select fl).FirstOrDefaultAsync();

                if (file != null) //If file exists return true
                {
                    result.Success = true;
                    result.Content = true;
                }
                else  //If no file exists return false
                {
                    result.Success = true;
                    result.Content = false;
                }
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Success = false;
                result.Content = false;
            }
            return result;
        }

        public async Task<Result<string>> CreateFile(int userId, string username, string fileName, string folderUrl)
        {
            Result<string> result = new();
            try
            {
                //set the file url
                string fileUrl = Path.Combine(folderUrl, fileName);

                //insert into file table
                await _context.SparcFiles.AddAsync(new SparcFile()
                {
                    FileUrl = fileUrl,
                    FileName = fileName,
                    DateCreated = DateTime.Now,
                    Owner = username
                });

                //insert into folder contains table
                await _context.SparcFolderContains.AddAsync(new SparcFolderContain()
                {
                    Owner = username,
                    FolderUrl = folderUrl,
                    FileUrl = fileUrl
                });

                //insert into access table
                await _context.SparcFolderFileAccesses.AddAsync(new SparcFolderFileAccess()
                {
                    Owner = username,
                    FolderUrl = folderUrl,
                    FileUrl = fileUrl,
                    HasAccess = 1
                });

                //insert into content table
                await _context.SparcContents.AddAsync(new Data.Models.SparcContent()
                {
                    Owner = username,
                    FileUrl = fileUrl,
                    Program = Encoding.Default.GetBytes(string.Empty),
                    DateModified = DateTime.Now
                });

                //save changes
                await _context.SaveChangesAsync();

                result.Success = true;
                result.Content = "Created a file successfully!";
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Success = false;
                result.Content = "Error occurred while creating a file!";
            }
            return result;
        }

        public async Task<Result<string>> DeleteFile(int userId, string username, string fileName, string folderUrl)
        {
            Result<string> result = new();
            try
            {
                //set the file url
                string fileUrl = Path.Combine(folderUrl, fileName);

                //Get the record from sparc files table and delete
                var spFile = await (from fl in _context.SparcFiles
                                    where fl.Owner.ToLower() == username.ToLower() &&
                                    fl.FileUrl.ToLower() == fileUrl.ToLower()
                                    select fl).FirstOrDefaultAsync();
                if (spFile != null)
                {
                    _context.SparcFiles.Remove(spFile);
                }

                //Get the record from sparc folder contains table and delete
                var spContains = await (from fc in _context.SparcFolderContains
                                        where fc.Owner.ToLower() == username.ToLower() &&
                                        fc.FileUrl.ToLower() == fileUrl.ToLower()
                                        select fc).FirstOrDefaultAsync();
                if (spContains != null)
                {
                    _context.SparcFolderContains.Remove(spContains);
                }

                //Get the record from sparc folder file access table and delete
                var spAccess = await (from fa in _context.SparcFolderFileAccesses
                                      where fa.Owner.ToLower() == username.ToLower() &&
                                      fa.FileUrl.ToLower() == fileUrl.ToLower() &&
                                      fa.HasAccess == 1
                                      select fa).FirstOrDefaultAsync();
                if (spAccess != null)
                {
                    _context.SparcFolderFileAccesses.Remove(spAccess);
                }

                //Get the record from sparc content table and delete
                var spContent = await (from fc in _context.SparcContents
                                       where fc.Owner.ToLower() == username.ToLower() &&
                                       fc.FileUrl.ToLower() == fileUrl.ToLower()
                                       select fc).FirstOrDefaultAsync();
                if (spContent != null)
                {
                    _context.SparcContents.Remove(spContent);
                }

                //save changes
                await _context.SaveChangesAsync();

                result.Success = true;
                result.Content = "Deleted file successfully!";
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Success = false;
                result.Content = "Error occurred while deleting file!";
            }
            return result;
        }

        public Task GetFolderContains(int userId, string folderName, string parentUrl)
        {
            throw new NotImplementedException();
        }

        public async Task<Result<string>> SaveFileContent(int userId, string username, string fileName, string folderUrl, string program)
        {
            Result<string> result = new();
            try
            {
                //set the file url
                string fileUrl = Path.Combine(folderUrl, fileName);

                //Get the file record from the Sparc Content table
                var spContent = await (from sp in _context.SparcContents
                                       where sp.Owner.ToLower() == username.ToLower() &&
                                       sp.FileUrl.ToLower() == fileUrl.ToLower()
                                       select sp).FirstOrDefaultAsync();

                if (spContent != null)
                {
                    spContent.DateModified = DateTime.Now;
                    spContent.Program = Encoding.Default.GetBytes(program);

                    //save changes
                    await _context.SaveChangesAsync();

                    result.Success = true;
                    result.Content = "saved file content successfully!";
                }
                else
                {
                    result.Success = false;
                    result.Content = "Error occurred while saving file content!";
                }
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Success = false;
                result.Content = "Error occurred while saving file content!";
            }
            return result;
        }

        public async Task<Result<Data.Entities.SparcContent>> GetFileContent(int userId, string username, string fileName, string folderUrl)
        {
            Result<Data.Entities.SparcContent> result = new()
            {
                Success = false,
                Content = new Data.Entities.SparcContent()
            };

            try
            {
                //set the file url
                string fileUrl = Path.Combine(folderUrl, fileName);

                //Get the file record from the Sparc Content table
                var spContent = await (from sp in _context.SparcContents
                                       where sp.Owner.ToLower() == username.ToLower() &&
                                       sp.FileUrl.ToLower() == fileUrl.ToLower()
                                       select sp).FirstOrDefaultAsync();

                if (spContent != null)
                {
                    var data = new Data.Entities.SparcContent()
                    {
                        FileName = fileName,
                        FolderUrl = folderUrl,
                        DateTime = spContent.DateModified.ToString("MM/dd/yyyy hh:mm:ss tt"),
                        Program = Encoding.Default.GetString(spContent.Program)
                    };
                    result.Success = true;
                    result.Content = data;
                    return result;
                }
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
            }
            return result;
        }

        public async Task<Result<string>> GetAllFoldersFilesAccessible(int userId, string username)
        {
            Result<string> result = new();

            try
            {
                //Get the file record from the Sparc Content table
                var foldersFiles = await (from sp in _context.SparcFolderFileAccesses
                                          where sp.Owner.ToLower() == username.ToLower()
                                          select sp).ToListAsync();

                if (foldersFiles != null && foldersFiles.Any())
                {
                    //TO-DO: Create the tree structure here
                    result.Success = true;
                    result.Content = "Folder Structure";
                    return result;
                }
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Content = "Error occurred while fetching the accessible folders and files";
                return result;
            }
            result.Content = "No accessible files and folder present for the user";
            return result;
        }

    }
}
