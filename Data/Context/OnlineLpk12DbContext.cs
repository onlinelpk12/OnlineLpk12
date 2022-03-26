using Microsoft.EntityFrameworkCore;
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
        public virtual DbSet<ContentType> ContentTypes { get; set; } = null!;
        public virtual DbSet<Lesson> Lessons { get; set; } = null!;
        public virtual DbSet<Progress> Progresses { get; set; } = null!;
        public virtual DbSet<Quiz> Quizzes { get; set; } = null!;
        public virtual DbSet<StudentProgress> StudentProgresses { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserType> UserTypes { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySql("server=localhost;database=onlinelpk12;user=admin;password=Admin@1234", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.28-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("utf8mb4_0900_ai_ci")
                .HasCharSet("utf8mb4");

            modelBuilder.Entity<Content>(entity =>
            {
                entity.ToTable("content");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ContentTypeId).HasColumnName("content_type_id");

                entity.Property(e => e.ContentUrl)
                    .HasMaxLength(200)
                    .HasColumnName("content_url");

                entity.Property(e => e.LessonId).HasColumnName("lesson_id");
            });

            modelBuilder.Entity<ContentType>(entity =>
            {
                entity.ToTable("content_type");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ContentType1)
                    .HasMaxLength(50)
                    .HasColumnName("content_type")
                    .IsFixedLength()
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");
            });

            modelBuilder.Entity<Lesson>(entity =>
            {
                entity.ToTable("lesson");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.LessonName)
                    .HasMaxLength(50)
                    .HasColumnName("lesson_name");

                entity.Property(e => e.LessonNumber)
                    .HasMaxLength(50)
                    .HasColumnName("lesson_number");
            });

            modelBuilder.Entity<Progress>(entity =>
            {
                entity.ToTable("progress");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ProgressStatus)
                    .HasMaxLength(50)
                    .HasColumnName("progress_status")
                    .IsFixedLength()
                    .UseCollation("utf8_general_ci")
                    .HasCharSet("utf8");
            });

            modelBuilder.Entity<Quiz>(entity =>
            {
                entity.ToTable("quiz");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Answer)
                    .HasMaxLength(1000)
                    .HasColumnName("answer");

                entity.Property(e => e.LessonId).HasColumnName("lesson_id");

                entity.Property(e => e.Options)
                    .HasColumnType("text")
                    .HasColumnName("options");

                entity.Property(e => e.Question)
                    .HasColumnType("text")
                    .HasColumnName("question");

                entity.Property(e => e.QuestionId).HasColumnName("question_id");
            });

            modelBuilder.Entity<StudentProgress>(entity =>
            {
                entity.ToTable("student_progress");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.LessonId).HasColumnName("lesson_id");

                entity.Property(e => e.LessonProgressStatusId).HasColumnName("lesson_progress_status_id");

                entity.Property(e => e.QuizScore)
                    .HasPrecision(18)
                    .HasColumnName("quiz_score");

                entity.Property(e => e.QuizStatusId).HasColumnName("quiz_status_id");

                entity.Property(e => e.StudentId).HasColumnName("student_id");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("user");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.EmailId)
                    .HasMaxLength(50)
                    .HasColumnName("email_id");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(50)
                    .HasColumnName("first_name");

                entity.Property(e => e.LastName)
                    .HasMaxLength(50)
                    .HasColumnName("last_name");

                entity.Property(e => e.Password)
                    .HasMaxLength(50)
                    .HasColumnName("password");

                entity.Property(e => e.UserName)
                    .HasMaxLength(50)
                    .HasColumnName("user_name");

                entity.Property(e => e.UserTypeId)
                    .HasMaxLength(50)
                    .HasColumnName("user_type_id");
            });

            modelBuilder.Entity<UserType>(entity =>
            {
                entity.ToTable("user_type");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.UserType1)
                    .HasMaxLength(50)
                    .HasColumnName("user_type");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
