CREATE DATABASE CollegeDB;
GO

USE CollegeDB;
GO

CREATE TABLE Course
(
    CourseCode    VARCHAR(10)   NOT NULL PRIMARY KEY,
    CourseName    VARCHAR(60)   NOT NULL,
    DurationYears INT           NOT NULL,
    AnnualFee     DECIMAL(10,2) NOT NULL
);

CREATE TABLE Student
(
    StudentID   INT IDENTITY(1,1) PRIMARY KEY,
    RollNo      VARCHAR(10)  NOT NULL UNIQUE,
    StudentName VARCHAR(50)  NOT NULL,
    Course      VARCHAR(10)  NOT NULL,
    Semester    INT          NOT NULL,
    City        VARCHAR(30)  NOT NULL,
    Marks       INT          NOT NULL CHECK (Marks BETWEEN 0 AND 100)
);
GO

INSERT INTO Course (CourseCode, CourseName, DurationYears, AnnualFee) VALUES
('BCA',    'Bachelor of Computer Applications', 3, 45000.00),
('BSc IT', 'B.Sc. Information Technology',      3, 40000.00),
('MCA',    'Master of Computer Applications',   2, 60000.00);

INSERT INTO Student (RollNo, StudentName, Course, Semester, City, Marks) VALUES
('BCA101', 'Aman Verma',   'BCA',    3, 'Ludhiana',   82),
('BCA102', 'Simran Kaur',  'BCA',    3, 'Amritsar',   91),
('BCA103', 'Rohit Sharma', 'BCA',    5, 'Jalandhar',  76),
('MCA201', 'Neha Gupta',   'MCA',    1, 'Ludhiana',   88),
('BSC301', 'Arjun Mehta',  'BSc IT', 3, 'Patiala',    69),
('MCA202', 'Priya Singh',  'MCA',    1, 'Chandigarh', 94);
GO
