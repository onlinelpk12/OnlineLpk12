using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Data.Context;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Services.Interface;
using System.Net.Http.Headers;
using System.Text;
using System.Reflection;
using System.Diagnostics;

namespace OnlineLpk12.Services.Implementation
{
    public class SparcService : ISparcService
    {
        private readonly OnlineLpk12DbContext _context;
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

        /// <summary>
        /// Execute the sparc request
        /// </summary>
        /// <param name="sparcRequest"></param>
        /// <returns></returns>
        public async Task<Result<string>> ExecuteSparcRequest(Sparc sparcRequest)
        {
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
                _logService.LogError(sparcRequest.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }

        /// <summary>
        /// Save sparc request
        /// </summary>
        /// <param name="sparcRequest"></param>
        /// <returns></returns>
        public async Task<Result<string>> SaveSparcProgram(Sparc sparcRequest)
        {
            var result = new Result<string>();
            try
            {
                await SaveSparcData(sparcRequest, "");
                result.Success = true;
                result.Message = "Saved successfully";
            }
            catch (Exception ex)
            {
                _logService.LogError(sparcRequest.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Success = false;
                result.Message = "Save failed.";
            }
            return result;
        }

        /// <summary>
        /// Save sparc data
        /// </summary>
        /// <param name="sparcRequest"></param>
        /// <param name="response"></param>
        /// <returns></returns>
        private async Task SaveSparcData(Sparc sparcRequest, string response)
        {
            try
            {
                var d = await (from sp in _context.Sparcs
                               where sp.LessonId == sparcRequest.LessonId &&
                               sp.LearningOutcome == sparcRequest.LearningOutcome &&
                               sp.UserId == sparcRequest.UserId
                               select sp).FirstOrDefaultAsync();

                if (d != null)
                {
                    d.Program = Encoding.Default.GetBytes(sparcRequest.Editor);
                    d.ActivityTimeStamp = DateTime.Now;
                    d.IsGrading = sparcRequest.IsGrading ? (sbyte)1 : (sbyte)0;
                    if (!string.IsNullOrEmpty(response))
                    {
                        d.Query = sparcRequest.Query;
                        d.Results = Encoding.Default.GetBytes(sparcRequest.Action == "getQuery" ? response : "");
                    }
                }
                else
                {
                    var data = new Data.Models.Sparc()
                    {
                        LessonId = sparcRequest.LessonId,
                        LearningOutcome = sparcRequest.LearningOutcome,
                        UserId = sparcRequest.UserId,
                        Program = Encoding.Default.GetBytes(sparcRequest.Editor),
                        Query = sparcRequest.Query,
                        Results = Encoding.Default.GetBytes(sparcRequest.Action == "getQuery" ? response : ""),
                        ActivityTimeStamp = DateTime.Now,
                        IsGrading = sparcRequest.IsGrading ? (sbyte)1 : (sbyte)0
                    };
                    await _context.Sparcs.AddAsync(data);
                }

                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                await _logService.LogError(sparcRequest.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }

        /// <summary>
        /// Get Sparc programs by user id
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="lessonId"></param>
        /// <returns></returns>
        public async Task<Result<List<SparcProgram>>> GetSparcProgramsByUserId(int userId, int lessonId)
        {
            var result = new Result<List<SparcProgram>>();
            try
            {
                if (lessonId > 0)
                {
                    result.Content = (from sp in _context.Sparcs
                                      where sp.UserId == userId && sp.LessonId == lessonId
                                      select new SparcProgram()
                                      {
                                          LessonId = sp.LessonId ?? 0,
                                          LearningOutcome = sp.LearningOutcome ?? 0,
                                          Program = Encoding.Default.GetString(sp.Program),
                                          UserId = userId
                                      }).ToList();
                }
                else
                {
                    result.Content = (from sp in _context.Sparcs
                                      where sp.UserId == userId
                                      select new SparcProgram()
                                      {
                                          LessonId = sp.LessonId ?? 0,
                                          LearningOutcome = sp.LearningOutcome ?? 0,
                                          Program = Encoding.Default.GetString(sp.Program),
                                          UserId = userId
                                      }).ToList();
                }
                return result;
            }
            catch (Exception ex)
            {
                await _logService.LogError(userId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                throw;
            }
        }

        /// <summary>
        /// Submit sparc grade
        /// </summary>
        /// <param name="sparcRequest"></param>
        /// <returns></returns>
        public async Task<Result<string>> SubmitSparcGrade(Sparc sparcRequest)
        {
            var result = new Result<string>();
            try
            {
                var mostRecentTimestamp = _context.Sparcs.Where(sp => sp.UserId == sparcRequest.UserId &&
                 sp.LearningOutcome == sparcRequest.LearningOutcome &&
                 sp.LessonId == sparcRequest.LessonId).Max(sp => sp.ActivityTimeStamp);

                var sparc = (from sp in _context.Sparcs
                             where sp.UserId == sparcRequest.UserId &&
                                   sp.LearningOutcome == sparcRequest.LearningOutcome &&
                                   sp.LessonId == sparcRequest.LessonId &&
                                   sp.ActivityTimeStamp == mostRecentTimestamp
                             select sp).FirstOrDefault();

                dynamic sparc_id = sparc?.Id;

                //If the record already present in sparc grade table then it will be update the grade
                var datafromdb = await (from gr in _context.SparcGrades
                                        where gr.StudentId == sparcRequest.UserId &&
                                        gr.LessonId == sparcRequest.LessonId &&
                                        gr.LearningOutcome == sparcRequest.LearningOutcome
                                        select gr).FirstOrDefaultAsync();
                if (datafromdb == null)
                {
                    var data = new Data.Models.SparcGrade()
                    {
                        LessonId = sparcRequest.LessonId,
                        LearningOutcome = sparcRequest.LearningOutcome,
                        StudentId = sparcRequest.UserId,
                        Grade = sparcRequest.Grade,
                        ActivityTimeStamp = DateTime.Now,
                        SparcId = Convert.ToInt32(sparc_id)
                    };
                    await _context.SparcGrades.AddAsync(data);
                }
                else
                {
                    datafromdb.Grade = sparcRequest.Grade;
                }
                await _context.SaveChangesAsync();

                result.Success = true;
                result.Message = "Grade submitted successfully";
            }
            catch (Exception ex)
            {
                _logService.LogError(sparcRequest.UserId, MethodBase.GetCurrentMethod().Name,
                    Process.GetCurrentProcess().MainModule.FileName, ex.Message, ex);
                result.Success = false;
                result.Message = "Grade submission failed.";
            }
            return result;
        }

    }
}
