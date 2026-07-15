using System;
using System.Collections.Generic;

namespace CourseManagementSystem.Models;

public partial class Section
{
    public int SectionId { get; set; }

    public string? SectionName { get; set; }

    public virtual ICollection<Course> Courses { get; set; } = new List<Course>();
}
