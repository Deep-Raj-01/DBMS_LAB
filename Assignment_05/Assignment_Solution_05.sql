--Part A: Student–Enrollment Relationship

--Display StudentID and Name from Student table along with CourseID from
--Enrollment table.
SELECT 
STUDENT.STUDENT_ID ,STUDENT.NAME,ENROLLMENT.COURSE_ID
FROM STUDENT
INNER JOIN ENROLLMENT
ON STUDENT.STUDENT_ID = ENROLLMENT.STUDENT_ID;

--Display student Name and Semester for all enrolled students.
SELECT
STUDENT.NAME , ENROLLMENT.SEMESTER 
FROM STUDENT
INNER JOIN ENROLLMENT
ON STUDENT.STUDENT_ID = ENROLLMENT.STUDENT_ID;

--Display student Name and Grade obtained in each course.
SELECT
STUDENT.NAME , ENROLLMENT.GRADE
FROM STUDENT
INNER JOIN ENROLLMENT
ON STUDENT.STUDENT_ID=ENROLLMENT.STUDENT_ID;


--Course–Faculty Relationship

--Display CourseName and Credits along with the Faculty Name who teaches
--the course.
SELECT
COURSE.COURSE_NAME,COURSE.CREDITS,FACULTY.NAME
FROM COURSE
INNER JOIN FACULTY
ON COURSE.FACULTY_ID=FACULTY.FACULTY_ID;

--Display all courses taught by a faculty member whose FacultyID is 'F201'.
SELECT 
COURSE.COURSE_NAME
FROM COURSE
INNER JOIN FACULTY
ON FACULTY.FACULTY_ID = COURSE.FACULTY_ID
WHERE FACULTY.FACULTY_ID =501;

--Display faculty Name and Designation along with the CourseName they teach.
SELECT 
FACULTY.NAME,FACULTY.DESIGNATION,COURSE.COURSE_NAME
FROM FACULTY
INNER JOIN COURSE
ON FACULTY.FACULTY_ID=COURSE.FACULTY_ID;


--Part C: Student–Course–Enrollment Relationship

--Display student Name along with CourseName for all enrollments.
SELECT
S.NAME,C.COURSE_NAME
FROM STUDENT  S
INNER JOIN ENROLLMENT  E
ON S.STUDENT_ID = E.STUDENT_ID
INNER JOIN COURSE  C
ON E.COURSE_ID = C.COURSE_ID;

--Display student Name, CourseName, and Semester.
SELECT
S.NAME,C.COURSE_NAME,E.SEMESTER
FROM STUDENT  S
INNER JOIN ENROLLMENT  E
ON S.STUDENT_ID = E.STUDENT_ID
INNER JOIN COURSE  C
ON E.COURSE_ID = C.COURSE_ID;

--Display student Name, CourseName, and Grade for Semester 4 only.
SELECT
S.NAME,C.COURSE_NAME,E.GRADE
FROM STUDENT  S
INNER JOIN ENROLLMENT  E
ON S.STUDENT_ID = E.STUDENT_ID
INNER JOIN COURSE  C
ON E.COURSE_ID = C.COURSE_ID
WHERE E.SEMESTER='4th';

--Display all courses taken by a student whose StudentID is 'S401'
SELECT
C.COURSE_NAME
FROM STUDENT  S
INNER JOIN ENROLLMENT  E
ON S.STUDENT_ID = E.STUDENT_ID
INNER JOIN COURSE  C
ON E.COURSE_ID = C.COURSE_ID
WHERE S.STUDENT_ID=23105128005;


--Part D: Department-Based JOIN Queries

--Display student Name and DepartmentID along with CourseName.
SELECT
    S.NAME,
    S.DEPT_ID,
    C.COURSE_NAME
FROM STUDENT S
JOIN ENROLLMENT E
ON S.STUDENT_ID = E.STUDENT_ID
JOIN COURSE C
ON E.COURSE_ID = C.COURSE_ID;

--Display department-wise list of courses using DepartmentID.
SELECT
    D.DEPT_ID,
    C.COURSE_NAME
FROM DEPARTMENT D
JOIN COURSE C
ON D.DEPT_ID = C.DEPT_ID
ORDER BY D.DEPT_ID;

--Display faculty Name along with department name they belong to.
SELECT
    F.NAME,
    D.DEPT_NAME
FROM FACULTY F
JOIN DEPARTMENT D
ON F.DEPT_ID = D.DEPT_ID;


--Part E: JOIN with Filtering and Sorting

--Display student Name and CourseName for students belonging to Department
--'D101'.
SELECT
    S.NAME,
    C.COURSE_NAME
FROM STUDENT S
JOIN ENROLLMENT E
ON S.STUDENT_ID = E.STUDENT_ID
JOIN COURSE C
ON E.COURSE_ID = C.COURSE_ID
WHERE S.DEPT_ID = 101;

--Display student Name and CourseName sorted by student name in ascending
--order.
SELECT
    S.NAME,
    C.COURSE_NAME
FROM STUDENT S
JOIN ENROLLMENT E
ON S.STUDENT_ID = E.STUDENT_ID
JOIN COURSE C
ON E.COURSE_ID = C.COURSE_ID
ORDER BY S.NAME ASC;

--Display faculty Name and CourseName sorted by course credits in descending
--order.
SELECT
    F.NAME,
    C.COURSE_NAME,
    C.CREDITS
FROM FACULTY F
JOIN COURSE C
ON F.FACULTY_ID = C.FACULTY_ID
ORDER BY C.CREDITS DESC;


--Part F: Analytical JOIN Queries

--Display number of students enrolled in each course.
SELECT
    C.COURSE_NAME,
    COUNT(E.STUDENT_ID) AS TOTAL_STUDENTS
FROM COURSE C
JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;

--Display number of courses taught by each faculty member.
SELECT
    F.NAME,
    COUNT(C.COURSE_ID) AS TOTAL_COURSES
FROM FACULTY F
JOIN COURSE C
ON F.FACULTY_ID = C.FACULTY_ID
GROUP BY F.NAME;

--Display department-wise count of students.
SELECT
    D.DEPT_NAME,
    COUNT(S.STUDENT_ID) AS TOTAL_STUDENTS
FROM DEPARTMENT D
JOIN STUDENT S
ON D.DEPT_ID = S.DEPT_ID
GROUP BY D.DEPT_NAME;

--Display course name along with maximum grade awarded in that course.
SELECT
    C.COURSE_NAME,
    MAX(E.GRADE) AS MAX_GRADE
FROM COURSE C
JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;