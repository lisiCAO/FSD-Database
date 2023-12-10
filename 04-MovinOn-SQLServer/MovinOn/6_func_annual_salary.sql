/* Purpose: create a function to view employee's annual salary.
Author: Lisi Cao
Date: 2023-08-17 */

-- 1. create a function to view employee's annual salary, input employee ID and return annual salary

CREATE FUNCTION HR.fn_annual_salary (@emp_id INT)
RETURNS DECIMAL(20,2)
AS
BEGIN 
    DECLARE @salary DECIMAL(20,2)
    DECLARE @hourly_rate DECIMAL(5,2)
    DECLARE @annual_salary DECIMAL(20,2)

    SELECT @salary = salary, @hourly_rate = hourly_rate
    FROM HR.employee
    WHERE emp_id = @emp_id

    IF @salary IS NOT NULL
        SET @annual_salary = @salary
    ELSE
        SET @annual_salary = @hourly_rate * 40 * 52 -- transfer hourly wage to annully, 40 hours per week, 52 weeks per year
    
    RETURN @annual_salary
END
;   
GO

-- 1.1 test the function, input employee ID and return annual salary
-- specific employee annully salary
DECLARE @emp_id INT
SET @emp_id = 2

SELECT e.emp_id, HR.fn_annual_salary(@emp_id) AS [annual salary]
FROM HR.employee e
WHERE emp_id = @emp_id
;
GO

-- total annual salary
SELECT SUM(HR.fn_annual_salary(e.emp_id)) AS TotalAnnualSalary
FROM HR.employee e;
GO

-- 1.2 EXEC sp_helptext 'YourFunctionName';

EXEC sp_help 'HR.fn_annual_salary'
;
GO
