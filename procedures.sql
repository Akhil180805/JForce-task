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




USE JForceEmployeePayroll;
GO

CREATE OR ALTER PROCEDURE GetEmployeeSalaryReport
    @department_name VARCHAR(50),
    @minimum_salary DECIMAL(10,2)
AS
BEGIN
    SELECT
        employee_id,
        employee_name,
        department,
        designation,
        basic_salary,
        joining_date
    FROM Employees
    WHERE department = @department_name
      AND basic_salary >= @minimum_salary
      AND status = 'Active';
END;
GO

EXEC GetEmployeeSalaryReport 'IT', 50000;
EXEC GetEmployeeSalaryReport 'IT', 40000;

EXEC GetEmployeeSalaryReport 'IT', 60000;






USE JForceEmployeePayroll;
GO

CREATE OR ALTER PROCEDURE EmployeeSalaryGrade
    @employee_id INT
AS
BEGIN
    SELECT
        employee_name AS EmployeeName,
        basic_salary AS BasicSalary,

        CASE
            WHEN basic_salary < 30000 THEN 'C'
            WHEN basic_salary <= 60000 THEN 'B'
            ELSE 'A'
        END AS SalaryGrade

    FROM Employees
    WHERE employee_id = @employee_id;
END;
GO

EXEC EmployeeSalaryGrade 105;






USE JForceEmployeePayroll;
GO

CREATE OR ALTER PROCEDURE GetDepartmentSummary
    @department_name VARCHAR(50)
AS
BEGIN

    
    IF NOT EXISTS
    (
        SELECT 1
        FROM Employees
        WHERE department = @department_name
    )
    BEGIN
        PRINT 'Department does not exist.';
        RETURN;
    END;

 
    SELECT
        @department_name AS DepartmentName,
        COUNT(*) AS TotalEmployees,
        AVG(basic_salary) AS AverageSalary,
        MAX(basic_salary) AS HighestSalary,
        MIN(basic_salary) AS LowestSalary,
        SUM(basic_salary) AS TotalSalaryExpenditure
    FROM Employees
    WHERE department = @department_name;

END;
GO



EXEC GetDepartmentSummary 'IT';


EXEC GetDepartmentSummary 'Marketing';





USE JForceEmployeePayroll;
GO

CREATE OR ALTER PROCEDURE CalculateEmployeeSalary
    @employee_id INT
AS
BEGIN
    DECLARE @basic_salary DECIMAL(10,2);
    DECLARE @hra DECIMAL(10,2);
    DECLARE @da DECIMAL(10,2);
    DECLARE @pf DECIMAL(10,2);
    DECLARE @net_salary DECIMAL(10,2);

    
    SELECT @basic_salary = basic_salary
    FROM Employees
    WHERE employee_id = @employee_id;

  
    SET @hra = @basic_salary * 0.20;
    SET @da = @basic_salary * 0.10;
    SET @pf = @basic_salary * 0.12;

    
    SET @net_salary = @basic_salary + @hra + @da - @pf;

   
    SELECT
        employee_name AS EmployeeName,
        @basic_salary AS BasicSalary,
        @hra AS HRA,
        @da AS DA,
        @pf AS PF,
        @net_salary AS NetSalary
    FROM Employees
    WHERE employee_id = @employee_id;
END;
GO


EXEC CalculateEmployeeSalary 10;


EXEC CalculateEmployeeSalary 999;
