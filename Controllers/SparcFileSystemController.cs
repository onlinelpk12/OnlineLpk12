using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net;
using System.Reflection;
using System.Diagnostics;
using OnlineLpk12.Helpers;

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

        [HttpPost("createrootfolder")]
        public async Task<IActionResult> CreateRootFolder([FromBody] SparcInput sparc)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                if(sparc == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid input.");
                    return BadRequest(response);
                }

                //Validate the user input
                if (sparc.UserId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(sparc.UserId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the root folder exists in Database
                var isFolderExists = await _fileSystemService.IsFolderExists(sparc.UserId, username, username, String.Empty);
                if (isFolderExists == null || !isFolderExists.Success || isFolderExists.Content)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Root folder already exists");
                    return Ok(response);
                }

                //If no folder exists -> create a new folder
                var res = await _fileSystemService.CreateFolder(sparc.UserId, username, username, String.Empty);
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
                _logService.LogError(sparc.UserId, MethodBase.GetCurrentMethod().Name,
                    System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("isFolderExists")]
        public async Task<IActionResult> CheckFolderExistence([FromBody] SparcInput sparc)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = string.Empty;
            try
            {
                if (sparc == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid input.");
                    return BadRequest(response);
                }

                //Validate the user input
                if (sparc.UserId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(sparc.UserId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(sparc.FolderUrl))
                    validationMessages.Add("Enter valid folder");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                sparc.FolderUrl = sparc.FolderUrl.ToLower().TrimEnd(new char[] { ' ', '/', '\\' });
                sparc.FolderName = SparcFileSystemHelper.GetFolderNameFromFolderUrl(sparc.FolderUrl);
                sparc.ParentUrl = SparcFileSystemHelper.GetParentUrlFromFolderUrl(sparc.FolderUrl);

                //Check if the folder exists in Database
                var isFolderExists = await _fileSystemService.IsFolderExists(sparc.UserId, username, sparc.FolderName, sparc.ParentUrl);
                if (isFolderExists == null || !isFolderExists.Success) //|| isFolderExists.Content)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Error occurred while processing the request.");
                    return Ok(response);
                }

                response.Message = isFolderExists.Content ? "Folder exists." : "Folder does not exists.";
                response.Content = isFolderExists.Content.ToString();
                return Ok(response);

            }
            catch (Exception ex)
            {
                _logService.LogError(sparc.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("createfolder")]
        public async Task<IActionResult> CreateFolder([FromBody] SparcInput sparc)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                if (sparc == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid input.");
                    return BadRequest(response);
                }

                //Validate the user input
                if (sparc.UserId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(sparc.UserId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(sparc.FolderName))
                    validationMessages.Add("Enter valid folder name");

                if (string.IsNullOrEmpty(sparc.ParentUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the folder exists in Database
                var isFolderExists = await _fileSystemService.IsFolderExists(sparc.UserId, username, sparc.FolderName.ToLower(), sparc.ParentUrl.ToLower());
                if (isFolderExists == null || !isFolderExists.Success || isFolderExists.Content)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("A folder exists already with same name");
                    return Ok(response);
                }

                //If no folder exists -> create a new folder
                var res = await _fileSystemService.CreateFolder(sparc.UserId, username, sparc.FolderName.ToLower(), sparc.ParentUrl.ToLower());
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
                _logService.LogError(sparc.UserId, MethodBase.GetCurrentMethod().Name,
                    System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }


        [HttpPost("isfileExists")]
        public async Task<IActionResult> CheckFileExistence([FromBody] SparcInput sparc)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                if (sparc == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid input.");
                    return BadRequest(response);
                }

                //Validate the user input
                if (sparc.UserId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(sparc.UserId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(sparc.FileUrl))
                    validationMessages.Add("Enter valid file url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }


                sparc.FileUrl = sparc.FileUrl.ToLower().TrimEnd(new char[] { ' ', '/', '\\' });
                sparc.FileName = SparcFileSystemHelper.GetFileNameFromFileUrl(sparc.FileUrl);
                sparc.FolderUrl = SparcFileSystemHelper.GetFolderUrlFromFileUrl(sparc.FileUrl);

                //Check if the file exists in Database
                var isFileExists = await _fileSystemService.IsFileExists(sparc.UserId, username, sparc.FileName.ToLower(), sparc.FolderUrl.ToLower());

                if (isFileExists == null || !isFileExists.Success)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Error occurred while processing the request.");
                    return Ok(response);
                }

                response.Message = isFileExists.Content ? "File exists." : "File does not exists";
                response.Content = isFileExists.Content.ToString();
                return Ok(response);
            }
            catch (Exception ex)
            {
                _logService.LogError(sparc.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("createfile")]
        public async Task<IActionResult> CreateFile([FromBody] SparcInput sparc)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                if (sparc == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid input.");
                    return BadRequest(response);
                }

                //Validate the user input
                if (sparc.UserId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(sparc.UserId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(sparc.FileName))
                    validationMessages.Add("Enter valid file name");

                if (string.IsNullOrEmpty(sparc.FolderUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the file exists in Database
                var isFileExists = await _fileSystemService.IsFileExists(sparc.UserId, username, sparc.FileName.ToLower(), sparc.FolderUrl.ToLower());
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
                var res = await _fileSystemService.CreateFile(sparc.UserId, username, sparc.FileName.ToLower(), sparc.FolderUrl.ToLower());
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
                _logService.LogError(sparc.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("deletefolder")]
        public async Task<IActionResult> DeleteFolder([FromBody] SparcInput sparc)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                if (sparc == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid input.");
                    return BadRequest(response);
                }

                //Validate the user input
                if (sparc.UserId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(sparc.UserId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(sparc.FolderName))
                    validationMessages.Add("Enter valid folder name");

                if (string.IsNullOrEmpty(sparc.ParentUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the folder exists in Database
                var isFileExists = await _fileSystemService.IsFolderExists(sparc.UserId, username, sparc.FolderName.ToLower(), sparc.ParentUrl.ToLower());
                if (isFileExists == null || !isFileExists.Success || !isFileExists.Content)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Folder not found to delete");
                    return NotFound(response);
                }

                //If file exists -> delete the file
                var res = await _fileSystemService.DeleteFolder(sparc.UserId, username, sparc.FolderName.ToLower(), sparc.ParentUrl.ToLower());
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
                _logService.LogError(sparc.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpPost("deletefile")]
        public async Task<IActionResult> DeleteFile([FromBody] SparcInput sparc)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                if (sparc == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid input.");
                    return BadRequest(response);
                }

                //Validate the user input
                if (sparc.UserId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(sparc.UserId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(sparc.FileName))
                    validationMessages.Add("Enter valid file name");

                if (string.IsNullOrEmpty(sparc.FolderUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the file exists in Database
                var isFileExists = await _fileSystemService.IsFileExists(sparc.UserId, username, sparc.FileName.ToLower(), sparc.FolderUrl.ToLower());
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
                var res = await _fileSystemService.DeleteFile(sparc.UserId, username, sparc.FileName.ToLower(), sparc.FolderUrl.ToLower());
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
                _logService.LogError(sparc.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }


        [HttpPost("savefile")]
        public async Task<IActionResult> SaveFileContent([FromBody] SparcInput sparc)
        {
            Response<string> response = new();
            List<string> validationMessages = new();
            string username = "";
            try
            {
                if (sparc == null)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Invalid input.");
                    return BadRequest(response);
                }

                //Validate the user input
                if (sparc.UserId < 1)
                {
                    validationMessages.Add("Enter valid User Id.");
                }
                else
                {
                    username = await _userService.GetUserNameByUserId(sparc.UserId);
                    if (string.IsNullOrEmpty(username))
                        validationMessages.Add("User is invalid.");
                }

                if (string.IsNullOrEmpty(sparc.FileName))
                    validationMessages.Add("Enter valid file name");

                if (string.IsNullOrEmpty(sparc.FolderUrl))
                    validationMessages.Add("Enter valid folder url");

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the file exists in Database
                var isFileExists = await _fileSystemService.IsFileExists(sparc.UserId, username, sparc.FileName.ToLower(), sparc.FolderUrl.ToLower());
                if (isFileExists == null || !isFileExists.Success)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("Error occurred while processing the request.");
                    return Ok(response);
                }

                //If File not exists create a new file
                if (!isFileExists.Content)
                {
                    var isFileCreated = await _fileSystemService.CreateFile(sparc.UserId, username, sparc.FileName.ToLower(), sparc.FolderUrl.ToLower());
                    if (isFileCreated == null || !isFileCreated.Success)
                    {
                        response.Message = "One or more validation errors occurred.";
                        response.Errors.Add("Failed saving content!");
                        return Ok(response);
                    }
                }

                var res = await _fileSystemService.SaveFileContent(sparc.UserId, username, sparc.FileName.ToLower(), sparc.FolderUrl.ToLower(), sparc.Program);
                if (res.Success)
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
                _logService.LogError(sparc.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }

        [HttpGet("getfile")]
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

                var result = await _fileSystemService.GetFileContent(userId, username, fileName.ToLower(), folderUrl.ToLower());
                if (result != null && result.Success)
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

        [HttpGet("getallfoldersfiles")]
        public async Task<IActionResult> GetAllFoldersFilesAccessible(int userId)
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

                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                var result = await _fileSystemService.GetAllFoldersFilesAccessible(userId, username);
                if (result.Success)
                {
                    response.Content = result.Content;
                    return Ok(response);
                }
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add(result.Content);
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
