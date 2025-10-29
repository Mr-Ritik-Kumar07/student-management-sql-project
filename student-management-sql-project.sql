CREATE DATABASE student_management;
USE student_management;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department_id INT
);

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO departments (department_name)
VALUES ('Computer Science'), ('Mathematics'), ('Physics');

INSERT INTO students (name, age, gender, department_id)
VALUES 
('Ravi', 20, 'Male', 1),
('Priya', 21, 'Female', 2),
('Amit', 22, 'Male', 1),
('Neha', 20, 'Female', 3);

INSERT INTO marks (student_id, subject, marks)
VALUES
(1, 'Python', 85),
(1, 'SQL', 90),
(2, 'Math', 88),
(3, 'DBMS', 75),
(4, 'Physics', 92);

-- 1. List all students
SELECT * FROM students;

-- 2. Find all students in “Computer Science” department
SELECT name 
FROM students 
WHERE department_id = 1;

-- 3. Find average marks of each student
SELECT student_id, AVG(marks) AS avg_marks
FROM marks
GROUP BY student_id;

-- 4. Find top scoring student
SELECT student_id, SUM(marks) AS total_marks
FROM marks
GROUP BY student_id
ORDER BY total_marks DESC
LIMIT 1;

-- 5. Find students with marks above 80
SELECT student_id, subject, marks
FROM marks
WHERE marks > 80;

-- 6. Count students in each department
SELECT department_id, COUNT(*) AS total_students
FROM students
GROUP BY department_id;

-- 7. Find male and female student count
SELECT gender, COUNT(*) AS total
FROM students
GROUP BY gender;

