using System;
using System.Collections.Generic;

namespace CourseManagementSystem.Models;

public partial class Teacher
{
    public int TeacherId { get; set; }

    public string? TeacherName { get; set; }

    public string Email { get; set; } = null!;

    public string? Qualification { get; set; }

    public int? Age { get; set; }

    public virtual ICollection<Course> Courses { get; set; } = new List<Course>();
}
