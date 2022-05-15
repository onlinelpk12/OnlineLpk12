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
        public virtual DbSet<Content> Contents { get; set; } = null!;
        public virtual DbSet<Lesson> Lessons { get; set; } = null!;
        public virtual DbSet<LessonStatus> LessonStatuses { get; set; } = null!;
        public virtual DbSet<Quiz> Quizzes { get; set; } = null!;
        public virtual DbSet<QuizOption> QuizOptions { get; set; } = null!;
        public virtual DbSet<QuizStatus> QuizStatuses { get; set; } = null!;
        public virtual DbSet<Sparc> Sparcs { get; set; } = null!;
        public virtual DbSet<StudentProgress> StudentProgresses { get; set; } = null!;
        public virtual DbSet<StudentQuiz> StudentQuizzes { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<User1> Users1 { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySql("server=localhost;database=onlinelpk12;user=admin;password=AdminPassword", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.28-mysql"));
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

                entity.Property(e => e.UserId).HasColumnName("user_id");
            });

            modelBuilder.Entity<Content>(entity =>
            {
                entity.ToTable("content");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ContentType)
                    .HasMaxLength(50)
                    .HasColumnName("content_type");

                entity.Property(e => e.ContentUrl)
                    .HasMaxLength(2500)
                    .HasColumnName("content_url");

                entity.Property(e => e.LessonId).HasColumnName("lesson_id");
            });

            modelBuilder.Entity<Lesson>(entity =>
            {
                entity.ToTable("lesson");

                entity.HasIndex(e => e.LessonNumber, "lesson_number_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.LessonName)
                    .HasMaxLength(50)
                    .HasColumnName("lesson_name");

                entity.Property(e => e.LessonNumber).HasColumnName("lesson_number");
            });

            modelBuilder.Entity<LessonStatus>(entity =>
            {
                entity.ToTable("lesson_status");

                entity.Property(e => e.Id).HasColumnName("id");

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

                entity.Property(e => e.QuestionId).HasColumnName("question_id");

                entity.Property(e => e.Answer).HasColumnName("answer");

                entity.Property(e => e.LessonId).HasColumnName("lesson_id");

                entity.Property(e => e.Question)
                    .HasColumnType("text")
                    .HasColumnName("question");

                entity.Property(e => e.QuestionOrder).HasColumnName("question_order");

                entity.Property(e => e.QuizId).HasColumnName("quiz_id");
            });

            modelBuilder.Entity<QuizOption>(entity =>
            {
                entity.ToTable("quiz_options");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.OptionDesc)
                    .HasMaxLength(100)
                    .HasColumnName("option_desc");

                entity.Property(e => e.OptionNumber).HasColumnName("option_number");

                entity.Property(e => e.QuestionId).HasColumnName("question_id");
            });

            modelBuilder.Entity<QuizStatus>(entity =>
            {
                entity.ToTable("quiz_status");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Status)
                    .HasMaxLength(50)
                    .HasColumnName("status");
            });

            modelBuilder.Entity<Sparc>(entity =>
            {
                entity.ToTable("sparc");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ActivityTimeStamp)
                    .HasColumnType("datetime")
                    .HasColumnName("activity_time_stamp");

                entity.Property(e => e.AssessmentId).HasColumnName("assessment_id");

                entity.Property(e => e.LessonId).HasColumnName("lesson_id");

                entity.Property(e => e.Program)
                    .HasColumnType("blob")
                    .HasColumnName("program");

                entity.Property(e => e.ProgrammingTaskId).HasColumnName("programming_task_id");

                entity.Property(e => e.Query)
                    .HasColumnType("text")
                    .HasColumnName("query");

                entity.Property(e => e.Results)
                    .HasColumnType("blob")
                    .HasColumnName("results");

                entity.Property(e => e.UserId).HasColumnName("user_id");
            });

            modelBuilder.Entity<StudentProgress>(entity =>
            {
                entity.ToTable("student_progress");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.LessonId).HasColumnName("lesson_id");

                entity.Property(e => e.LessonStatusId).HasColumnName("lesson_status_id");

                entity.Property(e => e.QuizId).HasColumnName("quiz_id");

                entity.Property(e => e.QuizScore)
                    .HasPrecision(18)
                    .HasColumnName("quiz_score");

                entity.Property(e => e.QuizStatusId).HasColumnName("quiz_status_id");

                entity.Property(e => e.StudentId).HasColumnName("student_id");
            });

            modelBuilder.Entity<StudentQuiz>(entity =>
            {
                entity.ToTable("student_quiz");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AnswerOptionId).HasColumnName("answer_option_id");

                entity.Property(e => e.LessonId).HasColumnName("lesson_id");

                entity.Property(e => e.QuestionId).HasColumnName("question_id");

                entity.Property(e => e.QuizId).HasColumnName("quiz_id");

                entity.Property(e => e.SelectedOptionId).HasColumnName("selected_option_id");

                entity.Property(e => e.StudentId).HasColumnName("student_id");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("user");

                entity.HasIndex(e => e.EmailId, "email_id_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.Username, "username_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.EmailId)
                    .HasMaxLength(50)
                    .HasColumnName("email_id");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(50)
                    .HasColumnName("first_name");

                entity.Property(e => e.IsActive)
                    .HasColumnType("bit(1)")
                    .HasColumnName("is_active");

                entity.Property(e => e.LastName)
                    .HasMaxLength(50)
                    .HasColumnName("last_name");

                entity.Property(e => e.Password)
                    .HasMaxLength(50)
                    .HasColumnName("password");

                entity.Property(e => e.UserType)
                    .HasMaxLength(50)
                    .HasColumnName("user_type");

                entity.Property(e => e.Username)
                    .HasMaxLength(50)
                    .HasColumnName("username");
            });

            modelBuilder.Entity<User1>(entity =>
            {
                entity.ToTable("users");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("createdAt");

                entity.Property(e => e.Email)
                    .HasMaxLength(255)
                    .HasColumnName("email");

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .HasColumnName("password");

                entity.Property(e => e.Role)
                    .HasMaxLength(255)
                    .HasColumnName("role");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updatedAt");

                entity.Property(e => e.Username)
                    .HasMaxLength(255)
                    .HasColumnName("username");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
