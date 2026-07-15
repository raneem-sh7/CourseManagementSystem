using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace CourseManagementSystem.Models;

public partial class CourseManagmentDbContext : DbContext
{
    public CourseManagmentDbContext()
    {
    }

    public CourseManagmentDbContext(DbContextOptions<CourseManagmentDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Course> Courses { get; set; }

    public virtual DbSet<Enrollment> Enrollments { get; set; }

    public virtual DbSet<Section> Sections { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    public virtual DbSet<Teacher> Teachers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=raneem-shehadeh;Database=CourseManagmentDB;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Course>(entity =>
        {
            entity.HasKey(e => e.CourseId).HasName("PK_Cources");

            entity.Property(e => e.CourseId).HasColumnName("Course-ID");
            entity.Property(e => e.CourseName)
                .HasMaxLength(50)
                .HasColumnName("Course-Name");
            entity.Property(e => e.Duration).HasMaxLength(10);
            entity.Property(e => e.SectionId).HasColumnName("Section-ID");
            entity.Property(e => e.Subject).HasMaxLength(50);
            entity.Property(e => e.TeachearId).HasColumnName("Teachear-ID");

            entity.HasOne(d => d.Section).WithMany(p => p.Courses)
                .HasForeignKey(d => d.SectionId)
                .HasConstraintName("FK_Courses_Sections");

            entity.HasOne(d => d.Teachear).WithMany(p => p.Courses)
                .HasForeignKey(d => d.TeachearId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Courses_Teachers");
        });

        modelBuilder.Entity<Enrollment>(entity =>
        {
            entity.ToTable("Enrollment");

            entity.Property(e => e.EnrollmentId).HasColumnName("Enrollment-ID");
            entity.Property(e => e.CourseId).HasColumnName("Course-ID");
            entity.Property(e => e.EnrollmentDate).HasColumnName("Enrollment-Date");
            entity.Property(e => e.StudentId).HasColumnName("Student-ID");

            entity.HasOne(d => d.Course).WithMany(p => p.Enrollments)
                .HasForeignKey(d => d.CourseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Enrollment_Courses");

            entity.HasOne(d => d.Student).WithMany(p => p.Enrollments)
                .HasForeignKey(d => d.StudentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Enrollment_Students");
        });

        modelBuilder.Entity<Section>(entity =>
        {
            entity.Property(e => e.SectionId).HasColumnName("Section-ID");
            entity.Property(e => e.SectionName)
                .HasMaxLength(10)
                .HasColumnName("Section-Name");
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.HasKey(e => e.StudentId).HasName("PK_Student");

            entity.Property(e => e.StudentId).HasColumnName("Student-ID");
            entity.Property(e => e.Country).HasMaxLength(50);
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.Password).HasMaxLength(225);
            entity.Property(e => e.StudentName)
                .HasMaxLength(100)
                .HasColumnName("Student-Name");
        });

        modelBuilder.Entity<Teacher>(entity =>
        {
            entity.Property(e => e.TeacherId).HasColumnName("Teacher-ID");
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.Qualification).HasMaxLength(100);
            entity.Property(e => e.TeacherName)
                .HasMaxLength(100)
                .HasColumnName("Teacher-Name");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
