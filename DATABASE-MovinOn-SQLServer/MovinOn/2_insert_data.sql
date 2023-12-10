/* Purpose: insert data for movinon database */
/* Author: Lisi Cao */
/* Date: 2023-08-17 */

-- 4. Insert Data

-- for azure database, use the following command to import data
/* using azure data studio import wizard, import data from csv file to database, creating a new table in the database,
    then use the following command to insert data into table */
    --insert into table_name select * from table_name;



-- 4.1 Employee Position Table

BULK INSERT HR.employee_position
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/EmployoeePosition.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO


-- 4.2 Employee Table
BULK INSERT HR.employee
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/Employees.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO



BULK INSERT HR.driver
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/Drivers.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

BULK INSERT inventory.vehicle
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/Vehicles.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

BULK INSERT inventory.warehouse
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/Warehouse.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

BULK INSERT inventory.storage_unit
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/StorageUnits.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

BULK INSERT Operations.job_order
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/JobOrders.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

BULK INSERT Operations.lease
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/UnitRentals.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

BULK INSERT Clients.customer
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/Customers.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

BULK INSERT Operations.job_detail
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-Final_project/MovinOn/MovinOn_Data_Source/JobDetails.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
GO

-- inport temp table and insert into current tables --EXAMPLE
INSERT INTO  Clients.customer
select * from Clients.Customers;
GO

insert into HR.employee_position
select * from HR.EmployeePosition;
GO

-- shows tables 
SELECT * FROM Clients.customer
;
GO 

SELECT * FROM HR.employee
;
GO 

SELECT * FROM HR.driver
;
GO 

SELECT * FROM HR.employee_position
;
GO

SELECT * FROM inventory.storage_unit
;
GO

SELECT * FROM inventory.vehicle
;
GO

SELECT * FROM inventory.warehouse
;
GO

SELECT * FROM Operations.job_detail
;
GO

SELECT * FROM Operations.job_order
;
GO

SELECT * FROM Operations.lease
;
GO