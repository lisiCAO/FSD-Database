-- Purpose: Database initialization for MovinOn 
-- Date: 2023-08-12
-- Author: Lisi Cao

-- 1. Database Creation
-- CREATE DATABASE movinon
-- ;
-- GO
-- USE movinon; 

-- create schema
CREATE SCHEMA HR
;
GO
--HR (employee, employee_position, driver)

CREATE SCHEMA Operations
;
GO
-- Operations(job_order, job_detail, lease, )

CREATE SCHEMA Clients
;
GO
-- Clients(customer)
CREATE SCHEMA inventory
;
GO
--inventory(warehouse, storage_unit, vehicle)

-- 2. Table Creation

-- 2.1 Employee Table
IF OBJECT_ID('HR.employee', 'U') IS NOT NULL
    DROP TABLE HR.employee
;
GO

CREATE TABLE HR.employee (
    emp_id INT PRIMARY KEY NOT NULL,
    l_name NVARCHAR(20) NOT NULL,
    f_name NVARCHAR(20) NOT NULL,
    zip NVARCHAR(7) NOT NULL,
    phone NVARCHAR(20) NOT NULL,
    cell NVARCHAR(16),
    ssn CHAR(11) NOT NULL UNIQUE,
    d_birth DATE,
    d_start DATE,
    d_end DATE,
    pos_id SMALLINT,
    salary DECIMAL(20,2),
    hourly_rate DECIMAL(5,2),
    d_review DATE,
    wh_id NVARCHAR(4) NOT NULL,
    memo NVARCHAR(200) DEFAULT 'N/A',
	street NVARCHAR(100) NOT NULL,
    city NVARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
)
;
GO 

-- 2.2 Employee Position Table
IF OBJECT_ID('HR.employee_position', 'U') IS NOT NULL
    DROP TABLE HR.employee_position
;
GO

CREATE TABLE HR.employee_position (
    pos_id SMALLINT PRIMARY KEY ,
    pos_cat NVARCHAR(20) NOT NULL,
    pos_desc NVARCHAR(100)
)
;
GO


-- 2.3 Driver Table
IF OBJECT_ID('HR.driver', 'U') IS NOT NULL
    DROP TABLE HR.driver
;
GO

CREATE TABLE HR.driver (
    driver_id INT PRIMARY KEY NOT NULL,
    l_name NVARCHAR(20) NOT NULL,
    f_name NVARCHAR(20) NOT NULL,
    zip NVARCHAR(7) NOT NULL,
    phone NVARCHAR(20) NOT NULL,
    cell NVARCHAR(20),
    ssn CHAR(11) NOT NULL,
    d_birth DATE,
    d_hire DATE NOT NULL,
    d_end DATE,
    mileage_rate DECIMAL(5,2) NOT NULL,
    d_review DATE,
    driving_record CHAR(1) NOT NULL,
	street NVARCHAR(100) NOT NULL,
    city NVARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
)
;
GO

-- 2.4 Vehicle Table
IF OBJECT_ID('inventory.vehicle', 'U') IS NOT NULL
    DROP TABLE inventory.vehicle
;
GO

CREATE TABLE inventory.vehicle (
    vehicle_id CHAR(7) PRIMARY KEY,
    plate_num NVARCHAR(7) NOT NULL,
    axles TINYINT NOT NULL,
    color NVARCHAR(20) NOT NULL
);

-- 2.5 Warehouse Table
IF OBJECT_ID('inventory.warehouse', 'U') IS NOT NULL
    DROP TABLE inventory.warehouse
;
GO

CREATE TABLE inventory.warehouse (
    wh_id NVARCHAR(4) PRIMARY KEY,
    zip NVARCHAR(7) NOT NULL,
    phone NVARCHAR(16) NOT NULL,
    has_climate_control BIT NOT NULL,
    has_security_gate BIT NOT NULL,
	street NVARCHAR(100) NOT NULL,
    city NVARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
);
GO

-- 2.6 Storage Unit Table
IF OBJECT_ID('inventory.storage_unit', 'U') IS NOT NULL
    DROP TABLE inventory.storage_unit
;
GO

CREATE TABLE inventory.storage_unit (
    unit_id INT NOT NULL ,
    wh_id NVARCHAR(4) NOT NULL,
    unit_size NVARCHAR(20) NOT NULL,
    rent DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(unit_id, wh_id)
);

-- 2.7 Job Order Table
IF OBJECT_ID('Operations.job_order', 'U') IS NOT NULL
    DROP TABLE Operations.job_order
;
GO

CREATE TABLE Operations.job_order (
    order_id INT PRIMARY KEY ,
    cust_id INT NOT NULL,
    emp_id INT NOT NULL,
    d_order DATE NOT NULL,
    d_move DATE NOT NULL,
    from_address NVARCHAR(100) NOT NULL,
    from_city NVARCHAR(20),
    from_state CHAR(2),
    to_address NVARCHAR(100) NOT NULL,
    to_city NVARCHAR(20),
    to_state CHAR(2),
    distance_est INT NOT NULL,
    weight_est INT NOT NULL,
    has_packing BIT NOT NULL,
    has_heavy_items BIT NOT NULL,
    has_storage BIT NOT NULL
)
;
GO

-- 2.8 Lease Table
IF OBJECT_ID('Operations.lease', 'U') IS NOT NULL
    DROP TABLE Operations.lease
;
GO

CREATE TABLE Operations.lease (
    lease_id INT PRIMARY KEY ,
    cust_id INT NOT NULL,
    unit_id INT NOT NULL,
    wh_id NVARCHAR(4) NOT NULL,
    d_in DATE NOT NULL,
    d_out DATE
)
;
GO

-- 2.9 Customer Table
IF OBJECT_ID('Clients.customer', 'U') IS NOT NULL
    DROP TABLE Clients.customer
;
GO

CREATE TABLE Clients.customer (
    cust_id INT PRIMARY KEY ,
    company_name NVARCHAR(50) NOT NULL,
    contact_f_n NVARCHAR(20) NULL,
    contact_l_n NVARCHAR(20) NOT NULL,
    zip NVARCHAR(7) NOT NULL,
    phone NVARCHAR(20) NOT NULL,
    balance DECIMAL(10,2) NOT NULL,
    street NVARCHAR(100) NOT NULL,
    city NVARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
)
;
GO

-- 2.10 Job Detail Table
IF OBJECT_ID('Operations.job_detail', 'U') IS NOT NULL
    DROP TABLE inventory.job_detail
;
GO

CREATE TABLE Operations.job_detail (
    order_id INT NOT NULL,
    vehicle_id CHAR(7) NOT NULL,
    driver_id INT NOT NULL,
    mileage_actual DECIMAL(10,2) NOT NULL,
    weight_actual DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(order_id)
)
;
GO

-- 3. Constraints

-- 3.1 Employee Table Constraints

-- foreign keys
ALTER TABLE HR.employee 
ADD FOREIGN KEY (pos_id) REFERENCES HR.employee_position(pos_id);
ALTER TABLE HR.employee
ADD FOREIGN KEY (wh_id) REFERENCES inventory.warehouse(wh_id)
;
GO 

-- unique constraints
ALTER TABLE HR.employee
ADD CONSTRAINT uq_employee_ssn UNIQUE (ssn)
;
ALTER TABLE HR.employee
ADD CONSTRAINT uq_employee_phone UNIQUE (phone)
;
ALTER TABLE HR.employee
ADD CONSTRAINT uq_employee_cell UNIQUE (cell)
;
GO

-- check constraints
ALTER TABLE HR.employee
ADD CONSTRAINT ck_employee_salary CHECK (salary > 0)
;
ALTER TABLE HR.employee
ADD CONSTRAINT ck_employee_hourly_rate CHECK (hourly_rate > 0)
;
ALTER TABLE HR.employee
ADD CONSTRAINT ck_employee_d_review CHECK (d_review > d_start OR d_review = NULL)
;
ALTER TABLE HR.employee
ADD CONSTRAINT ck_employee_d_end CHECK (d_end = NULL OR d_end > d_start)
;
ALTER TABLE HR.employee
ADD CONSTRAINT ck_employee_d_birth CHECK (d_birth < GETDATE())
;
ALTER TABLE HR.employee
ADD CONSTRAINT ck_employee_d_start CHECK (d_start < GETDATE())
;
ALTER TABLE HR.employee
ADD CONSTRAINT ck_employee_zip CHECK (LEN(zip) = 5 OR LEN(zip) = 9)
;
GO

-- 3.2 Driver Table Constraints
-- unique constraints
ALTER TABle HR.driver
ADD CONSTRAINT uq_driver_ssn UNIQUE (ssn)
;
ALTER TABLE HR.driver
ADD CONSTRAINT uq_driver_phone UNIQUE (phone)
;
ALTER TABLE HR.driver
ADD CONSTRAINT uq_driver_cell UNIQUE (cell)
;
GO

-- check constraints
ALTER TABLE HR.driver
ADD CONSTRAINT ck_driver_d_review CHECK (d_review > d_hire OR d_review = NULL)
;
ALTER TABLE HR.driver
ADD CONSTRAINT ck_driver_d_end CHECK (d_end = NULL OR d_end > d_hire)
;
ALTER TABLE HR.driver
ADD CONSTRAINT ck_driver_d_birth CHECK (d_birth < GETDATE())
;
ALTER TABLE HR.driver
ADD CONSTRAINT ck_driver_d_hire CHECK (d_hire < GETDATE())
;
ALTER TABLE HR.driver
ADD CONSTRAINT ck_driver_mileage_rate CHECK (mileage_rate > 0)
;
ALTER TABLE HR.driver
ADD CONSTRAINT ck_driver_driving_record CHECK(driving_record IN('A', 'B', 'C', 'D', 'E', 'F'))
;
ALTER TABLE HR.driver
ADD CONSTRAINT ck_driver_zip CHECK (LEN(zip) = 5 OR LEN(zip) = 9)
;
GO

-- 3.3 Storage Unit Table Constraints

-- foreign keys
ALTER TABLE inventory.storage_unit
ADD FOREIGN KEY (wh_id) REFERENCES inventory.warehouse(wh_id)
;
GO

-- check constraints
ALTER TABLE inventory.storage_unit
ADD CONSTRAINT ck_unit_rent CHECK (rent > 0)
;
GO
-- 3.4 Job Order Table Constraints

-- foreign keys
ALTER TABLE Operations.job_order
ADD FOREIGN KEY (cust_id) REFERENCES Clients.customer(cust_id)
;
ALTER TABLE Operations.job_order
ADD FOREIGN KEY (emp_id) REFERENCES HR.employee(emp_id)
;
GO

-- check constraints
ALTER TABLE Operations.job_order
ADD CONSTRAINT ck_job_order_d_order CHECK (d_order < GETDATE())
;
ALTER TABLE Operations.job_order
ADD CONSTRAINT ck_job_order_d_move CHECK (d_move > d_order)
;
ALTER TABLE Operations.job_order
ADD CONSTRAINT ck_job_order_distance_est CHECK (distance_est > 0)
;
ALTER TABLE Operations.job_order
ADD CONSTRAINT ck_job_order_weight_est CHECK (weight_est > 0)
;
ALTER TABLE Operations.job_order
ADD CONSTRAINT ck_job_order_has_packing CHECK (has_packing IN (0, 1))
;
ALTER TABLE Operations.job_order
ADD CONSTRAINT ck_job_order_has_heavy_items CHECK (has_heavy_items IN (0, 1))
;
ALTER TABLE Operations.job_order
ADD CONSTRAINT ck_job_order_has_storage CHECK (has_storage IN (0, 1))
;
GO


-- 3.5 Lease Table Constraints

-- foreign keys
ALTER TABLE Operations.lease
ADD FOREIGN KEY (cust_id) REFERENCES Clients.customer(cust_id)
;
ALTER TABLE Operations.lease
ADD FOREIGN KEY (unit_id, wh_id) REFERENCES inventory.storage_unit(unit_id, wh_id)
;
GO

-- check constraints
ALTER TABLE Operations.lease
ADD CONSTRAINT ck_lease_d_in CHECK (d_in < GETDATE())
;
ALTER TABLE Operations.lease
ADD CONSTRAINT ck_lease_d_out CHECK (d_out = NULL OR d_out > d_in)
;
GO


-- 3.6 Job Detail Table Constraints

-- foreign keys
ALTER TABLE Operations.job_detail
ADD FOREIGN KEY (order_id) REFERENCES Operations.job_order(order_id)
;
ALTER TABLE Operations.job_detail
ADD FOREIGN KEY (vehicle_id) REFERENCES inventory.vehicle(vehicle_id)
;
ALTER TABLE Operations.job_detail
ADD FOREIGN KEY (driver_id) REFERENCES HR.driver(driver_id)
;
GO

-- check constraints
ALTER TABLE Operations.job_detail
ADD CONSTRAINT ck_job_detail_mileage_actual CHECK (mileage_actual > 0)
;
ALTER TABLE Operations.job_detail
ADD CONSTRAINT ck_job_detail_weight_actual CHECK (weight_actual > 0)
;
GO

-- 3.7 Customer Table Constraints

-- unique constraints
ALTER TABLE Clients.customer
ADD CONSTRAINT uq_customer_phone UNIQUE (phone)
;
GO

-- check constraints
ALTER TABLE Clients.customer
ADD CONSTRAINT ck_customer_balance CHECK (balance >= 0)
;
ALTER TABLE Clients.customer
ADD CONSTRAINT ck_customer_zip CHECK (LEN(zip) = 5 OR LEN(zip) = 9)
;
GO
-- 3.8 Vehicle Table Constraints

-- unique constraints
ALTER TABLE inventory.vehicle
ADD CONSTRAINT uq_vehicle_plate UNIQUE (plate_num)
;
GO

-- check constraints
ALTER TABLE inventory.vehicle
ADD CONSTRAINT ck_vehicle_axles CHECK (axles > 0)
;
GO 

-- display information
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS;
GO
