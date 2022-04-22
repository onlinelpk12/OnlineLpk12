using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net.Http.Headers;

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

        public async Task<Result<Object>> GetProgram(int userId)
        {
            Result<object> result = new Result<object>();
            try
            {
                var program = _context.SparcPrograms.FirstOrDefault(x => x.UserId == userId);
                if (program == null)
                {
                    result.Success = false;
                    return result;
                }
                result.Success = true;
                result.Content = new
                {
                    Id = program.Id,
                    UserId = program.UserId,
                    Program = program.Program.ToString()
                };
                result.Content = program;
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
                data.Add("editor", !string.IsNullOrEmpty(sparcRequest.Editor) ? sparcRequest.Editor : "");
                if (sparcRequest.Action == "getQuery")
                {
                    data.Add("query", !string.IsNullOrEmpty(sparcRequest.Query) ? sparcRequest.Query : "");
                }
                var httpClient = _httpClientFactory.CreateClient("Sparc");
                var response = await httpClient.PostAsync("", new FormUrlEncodedContent(data));
                if (response.IsSuccessStatusCode)
                {
                    result.Success = true;
                    result.Content = response.Content.ReadAsStringAsync().Result;
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
        
    }
}
