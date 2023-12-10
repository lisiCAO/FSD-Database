/* Purpose: Database initialization for MovinOn 
 * Date: 2023-08-12
 * Author: Lisi Cao
 */
 
 -- 1. Database Creation
CREATE DATABASE movinon
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE movinon; 

-- 2. Table Creation

/* -- Abbreviation ->Full Form
emp -> Employee
l_name -> Last Name
f_name -> First Name
ssn -> Social Security Number
d_birth -> Date of Birth
d_start -> Date Started (Date of hiring/Date of joining)
d_end -> Date Ended (Date of termination)
pos_id -> Position Identifier
hourly_rate -> Hourly Rate of Pay
d_review -> Date of Last Personnel Review
wh_id -> Warehouse Identifier
pos_cat -> Position Category
pos_desc -> Position Description
driver -> Driver
d_hire -> Date of Hiring (for drivers)
driving_record -> Driving Record/Rating Level
plate_num -> License Plate Number
axles -> Number of Axles
climate_control -> Climate Control Availability
security_gate -> Security Gate Availability
unit_size -> Size of the Unit
rent -> Rental Amount
job_order -> Job Order
cust_id -> Customer Identifier
d_order -> Date of Order/Schedule
d_move -> Date to Move/Relocation Date
from_address -> Original Address (Starting Point)
to_address -> Destination Address
distance_est -> Estimated Distance
weigth_est -> Estimated Weight
lease -> Lease Agreement/Contract
d_in -> Lease Start Date
d_out -> Lease End Date
contact_f_n -> Contact First Name
contact_m_n -> Contact Middle Name
contact_l_n -> Contact Last Name
balance -> Current Balance
*/


-- 2.1 Employee Table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    l_name VARCHAR(20) NOT NULL,
    f_name VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(7) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    cell VARCHAR(16),
    ssn CHAR(11) NOT NULL,
    d_birth DATE DEFAULT NULL,
    d_start DATE DEFAULT NULL,
    d_end DATE DEFAULT NULL,
    pos_id SMALLINT UNSIGNED,
    salary decimal(20,2),
    hourly_rate DECIMAL(5,2),
    d_review DATE DEFAULT NULL,
    wh_id VARCHAR(4) NOT NULL,
    memo varchar(200) DEFAULT 'N/A'
    );

-- 2.2 Employee Position Table
CREATE TABLE employee_position (
    pos_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    pos_cat VARCHAR(20) NOT NULL,
    pos_desc VARCHAR(100)
);

-- 2.3 Driver Table
CREATE TABLE driver (
    driver_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    l_name VARCHAR(20) NOT NULL,
    f_name VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(7) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    cell VARCHAR(20) NULL,
    ssn CHAR(11) NOT NULL,
    d_birth DATE DEFAULT NULL,
    d_hire DATE NOT NULL,
    d_end DATE DEFAULT NULL,
    mileage_rate DECIMAL(5,2) NOT NULL,
    d_review DATE DEFAULT NULL,
    driving_record CHAR(1) NOT NULL
);

-- 2.4 Vehicle Table
CREATE TABLE vehicle (
    vehicle_id CHAR(7) PRIMARY KEY,
    plate_num VARCHAR(7) NOT NULL,
    axles TINYINT NOT NULL,
    color VARCHAR(20) NOT NULL
);

-- 2.5 Warehouse Table
CREATE TABLE warehouse (
    wh_id VARCHAR(4) PRIMARY KEY,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip CHAR(7) NOT NULL,
    phone VARCHAR(16) NOT NULL,
    has_climate_control BOOLEAN NOT NULL,
    has_security_gate BOOLEAN NOT NULL
);

-- 2.6 Storage Unit Table
CREATE TABLE storage_unit (
    unit_id TINYINT UNSIGNED AUTO_INCREMENT,
    wh_id VARCHAR(4) NOT NULL,
    unit_size VARCHAR(20) NOT NULL,
    rent DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(unit_id, wh_id)
);

-- 2.7 Job Order Table
CREATE TABLE job_order (
    order_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cust_id INT UNSIGNED NOT NULL,
    emp_id INT NOT NULL,
    d_order DATE NOT NULL,
    d_move DATE NOT NULL,
    from_address VARCHAR(100) NOT NULL,
    from_city VARCHAR(20),
    from_state VARCHAR(2),
    to_address VARCHAR(100) NOT NULL,
    to_city VARCHAR(20),
    to_state VARCHAR(2),
    distance_est INT UNSIGNED NOT NULL,
    weight_est INT UNSIGNED NOT NULL,
    has_packing BOOLEAN NOT NULL,
    has_heavy_items BOOLEAN NOT NULL,
    has_storage BOOLEAN NOT NULL
);


-- 2.8 Lease Table
CREATE TABLE lease (
    lease_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cust_id INT UNSIGNED NOT NULL,
    unit_id TINYINT UNSIGNED NOT NULL,
    d_in DATE NOT NULL,
    d_out DATE
);

-- 2.9 Customer Table
CREATE TABLE customer (
    cust_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(20) NOT NULL,
    contact_f_n VARCHAR(20),
    contact_l_n VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip CHAR(7) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    balance DECIMAL(10,2) NOT NULL
);

-- 2.10 Job Detail Table
CREATE TABLE job_detail (
    order_id INT UNSIGNED NOT NULL,
    vehicle_id CHAR(7) NOT NULL,
    driver_id INT UNSIGNED NOT NULL,
    mileage_actual DECIMAL(10,2) NOT NULL,
    weight_actual DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(order_id)
);


-- 3. Constraints

-- 3.1 Employee Table Constraints
ALTER TABLE employee 
ADD CONSTRAINT FK_emp_pos FOREIGN KEY (pos_id) REFERENCES employee_position(pos_id),
ADD CONSTRAINT FK_emp_wh FOREIGN KEY (wh_id) REFERENCES warehouse(wh_id),
ADD CONSTRAINT UNIQUE_ssn_emp UNIQUE(ssn);

-- 3.2 Driver Table Constraints
ALTER TABLE driver
ADD CONSTRAINT UNIQUE_ssn_dri UNIQUE(ssn);

-- 3.3 Storage Unit Table Constraints
ALTER TABLE storage_unit
ADD CONSTRAINT FK_su_wh FOREIGN KEY (wh_id) REFERENCES warehouse(wh_id);

-- 3.4 Job Order Table Constraints
ALTER TABLE job_order
ADD CONSTRAINT FK_jo_cust FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
ADD CONSTRAINT FK_jo_emp FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ;

-- 3.5 Lease Table Constraints
ALTER TABLE lease
ADD CONSTRAINT FK_lease_cust FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
ADD CONSTRAINT FK_lease_unit FOREIGN KEY (unit_id) REFERENCES storage_unit(unit_id);

-- 3.6 Job Detail Table Constraints
ALTER TABLE job_detail
ADD CONSTRAINT FK_jd_order FOREIGN KEY (order_id) REFERENCES job_order(order_id),
ADD CONSTRAINT FK_jd_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
ADD CONSTRAINT FK_jd_driver FOREIGN KEY (driver_id) REFERENCES driver(driver_id);

-- 3.7 Vehicle Table Constraints
ALTER TABLE vehicle
ADD CONSTRAINT UNIQUE_plate_num UNIQUE(plate_num);



