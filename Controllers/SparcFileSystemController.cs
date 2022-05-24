using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net;
using System.Reflection;

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

        [HttpGet]
        public async Task<IActionResult> CreateFile(int userId, string fileName, string parentUrl)
        {
            Response<List<Student>> response = new();
            List<string> validationMessages = new();
            try
            {
                //Validate the user input
                if (userId < 1)
                    validationMessages.Add("Enter valid User Id.");

                if (!string.IsNullOrEmpty(fileName))
                    validationMessages.Add("Enter valid file name");
                
                if (!string.IsNullOrEmpty(parentUrl))
                    validationMessages.Add("Enter valid folder url");
                
                if (validationMessages.Any())
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.AddRange(validationMessages);
                    return BadRequest(response);
                }

                //Check if the folder exists in Database
                var isFolderExists = await _fileSystemService.CheckFolderExistence(userId, fileName, parentUrl);
                if(isFolderExists == null || !isFolderExists.Success || !isFolderExists.Content)
                {
                    response.Message = "One or more validation errors occurred.";
                    response.Errors.Add("A folder exists already with same name");
                    return Ok(response);
                }
                return Ok();
                //Insert folder into database
            }
            catch (Exception ex)
            {
                _logService.LogError(userId, MethodBase.GetCurrentMethod().Name, _fileName, ex.Message, ex);
                response.Message = "One or more validation errors occurred.";
                response.Errors.Add("Error occurred while fetching the data.");
                return StatusCode((int)HttpStatusCode.InternalServerError, response);
            }
        }
    }
}
