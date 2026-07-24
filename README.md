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

**While displaying the list of courses, I encountered a `System.NullReferenceException` when trying to display the teacher's name.

The reason was that the **Course** table only stores the `TeacherId` as a foreign key. Therefore, the application could not directly access `TeacherName` because the related `Teacher` entity was not loaded.

### Screenshot**
<img width="700" height="412" alt="image" src="https://github.com/user-attachments/assets/34e96414-0c19-4e05-b074-e213d4f6627c" />

---

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
