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
        public SparcService(OnlineLpk12DbContext context, IHttpClientFactory httpClientFactory)
        {
            _context = context;
            _httpClientFactory = httpClientFactory;
        }

        public async Task<Result<SparcProgram>> GetProgram(int userId)
        {
            Result<SparcProgram> result = new Result<SparcProgram>();
            try
            {
                //var program = await _context.SparcPrograms.FirstOrDefaultAsync(x => x.UserId == userId);
                //if (program == null)
                //{
                //    result.Success = false;
                //    return result;
                //}
                //result.Success = true;
                //result.Content = new SparcProgram()
                //{
                //    Id = program.Id,
                //    UserId = program.UserId,
                //    Program = Encoding.Default.GetString(program.Program)
                //};
                return result;
            }
            catch
            {
                throw;
            }
        }

        public async Task<Result<SparcQuery>> GetQuery(int userId)
        {
            Result<SparcQuery> result = new Result<SparcQuery>();
            try
            {
                //var query = await _context.SparcQueries.FirstOrDefaultAsync(x => x.UserId == userId);
                //if (query == null)
                //{
                //    result.Success = false;
                //    return result;
                //}
                //result.Success = true;
                //result.Content = new SparcQuery()
                //{
                //    Id = query.Id,
                //    UserId = query.UserId,
                //    Query = Encoding.Default.GetString(query.Query)
                //};
                return result;
            }
            catch
            {
                throw;
            }
        }


        public async Task<Result<string>> ExecuteSparcRequest(Sparc sparcRequest)
        {
            var result = new Result<string>();
            try
            {
                var data = new Dictionary<string, string>();
                data.Add("action", sparcRequest.Action);
                if (sparcRequest.Action == "getFileContent")
                {
                    data.Add("fileurl", !string.IsNullOrEmpty(sparcRequest.FileUrl) ? sparcRequest.FileUrl : "");
                }
                else if (sparcRequest.Action == "getAnswerSets" || sparcRequest.Action == "getAnimation")
                {
                    data.Add("editor", !string.IsNullOrEmpty(sparcRequest.Editor) ? sparcRequest.Editor : "");

                }
                else if (sparcRequest.Action == "getQuery")
                {
                    data.Add("editor", !string.IsNullOrEmpty(sparcRequest.Editor) ? sparcRequest.Editor : "");
                    data.Add("query", !string.IsNullOrEmpty(sparcRequest.Query) ? sparcRequest.Query : "");
                }

                var httpClient = _httpClientFactory.CreateClient("Sparc");
                var response = await httpClient.PostAsync("", new FormUrlEncodedContent(data));
                if (response.IsSuccessStatusCode)
                {
                    result.Success = true;
                    result.Content = response.Content.ReadAsStringAsync().Result;
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
                throw;
            }
        }

        private async Task SaveSparcData(Sparc sparcRequest, string response)
        {
            try
            {

                var data = new Data.Models.Sparc()
                {
                    //LessonId = 1,
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
                throw;
            }
        }

    }
}
