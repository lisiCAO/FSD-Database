/* 
Purpose:
Manipulate data from the MovinOn Inc. database 

Script Date: August 12, 2023
Developed by: 
*/

use MovinOn23H2
;

/* ********** Question 8 ********** */
--    The truck drivers for MovinOn are special type of employee, and their data is stored in a table separate 
--    from the rest of the employees because of driving certification requirements. Drivers are certified to drive 
--    trucks with a specified number of axles, and MovinOn must be sertain that a driver is certified to drive a 
--    particular truck. when Darnell meets with David Bower, the general manager, he learns that only drivers who 
--    have a driving record of “A” or “B” are allowed to drive the large trucks (those with four axles or more). 
--    He asks you to identify the drivers qualified to drive the four-axle trucks. Because he will use the list 
--    you create to call drivers when he needs a substitute, include the phone numbers and driving record for 
--    each driver. Save the script as 1_4AxleDrivers.

select 
	D.DriverID as `Driver ID`,
	concat_ws(' ', D.DriverFirst, D.DriverLast) as `Driver's Name`,
	D.Phone,
	D.DrivingRecord as `Driving Record`,
    if(EndDate = null ,'Employed','Terminated') as `Status`
from Drivers as D
where DrivingRecord in ('A', 'B')
;

select * from drivers;
/* ********** Question 9 ********** */
--    Darnell also learns that he must immediately review drivers who have a driving record lower that “A” or “B”. 
--    those drivers who have a record of “C” will be put on notice, and those with a record “D” or “F” can be terminated 
--    immediately. List the drivers with these low driving records, and sort the list so that Darnell can easily determine 
--    the driving record of each driver. Because he can enroll long-term drivers in a training program, he also needs to
--    know when each driver started working for MovinOn and whether the driver is still employed. 
--    Save the script as 2_DriversWithLowRecords.

select
    D.DriverID as `Driver ID`,
    concat_ws(' ', D.DriverFirst, D.DriverLast) as `Driver's Name`,
    D.Phone,
    D.DrivingRecord as `Driving Record`,
    D.StartDate as `Start Date`,
    D.EndDate as `End Date`,
        case
            when DrivingRecord = 'C' then 'Job on notice'
            when DrivingRecord = 'D' then 'Job Terminated'
            when DrivingRecord = 'F' then 'Job Terminated'
            else 'Driving record OK'
		end as `Action to Take`
from Driver as D
where DrivingRecord in ('C', 'D', 'F')
;

/* ********** Question 10 ********** */
--     Id drivers are to be terminated because of their driving record, Darnell wants to include them in an additional 
--     list. Create this list for Darnell, and include all relevant employment information. 
--     Save this script as 3_DriversForTermination.

use MovinOn_Em;

select 
	D.DriverID as `Driver ID`,
    concat_ws(' ', D.DriverFirst, D.DriverLast) as `Driver's Name`,
    D.SSN as `SSN`,
    D.MileageRate as `Mileage Rate`,
    D.Review as `Review Date`,
    d.StartDate as `Hire Date`, 
	d.EndDate as `Termination Date`, 
	d.Phone as `Phone Number`,
	d.Cell as `Cell Phone`,
	d.Address as `Address`,
	d.Zip as `ZIP Code`,
	d.City as `City`,
	d.State as `State`,
    D.DrivingRecord as `Driving Record`
from driver as D
	where D.DrivingRecord in('D', 'F')
    -- and EndDate is nulls
;

/* ********** Question 11 ********** */
-- In what states or provinces do the employees reside? save as 4_EmployeeStatesProvinces 

select * from Employee;          

SELECT distinct State
FROM Employee
GROUP BY tblEmployee.State
;

-- or

select 
	distinct E.State as `Employees living in the following states`,
	case
		when State = 'WA' then 'Washington State'
        when State = 'OR' then 'Oregon State'
        when State = 'WY' then 'Wyoming State'
        else 'State not found'
	end as `Full State Name`
from employee as E
-- where State in ('WA', 'WY', 'OR')
;

/* ********** Question 12 ********** */
-- How many employees in each city? save as 5_EmployeesPerCity 

select * from Employee; 

select 
	E.City,
	count(E.EmpID) as `Number of Employees in each city`    
from Employee as E
group by E.City
order by count(E.EmpID) desc
;

/* ********** Question 13 ********** */
-- Who makes the highest salary? Select Only one. Save as 6_SalariedEmployees

select * from Employee;

SELECT EmpID, EmpFirst, EmpLast, Salary
FROM Employee
WHERE Salary Is Not Null
ORDER BY Salary DESC
limit 1
;

-- or
select
	concat_ws(' ', E.EmpFirst, E.EmpLast) as `Employee Name`,
	P.Title,
    E.Salary as `Salary`
		from Employees as E
        inner join Position as P
        on E.PositionID = P.PositionID
		where E.Salary = (select max(Salary) from Employees)
;

-- or
SELECT EmpID, EmpFirst, EmpLast, Salary,
 max(cast(E.Salary as decimal(7,2))) AS  `The highest salary`
FROM Employee
WHERE Salary Is Not Null
ORDER BY tblEmployee.Salary DESC
limit 1
;

-- or

-- Highest Paid Employee (Salary) :
select 
	max(Salary) as `Highest Salary`, 
	concat_ws(' ', EmpFirst, EmpLast) as `Employee Full Name`, 
	EmpID as `Employee ID`
from Employee
where Salary >= 0
group by EmpID
limit 1;

-- or 

-- List of Highest to Lowest (Salary) : 
select 
	max(E.Salary) as `Highest Salary`, 
    concat_ws(' ', E.EmpFirst, E.EmpLast) as `Employee Full Name`, 
	E.EmpID as `Employee ID`
from Employee as E
where E.Salary >= 0
group by E.EmpID
order by max(E.Salary) desc;

/* ********** Question 14 ********** */
-- Who is paid the lowest hourly rate? Select Only one. Save as 7_EmployeeLowWage

SELECT EmpID, EmpFirst, EmpLast, HourlyRate
FROM Employee
WHERE HourlyRate Is Not Null
ORDER BY HourlyRate asc
;

-- or
select
	concat_ws(' ', E.EmpFirst, E.EmpLast) as `Employee Name`,
		E.HourlyRate
		from Employees as E
		where E.HourlyRate = (select min(HourlyRate) from Employees)
;

-- or
SELECT EmpID, EmpFirst, EmpLast, HourlyRate,
min(cast(E.HourlyRate as decimal(5,2)))  AS  `The lowest hourly rate`
FROM Employee
WHERE HourlyRate Is Not Null
ORDER BY HourlyRate asc
;

select * from Employee;

-- Lowest Paid Employee (HourlyRate) :

select 
	min(HourlyRate) as `Lowest Hourly Rate`, 
	concat_ws(' ', EmpFirst, EmpLast) as `Employee Full Name`, 
	EmpID as `Employee ID`
from Employee
where HourlyRate >= 0
group by EmpID
order by min(HourlyRate)
limit 1;

-- List of Lowest HourlyRate to the Highest:
 
select 
	min(HourlyRate) as `Lowest Hourly Rate`, 
	concat_ws(' ', EmpFirst, EmpLast) as `Employee Full Name`, 
	EmpID as `Employee ID`
from Employee
where HourlyRate >= 0
group by EmpID
order by min(HourlyRate) asc;

/* ********** Question 15 ********** */
-- How many types of jobs are offered at MovinOn? save as 8_JobPositions


select
	count(P.PositionID) as `Number of Types of Jobs`
		from Position as P
;

-- or 
select 
	position.title as `Job Title`, 
	count(empID) as `Employees in this Position`
from employee inner join position
	on employee.positionid = position.positionid
group by `Job Title`
;

/* ********** Question 16 ********** */
-- How many people are employed in each type of job? save as 9_JobsPerPosition

select 
	P.Title as `Job Title`,
	count(E.EmpID) as `Number of Employees in this position`                  
from employee as E
	inner join Position as P
		on E.PositionID = P.PositionID
group by P.Title
order by count(E.EmpID)
;

-- or  
SELECT P.PositionID, P.Title
FROM Position as P 
	LEFT JOIN Employee as E 
		ON P.PositionID = E.PositionID
WHERE E.PositionID Is Null
;

/* ********** Question 17 ********** */
--     To prepare for a payroll, Darnell must provide a list of list of employees that includes their salary or hourly pay rate. 
--     The list must also include Social Security Numbers and employee IDs so that an outside firm can properly process the payroll. 
--     Produce an employee list that provides this information, and sort it so that it’s easy to find an employee by name. for those 
--     employees who are on a salary, the list should show their monthly wage. Save this script as 10_Payroll.

select 
	concat_ws(' ', E.EmpFirst , E.EmpLast) as `Employee name`,         
	ifNull(ROUND((E.Salary/12), 2), '') as `Monthly Wage`,
	ifNull(E.HourlyRate as `Hourly Wage`, '') as `Hourly Rate`,
	E.EmpID as `Employee ID`, 
	E.SSN as `Social Security Number`
from employee as E
order by `Employee Name` asc
;

-- or 
SELECT concat_ws(' ', E.EmpEmpLast , E.EmpFirst) as `Employee name`, E.SSN as `Social Security Number`, 
round((E.Salary/12),2) as `Monthly Wage`, E.HourlyRate as `Hourly Rate`
FROM tblEmployees as E
ORDER BY `Employee name` asc
;


/* ********** Question 18 ********** */
-- 	   Darnell sometimes needs to contact the warehouse managers, accountants, administrative assistants, and other employees at 
--     the warehouse where they work. Create a contact list that he can use to phone employees, and that contains enough information to 
--     identity employees, their positions, and their warehouses along with the warehouse phone number. Because Darnell might eventually 
--     use this list as the basis for a report, the employee’s name should appear as one full name, with the last name first. When you 
--     show this query to Darnell, he realizes that it would be more helpful if he could specify a particular warehouse before producing 
--     the list, and then see the contact information only for the employees who work in that warehouse. Create a script that meets 
--     these needs, saving it as 11_EmployeeContactByWarehouse.  

set @warehouse = 'OR-1';
SELECT E.EmpID, E.EmpLast, E.EmpFirst, P.Title,
E.WarehouseID, W.Phone
FROM Warehouse as W
  INNER JOIN (Position as P
    INNER JOIN Employee as E
      ON P.PositionID = E.PositionID)
        ON W.WarehouseID = E.WarehouseID
WHERE E.WarehouseID = @warehouse
ORDER BY E.EmpLast, E.EmpFirst
;

-- or 
-- Part 1

select
	E.WarehouseID as `Warehouse ID`,
    P.Title as `Position Title`,
	E.EmpID as `Employee ID`,
    concat_ws(', ', E.EmpLast, E.EmpFirst) as `Employee Name`,
    P.PositionID as `Position ID`,
    W.Phone as `Warehouse Phone`
from Employee as E
	inner join Warehouse as W
		on E.WarehouseID = W.WarehouseID
	inner join Position as P
		on E.PositionID = P.PositionID
order by E.WarehouseID, P.Title;


-- Part 2 | Darnell's input as a where statement for now

select
	E.WarehouseID as `Warehouse ID`,
    P.Title as `Position Title`,
	E.EmpID as `Employee ID`,
    concat_ws(', ', E.EmpLast, E.EmpFirst) as `Employee Name`,
    P.PositionID as `Position ID`,
    W.Phone as `Warehouse Phone`
from Employee as E
	inner join Warehouse as W
		on E.WarehouseID = W.WarehouseID
	inner join Position as P
		on E.PositionID = P.PositionID
where W.WarehouseID = 'WA-1' -- Darnell's input
order by W.WarehouseID, P.Title;

/* ********** Question 19 ********** */
--     MovinOn knows that having a workforce of long-term employees improves customer service and avoids the high expense of training 
--     new employees. Darnell wants to know if one warehouse is more effective at retaining employees than another. Create an employee list 
--     that calculates the number of years each employee has worked for MovinOn. Organize the list by job title within each warehouse. 
--     Save the script as 12_EmployeeLongevity.                                                                             

SELECT E.EmpID, E.EmpLast, E.EmpFirst, W.WarehouseID,
P.Title, round((datediff(Current_Date(), E.StartDate)/365), 2) AS 'Longevity In Years'
FROM Warehouse as W
  INNER JOIN (Position as P
      INNER JOIN Employee as E
        ON P.PositionID = E.PositionID)
          ON W.WarehouseID = E.WarehouseID
ORDER BY W.WarehouseID, P.Title
;

-- or 
select
	E.WarehouseID as `Warehouse ID`,
    P.Title as `Title`,
	E.EmpID as `Employee ID`,
    concat_ws(', ', E.EmpLast, E.EmpFirst) as `Name`,
	abs(year(E.StartDate) - year(ifNull(E.EndDate, curdate()))) as `Number of Years Worked`,
    E.StartDate as `Start Date`,
    E.EndDate as `End Date`
from Employee as E
	inner join Warehouse as W
		on E.WarehouseID = W.WarehouseID
	inner join Position as P
		on E.PositionID = P.PositionID
order by E.WarehouseID, P.Title
;


/* ********** Question 20 ********** */
--     Darnell learns that the manager of the Oregon warehouse has decided to give his hourly employees a 10% raise. He asks you 
--     to list all the employees who work in the Oregon warehouse, and show the old rate along the new rate after a 10% increase to their 
--     hourly pay rate. The increase applies only to hourly employees. Save the script as 13_OregonRateIncrease.

select * from Employee;                                                                            

select 
	W.WarehouseID as `Warehouse ID`, 
    W.State as `State`, 
    concat_ws(' ', E.EmpFirst , E.EmpLast) as `Full Name`, 
    E.EmpID as `Employee ID`, 
    E.HourlyRate as `Old Wage`, 
    (E.hourlyRate * 1.10) as `New Wage`
from employee as E inner join Warehouse as W
	on W.WarehouseID = E.WarehouseID
		inner join Position as P on P.PositionID = E.PositionID
where W.state = 'OR' and HourlyRate >= 0
;

-- or 
SELECT WarehouseID, EmpLast, EmpFirst, HourlyRate,
(HourlyRate * 1.1) AS Raise
FROM tblEmployee
WHERE ((WarehouseID ='OR-1') AND (HourlyRate Is Not Null))
;
