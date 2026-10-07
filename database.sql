CREATE DATABASE JForceEmployeePayroll

USE JForceEmployeePayroll

CREATE TABLE Employees
(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    designation VARCHAR(100) NOT NULL,
    basic_salary DECIMAL(10,2) NOT NULL,
    joining_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
);

SELECT * FROM Employees


INSERT INTO Employees
(
    employee_id,
    employee_name,
    department,
    designation,
    basic_salary,
    joining_date,
    status
)
VALUES
(101, 'Amit Sharma', 'IT', 'Junior Developer', 28000, '2024-01-15', 'Active'),
(102, 'Priya Patel', 'IT', 'Software Developer', 45000, '2023-06-20', 'Active'),
(103, 'Rahul Verma', 'IT', 'Senior Developer', 75000, '2022-03-10', 'Active'),
(104, 'Sneha Shah', 'HR', 'HR Executive', 35000, '2023-08-05', 'Active'),
(105, 'Rohan Mehta', 'HR', 'HR Manager', 65000, '2021-11-12', 'Active'),
(106, 'Neha Joshi', 'Finance', 'Accountant', 42000, '2024-02-01', 'Active'),
(107, 'Vikram Singh', 'Finance', 'Finance Manager', 80000, '2020-07-18', 'Active'),
(108, 'Pooja Desai', 'Sales', 'Sales Executive', 30000, '2024-04-22', 'Active'),
(109, 'Karan Gupta', 'Sales', 'Sales Manager', 70000, '2021-09-15', 'Inactive'),
(110, 'Anjali Rao', 'IT', 'System Administrator', 55000, '2022-12-01', 'Active'),
(111, 'Suresh Kumar', 'Admin', 'Office Administrator', 26000, '2024-05-10', 'Active'),
(112, 'Meera Nair', 'IT', 'Project Manager', 90000, '2019-10-25', 'Active');

SELECT * FROM Employees