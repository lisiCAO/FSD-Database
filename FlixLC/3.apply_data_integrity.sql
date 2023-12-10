/* Purpose: Apply data integrity to tables (using constraints) in the Flix database */
/* Script Date: August 9, 2023
   Developed by: Lisi Cao */
   
   -- switch to the Flix database
use FlixLC
;
/* Data Integrity Types:
• Domain
• Entity 
• Referential

Constraint Types:
1) Primary Key --> pk_table_name (pk_Customers)

2) Foreign key (fk_)
	2a. between 2 tables
		fk_table_name_1_table_name_2	(fk_Orders_Customers)
    2b. between columns withing the same table   
		fk_table_name.column_name1_column_name2 (fk_Employees_EmployeeID_ReportsTo)
        
3) Unique - apply to non-primary key column 
		uq_column_name_table_name (uq_CompanyName_Customers)

4) Default
	df_column_name_table_name (df_City_Suppliers)
    
5) Check
	5a.	ck_column_name_table_name --> ck_Quantity_Orders (quantity condition) 
    5b. ck_column_name1_column_name2_table_name --> ck_DateDue_DateOut_Transactions (DateDue >= DateOut)
*/

/* create table Suppliers */
create table Suppliers
(
	SupplierID smallint not null,
    CompanyName varchar(40) not null,
    Phone varchar(15) not null
)
;

/* add a primary key to an existing table */
alter table Suppliers
-- add constraint constraint_name constraint_type 
	add constraint pk_Suppliers primary key(SupplierID asc);
    
    
/* modify a table 
1. add a new column
2. change the column
3. change the column size (length)
4. change the data type
5. drop an existing column
6. add constraint(s)
7. drop constraint(s)
*/

/* add a new column to table Suppliers */

alter table Suppliers
add column City varchar(15) not null -- after column num
;

/* create a default constraint on the City column is table Suppliers 
when the table is already exists */

alter table Suppliers
	alter column City
		set default 'Montreal'
;     

describe Suppliers
;


/* *************************************************************** */
/* add froeign key constraint(s) to the DVDs table */

/* 1. Between DVDs and MovieTypes tables */   
alter table DVDs
	-- add constraint constraint_name constraint_type [references] to the primary_key_table 
    add constraint fk_DVDs_MovieTypes foreign key (MTypeID) 
		references MovieTypes (MTypeID)
;

/* 2) Between DVDs and Studios tables */
alter table DVDs
	add constraint fk_DVDs_Studios foreign key (StudID)
		references Studios (StudID)
;

/* 3) Between DVDs and Ratings tables */    
alter table DVDs
	add constraint fk_DVDs_Ratings foreign key (RatingID)
		references Ratings (RatingID)
;        

/* 4) Between DVDs and Formats tables */
alter table DVDs
	add constraint fk_DVDs_Formats foreign key (FormID)
	references Formats (FormID)
;

/* 5) Between DVDs and Status tables */	
alter table DVDs
	add constraint fk_DVDs_Status foreign key (StatID)
	references Status (StatusID)
;

/* *************************************************************** */
/* add foreign key constraint(s) to the table DVDParticipants */

/* 1) Between DVDParticipants and DVDs tables */
alter table DVDParticipants
	add constraint fk_DVDParticipants_DVDs foreign key (DVDID)
    references DVDs (DVDID)
;
 
/* 2) Between DVDParticipants and Participants tables */
alter table DVDParticipants
	add constraint fk_DVDParticipants_Participants foreign key (PartID)
    references Participants (PartID)
;

/* 3) Between DVDParticipants and Roles tables */
alter table DVDParticipants
	add constraint fk_DVDParticipants_Roles foreign key (RoleID)
    references Roles (RoleID)
;

/* *************************************************************** */
/* add foreign key constraint(s) to the table Orders */

/* 1) Between Orders and Customers tables */
alter table Orders
	add constraint fk_Orders_Customers foreign key (CustID)
		references Customers (CustID)
;

/* 2) Between Orders and Employees tables */
alter table Orders
	add constraint fk_Orders_Employees foreign key (EmpID)
		references Employees (EmpID)
;

/* *************************************************************** */
/* add foreign key constraint(s) to the table Transactions */

/* 1) Between Transactions and Orders tables */
alter table Transactions
	add constraint fk_Transactions_Orders foreign key(OrderID)
		references Orders(OrderID)
  ;
  
/* 2) Between Transactions and DVDs tables */
alter table Transactions
	add constraint fk_Transactions_DVDs foreign key (DVDID)
		references DVDs (DVDID)
;

/* *************************************************************** */

-- set the DVD Name to unique constraint 
alter table DVDs
	add constraint uq_DVDName_DVDs unique (DVDName)
;
    
/* return the definition of table DVDs */
describe DVDs
;

show columns
from DVDs
;

/* *************************************************************** */
/* set the default value of the column NumDisks in the table DVDs to one. */
alter table DVDs
	alter column NumDisks
		set default 1
;        


/* return the table definition of DVDs */
show columns 
from DVDs
;

/* *************************************************************** */

/* set a check constraint to the table Transactions 
on Date Due to be greater than or equal to Date Out */

alter table Transactions 
	add constraint ck_DateDue_DateOut_Transactions check (DateDue >= DateOut)
;

-- remove the constraint check
alter table Transactions
	drop check ck_DateDue_DateOut_Transactions
;
    
/* return the definition of the table Transaction */
show columns 
from Transactions
;
   
describe Transactions
;
    

/* *************************************************************** */
/* return foreign key constraints in table DVDs */
select *
from information_schema.TABLE_CONSTRAINTS
where table_name = 'DVDs'
and
	constraint_type = 'FOREIGN KEY'	
and 
	table_schema = 'FlixLC'
;

-- in DVDParticipants
select *
from information_schema.TABLE_CONSTRAINTS
where tabLe_name = 'DVDParticipants'
 and 
	constraint_type = 'FOREIGN KEY'
 and 
	table_schema = 'FlixLC'
;

/* return the number of foreign key constraints in DVDs */
select count(*) as `No. of Foreign Key Constraints`
from information_schema.TABLE_CONSTRAINTS
where tabLe_name = 'DVDParticipants'
 and 
	constraint_type = 'FOREIGN KEY'
 and 
	table_schema = 'FlixLC'
;

/*  which key columns have constraints. */
select *
from information_schema.KEY_COLUMN_USAGE
where table_schema = 'FlixLC'
and constraint_schema = 'FOREIGN KEY'
;

/* count number of foreign key constraint in each table 
DVDs = 5
DVDParticipants - 3
Orders - 2
Transactions - 2
*/

/* ******************************************************** */
-- Drop a constraint 

-- remove the check constraint 
/*
alter table table_name
	drop check ck_constraint_name
;

   
-- remove the foreign key constraint 
alter table table_name
	drop foreign key fk_constraint_name
;
   
-- remove the unique constraint 
alter table table_name
	drop index uq_constraint_name
;

-- remove default constraint
alter table table_name
	alter column_name drop default
;

-- remove primary key constraint
alter table table_name
	drop primary key
;
/*