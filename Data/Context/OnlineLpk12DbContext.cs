using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Data.Context
{
    public partial class OnlineLpk12DbContext : DbContext
    {
        public OnlineLpk12DbContext()
        {
        }

        public OnlineLpk12DbContext(DbContextOptions<OnlineLpk12DbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ActivityLog> ActivityLogs { get; set; } = null!;
        public virtual DbSet<AssessmentStatus> AssessmentStatuses { get; set; } = null!;
        public virtual DbSet<AssessmentSubmission> AssessmentSubmissions { get; set; } = null!;
        public virtual DbSet<Content> Contents { get; set; } = null!;
        public virtual DbSet<Course> Courses { get; set; } = null!;
        public virtual DbSet<CourseTeacher> CourseTeacher { get; set; } = null!;
        public virtual DbSet<CoursesStudent> CoursesStudents { get; set; } = null!;
        public virtual DbSet<Lesson> Lessons { get; set; } = null!;
        public virtual DbSet<LessonStatus> LessonStatuses { get; set; } = null!;
        public virtual DbSet<Quiz> Quizzes { get; set; } = null!;
        public virtual DbSet<QuizOption> QuizOptions { get; set; } = null!;
        public virtual DbSet<QuizStatus> QuizStatuses { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Sparc> Sparcs { get; set; } = null!;
        public virtual DbSet<SparcContent> SparcContents { get; set; } = null!;
        public virtual DbSet<SparcFile> SparcFiles { get; set; } = null!;
        public virtual DbSet<SparcFolder> SparcFolders { get; set; } = null!;
        public virtual DbSet<SparcFolderContain> SparcFolderContains { get; set; } = null!;
        public virtual DbSet<SparcFolderFileAccess> SparcFolderFileAccesses { get; set; } = null!;
        public virtual DbSet<SparcGrade> SparcGrades { get; set; } = null!;
        public virtual DbSet<StudentLessonProgress> StudentLessonProgresses { get; set; } = null!;
        public virtual DbSet<StudentProgress> StudentProgresses { get; set; } = null!;
        public virtual DbSet<StudentQuiz> StudentQuizzes { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserRole> UserRoles { get; set; } = null!;
        public virtual DbSet<SlideData> SlideData { get; set; } = null!;
        public virtual DbSet<AssessmentData> AssessmentData { get; set; } = null!;
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
           if (!optionsBuilder.IsConfigured)
           {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
               optionsBuilder.UseMySql("server=onlinelpk12database.mysql.database.azure.com;database=onlinelpk12;user=onlinelpk12admin@onlinelpk12database;password=Paswd@1234", Microsoft.EntityFrameworkCore.ServerVersion.Parse("5.7.32-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("latin1_swedish_ci")
                .HasCharSet("latin1");

            modelBuilder.Entity<ActivityLog>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("activity_log");

                entity.Property(e => e.ActivityTimeStamp)
                    .HasColumnType("datetime")
                    .HasColumnName("activity_time_stamp");

                entity.Property(e => e.Exception)
                    .HasColumnType("text")
                    .HasColumnName("exception");

                entity.Property(e => e.FileName)
                    .HasMaxLength(45)
                    .HasColumnName("file_name");

                entity.Property(e => e.LogLevelType)
                    .HasMaxLength(45)
                    .HasColumnName("log_level_type");

                entity.Property(e => e.Message)
                    .HasColumnType("text")
                    .HasColumnName("message");

                entity.Property(e => e.MethodName)
                    .HasMaxLength(45)
                    .HasColumnName("method_name");

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_id");
            });

            modelBuilder.Entity<AssessmentStatus>(entity =>
            {
                entity.ToTable("assessment_status");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.LearningOutcome)
                    .HasColumnType("int(11)")
                    .HasColumnName("learning_outcome");

                entity.Property(e => e.LessonId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_id");

                entity.Property(e => e.Score)
                    .HasColumnType("int(11)")
                    .HasColumnName("score");

                entity.Property(e => e.Status)
                    .HasMaxLength(45)
                    .HasColumnName("status");

                entity.Property(e => e.StudentId)
                    .HasColumnType("int(11)")
                    .HasColumnName("student_id");

                entity.Property(e => e.TotalScore)
                    .HasColumnType("int(11)")
                    .HasColumnName("total_score");
            });

            modelBuilder.Entity<AssessmentSubmission>(entity =>
            {
                entity.ToTable("assessment_submissions");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.Answer)
                    .HasMaxLength(1000)
                    .HasColumnName("answer");

                entity.Property(e => e.LearningOutcome)
                    .HasColumnType("int(11)")
                    .HasColumnName("learning_outcome");

                entity.Property(e => e.LessonId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_id");

                entity.Property(e => e.Question)
                    .HasMaxLength(1000)
                    .HasColumnName("question");

                entity.Property(e => e.StudentId)
                    .HasColumnType("int(11)")
                    .HasColumnName("student_id");
            });

            modelBuilder.Entity<Content>(entity =>
            {
                entity.ToTable("content");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.ContentType)
                    .HasMaxLength(50)
                    .HasColumnName("content_type");

                entity.Property(e => e.ContentUrl)
                    .HasMaxLength(2500)
                    .HasColumnName("content_url");

                entity.Property(e => e.LessonId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_id");
            });

            modelBuilder.Entity<Course>(entity =>
            {
                entity.ToTable("courses");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.CourseName)
                    .HasMaxLength(100)
                    .HasColumnName("course_name");

                entity.Property(e => e.Semester)
                    .HasMaxLength(10)
                    .HasColumnName("semester");

                entity.Property(e => e.Year)
                    .HasColumnType("int(11)")
                    .HasColumnName("year");
            });

            modelBuilder.Entity<SlideData>(entity =>
            {
                entity.ToTable("slide_data");

                entity.Property(e => e.Id)
                   .HasColumnType("int(11)")
                   .HasColumnName("id");

                entity.Property(e => e.CourseName)
                    .HasMaxLength(100)
                    .HasColumnName("course_name");

                entity.Property(e => e.LessonName)
                    .HasMaxLength(100)
                    .HasColumnName("lesson_name");

                entity.Property(e => e.Pdf)
                    .HasMaxLength(1000)
                    .HasColumnName("pdf");
            });
            modelBuilder.Entity<AssessmentData>(entity =>
            {
                entity.ToTable("assessment_data");

                entity.Property(e => e.Id)
                   .HasColumnType("int(11)")
                   .HasColumnName("id");

                entity.Property(e => e.CourseName)
                    .HasMaxLength(100)
                    .HasColumnName("course_name");

                entity.Property(e => e.LessonName)
                    .HasMaxLength(100)
                    .HasColumnName("lesson_name");

                entity.Property(e => e.PageNum)
                    .HasMaxLength(100)
                    .HasColumnName("page_num");
                entity.Property(e => e.Header)
                    .HasMaxLength(100)
                    .HasColumnName("header");
                entity.Property(e => e.Data)
                    .HasMaxLength(100)
                    .HasColumnName("data");
                entity.Property(e => e.Questions)
                    .HasMaxLength(100)
                    .HasColumnName("questions");
                entity.Property(e => e.Answers)
                    .HasMaxLength(100)
                    .HasColumnName("answers");
            });

            modelBuilder.Entity<CoursesStudent>(entity =>
            {
                entity.ToTable("courses_students");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.CourseId)
                    .HasColumnType("int(11)")
                    .HasColumnName("course_id");

                entity.Property(e => e.StudentId)
                    .HasColumnType("int(11)")
                    .HasColumnName("student_id");

                entity.Property(e => e.TeacherId)
                    .HasColumnType("int(11)")
                    .HasColumnName("teacher_id");
            });

            modelBuilder.Entity<CourseTeacher>(entity =>
            {
                entity.ToTable("course_teacher");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.CourseId)
                    .HasColumnType("int(11)")
                    .HasColumnName("course_id");

                entity.Property(e => e.TeacherId)
                    .HasColumnType("int(11)")
                    .HasColumnName("teacher_id");
            });

            modelBuilder.Entity<Lesson>(entity =>
            {
                entity.ToTable("lesson");

                entity.HasIndex(e => e.LessonNumber, "lesson_number_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.LessonName)
                    .HasMaxLength(50)
                    .HasColumnName("lesson_name");

                entity.Property(e => e.LessonNumber)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_number");
            });

            modelBuilder.Entity<LessonStatus>(entity =>
            {
                entity.ToTable("lesson_status");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.Status)
                    .HasMaxLength(50)
                    .HasColumnName("status")
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");
            });

            modelBuilder.Entity<Quiz>(entity =>
            {
                entity.HasKey(e => e.QuestionId)
                    .HasName("PRIMARY");

                entity.ToTable("quiz");

                entity.Property(e => e.QuestionId)
                    .HasColumnType("int(11)")
                    .HasColumnName("question_id");

                entity.Property(e => e.Answer)
                    .HasColumnType("int(11)")
                    .HasColumnName("answer");

                entity.Property(e => e.LessonId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_id");

                entity.Property(e => e.Question)
                    .HasColumnType("text")
                    .HasColumnName("question");

                entity.Property(e => e.QuestionOrder)
                    .HasColumnType("int(11)")
                    .HasColumnName("question_order");

                entity.Property(e => e.QuizId)
                    .HasColumnType("int(11)")
                    .HasColumnName("quiz_id");
            });

            modelBuilder.Entity<QuizOption>(entity =>
            {
                entity.ToTable("quiz_options");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.OptionDesc)
                    .HasMaxLength(100)
                    .HasColumnName("option_desc");

                entity.Property(e => e.OptionNumber)
                    .HasColumnType("int(2)")
                    .HasColumnName("option_number");

                entity.Property(e => e.QuestionId)
                    .HasColumnType("int(11)")
                    .HasColumnName("question_id");
            });

            modelBuilder.Entity<QuizStatus>(entity =>
            {
                entity.ToTable("quiz_status");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.Status)
                    .HasMaxLength(50)
                    .HasColumnName("status");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("roles");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("createdAt");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasColumnName("name");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updatedAt");
            });

            modelBuilder.Entity<Sparc>(entity =>
            {
                entity.ToTable("sparc");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.ActivityTimeStamp)
                    .HasColumnType("datetime")
                    .HasColumnName("activity_time_stamp");

                entity.Property(e => e.IsGrading)
                    .HasColumnType("tinyint(4)")
                    .HasColumnName("is_grading");

                entity.Property(e => e.LearningOutcome)
                    .HasColumnType("int(11)")
                    .HasColumnName("learning_outcome");

                entity.Property(e => e.LessonId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_id");

                entity.Property(e => e.Program)
                    .HasColumnType("blob")
                    .HasColumnName("program");

                entity.Property(e => e.ProgrammingTaskId)
                    .HasColumnType("int(11)")
                    .HasColumnName("programming_task_id");

                entity.Property(e => e.Query)
                    .HasColumnType("text")
                    .HasColumnName("query");

                entity.Property(e => e.Results)
                    .HasColumnType("blob")
                    .HasColumnName("results");

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("user_id");
            });

            modelBuilder.Entity<SparcContent>(entity =>
            {
                entity.ToTable("sparc_content");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.DateModified)
                    .HasColumnType("datetime")
                    .HasColumnName("date_modified");

                entity.Property(e => e.FileUrl)
                    .HasMaxLength(1000)
                    .HasColumnName("file_url");

                entity.Property(e => e.Owner)
                    .HasMaxLength(100)
                    .HasColumnName("owner");

                entity.Property(e => e.Program)
                    .HasColumnType("blob")
                    .HasColumnName("program");
            });

            modelBuilder.Entity<SparcFile>(entity =>
            {
                entity.ToTable("sparc_file");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasColumnName("date_created");

                entity.Property(e => e.FileName)
                    .HasMaxLength(45)
                    .HasColumnName("file_name");

                entity.Property(e => e.FileUrl)
                    .HasMaxLength(100)
                    .HasColumnName("file_url");

                entity.Property(e => e.Owner)
                    .HasMaxLength(45)
                    .HasColumnName("owner");
            });

            modelBuilder.Entity<SparcFolder>(entity =>
            {
                entity.ToTable("sparc_folder");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasColumnName("date_created");

                entity.Property(e => e.FolderName)
                    .HasMaxLength(50)
                    .HasColumnName("folder_name");

                entity.Property(e => e.FolderUrl)
                    .HasMaxLength(100)
                    .HasColumnName("folder_url");

                entity.Property(e => e.Owner)
                    .HasMaxLength(45)
                    .HasColumnName("owner");

                entity.Property(e => e.ParentUrl)
                    .HasMaxLength(100)
                    .HasColumnName("parent_url");
            });

            modelBuilder.Entity<SparcFolderContain>(entity =>
            {
                entity.ToTable("sparc_folder_contains");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.FileUrl)
                    .HasMaxLength(100)
                    .HasColumnName("file_url");

                entity.Property(e => e.FolderUrl)
                    .HasMaxLength(100)
                    .HasColumnName("folder_url");

                entity.Property(e => e.Owner)
                    .HasMaxLength(45)
                    .HasColumnName("owner");
            });

            modelBuilder.Entity<SparcFolderFileAccess>(entity =>
            {
                entity.ToTable("sparc_folder_file_access");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.FileUrl)
                    .HasMaxLength(100)
                    .HasColumnName("file_url");

                entity.Property(e => e.FolderUrl)
                    .HasMaxLength(100)
                    .HasColumnName("folder_url");

                entity.Property(e => e.HasAccess)
                    .HasColumnType("tinyint(4)")
                    .HasColumnName("has_access");

                entity.Property(e => e.Owner)
                    .HasMaxLength(45)
                    .HasColumnName("owner");
            });

            modelBuilder.Entity<SparcGrade>(entity =>
            {
                entity.ToTable("sparc_grade");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.ActivityTimeStamp)
                    .HasColumnType("datetime")
                    .HasColumnName("activity_time_stamp");

                entity.Property(e => e.Grade)
                    .HasMaxLength(45)
                    .HasColumnName("grade");

                entity.Property(e => e.LearningOutcome)
                    .HasColumnType("int(11)")
                    .HasColumnName("learning_outcome");

                entity.Property(e => e.LessonId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_id");

                entity.Property(e => e.SparcId)
                    .HasColumnType("int(11)")
                    .HasColumnName("sparc_id");

                entity.Property(e => e.StudentId)
                    .HasColumnType("int(11)")
                    .HasColumnName("student_id");
            });

            modelBuilder.Entity<StudentLessonProgress>(entity =>
            {
                entity.ToTable("student_lesson_progress");

                entity.Property(e => e.Id)
                    .HasColumnType("bigint(20)")
                    .HasColumnName("id");

                entity.Property(e => e.ActivityTimeStamp)
                    .HasColumnType("datetime")
                    .HasColumnName("activity_time_stamp");

                entity.Property(e => e.LearningOutcome)
                    .HasColumnType("int(11)")
                    .HasColumnName("learning_outcome");

                entity.Property(e => e.LessonId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_id");

                entity.Property(e => e.PageNumber)
                    .HasColumnType("int(11)")
                    .HasColumnName("page_number");

                entity.Property(e => e.StudentId)
                    .HasColumnType("int(11)")
                    .HasColumnName("student_id");
            });

            modelBuilder.Entity<StudentProgress>(entity =>
            {
                entity.ToTable("student_progress");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.LessonId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_id");

                entity.Property(e => e.LessonStatusId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_status_id");

                entity.Property(e => e.QuizId)
                    .HasColumnType("int(11)")
                    .HasColumnName("quiz_id");

                entity.Property(e => e.QuizScore)
                    .HasPrecision(18)
                    .HasColumnName("quiz_score");

                entity.Property(e => e.QuizStatusId)
                    .HasColumnType("int(11)")
                    .HasColumnName("quiz_status_id");

                entity.Property(e => e.StudentId)
                    .HasColumnType("int(11)")
                    .HasColumnName("student_id");
            });

            modelBuilder.Entity<StudentQuiz>(entity =>
            {
                entity.ToTable("student_quiz");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.AnswerOptionId)
                    .HasColumnType("int(11)")
                    .HasColumnName("answer_option_id");

                entity.Property(e => e.LessonId)
                    .HasColumnType("int(11)")
                    .HasColumnName("lesson_id");

                entity.Property(e => e.QuestionId)
                    .HasColumnType("int(11)")
                    .HasColumnName("question_id");

                entity.Property(e => e.QuizId)
                    .HasColumnType("int(11)")
                    .HasColumnName("quiz_id");

                entity.Property(e => e.SelectedOptionId)
                    .HasColumnType("int(11)")
                    .HasColumnName("selected_option_id");

                entity.Property(e => e.StudentId)
                    .HasColumnType("int(11)")
                    .HasColumnName("student_id");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("user");

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("createdAt");

                entity.Property(e => e.EmailId)
                    .HasMaxLength(255)
                    .HasColumnName("email_id");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(255)
                    .HasColumnName("first_name");

                entity.Property(e => e.IsActive).HasColumnName("is_active");

                entity.Property(e => e.LastName)
                    .HasMaxLength(255)
                    .HasColumnName("last_name");

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .HasColumnName("password");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updatedAt");

                entity.Property(e => e.UserType)
                    .HasMaxLength(255)
                    .HasColumnName("user_type");

                entity.Property(e => e.Username)
                    .HasMaxLength(255)
                    .HasColumnName("username");
            });

            modelBuilder.Entity<UserRole>(entity =>
            {
                entity.HasKey(e => new { e.RoleId, e.UserId })
                    .HasName("PRIMARY")
                    .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

                entity.ToTable("user_roles");

                entity.HasIndex(e => e.UserId, "userId");

                entity.Property(e => e.RoleId)
                    .HasColumnType("int(11)")
                    .HasColumnName("roleId");

                entity.Property(e => e.UserId)
                    .HasColumnType("int(11)")
                    .HasColumnName("userId");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("createdAt");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updatedAt");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.UserRoles)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("user_roles_ibfk_1");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserRoles)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("user_roles_ibfk_2");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
