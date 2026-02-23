--Part A: Basic Data Display (Using Aliases)
--Display all columns from the Student table using suitable aliases for every column.
SELECT 
    Student_ID AS Roll_No,
    Name AS Student_Name,
    Date_of_Birth AS DOB,
    Gender AS Sex,
    Contact_No AS Contact,
    Dept_ID AS Department_ID
FROM Student;

--Display only StudentID, Name, and DepartmentID from the Student table, renaming
--them as Roll_No, Student_Name, and Dept_ID.
SELECT 
    Student_ID AS Roll_No,
    Name AS Student_Name,
    Dept_ID AS Department_ID
FROM Student;

--Display FacultyID, Name, Designation, and Email from the Faculty table using
--readable column names.
SELECT
    Faculty_ID AS Faculty_ID,
    Name AS Faculty_Name,
    Designation AS Faculty_Designation,
    Email AS Faculty_Email
FROM Faculty;

--Display all columns from the Course table with renamed column headers
SELECT
    Course_ID AS ID,
    Course_Name AS Name,
    Credits AS Points,
    Dept_ID AS Department_ID,
    Faculty_ID AS Faculty_ID
FROM COURSE;

--Display all columns from the Enrollment table with meaningful aliases.
SELECT
    Enrollment_ID AS Enroll_ID,
    Semester AS Sem,
    Grade AS Marks,
    Student_ID AS Std_ID,
    Course_ID AS course_ID
FROM ENROLLMENT;


--Part B: Conditional Data Display (WHERE Clause)
--Display all students whose DepartmentID is 'D101'.
SELECT *FROM STUDENT WHERE DEPT_ID = 101;

--Display all students whose Gender is 'Female'.
SELECT * FROM STUDENT WHERE GENDER = 'F';

--Display faculty members whose Designation is 'Assistant Professor'.
SELECT * FROM FACULTY WHERE DESIGNATION = 'Assistant Professor';

--Display faculty members whose DepartmentID is 'D102'.
SELECT * FROM FACULTY WHERE DEPT_ID = 102;

-- Display courses whose Credits are greater than or equal to 4.
SELECT *FROM COURSE WHERE CREDITS >= 4;

--Display students born after 2003-01-01 using the DOB column.
SELECT *FROM STUDENT WHERE DATE_OF_BIRTH > DATE'2003-01-01';

--Display enrollment records for students enrolled in Semester 4.
SELECT * FROM ENROLLMENT WHERE SEMESTER = '4th';


--Part C: Sorting and Limiting Results
--Display student records sorted by Name in ascending order
SELECT * FROM STUDENT ORDER BY NAME ASC;

--Display student records sorted by DOB in descending order
SELECT * FROM STUDENT ORDER BY DATE_OF_BIRTH DESC;

--Display faculty records sorted by Designation in ascending order.
SELECT *FROM FACULTY ORDER BY DESIGNATION ASC;

--Display courses sorted by Credits in descending order.
SELECT * FROM COURSE ORDER BY CREDITS DESC;

-- Display only the first 3 student records.
SELECT * FROM STUDENT FETCH FIRST 3 ROW ONLY;

--Display only the first 5 course records
SELECT * FROM COURSE FETCH FIRST 5 ROW ONLY;


--Part D: Derived / Computed Output (No Table Modification)
--Display student Name along with their calculated Age using DOB.
SELECT 
    Name,
    EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM Date_of_birth) AS DOB
FROM STUDENT;

--Display course CourseName along with Credits + 1 as Updated_Credits.
SELECT 
    COURSE_NAME ,
    CREDITS +1 AS UPDATED_CREDITS
FROM COURSE;

--Display enrollment details with column Grade shown as Final_Grade.
SELECT 
    ENROLLMENT_ID,
    SEMESTER ,
    GRADE AS FINAL_GRADE,
    STUDENT_ID,
    COURSE_ID
FROM ENROLLMENT;

--Display student Name along with year of birth extracted from DOB.
SELECT 
    NAME,
    EXTRACT(YEAR FROM DATE_OF_BIRTH) AS YEAR_OF_BIRTH
FROM STUDENT;

--Display faculty Name along with email domain extracted from Email.
SELECT 
    NAME,
    SUBSTR(EMAIL,INSTR(EMAIL , '@')+1) AS EMAIL_DOMAIN
FROM FACULTY;