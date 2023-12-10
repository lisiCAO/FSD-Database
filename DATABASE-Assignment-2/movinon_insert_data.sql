/* Purpose: insert records into movinon */
/* Script date: August 12, 2023 */
/* Author: Lisi Cao */

-- switch to moinon
use movinon;

/** set variables */
-- set'secure_file_priv'
show variables like 'secure_file_priv'
;
-- set 'local_infile'
show global variables like 'local_infile'
;
set global local_infile = 'ON' -- or 1
;

/** insert data to table driver */
describe driver;

-- load data file
LOAD DATA INFILE 
'/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Assignment-2/SA5_DB_Take_Home_Assignment_2_Data/MovinOn_Data_Source/Drivers.csv' 
INTO TABLE driver 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(driver_id, l_name, f_name, address, city, state, zip, phone, cell, 
ssn, d_birth, d_hire, @var_d_end, mileage_rate, @var_d_review, driving_record) 
SET d_review = NULLIF(@var_d_review, ' '), 
d_end = NULLIF(@var_d_end, ' ');

-- display table
select * 
from  driver
;

/** employee_position */
select * from employee_position; -- show table

INSERT INTO employee_position (pos_id, pos_cat, pos_desc) VALUES -- insert data
(1, 'owner', 'manage the company'),
(2, 'office staff', 'deal with orders'),
(3, 'moving assistant', 'help move'),
(4, 'finance manager', 'manage company finances'),
(5, 'HR specialist', 'handle recruitment and employee relations'),
(6, 'IT technician', 'manage and maintain IT infrastructure'),
(7, 'marketing executive', 'promote company products and services');

/** warehouse */
select * from warehouse; -- show tables 

INSERT INTO warehouse (wh_id, address, city, state, zip, phone, has_climate_control, has_security_gate) -- insert data
VALUES 
('OR-1', '#3 Industrial Park Way', 'Portland', 'OR', '97212', '5035512423', FALSE, TRUE),
('WA-1', '8798 Warehouse Rd', 'Seattle', 'WA', '98121', '2063242312', TRUE, TRUE),
('WY-1', '54781 Hixson Pike', 'Jackson Hole', 'WY', '83001', '3075413571', TRUE, FALSE);


/** employee */ 
SELECT * FROM employee; -- show tables

-- test
INSERT INTO employee(emp_id, l_name, f_name, address, city, state, zip, phone, cell, ssn, 
d_birth, d_start,d_end, pos_id,hourly_rate, d_review, wh_id, memo, salary)  
VALUES
('4','Behrens',	'Eric','21 Adrian Way','Jackson Hole','WY','83005','3075461272','3075763154	','956346120','1995-02-14','2005-09-12','2006-02-15','3','12.5',NULL,'WY-1',NULL, NULL)	;	

/** storage_unit */
SELECT * FROM storage_unit;

/** customer */
select * from customer;

/** lease */
SELECT * FROM lease;

/** vehicle */
SELECT * FROM vehicle;

/** job_order */
SELECT * FROM job_order;
INSERT INTO job_order(order_id,cust_id,emp_id,d_order,d_move,from_address,from_city,from_state,to_address,to_city,to_state,distance_est,weight_est,has_packing,has_heavy_items,has_storage)
VALUES('2','1','7','2016-10-11','2016-10-15','9001 Shady Lane', 'Bend','OR','9000 Smith Avenue','Eugene','OR','115','5500',1,1,0);

/** job_detail */
SELECT * FROM job_detail;

