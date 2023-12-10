/* Purpose: uses a calculation to accurately determine the years of service for each active and inactive employee.
Author: Lisi Cao
Date: 2023-08-17 */


-- 1. Create a view to calculate the years of service for each active and inactive employee.

CREATE VIEW HR.years_of_service AS
SELECT
    e.emp_id AS 'Employee ID',
    CONCAT_WS(' ', e.f_name, e.l_name) AS 'Employee Name',
    ep.pos_cat AS 'Position Category',
    CASE
        WHEN e.d_end IS NULL AND e.d_start IS NOT NULL THEN 'Active'
        ELSE 'Inactive'
    END AS 'Employee Status',
    CASE
        WHEN e.d_end IS NULL AND e.d_start IS NOT NULL 
            AND DATEDIFF(YEAR, e.d_start, GETDATE()) >= 5 THEN 'Yes'
        ELSE 'No'
    END AS 'Eligible for Pension'
FROM HR.employee e
JOIN HR.employee_position ep
ON e.pos_id = ep.pos_id;
GO

-- 1.1 Test the view
SELECT * FROM HR.years_of_service
;
GO

-- 2 Create active and inactive view

-- 2.1 Active Employees View - hide the END DATE

CREATE VIEW HR.vw_active_employees AS
SELECT
    emp_id AS 'Employee ID',
    CONCAT_WS(' ', f_name, l_name) AS 'Employee Name',
    zip, phone, cell, ssn, d_birth, d_start,
    pos_id, salary, hourly_rate, d_review,
    wh_id, memo, street, city, state
FROM HR.employee
WHERE d_end IS NULL
;
GO

-- 2.2 Inactive Employees View - hide the REVIEW DATE

CREATE VIEW HR.vw_inactive_employees AS
SELECT
    emp_id AS 'Employee ID',
    CONCAT_WS(' ', f_name, l_name) AS 'Employee Name',
    zip, phone, cell, ssn, d_birth, d_start, d_end,
    pos_id, salary, hourly_rate,
    wh_id, memo, street, city, state
FROM HR.employee
WHERE d_end IS NOT NULL;

GO

-- 2.3 Test the views

SELECT * 
FROM HR.vw_active_employees
;
GO

SELECT * 
FROM HR.vw_inactive_employees
;
GO