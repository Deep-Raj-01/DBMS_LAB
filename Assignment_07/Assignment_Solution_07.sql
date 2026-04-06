-- 1. Display names of students who belong to the same department as student 'S401'.
SELECT Name 
FROM Student 
WHERE DepartmentID = (SELECT DepartmentID 
                      FROM Student 
                      WHERE StudentID = 'S401');

-- 2. Display students who have the same gender as student 'S402'.
SELECT Name 
FROM Student 
WHERE Gender = (SELECT Gender 
                FROM Student 
                WHERE StudentID = 'S402');

-- 3. Display students belonging to the same department as 'S403'.
SELECT Name 
FROM Student 
WHERE DepartmentID = (SELECT DepartmentID 
                      FROM Student 
                      WHERE StudentID = 'S403');

-- 4. Display students whose DepartmentID exists where Gender is 'Female'.
SELECT Name 
FROM Student 
WHERE DepartmentID IN (SELECT DepartmentID 
                       FROM Student 
                       WHERE Gender = 'Female');

-- 5. Display students whose StudentID appears in the Enrollment table.
SELECT Name 
FROM Student 
WHERE StudentID IN (SELECT StudentID 
                    FROM Enrollment);

-- 6. Display students who are enrolled in any course.
SELECT Name 
FROM Student 
WHERE StudentID IN (SELECT StudentID 
                    FROM Enrollment);

-- 7. Display courses having credits greater than average credits.
SELECT CourseName 
FROM Course 
WHERE Credits > (SELECT AVG(Credits) 
                 FROM Course);

-- 8. Display students whose StudentID is greater than the average StudentID (assume numeric comparison).
SELECT Name 
FROM Student 
WHERE StudentID > (SELECT AVG(StudentID) 
                   FROM Student);

-- 9. Display departments having more students than the average number of students per department.
SELECT DepartmentID 
FROM Student 
GROUP BY DepartmentID 
HAVING COUNT(StudentID) > (SELECT AVG(COUNT(StudentID)) 
                           FROM Student 
                           GROUP BY DepartmentID);

-- 10. Display names of students who are enrolled in courses (without using JOIN).
SELECT Name 
FROM Student S 
WHERE EXISTS (SELECT 1 
              FROM Enrollment E 
              WHERE S.StudentID = E.StudentID);

-- 11. Display students who are allocated to any department (using subquery logic).
SELECT Name 
FROM Student 
WHERE DepartmentID IN (SELECT DepartmentID 
                       FROM Department);

-- 12. Display courses that have at least one student enrolled.
SELECT CourseName 
FROM Course C 
WHERE EXISTS (SELECT 1 
              FROM Enrollment E 
              WHERE C.CourseID = E.CourseID);

-- 13. Display the course with maximum credits.
SELECT CourseName 
FROM Course 
WHERE Credits = (SELECT MAX(Credits) 
                 FROM Course);

-- 14. Display students who are enrolled in more than one course.
SELECT Name 
FROM Student 
WHERE StudentID IN (SELECT StudentID 
                    FROM Enrollment 
                    GROUP BY StudentID 
                    HAVING COUNT(CourseID) > 1);

-- 15. Display departments having the maximum number of students.
SELECT DepartmentID 
FROM Student 
GROUP BY DepartmentID 
HAVING COUNT(StudentID) = (SELECT MAX(COUNT(StudentID)) 
                           FROM Student 
                           GROUP BY DepartmentID);

-- 16. Display students who are enrolled in the same course as student 'S401'.
SELECT Name 
FROM Student 
WHERE StudentID IN (SELECT StudentID 
                    FROM Enrollment 
                    WHERE CourseID IN (SELECT CourseID 
                                       FROM Enrollment 
                                       WHERE StudentID = 'S401'))
AND StudentID != 'S401';

-- 17. Display students who are not enrolled in any course.
SELECT Name 
FROM Student 
WHERE StudentID NOT IN (SELECT StudentID 
                        FROM Enrollment 
                        WHERE StudentID IS NOT NULL);

-- 18. Display courses that have no students enrolled.
SELECT CourseName 
FROM Course 
WHERE CourseID NOT IN (SELECT CourseID 
                       FROM Enrollment 
                       WHERE CourseID IS NOT NULL);