/* Purpose: list drivers terminated due to their driving record.
 include all relevant employment information. */
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */


-- 3_DriversForTermination.sql
SELECT 
    driver_id AS 'ID',
	CONCAT(l_name,', ', f_name) AS 'Full Name',
    CONCAT(address,',', city, ', ', state, ',', zip) AS 'Address',
    phone AS 'Phone Number',
    cell AS 'Mobile Phone',
    ssn as 'SSN',
    d_birth AS 'Birthday',
    d_hire AS 'Hire Date', 
    d_end AS 'Termination Date',
    mileage_rate AS 'Mileage Rate',
    d_review AS 'Last Date of Review',
	driving_record AS 'Driving Record'
FROM driver
WHERE driving_record IN ('D', 'F');
