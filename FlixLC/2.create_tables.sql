/* Purpose: Creating table objects in Flix databse */
/* Script Date: August 8, 2023
	Developed by: Lisi Cao 
    */

-- switch to the Flix databse
use FlixLC
;

/* Partial Syntax to create table object 
create table table_name
(
	column_name data_type constrint(s),
    ...
)
where constraint defines the business rules: null, not null, primary key (pk),
foreign key (fk), default (df),check(ck), unique(uq)
*/

/* character data type:
char(length) -fixed length
varchar(length) -variable length
*/

/* ***** Table NO.1 - Customers   ***** */
create table Customers 
(
	Custid smallint primary key not null,
    Custfn varchar(20) not null,
    Custmn varchar(20) null, -- option (null is the default value)
    Custln varchar(20) not null
    )
;

-- return the definition of the table Customers
show columns
from Customers
;

-- or using describe command
describe Customers
;

-- primary key constraint 
-- [CONSTRAINT <constraint name>] PRIMARY KEY (<column name[{,<column name>}...])

-- creating lookup tables
/* ******* Table NO. 2 - Roles    **** */ 
create table Roles
(
	RoleID varchar(4) not null,
    RoleDescrip varchar(30) not null,
    -- constraint constraint_name constraint_type
    constraint pk_Roles primary key(RoleID asc)
)
;

-- return the definition of the table Roles 
show tables
;

show columns
from Roles
;

describe Roles 
;

/* ******* Table NO. 3 - MovieTypes    **** */ 
create table MovieTypes 
(
	MTypeID varchar(4) not null, -- required
    MTypeDescrip varchar(30) not null, 
    constraint pk_MovieTypes primary key clustered (MTypeID asc)
)
;
/* ******* Table NO. 4 - Studios    **** */ 
create table Studios
(
	StudID varchar(4) not null, 
    StudDescript varchar(40) not null,
    constraint pk_Studios primary key clustered(StudID asc)
)
;
/* set the size of the StudID to char(4) */
alter table Studios
	modify column StudID char(4) not null
;


/***** Table No. 5 - Ratings *****/ 
create table Ratings
(
	RatingID varchar(2) not null,
    RatingDescrip varchar(30) not null,
    constraint pk_Ratings primary key (RatingID asc)
)
;

/* modify the column RatingID size (length) to varchar(4) in table Ratings */
-- alter object_type object_name 
alter table Ratings
	modify column RatingID varchar(4) not null
;

/*
rename a column:
alter table table_name
	rename column old_column_name to new_column_name
    
    alter table roles 
	rename column RoleIDD to RoleID    
    
-- modify column
   alter table table_name
	change column old_column_name new_column_name data_type constraint
;
*/

/***** Table No. 6 - Formats *****/ 
create table Formats
(
	FormID char(2) not null,
    FormDescrip varchar(15) not null,
    constraint pk_Formats primary key (FormID asc)
)
;

/* remove the primary key constraint
alter table table_name
	drop primary key
*/

/* add a primary key to a table
alter table table_name
	add constraint constraint_name contraint_type */
/* alter table Formats
	add constraint pk_Formats primary key (FormID asc)
;
*/

/* remove the primary key constraint 
alter table a time_name
drop primary key
*/

/***** Table No. 7 - Status *****/ 
create table Status	
(
	StatusID char(2) not null,
    StatDescrip varchar(20) not null,
    constraint pk_Status primary key (StatusID asc) 
)
;

/***** Table No. 8 - Participants *****/ 
create table Participants
(
	PartID smallint auto_increment not null, -- auto-generated number assigned to a new participant
   	PartFN varchar(20) not null,
    PartMN varchar(20) null,
    PartLN varchar(20) not null,
    RoleID varchar(4) null, -- to be removed later 
    constraint pk_Participants primary key clustered (PartID asc)
)
;  

/* remove the column RoleID from table Participants */
alter table Participants
	drop column RoleID
;
    
/***** Table No. 9 - DVDs *****/ 
create table DVDs
(
	DVDID smallint not null auto_increment, -- auto-generated number assigned to a new DVD
    DVDName varchar(60) not null,
    NumDisks tinyint not null,
    YearRlsd year not null,
    MTypeID varchar(4) not null, -- foreign key references to (MoviTypes)
    StudID char(4) not null, -- Foreign Key references to (Studios)
    RatingID varchar(4) not null, -- Foreign Key references to (Ratings)
    FormID char(2) not null, -- Foreign Key references to (Formats)
    StatID char(2) not null, -- Foreign Key references to (Status)    
    constraint pk_DVDs primary key clustered (DVDID asc)
)
;

/* change the data type of the column YearRlsd to char(4) */
alter table DVDs
	modify column YearRlsd char(4) not null
;
    
   
/***** Table No. 10 - DVDParticipants *****/ 
create table DVDParticipants
(
	DVDID smallint not null, -- Foreign Key references to (DVDs)
    PartID smallint not null, -- Foreign Key references to (Participants)
    RoleID varchar(4) not null, -- Foreign Key references to (Roles)
    constraint pk_DVDParticipants primary key clustered 
		(
			-- composite primary key
            DVDID asc,
            PartID asc,
            RoleID asc
		)
)
;        

-- return the definition of the table DVDParticipants
describe DVDParticipants
;

/***** Table No. 11 - Employees *****/ 
create table Employees
(
	EmpID smallint not null auto_increment,
    EmpFN varchar(20) not null,
    EmpMN varchar(20) null,
    EmpLN varchar(20) not null,
    constraint pk_Employees primary key (EmpID asc)
)
;	

/***** Table No. 12 - Orders *****/ 
create table Orders
(
	OrderID int auto_increment not null,
    CustID smallint not null, -- foreign key references to (Customers table)
    EmpID smallint not null, -- foreign key references to (Employees table)   
    constraint pk_Orders primary key (OrderID asc)
)
;
    
/***** Table No. 13 - Transactions *****/     
drop table if exists Transactions
;

create table Transactions 
(
	TransID int not null auto_increment, 
    OrderID int not null, -- foreign key references to (Orders table)
    DVDID smallint not null, -- foreign key references to (DVDs table)
    DateOut date not null, -- we can use datetime data type
    DateDue date not null, -- when the DVD must be returned 
    DateIn date null, -- when the DVD is actually returned
    constraint pk_Transactions primary key (TransID asc)
)
;
/* ********************************************** */
/* rename database objects */
create table ABC
(
	column1 char(4) not null,
    column1_Descrip varchar(20) not null,
    constraint pk_ABC primary key (column1 asc)
)
;

/* rename a column
Syntax:
	alter table table_name
		rename column old_colum_name to new_column_name
        
or
	alter table table_name 
				change old_column_name new_colum_name data_type[size]
*/                
    
alter table ABC
	rename column column1 to ABCDE
;    

/* return the information about the base tables in mySQL server */
select * 
from information_schema.TABLES
where table_schema = 'FlixLC'
and table_type = 'BASE TABLE'
;

/* How many tables in database FlixLC */
select count(table_name) as `No. of tables in database Flix` -- 'No. of tables in database Flix'
from information_schema.TABLES
where table_schema = 'FlixLC'
and table_type = 'BASE TABLE'
;

/* return the definition of the table Customers */
select *
from information_schema.COLUMNS
where table_schema = 'FlixLC'
and table_name = 'Customers'
;

show columns
from Customers
;
