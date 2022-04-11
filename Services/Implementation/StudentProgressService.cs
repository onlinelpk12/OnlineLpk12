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
        public StudentProgressService(OnlineLpk12DbContext context)
        {
            _context = context;
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

        public async Task<List<Lessons>> GetLessons(int studentId)
        {
            var lessons = new List<Lessons>();
            try
            {
                lessons.Add(new Lessons()
                {
                    StudentId = studentId,
                    LessonId = 1,
                    LessonNumber = "1",
                    LessonName = "Lesson One",
                    LessonProgressStatus = "Completed",
                    QuizStatus = "Completed"
                });
                lessons.Add(new Lessons()
                {
                    StudentId = studentId,
                    LessonId = 2,
                    LessonNumber = "2",
                    LessonName = "Lesson Two",
                    LessonProgressStatus = "In Progress",
                    QuizStatus = "In Progress"
                });
                lessons.Add(new Lessons()
                {
                    StudentId = studentId,
                    LessonId = 3,
                    LessonNumber = "3",
                    LessonName = "Lesson Three",
                    LessonProgressStatus = "Not Started",
                    QuizStatus = "Not Started"
                });
            }
            catch (Exception ex)
            {
                throw;
            }
            return lessons;
        }

        public async Task<Lessons> GetContent(int lessonId)
        {
            var lesson = new Lessons()
            {
                LessonId = lessonId,
                LessonName = "Lesson One",
                LessonNumber = "1",
                Contents = new List<LessonContent>()
            };
            try
            {
                lesson.Contents.Add(new LessonContent()
                {
                    ContentId = 1,
                    ContentType = "Powerpoint",
                    ContentUrl = "Url"
                });
                lesson.Contents.Add(new LessonContent()
                {
                    ContentId = 2,
                    ContentType = "Video",
                    ContentUrl = "Url"
                });
            }
            catch (Exception ex)
            {
                throw;
            }
            return lesson;
        }

        public async Task<Data.Entities.Quiz> GetQuiz(int? lessonId, int? quizId, int? studentId)
        {
            var quiz = new Data.Entities.Quiz();
            try
            {
                var data = await (from qz in _context.Quizzes
                                  join opt in _context.QuizOptions
                                  on qz.QuestionId equals opt.QuestionId
                                  where (lessonId != null && qz.LessonId == lessonId) ||(quizId != null && qz.QuizId == quizId)
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
                    quiz.LessonId = data.First().LessonId;
                    quiz.QuizId = data.First().QuizId;
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
                    var question = quiz.Questions.Where(x => x.Id == item.QuestionId).First();
                    if (question != null)
                    {
                        question.Options.Add(item.OptionId, item.OptionDesc);
                    }
                }
                if(studentId != null)
                {
                    var d = _context.StudentProgresses.FirstOrDefault(x => x.LessonId == quiz.LessonId
                                                                        && x.QuizId == quiz.QuizId
                                                                        && x.StudentId == studentId);
                    if (d != null)
                    {
                        quiz.StudentId = d.StudentId;
                        quiz.Status = Helper.GetQuizStatus(d.QuizStatusId);
                        quiz.Score = Convert.ToInt32(d.QuizScore);

                        var studentQuiz = _context.StudentQuizzes.Where(x => x.LessonId == quiz.LessonId
                                                                          && x.QuizId == quiz.QuizId
                                                                          && x.StudentId == studentId).ToList();
                        foreach (var item in quiz.Questions)
                        {
                            var studentQuizRecord = studentQuiz.Where(k => k.QuestionId == item.Id).First();
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
                var data = await _context.Quizzes.Where(x => x.LessonId == quiz.LessonId && x.QuizId == quiz.QuizId).ToListAsync();
                quiz.Questions.ForEach(k => k.AnswerOption = data.Where(x => x.QuestionId == k.Id).First().Answer);
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
                var data = await _context.StudentQuizzes.Where(x => x.StudentId == quiz.StudentId
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
                            StudentId = quiz.StudentId,
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
                var data = await _context.StudentProgresses.FirstOrDefaultAsync(x => x.StudentId == quiz.StudentId
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
                        StudentId = quiz.StudentId
                    });
                }
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}
