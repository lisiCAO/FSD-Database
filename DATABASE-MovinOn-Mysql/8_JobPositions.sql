/* Purpose: How many types of jobs are offered at MonivOn? */
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 8_JobPositions.sql
SELECT 
    COUNT(pos_id) AS 'Job Types Count'
FROM employee_position;
