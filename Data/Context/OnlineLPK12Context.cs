using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using OnlineLpk12.Data.Models;

namespace OnlineLpk12.Data.Context
{
    public partial class OnlineLPK12Context : DbContext
    {
        public OnlineLPK12Context()
        {
        }

        public OnlineLPK12Context(DbContextOptions<OnlineLPK12Context> options)
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

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //            if (!optionsBuilder.IsConfigured)
            //            {
            //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
            //                optionsBuilder.UseSqlServer("");
            //            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Content>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Content");

                entity.Property(e => e.ContentUrl).HasMaxLength(200);
            });

            modelBuilder.Entity<ContentType>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("ContentType");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Type)
                    .HasMaxLength(50)
                    .IsFixedLength();
            });

            modelBuilder.Entity<Lesson>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Lesson");

                entity.Property(e => e.LessonName).HasMaxLength(50);

                entity.Property(e => e.LessonNumber).HasMaxLength(50);
            });

            modelBuilder.Entity<Progress>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Progress");

                entity.Property(e => e.Status)
                    .HasMaxLength(50)
                    .IsFixedLength();
            });

            modelBuilder.Entity<Quiz>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Quiz");

                entity.Property(e => e.Answer).HasMaxLength(1000);
            });

            modelBuilder.Entity<StudentProgress>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("StudentProgress");

                entity.Property(e => e.QuizScore).HasColumnType("decimal(18, 0)");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("User");

                entity.Property(e => e.EmailId).HasMaxLength(50);

                entity.Property(e => e.FirstName).HasMaxLength(50);

                entity.Property(e => e.LastName).HasMaxLength(50);

                entity.Property(e => e.Password).HasMaxLength(50);

                entity.Property(e => e.UserName).HasMaxLength(50);

                entity.Property(e => e.UserType).HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
