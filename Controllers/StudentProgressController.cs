using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLpk12.Data.Context;

namespace OnlineLpk12.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentProgressController : ControllerBase
    {
        //private readonly OnlineLPK12Context context;

        //public StudentProgressController(OnlineLPK12Context context)
        //{
        //    this.context = context;
        //}

        [HttpGet]
        public IActionResult GetStatuses()
        {
            var data = new List<Data.Models.Progress>()
            {
                new Data.Models.Progress(){ Id = 0, Status = "Not Started"},
                new Data.Models.Progress(){ Id = 1, Status = "In Progress"},
                new Data.Models.Progress(){ Id = 2, Status = "Completed"}
            };
            
            return Ok(data);

            //return Ok(context.Progresses.ToArray());
        }
    }
}
