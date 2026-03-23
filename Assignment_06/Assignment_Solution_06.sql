--Part A: Basic Aggregate Queries
--Display the total number of students in the Student table
SELECT COUNT(*) AS TOTAL_STUDENTS
FROM STUDENT;

--Display the total number of faculty members in the Faculty table.
SELECT COUNT(*) AS TOTAL_FACULTYS
FROM FACULTY;

--Display the total number of courses available in the Course table.
SELECT COUNT(*) AS TOTAL_COURSES
FROM COURSE;

--Display the maximum credits among all courses
SELECT MAX(CREDITS) AS MAX_CREDITS
FROM COURSE;

--Display the minimum credits offered by any course.
SELECT MIN(CREDITS) AS MIN_CREDITS
FROM COURSE;

--Part B: GROUP BY on Single Tables
--Display the number of students in each DepartmentID from the Student table
SELECT DEPT_ID,COUNT(*) AS TOTAL_STUDENTS
FROM STUDENT
GROUP BY (DEPT_ID);

--Display the number of faculty members in each DepartmentID from the Faculty table
SELECT DEPT_ID,COUNT(*) AS TOTAL_FACULTYS
FROM FACULTY
GROUP BY (DEPT_ID);

--Display the number of courses offered by each DepartmentID from the Course table.
SELECT COUNT(*) AS TOTAL_COURSES
FROM COURSE
GROUP BY (DEPT_ID);

--Display the number of enrollments in each Semester from the Enrollment table.
SELECT SEMESTER ,COUNT(*) AS TOTAL_STUDENT
FROM ENROLLMENT
GROUP BY (SEMESTER);

--Display the number of students for each Grade in the Enrollment table
SELECT GRADE,COUNT(*) AS TOTAL_STUDENT
FROM ENROLLMENT
GROUP BY (GRADE);


--Part C: GROUP BY with HAVING
--Display departments having more than 3 students.
SELECT DEPT_ID , COUNT(*) AS TOTAL_STUDENT
FROM STUDENT
GROUP BY (DEPT_ID)
HAVING COUNT(*)>3;

--Display semesters where more than 2 enrollments exist.
SELECT SEMESTER , COUNT(*) AS TOTAL_STUDENT
FROM ENROLLMENT
GROUP BY (SEMESTER)
HAVING COUNT(*)>2;

--Display grades that are assigned to more than one student
SELECT GRADE , COUNT(*) AS TOTAL_STUDENT
FROM ENROLLMENT
GROUP BY (GRADE)
HAVING COUNT(*)>1;

--Display DepartmentIDs where more than one course is offered.
SELECT DEPT_ID,COUNT (*) AS TOTAL_COURSE
FROM COURSE
GROUP BY (DEPT_ID)
HAVING COUNT(*)>1;


--Part D: Aggregation with JOIN
--Display the number of students enrolled in each CourseID
SELECT COURSE_ID , COUNT(*) AS ENROLLED_STUDENT
FROM ENROLLMENT
GROUP BY COURSE_ID;

--Display CourseName and number of students enrolled in that course.
SELECT C.COURSE_NAME , COUNT(E.STUDENT_ID) AS ENROLLED_STUDENT
FROM COURSE C
INNER JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;

--Display DepartmentID and number of students belonging to that department.
SELECT DEPT_ID , COUNT(STUDENT_ID) AS ENROLLED_STUDENT
FROM STUDENT
GROUP BY DEPT_ID;

-- Display Faculty Name and number of courses taught by each faculty member.
SELECT F.NAME , COUNT(C.COURSE_ID) AS TAUGHT
FROM COURSE C
JOIN FACULTY F
ON F.FACULTY_ID = C.FACULTY_ID
GROUP BY F.NAME;


--Part E: Analytical Queries
-- Display CourseName and maximum grade obtained in that course
SELECT C.COURSE_NAME , MAX(E.GRADE) AS MAX_GRADE
FROM COURSE C
JOIN ENROLLMENT E 
ON E.COURSE_ID = C.COURSE_ID
GROUP BY C.COURSE_NAME;

SELECT 
    C.COURSE_NAME,
    MAX(
        CASE E.GRADE
            WHEN 'A+' THEN 5
            WHEN 'A'  THEN 4
            WHEN 'B+' THEN 3
            WHEN 'B'  THEN 2
            WHEN 'C'  THEN 1
        END
    ) AS MAX_GRADE
FROM COURSE C
JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;

-- Display DepartmentID and total number of courses offered in that department.
SELECT DEPT_ID , COUNT(COURSE_ID) AS OFFERED_COURSE
FROM COURSE
GROUP BY DEPT_ID;

-- Display Semester and total number of students enrolled in that semester.
SELECT SEMESTER , COUNT(STUDENT_ID) AS STUDENT_ENROLLED
FROM ENROLLMENT
GROUP BY SEMESTER;

--Display courses that have more than 2 students enrolled
SELECT C.COURSE_NAME , COUNT(E.STUDENT_ID) AS ENROLLED_STUDENT
FROM COURSE C
JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME
HAVING COUNT(E.STUDENT_ID)>2;