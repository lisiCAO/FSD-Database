/* Purpose: create two functions to calculate employee's Seniority and Age.
Author: Lisi Cao
Date: 2023-08-17 */

-- 1. Seniority function, input Employee ID and return the seniority of an employee

CREATE FUNCTION HR.fn_seniority(@emp_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @d_start DATE
    DECLARE @d_end DATE
    DECLARE @seniority INT


    SELECT @d_start = d_start, @d_end = d_end
    FROM HR.employee
    WHERE emp_id = @emp_id

    IF @d_end IS NOT NULL
        SET @seniority = DATEDIFF(YEAR, @d_start, @d_end)
    ELSE
        SET @seniority = DATEDIFF(YEAR, @d_start, GETDATE())

    RETURN @seniority
END
;
GO

-- 1.1 Test Seniority function

SELECT HR.fn_seniority(2) as "Service Year";
GO

-- 2. Age function, input Employee ID and return the age of an employee

CREATE FUNCTION HR.fn_age(@emp_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @d_birth DATE
    DECLARE @age INT

    SELECT @d_birth = d_birth
    FROM HR.employee
    WHERE emp_id = @emp_id

    SET @age = DATEDIFF(YEAR, @d_birth, GETDATE())

    RETURN @age
END
;
GO

-- 2.1 Test AGE function

SELECT HR.fn_age(1) as 'age';
