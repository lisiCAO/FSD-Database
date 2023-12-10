/* Purpose: Creating table objects in Flix database */

/* Script Date: August 03, 2023
   Developed by: Khattar Daou
*/


-- switch to Flix database 
-- Syntax: use database_name;
/*create database */

create database KDFlix22H2
;

use KDFlix22H2
;

/* create table object - Partial syntax:
		create table table_name
		(
			column_name data_type constraint(s),
   			column_name data_type constraint(s),
			...
			column_name data_type constraint(s),

		)

    where constraint defines the business rules: not not, null, 
    primary key (pk_), default (df_), check (ck_), unique (uq_), foreign key (fk_)        
*/ 


/* character data type:
char(length) - fixed length
varchar(length) - variable length
*/

/* *****	Table No. 1 - Customers 	***** */    
create table Customers
(
	CustID smallint auto_increment not null primary key,
    CustFN varchar(20) not null,
    CustMN varchar(20) null,
    CustLN varchar(20) not null
)
;    



/* creating the lookup tables */
/* *****	Table No. 2 - Roles 	***** */
create table Roles
(
RoleID varchar(4) primary key not null,
RoleDescrip varchar(30) not null
)
;


/* *****	Table No. 3 -  MovieTypes	***** */ 
create table MovieTypes
(
MTypeID varchar(4) primary key not null,
MTypeDescrip varchar(30) not null
)
;

/* *****	Table No. 4 -  	Studios ***** */
create table Studios
(
StudID varchar(4) primary key not null,
StudDescrip varchar(40) not null
)
;

/* *****	Table No. 5 -  	 Ratings ***** */
create table Ratings
(
RatingID varchar(4) primary key not null,
RatingDescrip varchar(30) not null
)
;

/* *****	Table No. 6 - Formats 	 ***** */
create table Formats
(
FormID char(2) primary key not null,
FormDescrip varchar(15) not null
)
;

/* *****	Table No. 7 -  	Status ***** */
create table Status
(
StatID char(3) primary key not null,
StatDescrip varchar(20) not null
)
;

/* *****	Table No. 8 - Participants 	 ***** */
create table Participants 
(
PartID smallint auto_increment primary key not null, -- atuto-generated number 
PartFN varchar(20) not null,
PartMN varchar(20),
PartLN varchar(20) not null,
RoleID varchar(4) null -- to be removed later
/* constraint pk_Participants primary key clustered (PartID asc) */
)
;
/* remove the column RoleID from table Participants */
alter table Participants 
	drop column RoleID
;

/* *****	Table No. 9 - DVDs 	 ***** */
create table DVDs
(
DVDID smallint auto_increment primary key not null,
DVDName varchar(60) not null,
NumDisks tinyint,
YearRisd year,
MTypeID varchar(4) not null, -- foreign key reference (MovieTpyes)
StudID varchar(4) not null, -- foreign key reference (Studios)
RatingID varchar(4) not null, -- foreign key reference (Ratings)
FormID varchar(2) not null, -- foreign key reference (Formats)
StatID char(3) not null, -- foreign key reference (Status)
foreign key (MTypeID) references MovieTypes(MTypeID),
foreign key (StudID) references Studios(StudID),
foreign key (RatingID) references Ratings(RatingID),
foreign key (FormID) references Formats(FormID),
foreign key (StatID) references Status(StatID)
)
;

/* *****	Table No. 10 -  DVDParticipants	 ***** */
create table DVDParticipants
(
DVDID smallint not null,
PartID smallint not null,
RoleID varchar(4) not null,
primary key (DVDID, PartID, RoleID)
)
;
/* *****	Table No. 11 - Employees  ***** */
create table Employees
(
EmpID smallint auto_increment primary key not null,
EmpFN varchar(20) not null,
EmpMN varchar(20),
EmpLN varchar(20) not null
)
;
/* *****	Table No. 12 - Orders 	 ***** */
create table Orders
(
OrderID int auto_increment primary key not null,
CustID smallint not null,
EmpID smallint,
foreign key (CustID) references Customers(CustID),
foreign key (EmpID) references Employees(EmpID)
)
;
/* *****	Table No. 13 - Transactions 	 ***** */
create table Transactions
(
TransID int auto_increment primary key not null,
OrderID int not null,
DVDID smallint not null,
DateOut date not null,
DateDue date,
DateIn date not null,
foreign key (OrderID) references orders(OrderID),
foreign key (DVDID) references DVDs(DVDID)
)
;

