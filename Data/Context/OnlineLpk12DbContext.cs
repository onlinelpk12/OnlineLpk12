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

        public virtual DbSet<Content> Contents { get; set; } = null!;
        public virtual DbSet<Lesson> Lessons { get; set; } = null!;
        public virtual DbSet<LessonStatus> LessonStatuses { get; set; } = null!;
        public virtual DbSet<Quiz> Quizzes { get; set; } = null!;
        public virtual DbSet<QuizOption> QuizOptions { get; set; } = null!;
        public virtual DbSet<QuizStatus> QuizStatuses { get; set; } = null!;
        public virtual DbSet<StudentProgress> StudentProgresses { get; set; } = null!;
        public virtual DbSet<StudentQuiz> StudentQuizzes { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

//        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//                optionsBuilder.UseMySql("server=onlinelpk12db.mysql.database.azure.com;database=onlinelpk12;user=onlinelpk12admin;password=Paswd@1234", Microsoft.EntityFrameworkCore.ServerVersion.Parse("5.7.37-mysql"));
//            }
//        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("latin1_swedish_ci")
                .HasCharSet("latin1");

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

                entity.HasIndex(e => e.EmailId, "email_id_UNIQUE")
                    .IsUnique();

                entity.HasIndex(e => e.Username, "username_UNIQUE")
                    .IsUnique();

                entity.Property(e => e.Id)
                    .HasColumnType("int(11)")
                    .HasColumnName("id");

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

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
