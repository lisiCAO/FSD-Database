/* Purpose: calculate seniority and order by position, warehouse and seniority*/
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 12_EmployeeLongevity.sql
SELECT 
    CONCAT(l_name, ', ', f_name) as 'Full Name',
    pos_cat AS 'Position', 
    FLOOR(DATEDIFF(CURDATE(), d_start)/365 ) AS seniority
FROM employee
JOIN employee_position ON employee.pos_id = employee_position.pos_id
ORDER BY wh_id, pos_cat, seniority DESC;
