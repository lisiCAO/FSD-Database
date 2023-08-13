/* Purpose: prepare a list of contact information of employee in a certain format*/
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 11_EmployeeContactByWarehouse.sql
SET @desired_warehouse = 'OR-1';

SELECT 
    CONCAT(l_name, ', ', f_name) AS full_name, 
    phone AS 'Phone Number', 
    pos_cat AS 'Position Category', 
    wh_id AS 'Warehouse ID'
FROM employee
JOIN employee_position 
ON employee.pos_id = employee_position.pos_id
WHERE wh_id COLLATE utf8mb4_unicode_ci = @desired_warehouse COLLATE utf8mb4_unicode_ci
ORDER BY l_name;


select * from warehouse;