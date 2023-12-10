/* Purpose: calculate seniority and order by position, warehouse and seniority*/
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 13_OregonRateIncrease.sql
SELECT 
	CONCAT(l_name, ', ', f_name) as 'Full Name',
    ROUND(CASE
		WHEN hourly_rate IS NOT NULL THEN hourly_rate
        ELSE salary / 2000 
	END, 2) AS 'PreviousRate',
	ROUND(CASE
        WHEN hourly_rate IS NOT NULL THEN hourly_rate * 1.10
        ELSE (salary / 2000) * 1.10
    END, 2) AS 'Current Rate'
FROM employee
WHERE wh_id like 'OR-_';
