/* Purpose: To prepare for a payroll, a list of information of employees */
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 10_Payroll.sql
SELECT 
    CONCAT(l_name,', ', f_name) AS 'Full Name',
    ROUND(CASE 
        WHEN salary IS NOT NULL THEN salary / 12 
        ELSE hourly_rate 
    END,2
    ) AS 'Wage', 
    ssn AS 'SSN', 
    emp_id AS 'Employee ID'
FROM employee
ORDER BY l_name, f_name;
