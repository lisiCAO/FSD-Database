/* Purpose: Who makes the highest salary? */
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 6_SalariedEmployees.sql
SELECT 
    CONCAT(l_name,', ', f_name) AS 'Full Name',
    CASE
		WHEN salary IS NOT NULL THEN salary
        ELSE hourly_rate * 2000
    END AS 'Annual Salary'
FROM employee
ORDER BY `Annual Salary` DESC
LIMIT 1;
