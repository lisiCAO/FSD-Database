/* Purpose: How many employees in each city? */
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 5_EmployeesPerCity.sql
SELECT 
    city AS 'City', 
    COUNT(emp_id) AS 'Employee Number'
FROM employee
GROUP BY city;
