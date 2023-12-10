/* Purpose: Who is paid the lowest hourly rate */
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 7_EmployeeLowWage.sql
SELECT 
    CONCAT(l_name,', ', f_name) AS `Full Name`,
    CASE
        WHEN hourly_rate IS NULL OR hourly_rate <= 0 THEN salary / 2000
        ELSE hourly_rate
    END AS 'Hourly Rate'
FROM employee
ORDER BY `Hourly Rate` ASC
LIMIT 1;
