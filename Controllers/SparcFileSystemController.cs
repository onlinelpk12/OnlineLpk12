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

        //[HttpGet]
        //public async Task<IActionResult> CreateFile(int userId, string fileName, string folderUrl)
        //{
        //    Response<List<Student>> response = new();
        //    List<string> validationMessages = new();
        //    try
        //    {
        //        if (userId < 1)
        //        {
        //            //response.Message = "One or more validation errors occurred.";
        //            //response.Errors.Add("Enter valid User Id.");
        //            //return BadRequest(response);
        //            validationMessages.Add("Enter valid User Id.");
        //        }
        //        if (!string.IsNullOrEmpty(fileName))
        //        {
        //            validationMessages.Add("Enter valid file name");
        //        }
        //        if (!string.IsNullOrEmpty(folderUrl))
        //        {
        //            validationMessages.Add
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        _logService.LogError(userId, MethodBase.GetCurrentMethod().Name, _fileName, ex.Message, ex);
        //        response.Message = "One or more validation errors occurred.";
        //        response.Errors.Add("Error occurred while fetching the data.");
        //        return StatusCode((int)HttpStatusCode.InternalServerError, response);
        //    }
        //}
    }
}
