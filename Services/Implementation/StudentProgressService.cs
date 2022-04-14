using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Helpers;

namespace OnlineLpk12.Services.Implementation
{
    public class StudentProgressService : IStudentProgressService
    {
        private readonly OnlineLpk12DbContext _context;
        private readonly IUserService _userService;

        public StudentProgressService(OnlineLpk12DbContext context, IUserService userService)
        {
            _context = context;
            this._userService = userService;
        }



        public async Task<List<Data.Entities.Progress>> GetStatus()
        {
            var data = new List<Data.Entities.Progress>();
            try
            {
                //return _context.Progresses.ToList();
                data.Add(new Data.Entities.Progress() { Id = 0, ProgressStatus = "Not Started" });
                data.Add(new Data.Entities.Progress() { Id = 1, ProgressStatus = "In Progress" });
                data.Add(new Data.Entities.Progress() { Id = 2, ProgressStatus = "Completed" });
            }
            catch (Exception ex)
            {
                throw;
            }
            return data;
        }

        public LessonAndQuizProgressResponse? GetLessonsAndQuizProgress(int userId)
        {
            var studentDetails = _context.Users.Find(userId);
            if(studentDetails == null)
            {
                return null;
            }
            var lesonDetails = _context.Lessons.ToList();


            var queryResult = (from users in _context.Users
                               join studentProgress in _context.StudentProgresses
                               on users.Id equals studentProgress.StudentId
                               join lesson in _context.Lessons
                               on studentProgress.LessonId equals lesson.LessonNumber
                               join lessonStatus in _context.LessonStatuses
                               on studentProgress.LessonStatusId equals lessonStatus.Id
                               join quizStatus in _context.QuizStatuses
                               on studentProgress.QuizStatusId equals quizStatus.Id
                               where users.Id == userId
                               select new
                               {
                                   lessonId = studentProgress.LessonId,
                                   lessonNumber = lesson.LessonNumber,
                                   lessonName = lesson.LessonName,
                                   lessonStatus = lessonStatus.Status,
                                   quizStatus = quizStatus.Status
                               });

            var lessonAndQuizReponse = new LessonAndQuizProgressResponse();
            lessonAndQuizReponse.StudentId = studentDetails.Id;
            lessonAndQuizReponse.Username = studentDetails.Username;
            lessonAndQuizReponse.FirstName = studentDetails.FirstName;
            lessonAndQuizReponse.LastName = studentDetails.LastName;

            var lessonQuizStatuses = new List<LessonAndQuizStatus>();

            foreach (var data in queryResult)
            {
                lessonQuizStatuses.Add(new LessonAndQuizStatus()
                {
                    LessonId = data.lessonId,
                    LessonName = data.lessonName,
                    LessonNumber = data.lessonNumber,
                    QuizStatus = string.IsNullOrWhiteSpace(data.quizStatus) ? "NOT TAKEN" : data.quizStatus
                });
            }

            var lessonsNotStarted = lesonDetails.Where(x => !lessonQuizStatuses.Any(y => y.LessonId == x.Id));
            foreach (var lesson in lessonsNotStarted)
            {
                lessonQuizStatuses.Add(new LessonAndQuizStatus()
                {
                    LessonId = lesson.Id,
                    LessonNumber = lesson.LessonNumber,
                    LessonName = lesson.LessonName,
                    QuizStatus = "NOT TAKEN"
                });
            }

            lessonQuizStatuses.OrderBy(x => x.LessonId);
            lessonAndQuizReponse.LessonAndQuizStatus = lessonQuizStatuses;

            return lessonAndQuizReponse;
        }

        public async Task<LessonDetails> GetContent(int lessonId)
        {
            var info = (from lessons in _context.Lessons
                        join content in _context.Contents
                        on lessons.Id equals content.LessonId
                        where lessons.Id == lessonId
                        select new { lessons.Id, lessons.LessonNumber, lessons.LessonName, content.ContentType, content.ContentUrl });

            var details = info.FirstOrDefault();
            if (details == null)
            {
                return null;
            }

            var lessonDetails = new LessonDetails()
            {
                LessonId = details.Id,
                LessonNumber = details.LessonNumber,
                LessonName = details.LessonName,
                ContentType = details.ContentType,
                ContentUrl = details.ContentUrl,
            };

            return lessonDetails;
        }

        public async Task<Data.Entities.Quiz> GetQuiz(int? lessonId, int? quizId, int? userId)
        {
            var quiz = new Data.Entities.Quiz();
            try
            {
                var data = await (from qz in _context.Quizzes
                                  join opt in _context.QuizOptions
                                  on qz.QuestionId equals opt.QuestionId
                                  where (lessonId != null && qz.LessonId == lessonId) || (quizId != null && qz.QuizId == quizId)
                                  select new
                                  {
                                      LessonId = qz.LessonId,
                                      QuizId = qz.Id,
                                      QuestionId = qz.QuestionId,
                                      QuestionDesc = qz.Question,
                                      Questionorder = qz.QuestionOrder,
                                      OptionId = opt.Id,
                                      OptionDesc = opt.OptionDesc
                                  }).ToListAsync();

                if (data.Any())
                {
                    quiz.LessonId = data.FirstOrDefault().LessonId;
                    quiz.LessonName = _context.Lessons.FirstOrDefault(x => x.Id == quiz.LessonId).LessonName;
                    quiz.QuizId = data.FirstOrDefault().QuizId;
                    quiz.Questions = new List<Question>();
                }
                foreach (var item in data)
                {
                    var isQuestionAdded = quiz.Questions.Any(x => x.Id == item.QuestionId);
                    if (!isQuestionAdded)
                    {
                        quiz.Questions.Add(new Question()
                        {
                            Id = item.QuestionId,
                            QuestionOrder = item.Questionorder,
                            QuestionDescription = item.QuestionDesc
                        });
                    }
                    var question = quiz.Questions.Where(x => x.Id == item.QuestionId).FirstOrDefault();
                    if (question != null)
                    {
                        question.Options.Add(new { OptionId = item.OptionId, OptionDescription = item.OptionDesc });
                    }
                }
                if (userId != null)
                {
                    var d = await _context.StudentProgresses.FirstOrDefaultAsync(x => x.LessonId == quiz.LessonId
                                                                        && x.QuizId == quiz.QuizId
                                                                        && x.StudentId == userId);
                    if (d != null)
                    {
                        quiz.StudentId = d.StudentId;
                        quiz.Status = Helper.GetQuizStatus(d.QuizStatusId);
                        quiz.Score = Convert.ToInt32(d.QuizScore);

                        var studentQuiz = await _context.StudentQuizzes.Where(x => x.LessonId == quiz.LessonId
                                                                          && x.QuizId == quiz.QuizId
                                                                          && x.StudentId == userId).ToListAsync();
                        foreach (var item in quiz.Questions)
                        {
                            var studentQuizRecord = studentQuiz.Where(k => k.QuestionId == item.Id).FirstOrDefault();
                            item.AnswerOption = studentQuizRecord.AnswerOptionId;
                            item.SelectedOption = studentQuizRecord.SelectedOptionId;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return quiz;
        }

        public async Task<Data.Entities.SubmitQuiz> SubmitQuiz(Data.Entities.SubmitQuiz quiz)
        {

            try
            {
                await GetQuizAnswers(quiz);
                await SaveQuizAnswers(quiz);
                quiz.Score = quiz.Questions.Count(x => x.SelectedOption == x.AnswerOption);
                quiz.Status = Helper.ComputeQuizStatus(quiz.Score, quiz.Questions.Count);
                await SaveQuizScore(quiz);
            }
            catch (Exception ex)
            {
                throw;
            }
            return quiz;
        }

        private async Task GetQuizAnswers(Data.Entities.SubmitQuiz quiz)
        {
            try
            {
                var data = await _context.Quizzes.Where(x => x.QuizId == quiz.QuizId).ToListAsync();
                quiz.Questions.ForEach(k => k.AnswerOption = data.Where(x => x.QuestionId == k.Id).FirstOrDefault().Answer);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private async Task SaveQuizAnswers(Data.Entities.SubmitQuiz quiz)
        {
            try
            {
                var data = await _context.StudentQuizzes.Where(x => x.StudentId == quiz.UserId
                                                                 && x.QuizId == quiz.QuizId).ToListAsync();
                foreach (var item in quiz.Questions)
                {
                    var record = data.FirstOrDefault(x => x.QuestionId == item.Id);
                    if (record != null)
                    {
                        record.SelectedOptionId = item.SelectedOption;
                    }
                    else
                    {
                        await _context.StudentQuizzes.AddAsync(new StudentQuiz()
                        {
                            LessonId = quiz.LessonId,
                            StudentId = quiz.UserId,
                            SelectedOptionId = item.SelectedOption,
                            QuestionId = item.Id,
                            QuizId = quiz.QuizId,
                            AnswerOptionId = item.AnswerOption
                        });
                    }

                }
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private async Task SaveQuizScore(Data.Entities.SubmitQuiz quiz)
        {
            try
            {
                var data = await _context.StudentProgresses.FirstOrDefaultAsync(x => x.StudentId == quiz.UserId
                                                                                  && x.QuizId == quiz.QuizId);
                if (data != null)
                {
                    data.QuizScore = quiz.Score;
                    data.QuizStatusId = Helper.GetQuizStatusId(quiz.Status);
                }
                else
                {
                    await _context.StudentProgresses.AddAsync(new StudentProgress()
                    {
                        LessonId = quiz.LessonId,
                        QuizId = quiz.QuizId,
                        LessonStatusId = 1,
                        QuizScore = quiz.Score,
                        QuizStatusId = Helper.GetQuizStatusId(quiz.Status),
                        StudentId = quiz.UserId
                    });
                }
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public async Task<bool> IsUserTeacher(int userId)
        {
            bool isTeacher = await _context.Users.AnyAsync(x => x.Id == userId && x.UserType == "TEACHER");
            return isTeacher;
        }
        public async Task<List<StudentDetails>> GetAllStudentDetails()
        {
            var students = await _context.Users.Where(x => x.UserType == "STUDENT").ToListAsync();
            var StudentDetails = new List<StudentDetails>();
            foreach(var student in students)
            {
                var newStudent = new StudentDetails()
                {
                    UserId = student.Id,
                    UserName = student.Username,
                    FirstName = student.FirstName,
                    LastName = student.LastName,
                };
                StudentDetails.Add(newStudent);
            }
            return StudentDetails;
        }
    }
}
