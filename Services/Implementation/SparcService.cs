using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net.Http.Headers;
using System.Text;

namespace OnlineLpk12.Services.Implementation
{
    public class SparcService : ISparcService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly HttpClient client = new HttpClient();
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly ILogService _logService;

        public SparcService(OnlineLpk12DbContext context, IHttpClientFactory httpClientFactory, ILogService logService)
        {
            _context = context;
            _httpClientFactory = httpClientFactory;
            _logService = logService;
        }

        //public async Task<Result<SparcProgram>> GetProgram(int userId)
        //{
        //    Result<SparcProgram> result = new Result<SparcProgram>();
        //    try
        //    {
        //        //var program = await _context.SparcPrograms.FirstOrDefaultAsync(x => x.UserId == userId);
        //        //if (program == null)
        //        //{
        //        //    result.Success = false;
        //        //    return result;
        //        //}
        //        //result.Success = true;
        //        //result.Content = new SparcProgram()
        //        //{
        //        //    Id = program.Id,
        //        //    UserId = program.UserId,
        //        //    Program = Encoding.Default.GetString(program.Program)
        //        //};
        //        return result;
        //    }
        //    catch
        //    {
        //        throw;
        //    }
        //}

        //public async Task<Result<SparcQuery>> GetQuery(int userId)
        //{
        //    Result<SparcQuery> result = new Result<SparcQuery>();
        //    try
        //    {
        //        //var query = await _context.SparcQueries.FirstOrDefaultAsync(x => x.UserId == userId);
        //        //if (query == null)
        //        //{
        //        //    result.Success = false;
        //        //    return result;
        //        //}
        //        //result.Success = true;
        //        //result.Content = new SparcQuery()
        //        //{
        //        //    Id = query.Id,
        //        //    UserId = query.UserId,
        //        //    Query = Encoding.Default.GetString(query.Query)
        //        //};
        //        return result;
        //    }
        //    catch
        //    {
        //        throw;
        //    }
        //}


        public async Task<Result<string>> ExecuteSparcRequest(Sparc sparcRequest)
        {
            //Log to database
            _logService.LogInfo(sparcRequest.UserId, "ExecuteSparcRequest", "SparcService", "Execution of ExecuteSparcRequest method started");

            var result = new Result<string>();
            try
            {
                //Create a dictionary to store the request params
                var data = new Dictionary<string, string>
                {
                    { "action", sparcRequest.Action }
                };
                //Add file url if the request is getFileContent
                if (sparcRequest.Action == "getFileContent")
                {
                    data.Add("fileurl", !string.IsNullOrEmpty(sparcRequest.FileUrl) ? sparcRequest.FileUrl : "");
                }
                //Add editor in case of getAnswerSets / getAnimation
                else if (sparcRequest.Action == "getAnswerSets" || sparcRequest.Action == "getAnimation")
                {
                    data.Add("editor", !string.IsNullOrEmpty(sparcRequest.Editor) ? sparcRequest.Editor : "");

                }
                //Add both editor and query to request incase of getQuery
                else if (sparcRequest.Action == "getQuery")
                {
                    data.Add("editor", !string.IsNullOrEmpty(sparcRequest.Editor) ? sparcRequest.Editor : "");
                    data.Add("query", !string.IsNullOrEmpty(sparcRequest.Query) ? sparcRequest.Query : "");
                }

                //Create Http Client and post 
                var httpClient = _httpClientFactory.CreateClient("Sparc");
                var response = await httpClient.PostAsync("", new FormUrlEncodedContent(data));
                //If response is success
                if (response.IsSuccessStatusCode)
                {
                    //Set result to true and add the content
                    result.Success = true;
                    result.Content = response.Content.ReadAsStringAsync().Result;
                    //In case of getQuery / getAnswerSets / getAnimation
                    if (sparcRequest.Action == "getQuery" || sparcRequest.Action == "getAnswerSets" || sparcRequest.Action == "getAnimation")
                    {
                        await SaveSparcData(sparcRequest, result.Content);
                    }
                }
                else
                    result.Success = false;

                return result;
            }
            catch (Exception ex)
            {
                _logService.LogError(sparcRequest.UserId, "ExecuteSparcRequest", "SparcService", ex.Message, ex);
                throw;
            }
            finally
            {
                _logService.LogInfo(sparcRequest.UserId, "ExecuteSparcRequest", "SparcService", "Execution of ExecuteSparcRequest method ended");
            }
        }


        public async Task<Result<string>> SaveSparcProgram(Sparc sparcRequest)
        {
            _logService.LogInfo(sparcRequest.UserId, "SaveSparcProgram", "SparcService", "Execution of SaveSparcProgram method started");

            var result = new Result<string>();
            try
            {
                await SaveSparcData(sparcRequest, "");
                result.Success = true;
                result.Message = "Saved successfully";
            }
            catch (Exception ex)
            {
                _logService.LogError(sparcRequest.UserId, "SaveSparcProgram", "SparcService", ex.Message, ex);
                result.Success = false;
                result.Message = "Save failed.";
            }
            finally
            {
                _logService.LogInfo(sparcRequest.UserId, "SaveSparcProgram", "SparcService", "Execution of SaveSparcProgram method ended");
            }
            return result;
        }

        private async Task SaveSparcData(Sparc sparcRequest, string response)
        {
            try
            {
                var data = new Data.Models.Sparc()
                {
                    LessonId = sparcRequest.LessonId,
                    LearningOutcome = sparcRequest.LearningOutcome,
                    //ProgrammingTaskId = 1,
                    //QuizId = 1,
                    UserId = sparcRequest.UserId,
                    Program = Encoding.Default.GetBytes(sparcRequest.Editor),
                    Query = sparcRequest.Query,
                    Results = Encoding.Default.GetBytes(sparcRequest.Action == "getQuery" ? response : ""),
                    ActivityTimeStamp = DateTime.Now
                };
                await _context.Sparcs.AddAsync(data);
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                await _logService.LogError(sparcRequest.UserId, "SaveSparcData", "SparcService", ex.Message, ex);
                throw;
            }
        }



    }
}
