--Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) ,
    Office_Location VARCHAR(100)
);


--Student Table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) ,
    Date_of_Birth DATE,
    Gender CHAR(1),
    Contact_No VARCHAR(13),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);


--Faculty Table
CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Name VARCHAR(50) ,
    Designation VARCHAR(20),
    Email VARCHAR(50),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);


--Course Table
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(30) ,
    Credits INT,
    Dept_ID INT,
    Faculty_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID)
);


--Enrollment Table
CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Semester VARCHAR(10),
    Grade CHAR(2),
    Student_ID INT,
    Course_ID INT,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);


