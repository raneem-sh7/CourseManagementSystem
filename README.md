# Course Management System

## Project Overview

Course Management System is a web application built using **ASP.NET Core MVC** and **Entity Framework Core (Database First)**.

The system allows administrators to manage students, courses, teachers, sections, and enrollments through a simple CRUD interface while using SQL Server as the database.

---

## Technologies Used

- ASP.NET Core MVC
- C#
- Entity Framework Core (Database First)
- SQL Server
- Razor Views
- LINQ
- Bootstrap

---

## Features

- View all students
- Add a new student
- Edit student information
- Delete students
- SQL Server database integration
- Entity Framework Core Database First
- Foreign Key relationships
- Cascade Delete between Students/Courses and Enrollment

---

## Database Structure

The database contains the following tables:

- Students
- Courses
- Teachers
- Sections
- Enrollment

### Relationships

- One Student → Many Enrollments
- One Course → Many Enrollments
- One Section → Many Courses
- One Teacher → Many Courses

---


## Problems Encountered & Solutions

### Problem 1:
While implementing the Delete feature, SQL Server prevented deleting a student because the student had related records in the Enrollment table.

Error:

```
The DELETE statement conflicted with the REFERENCE constraint
'FK_Enrollment_Students'
```

### Solution

I solved this by enabling **ON DELETE CASCADE** on the foreign key relationships between:

- Students → Enrollment
- Courses → Enrollment

This allows SQL Server to automatically remove related enrollment records before deleting the parent record while maintaining referential integrity.
### Problem 2:

While displaying the list of courses, I encountered a `System.NullReferenceException` when trying to display the teacher's name.

The reason was that the **Course** table only stores the `TeacherId` as a foreign key. Therefore, the application could not directly access `TeacherName` because the related `Teacher` entity was not loaded.

### Screenshot
<img width="700" height="412" alt="image" src="https://github.com/user-attachments/assets/34e96414-0c19-4e05-b074-e213d4f6627c" />

### Solution

The issue was fixed by loading the related Teacher entity together with the Course data using Entity Framework's Include() method.

Example:
```
var courses = _context.Courses
    .Include(c => c.Teacher)
    .ToList();
```

After loading the related entity, the following code worked correctly:

```
<td>@item.Teacher.TeacherName</td>
```
Now the application successfully displays the teacher's name without throwing a NullReferenceException.
<img width="1521" height="386" alt="image" src="https://github.com/user-attachments/assets/e7aa0b65-e9f3-4fe9-afcd-647f92493de4" />

---
###Problem3 :
When creating a new course, the form initially asked the user to enter:
-**TeacherId**
-**SectionId**
For example, the user would have to enter:

TeacherId = 2
SectionId = 3
Instead, the user should see *meaningful names* such as:

Teacher: Sara
Section: Information Technology

However, the database still needs the IDs because TeacherId and SectionId are **foreign keys** in the Course table.

### Solution: 
Using **Dropdown Lists** with **ViewBag** and **SelectList**

The solution was to retrieve the list of teachers and sections from the database and pass them from the Controller to the View using ViewBag.

*Before*The Create GET action only returned the View:
```
public IActionResult Create()
{
    return View();
}
```
*After* The teachers and sections were retrieved from the database:
```
public IActionResult Create()
{
    var teachers = _context.Teachers.ToList();
    var sections = _context.Sections.ToList();

    ViewBag.Teachers = teachers;
    ViewBag.Sections = sections;

    return View();
}
```
The teachers variable contains a list of all teachers.

The sections variable contains a list of all sections.

The lists were then stored in:
-**ViewBag.Teachers**
-**ViewBag.Sections**

This allowed the Create View to access the teachers and sections in addition to the Course model.

Updating the **Course Create View**:

The TeacherId and SectionId input fields were replaced with dropdown lists so users can select names instead of entering numeric IDs.

*Before:*

```
<input asp-for="TeachearId" class="form-control" />
<input asp-for="SectionId" class="form-control" />

```
*After:*

```
<select asp-for="TeachearId"
        asp-items="@(new SelectList(ViewBag.Teachers, "TeacherId", "TeacherName"))"
        class="form-control">
</select>

<select asp-for="SectionId"
        asp-items="@(new SelectList(ViewBag.Sections, "SectionId", "SectionName"))"
        class="form-control">
</select>

```
### Result:
TeacherName and SectionName are displayed to the user.
TeacherId and SectionId are sent to the Controller.
The IDs are stored in the Course table as foreign keys.

This made the Create form easier and **more user-friendly.**
## What I Learned

During this project I practiced:

- ASP.NET Core MVC architecture
- CRUD Operations
- Controllers and Razor Views
- Entity Framework Core
- LINQ Queries
- SQL Server
- Primary Keys & Foreign Keys
- Database Relationships
- Cascade Delete
- Database First Approach
- Git & GitHub

---

## Future Improvements

- Search functionality
- Input validation
- Authentication & Authorization
- Bootstrap UI improvements
- Course and Teacher management pages
- Dashboard and statistics

---

## Author

**Raneem Shehadeh**

GitHub:
https://github.com/raneem-sh7
