using System;
using System.Collections.Generic;

namespace CourseManagementSystem.Models;

public partial class Course
{
    public int CourseId { get; set; }

    public string? CourseName { get; set; }

    public string? Subject { get; set; }

    public int? SectionId { get; set; }

    public string? Duration { get; set; }

    public int TeachearId { get; set; }

    public virtual ICollection<Enrollment> Enrollments { get; set; } = new List<Enrollment>();

    public virtual Section? Section { get; set; }

    public virtual Teacher Teachear { get; set; } = null!;
}
