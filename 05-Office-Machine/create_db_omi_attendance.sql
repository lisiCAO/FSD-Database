/* 
 * Purpose: create a database for Office Machines Inc. to manage the absences and overtime of employees. 
 * Script date: August 11, 2023 
 * Author: Lisi Cao 
 */
 
/** create database */
-- create database omi_attendance;
create database omi_attendance 
character set utf8mb4
collate utf8mb4_unicode_ci;

-- switch to database omi_attendance;
use omi_attendance;

/** create tables */
/*
Abbreviation Reference:
- abs        -> absence
- emp        -> employee
- overtime multiplier -> overtime rate
- dept      -> department
- cat       -> category
- desc      -> description
- mul.      -> multiplier
*/


-- Employee Table
CREATE TABLE employee (
    emp_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    first_name VARCHAR(20) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    address1 VARCHAR(200) NOT NULL,
    address2 VARCHAR(20),
    post_code VARCHAR(7) NOT NULL,
    city VARCHAR(20) NOT NULL,
    province CHAR(2) NOT NULL,
    country VARCHAR(20) NOT NULL,
    sin VARCHAR(11) NOT NULL,
    job_id SMALLINT UNSIGNED NOT NULL,
    hourly_wage FLOAT UNSIGNED NOT NULL,
    seniority TINYINT NOT NULL DEFAULT 0,
    dept_id SMALLINT UNSIGNED NOT NULL,
    emp_status VARCHAR(20) NOT NULL DEFAULT 'Full-time'
);

-- Department Table
CREATE TABLE department (
    dept_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(20) NOT NULL
);

-- Absence Table
CREATE TABLE absence (
    abs_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    emp_id SMALLINT UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    abs_type_id SMALLINT  UNSIGNED NOT NULL,
    note VARCHAR(200) DEFAULT 'N/A'
);

-- Overtime Table
CREATE TABLE overtime (
    overtime_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    emp_id SMALLINT UNSIGNED NOT NULL,
    date DATE NOT NULL,
    hours_worked FLOAT NOT NULL ,
    overtime_mul ENUM('1', '1.5', '2', '-1') NOT NULL DEFAULT '1.5',
    new_balance FLOAT NOT NULL,
    note VARCHAR(500) DEFAULT 'N/A'
);

-- Job Table
CREATE TABLE job (
    job_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    job_cat VARCHAR(20) NOT NULL,
    job_desc VARCHAR(200) NOT NULL
);

-- AbsenceType Table
CREATE TABLE absence_type (
    abs_type_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    abs_type_name VARCHAR(50) NOT NULL,
    is_paid BOOLEAN NOT NULL,
    acquisition_date DATE,
    expiry_date DATE,
    is_convertible BOOLEAN,
    max_days_allowed SMALLINT
);

/** Create constraints and References */

-- Foreign Key Constraints
ALTER TABLE employee
ADD CONSTRAINT fk_employee_job
FOREIGN KEY (job_id) REFERENCES job(job_id)
;

ALTER TABLE employee
ADD CONSTRAINT fk_employee_debt
FOREIGN KEY(dept_id) REFERENCES department(dept_id)
;

ALTER TABLE absence 
ADD CONSTRAINT fk_absence_emp
FOREIGN KEY(emp_id) REFERENCES employee(emp_id)
ON DELETE CASCADE
;

ALTER TABLE absence 
ADD CONSTRAINT fk_absence_type
FOREIGN KEY(abs_type_id) REFERENCES absence_type(abs_type_id)
ON DELETE CASCADE
;

ALTER TABLE overtime
ADD CONSTRAINT fk_overtime_emp
FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
ON DELETE CASCADE
;

-- Ensure gender values
ALTER TABLE employee
ADD CONSTRAINT chk_gender_values
CHECK (gender IN ('Male', 'Female', 'Other'))
;

-- Ensure emp_status values
ALTER TABLE employee
ADD CONSTRAINT chk_emp_status
CHECK (emp_status IN ('Full-time', 'Part-time', 'Contract', 'Intern'))
;

-- Ensure positive wage and hours
ALTER TABLE employee
ADD CONSTRAINT chk_positive_wage
CHECK (hourly_wage > 0)
;

ALTER TABLE overtime
ADD CONSTRAINT chk_positive_hours
CHECK (hours_worked >= 0)
;
