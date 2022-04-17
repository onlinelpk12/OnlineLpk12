using OnlineLpk12.Data.Context;
using OnlineLpk12.Services.Interface;
using OnlineLpk12.Data.Models;
using OnlineLpk12.Data.Entities;
using OnlineLpk12.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using OnlineLpk12.Helpers;
using Microsoft.AspNetCore.Mvc;

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

        /// <summary>
        /// Update lesson status for the given user and lesson
        /// </summary>
        /// <param name="lessonId">lesson id</param>
        /// <param name="userId">user id</param>
        /// <returns></returns>
        public async Task UpdateLessonStatus(int lessonId, int userId)
        {
            try
            {
                var data = await _context.StudentProgresses.FirstOrDefaultAsync(x => x.LessonId == lessonId 
                                                                                  && x.StudentId == userId);
                if (data == null)
                {
                    await _context.StudentProgresses.AddAsync(new StudentProgress()
                    {
                        LessonId = lessonId,
                        QuizId = lessonId,
                        LessonStatusId = (int)Data.Entities.LessonStatus.InProgress,
                        StudentId = userId,
                        QuizStatusId = (int)Data.Entities.QuizStatus.NotStarted
                    });
                }
                else
                {
                    data.LessonStatusId = (int)Data.Entities.LessonStatus.InProgress;
                }
                //Save changes
                await _context.SaveChangesAsync();
            }
            catch
            {
                throw;
            }
        }

        public async Task<LessonAndQuizProgressResponse?> GetLessonsAndQuizProgress(int userId)
        {
            var studentDetails = await _context.Users.FindAsync(userId);
            if (studentDetails == null)
            {
                return null;
            }
            var lesonDetails = await _context.Lessons.ToListAsync();


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

            var lessonAndQuizReponse = new LessonAndQuizProgressResponse
            {
                StudentId = studentDetails.Id,
                Username = studentDetails.Username,
                FirstName = studentDetails.FirstName,
                LastName = studentDetails.LastName
            };

            var lessonQuizStatuses = new List<LessonAndQuizStatus>();

            foreach (var data in queryResult)
            {
                lessonQuizStatuses.Add(new LessonAndQuizStatus()
                {
                    LessonId = data.lessonId,
                    LessonName = data.lessonName,
                    LessonNumber = data.lessonNumber,
                    LessonStatus = string.IsNullOrWhiteSpace(data.lessonStatus) ? "Not Started" : data.lessonStatus,
                    QuizStatus = string.IsNullOrWhiteSpace(data.quizStatus) ? "Not Started" : data.quizStatus
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
                    LessonStatus = "Not Started",
                    QuizStatus = "Not Started"
                }) ;
            }
            lessonAndQuizReponse.LessonAndQuizStatus =  lessonQuizStatuses.OrderBy(x => x.LessonNumber).ToList();
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

        /// <summary>
        /// Get Quiz Id by Lesson Id
        /// Get quiz with matching lesson id and return quiz id if exists
        /// </summary>
        /// <param name="lessonId">Lesson Id</param>
        /// <returns>Quiz Id</returns>
        public async Task<int> GetQuizIdByLessonId(int lessonId)
        {
            var quiz = await _context.Quizzes.FirstOrDefaultAsync(x => x.LessonId == lessonId);
            if (quiz != null)
            {
                return quiz.QuizId;
            }
            return 0;
        }

        /// <summary>
        /// Is Valid User Id
        /// Check if the user is present and return user status. Return concerned error message if not present
        /// </summary>
        /// <param name="userId">user id</param>
        /// <returns>user type or error message</returns>
        public async Task<Result<Data.Entities.User>> IsValidUser(int userId)
        {
            Result<Data.Entities.User> result = new();
            if (userId == 0)
            {
                result.Success = false;
                result.Message = "Invalid User Id.";
                return result;
            }
            var user = await _context.Users.FirstOrDefaultAsync(x => x.Id == userId);
            if (user == null)
            {
                result.Success = false;
                result.Message = "Invalid User Id.";
                return result;
            }
            if (user.IsActive == 0)
            {
                result.Success = false;
                result.Message = "User is Inactive.";
                return result;
            }
            result.Success = true;
            result.Message = "User is valid.";
            result.Content = new Data.Entities.User()
            {
                UserId = userId,
                UserType = user.UserType
            };
            return result;
        }

        /// <summary>
        /// Is Valid User Id
        /// Check if the user is present and return user status. Return concerned error message if not present
        /// </summary>
        /// <param name="userId">user id</param>
        /// <returns>user type or error message</returns>
        public async Task<Result<EmptyResult>> IsValidLesson(int lessonId)
        {
            Result<EmptyResult> result = new();
            if (lessonId == 0)
            {
                result.Success = false;
                result.Message = "Invalid Lesson.";
                return result;
            }
            bool isValidLesson = await _context.Lessons.AnyAsync(x => x.Id == lessonId);
            if (isValidLesson)
            {
                result.Success = isValidLesson;
            }
            result.Success = isValidLesson;
            result.Message = "Invalid Lesson.";
            return result;
        }

        /// <summary>
        /// Get Quiz for Student
        /// Get Questions and options if student id is not passed.
        /// Get Questions, options, selected option, score and quiz status if student id passed
        /// </summary>
        /// <param name="quizId">quiz id</param>
        /// <param name="userId">user id</param>
        /// <returns>quiz</returns>
        public async Task<Result<Data.Entities.Quiz>> GetQuizForStudent(int quizId, int? userId)
        {
            Result<Data.Entities.Quiz> result = new Result<Data.Entities.Quiz>();
            var quiz = new Data.Entities.Quiz();
            try
            {
                //Get quiz questions and options by quiz id
                quiz = await GetQuizQuestionsAndOptions(quizId);

                //If questions are not present, return not found.
                if (!quiz.Questions.Any())
                {
                    result.Success = false;
                    result.Message = "Quiz not found for the given lesson.";
                    return result;
                }

                //If there are questions, check if user id is passed and get the student's details
                if (quiz.Questions.Any() && userId != null)
                {
                    var d = await _context.StudentProgresses.FirstOrDefaultAsync(x => x.QuizId == quiz.QuizId
                                                                                   && x.StudentId == userId);
                    if (d != null)
                    {
                        quiz.UserId = d.StudentId;
                        quiz.IsTeacher = false;
                        quiz.Status = Helper.GetQuizStatus(d.QuizStatusId);
                        quiz.Score = Convert.ToInt32(d.QuizScore);
                        quiz.QuizScore = Helper.ComputeQuizScore(Convert.ToInt32(quiz.Score), quiz.Questions.Count);

                        if (quiz.Status == Data.Entities.QuizStatus.Pass)    //Show selected answers only when the quiz status is pass.
                        {
                            var studentQuiz = await _context.StudentQuizzes.Where(x => x.QuizId == quiz.QuizId
                                                                                    && x.StudentId == userId).ToListAsync();
                            foreach (var item in quiz.Questions)
                            {
                                var studentQuizRecord = studentQuiz.Where(k => k.QuestionId == item.Id).FirstOrDefault();
                                if (studentQuizRecord != null)
                                {
                                    item.AnswerOption = studentQuizRecord.AnswerOptionId;
                                    item.SelectedOption = studentQuizRecord.SelectedOptionId;
                                }
                            }
                        }
                    }
                    else
                    {
                        quiz.UserId = userId;
                        quiz.IsTeacher= false;
                        quiz.Status = Data.Entities.QuizStatus.NotStarted;
                        quiz.Score = 0;
                        quiz.QuizScore= 0;
                    }
                }
                result.Success = true;
                result.Content = quiz;
            }
            catch
            {
                throw;
            }
            return result;
        }

        /// <summary>
        /// Get quiz for teacher
        /// Get quiz questions, options, correct answer
        /// </summary>
        /// <param name="quizId">quiz id</param>
        /// <param name="userId">user id</param>
        /// <returns>quiz</returns>
        public async Task<Result<Data.Entities.Quiz>> GetQuizForTeacher(int quizId, int? userId)
        {
            Result<Data.Entities.Quiz> result = new();
            try
            {
                var quiz = await GetQuizQuestionsAndOptions(quizId);
                //If questions are not present, return not found.
                if (!quiz.Questions.Any())
                {
                    result.Success = false;
                    result.Message = "Quiz not found for the given lesson.";
                    return result;
                }

                if (quiz.Questions != null && quiz.Questions.Any())
                {
                    await SetQuizAnswers(quiz);
                }
                quiz.UserId=userId;
                quiz.IsTeacher = true;
                result.Success=true;
                result.Content = quiz;
                return result;
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Get quiz questions and options by quiz id
        /// </summary>
        /// <param name="quizId">quiz id</param>
        /// <returns>quiz</returns>
        private async Task<Data.Entities.Quiz> GetQuizQuestionsAndOptions(int quizId)
        {
            var quiz = new Data.Entities.Quiz();
            try
            {
                var data = await (from qz in _context.Quizzes
                                  join opt in _context.QuizOptions
                                  on qz.QuestionId equals opt.QuestionId
                                  where qz.QuizId == quizId
                                  select new
                                  {
                                      LessonId = qz.LessonId,
                                      QuizId = qz.QuizId,
                                      QuestionId = qz.QuestionId,
                                      QuestionDesc = qz.Question,
                                      Questionorder = qz.QuestionOrder,
                                      OptionId = opt.OptionNumber,
                                      OptionDesc = opt.OptionDesc
                                  }).ToListAsync();

                if (data != null && data.Any())
                {
                    //set lesson id, lesson name, quiz id
                    quiz.LessonId = data.FirstOrDefault().LessonId;
                    quiz.LessonName = _context.Lessons.FirstOrDefault(x => x.Id == quiz.LessonId).LessonName;
                    quiz.QuizId = data.FirstOrDefault().QuizId;
                    quiz.Questions = new List<Question>();

                    foreach (var item in data)
                    {
                        //Add questions
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
                        //Add options
                        var question = quiz.Questions.Where(x => x.Id == item.QuestionId).FirstOrDefault();
                        if (question != null)
                        {
                            question.Options.Add(new Option { OptionId = item.OptionId, OptionDescription = item.OptionDesc });
                        }
                    }
                }
            }
            catch
            {
                throw;
            }
            return quiz;
        }

        /// <summary>
        /// Set quiz answers to quiz object
        /// </summary>
        /// <param name="quiz">quiz</param>
        /// <returns>quiz</returns>
        private async Task SetQuizAnswers(Data.Entities.Quiz quiz)
        {
            var data = await _context.Quizzes.Where(x => x.QuizId == quiz.QuizId).ToListAsync();
            if (data.Count > 0)
            {
                quiz.Questions.ForEach(k => k.AnswerOption = data.Where(x => x.QuestionId == k.Id).FirstOrDefault()?.Answer);
            }
        }

        /// <summary>
        /// Validate Submitted quiz
        /// </summary>
        /// <param name="quiz">quiz</param>
        /// <returns>error messages</returns>
        public async Task<string> ValidateSubmittedQuiz(SubmitQuiz quiz)
        {
            var quizData = await GetQuizQuestionsAndOptions(quiz.QuizId);

            if (quizData.Questions.Count != quiz.Questions.Count)
            {
                return "Questions count is mismatching.";
            }

            foreach (var item in quiz.Questions)
            {
                var question = quizData.Questions.Where(x => x.Id == item.Id).FirstOrDefault();
                if (question == null)
                {
                    return "Submitted question is not present in the database.";
                }
                //if (!question.Options.Contains(item.SelectedOption))
                if(!question.Options.Any(x => x.OptionId == item.SelectedOption))
                {
                    return "Selected option is not present in the database.";
                }
            }
            return "";
        }

        /// <summary>
        /// Submit Quiz
        /// </summary>
        /// <param name="quiz">quiz with selected answers</param>
        /// <returns>quiz with scores and correct answers</returns>
        public async Task<SubmitQuiz> SubmitQuiz(SubmitQuiz quiz)
        {

            try
            {
                //Get Quiz Answers from db
                await GetQuizAnswers(quiz);

                //Save Quiz Answers to db
                await SaveQuizAnswers(quiz);

                //Calculate score by checking the correct answers
                quiz.Score = quiz.Questions.Count(x => x.SelectedOption == x.AnswerOption);
                
                //Calculate Quiz Score percentage
                quiz.QuizScore = Helper.ComputeQuizScore(quiz.Score, quiz.Questions.Count);

                //Compute the quiz status.
                quiz.Status = Helper.ComputeQuizStatus(quiz.QuizScore);

                //Save quiz Score
                await SaveQuizScore(quiz);
            }
            catch
            {
                throw;
            }
            return quiz;
        }

        /// <summary>
        /// Get Quiz Answers from Db
        /// </summary>
        /// <param name="quiz">quiz</param>
        /// <returns>quiz</returns>
        private async Task GetQuizAnswers(SubmitQuiz quiz)
        {
            try
            {
                var data = await _context.Quizzes.Where(x => x.QuizId == quiz.QuizId).ToListAsync();
                if (data.Count > 0)
                {
                    quiz.Questions.ForEach(k => {
                        var ans = data.Where(x => x.QuestionId == k.Id).FirstOrDefault();
                        if (ans != null)
                            k.AnswerOption = ans.Answer;
                        else
                            k.AnswerOption = 0;
                    });
                }
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Save Quiz Answers to Db
        /// If there is any record in Db, update the selected answer. else insert the selected answer
        /// </summary>
        /// <param name="quiz">quiz</param>
        /// <returns></returns>
        private async Task SaveQuizAnswers(SubmitQuiz quiz)
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
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Save Quiz Score
        /// Update the quiz score if record exists in Db, else insert the score
        /// </summary>
        /// <param name="quiz">quiz</param>
        /// <returns></returns>
        private async Task SaveQuizScore(SubmitQuiz quiz)
        {
            try
            {
                //Get the record for student and quiz from Db
                var data = await _context.StudentProgresses.FirstOrDefaultAsync(x => x.StudentId == quiz.UserId
                                                                                  && x.QuizId == quiz.QuizId);
                
                if (data != null) //If there is any record in Db, update the quiz score and quiz status
                {
                    data.QuizScore = quiz.Score;
                    data.QuizStatusId = Helper.GetQuizStatusId(quiz.Status);
                    if(data.QuizStatusId == 2)
                    {
                        data.LessonStatusId = 3;
                    }
                }
                else //If there is no record in Db, insert a new record into Db.
                {
                    await _context.StudentProgresses.AddAsync(new StudentProgress()
                    {
                        LessonId = quiz.LessonId,
                        QuizId = quiz.QuizId,
                        LessonStatusId = (quiz.Status == Data.Entities.QuizStatus.Pass ? (int)Data.Entities.LessonStatus.Completed 
                                                                                       : (int)Data.Entities.LessonStatus.NotStarted),
                        QuizScore = quiz.Score,
                        QuizStatusId = Helper.GetQuizStatusId(quiz.Status),
                        StudentId = quiz.UserId
                    });
                }
                //Save changes
                await _context.SaveChangesAsync();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Check if the user is a teacher
        /// </summary>
        /// <param name="userId">user id</param>
        /// <returns>if user is teacher or not</returns>
        public async Task<bool> IsUserTeacher(int userId)
        {
            bool isTeacher = await _context.Users.AnyAsync(x => x.Id == userId && x.UserType == "TEACHER");
            return isTeacher;
        }

        /// <summary>
        /// Get all student details
        /// </summary>
        /// <returns>list of student details</returns>
        public async Task<List<StudentDetails>> GetAllStudentDetails()
        {
            var students = await _context.Users.Where(x => x.UserType == "STUDENT").ToListAsync();
            var StudentDetails = new List<StudentDetails>();
            foreach (var student in students)
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
