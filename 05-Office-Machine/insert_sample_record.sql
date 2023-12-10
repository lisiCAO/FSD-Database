/* Purpose: insert 5 sample record for each table */
/* Author: Lisi Cao */

INSERT INTO `department` (dept_name) VALUES
('HR'),
('Sales'),
('IT'),
('Finance'),
('Engineering')
;
INSERT INTO `job` (job_cat, job_desc) VALUES
('Manager', 'Responsible for overseeing operations.'),
('Developer', 'Responsible for developing software.'),
('Sales Rep', 'Responsible for selling products.'),
('Accountant', 'Responsible for managing finances.'),
('Engineer', 'Responsible for designing solutions.')
;
INSERT INTO `employee` (last_name, first_name, gender, address1, post_code, city, province, country, sin, job_id, hourly_wage, seniority, dept_id, emp_status) VALUES 
('Smith', 'John', 'Male', '123 Main St', 'A1B2C3', 'Toronto', 'ON', 'Canada', '123-456-789', 1, 30.00, 5, 1, 'Full-time'),
('Doe', 'Jane', 'Female', '456 Elm St', 'D4E5F6', 'Vancouver', 'BC', 'Canada', '987-654-321', 2, 25.00, 3, 2, 'Part-time'),
('Lee', 'Anna', 'Female', '789 Pine St', 'G7H8I9', 'Calgary', 'AB', 'Canada', '456-789-012', 3, 20.00, 2, 3, 'Full-time'),
('Brown', 'Mike', 'Male', '012 Oak St', 'J1K2L3', 'Ottawa', 'ON', 'Canada', '789-012-345', 4, 28.50, 7, 4, 'Contract'),
('Johnson', 'Emily', 'Female', '345 Maple St', 'M6N7O8', 'Montreal', 'QC', 'Canada', '234-567-890', 5, 32.00, 6, 5, 'Full-time')
;
INSERT INTO `absence_type` (abs_type_name, is_paid) VALUES 
('Sick Leave', 1),
('Vacation', 1),
('Unpaid Leave', 0),
('Maternity Leave', 1),
('Paternity Leave', 1)
;
INSERT INTO `absence` (emp_id, start_date, end_date, abs_type_id, note) VALUES 
(1, '2023-08-01', '2023-08-02', 1, 'Sick leave due to fever.'),
(2, '2023-08-03', '2023-08-10', 2, 'Vacation in Bahamas.'),
(3, '2023-08-05', '2023-08-07', 3, 'Unpaid leave for personal reasons.'),
(4, '2023-08-08', '2023-08-09', 1, 'Sick leave due to cold.'),
(5, '2023-08-10', '2023-08-12', 2, 'Vacation in Paris.')
;
INSERT INTO `overtime` (emp_id, date, hours_worked, overtime_mul, new_balance) VALUES 
(1, '2023-08-01', 2, '1.5', 3.0),
(2, '2023-08-02', 3, '2', 6.0),
(3, '2023-08-03', 1.5, '1', 1.5),
(4, '2023-08-04', 4, '1.5', 6.0),
(5, '2023-08-05', 2.5, '2', 5.0);

select * 
from absence ;