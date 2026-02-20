/* Create Student table */
CREATE TABLE Student (
    RollNo INT PRIMARY KEY,
    Name VARCHAR2(50),
    Dept VARCHAR2(20),
    Age INT,
    Phone VARCHAR2(15)
);

/* Create Course table */
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR2(50),
    Credits INT
);

/* Add City column */
ALTER TABLE Student ADD City VARCHAR2(30);

/* Add Semester column */
ALTER TABLE Student ADD Semester INT;

/* Rename Phone to MobileNo */
ALTER TABLE Student RENAME COLUMN Phone TO MobileNo;

/* Drop Course table */
DROP TABLE Course;

/* Insert 5 records */
INSERT INTO Student VALUES (101, 'Rahul', 'CSE', 20, '9876543210', 'Delhi', 4);
INSERT INTO Student VALUES (102, 'Amit', 'ECE', 21, '9123456789', 'Patna', 5);
INSERT INTO Student VALUES (103, 'Neha', 'CSE', 22, '9988776655', 'Mumbai', 6);
INSERT INTO Student VALUES (104, 'Pooja', 'ME', 19, '9090909090', 'Kolkata', 3);
INSERT INTO Student VALUES (105, 'Ravi', 'CSE', 23, '9191919191', 'Patna', 7);

/* Display all records */
SELECT * FROM Student;

/* Display RollNo and Name only */
SELECT RollNo, Name FROM Student;

/* Display students from CSE department */
SELECT * FROM Student WHERE Dept = 'CSE';

/* Display students with age greater than 20 */
SELECT * FROM Student WHERE Age > 20;

/* Update department of RollNo 101 */
UPDATE Student SET Dept = 'ECE' WHERE RollNo = 101;

/* Update city of Rahul to Patna */
UPDATE Student SET City = 'Patna' WHERE Name = 'Rahul';

/* Increase age of all students by 1 */
UPDATE Student SET Age = Age + 1;

/* Delete student with RollNo 105 */
DELETE FROM Student WHERE RollNo = 105;

/* Delete all records but keep table */
DELETE FROM Student;

COMMIT;
