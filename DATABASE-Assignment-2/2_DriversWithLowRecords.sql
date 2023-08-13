/* Purpose: List the drivers with these low driving records, and sort the list 
so that Darnell can easily determine the driving record of each driver. */
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- 2_DriversWithLowRecords.sql
SELECT 
    CONCAT(l_name,', ', f_name) AS 'Full Name',
    driving_record AS 'Driving Record', 
    d_hire AS 'Hire Date', 
    d_end AS 'Termination Date'
FROM driver
WHERE driving_record IN ('C', 'D', 'F')
ORDER BY driving_record;
