using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
//using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Data.Entities;

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

        public async Task<Result<bool>> CheckFolderExistence(int userId, string folderName, string parentUrl)
        {
            Result<bool> result = new();
            try
            {
                //Get the user name
                string userName = await _userService.GetUserNameByUserId(userId);
                //return if user name does not exists for the user id (Invalid user case)
                if (userName == null)
                {
                    result.Success = false;
                    result.Message = "Invalid User";
                    return result;
                }

                //set the folder url
                string folderUrl = Path.Combine(parentUrl, folderName);

                //check if the folder already exists in the table
                var folder = await (from foldr in _context.SparcFolders
                                    where foldr.Owner.ToLower() == userName.ToLower() &&
                                    foldr.FolderUrl.ToLower() == folderUrl.ToLower()
                                    select foldr).FirstOrDefaultAsync();
                
                //If no folder exists return true
                if (folder == null)
                {
                    result.Success = true;
                    result.Content = true;
                    return result;
                }

                //If any folder exists return false
                result.Success = true;
                result.Content = false;
                return result;
            }
            catch (Exception ex)
            {
                await _logService.LogError(userId, "CheckFolderExistence", "SparcFileSystemService", ex.Message, ex);
                throw;
            }
        }


        public async Task CreateFolder(int userId, string folderName, string parentUrl)
        {
            try
            {
                //get the username for the given user id
                var user = await (from usr in _context.Users
                                  where usr.Id == userId
                                  select usr).FirstOrDefaultAsync();

                //if the user is null / there is no username -> return 
                string username = user != null && !string.IsNullOrEmpty(user.Username) ? user.Username : "";
                if (string.IsNullOrEmpty(username))
                {
                    return;
                }

                ////set the folder url
                string folderUrl = Path.Combine(parentUrl, folderName);

                ////check if the folder already exists in the table
                //var folder = await (from foldr in _context.SparcFolders
                //                    where foldr.Owner.ToLower() == username.ToLower() &&
                //                    foldr.FolderUrl.ToLower() == folderUrl.ToLower()
                //                    select foldr).FirstOrDefaultAsync();

                ////if fold already exists -> return
                //if (folder != null)
                //{
                //    return;
                //}

                //If folder does not exists
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
                    Username = username,
                    FolderUrl = folderUrl,
                    HasAccess = 1
                });

                //save changes
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                await _logService.LogError(userId, "CreateFolder", "SparcFileSystemService", ex.Message, ex);
                throw;
            }
        }

        public async Task CreateFile(int userId, string fileName, string folderUrl)
        {
            try
            {
                //get the username for the given user id
                var user = await (from usr in _context.Users
                                  where usr.Id == userId
                                  select usr).FirstOrDefaultAsync();

                //if the user is null / there is no username -> return 
                string username = user != null && !string.IsNullOrEmpty(user.Username) ? user.Username : "";
                if (string.IsNullOrEmpty(username))
                {
                    return;
                }

                //set the file url
                string fileUrl = Path.Combine(folderUrl, fileName);

                //check if the file already exists in the table
                var _file = await (from file in _context.SparcFiles
                                   where file.Owner.ToLower() == username.ToLower() &&
                                   file.FileUrl.ToLower() == fileUrl.ToLower()
                                   select file).FirstOrDefaultAsync();

                //if file already exists -> return
                if (_file != null)
                {
                    return;
                }

                //If folder does not exists
                //insert into folder table
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
                    FolderUrl = folderUrl,
                    FileUrl = fileUrl
                });

                //insert into access table
                await _context.SparcFolderFileAccesses.AddAsync(new SparcFolderFileAccess()
                {
                    Username = username,
                    FolderUrl = folderUrl,
                    FileUrl = fileUrl,
                    HasAccess = 1
                });

                //save changes
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                await _logService.LogError(userId, "CreateFile", "SparcFileSystemService", ex.Message, ex);
                throw;
            }
        }



    }
}
