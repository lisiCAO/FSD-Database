/* Purpose: identify the drivers qualified to drive the four-axle trucks.
 call drivers when he needs a substitute, include the phone numbers and driving record for each driver. */
/* Script date: August 13, 2023 */
/* Author: Lisi Cao */

-- switch to databse movinon
use movinon;
-- 1_4AxleDrivers.sql
SELECT 
    concat(l_name , ', ',f_name) AS 'Full Name', 
    phone AS 'Phone Number', 
    driving_record AS 'Driving Recording'
FROM driver
WHERE driving_record IN ('A', 'B');
