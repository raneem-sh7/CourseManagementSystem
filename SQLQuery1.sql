-- Write student name with courses name the student enroll in ,on one table
SELECT
    Students.[Student-Name] as StudentName,
    Courses.[Course-Name] as CourseName
FROM Enrollment
INNER JOIN Students
ON Students.[Student-ID] = Enrollment.[Student-ID]
INNER JOIN Courses 
ON Courses.[Course-ID] = Enrollment.[Course-ID]



