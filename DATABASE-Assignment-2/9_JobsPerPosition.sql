/* Purpose: How many people are employed in each type of job? */
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 9_JobsPerPosition.sql
SELECT 
    pos_cat AS 'Catogary', 
    COUNT(emp_id) AS 'Employees Count'
FROM employee_position
JOIN employee ON employee.pos_id = employee_position.pos_id
GROUP BY employee_position.pos_cat;
