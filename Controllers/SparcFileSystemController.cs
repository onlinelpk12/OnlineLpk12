using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net;
using System.Reflection;
using System.Diagnostics;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SparcFileSystemController : ControllerBase
    {
        private readonly ISparcFileSystemService _fileSystemService;
        private readonly IUserService _userService;
        private readonly ILogService _logService;
        private readonly string _fileName;

        public SparcFileSystemController(ISparcFileSystemService fileSystemService, IUserService userService, ILogService logService)
        {
            _fileSystemService = fileSystemService;
            _userService = userService;
            _logService = logService;
            _fileName = System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName;
        }

        [HttpPost]
        public async Task<IActionResult> CreateFolder(int userId, string folderName, string parentUrl)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                //Validate the user input
                if (userId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(userId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(folderName))
                    validationMessages.Add("Enter valid folder name");

                if (string.IsNullOrEmpty(parentUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the folder exists in Database
                var isFolderExists = await _fileSystemService.CheckFolderExistence(userId, username, folderName, parentUrl);
                if (isFolderExists == null || !isFolderExists.Success || !isFolderExists.Content)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("A folder exists already with same name");
                    return Ok(response);
                }

                //If no folder exists -> create a new folder
                var res = await _fileSystemService.CreateFolder(userId, username, folderName, parentUrl);
                if (res != null && res.Success && !string.IsNullOrEmpty(res.Content))
                {
                    response.Content = res.Content;
                }
                else
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add(response.Content);
                }
                return Ok(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreateFile(int userId, string fileName, string folderUrl)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                //Validate the user input
                if (userId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(userId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(fileName))
                    validationMessages.Add("Enter valid file name");

                if (string.IsNullOrEmpty(folderUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the file exists in Database
                var isFileExists = await _fileSystemService.IsFileExists(userId, username, fileName, folderUrl);
                if (isFileExists == null || !isFileExists.Success)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Error occurred while processing the request.");
                    return Ok(response);
                }

                if (isFileExists.Content)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("A file exists already with same name.");
                    return Ok(response);
                }

                //If no file exists -> create a new file
                var res = await _fileSystemService.CreateFile(userId, username, fileName, folderUrl);
                if (res != null && res.Success && !string.IsNullOrEmpty(res.Content))
                {
                    response.Content = res.Content;
                }
                else
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add(response.Content);
                }
                return Ok(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost]
        public async Task<IActionResult> DeleteFolder(int userId, string folderName, string parentUrl)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                //Validate the user input
                if (userId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(userId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(folderName))
                    validationMessages.Add("Enter valid folder name");

                if (string.IsNullOrEmpty(parentUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the folder exists in Database
                var isFileExists = await _fileSystemService.CheckFolderExistence(userId, username, folderName, parentUrl);
                if (isFileExists == null || !isFileExists.Success || isFileExists.Content)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Folder not found to delete");
                    return NotFound(response);
                }

                //If file exists -> delete the file
                var res = await _fileSystemService.DeleteFolder(userId, username, folderName, parentUrl);
                if (res != null && res.Success && !string.IsNullOrEmpty(res.Content))
                {
                    response.Content = res.Content;
                }
                else
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add(response.Content);
                }
                return Ok(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost]
        public async Task<IActionResult> DeleteFile(int userId, string fileName, string folderUrl)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                //Validate the user input
                if (userId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(userId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(fileName))
                    validationMessages.Add("Enter valid file name");

                if (string.IsNullOrEmpty(folderUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the file exists in Database
                var isFileExists = await _fileSystemService.IsFileExists(userId, username, fileName, folderUrl);
                if (isFileExists == null || !isFileExists.Success)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Error occurred while processing the request.");
                    return Ok(response);
                }

                if (!isFileExists.Content)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("File not found to delete");
                    return NotFound(response);
                }

                //If file exists -> delete the file
                var res = await _fileSystemService.DeleteFile(userId, username, fileName, folderUrl);
                if (res != null && res.Success && !string.IsNullOrEmpty(res.Content))
                {
                    response.Content = res.Content;
                }
                else
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add(response.Content);
                }
                return Ok(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost]
        public async Task<IActionResult> SaveFileContent(int userId, string fileName, string folderUrl, string program)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                //Validate the user input
                if (userId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(userId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(fileName))
                    validationMessages.Add("Enter valid file name");

                if (string.IsNullOrEmpty(folderUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the file exists in Database
                var isFileExists = await _fileSystemService.IsFileExists(userId, username, fileName, folderUrl);
                if (isFileExists == null || !isFileExists.Success)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Error occurred while processing the request.");
                    return Ok(response);
                }

                //If File not exists create a new file
                if (!isFileExists.Content)
                {
                    var isFileCreated = await _fileSystemService.CreateFile(userId, username, fileName, folderUrl);
                    if (isFileCreated == null || !isFileCreated.Success)
                    {
                        response.Message = "One or more validation errors occurred.";
                        response.Errors.Add("Failed saving content!");
                        return Ok(response);
                    }
                }

                var res = await _fileSystemService.SaveFileContent(userId, username, fileName, folderUrl, program);
                if(res.Success)
                {
                    response.Content = res.Content;
                }
                else
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add(res.Content);
                }
                return Ok(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost]
        public async Task<IActionResult> GetFileContent(int userId, string fileName, string folderUrl, string program)
        {
            Response<SparcContent> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                //Validate the user input
                if (userId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(userId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(fileName))
                    validationMessages.Add("Enter valid file name");

                if (string.IsNullOrEmpty(folderUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                var result = await _fileSystemService.GetFileContent(userId, username, fileName, folderUrl);
                if(result != null && result.Success)
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("No sparc program found.");
                return NotFound(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}
