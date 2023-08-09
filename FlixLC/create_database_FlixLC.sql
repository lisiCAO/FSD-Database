/* 
Purpose: To create a database that tracks the inventory of DVDs,
provides information about the DVIDs, records rental transactions, and stores the names of the store's customers and employees.
*/
/*Script Date: August 8, 2023
Developed by: Lisi Cao*/

--  create FlixLC
create database FlixLC
;

-- switch to the Flix database

-- use database_name
use FlixLC
;

/*using the schema command to create a new database in MySQL.
Note: Creating schema in Microsoft SQL Server has different meaning.
*/

-- creating a new database using command schema 
create schema DB1
;
-- show the character set and collation in MySQl
show character set
;

show collation 
;

/* return the list of database object */
show databases
;

-- switch to FlixLC
use FlixLC
;
-- show Flix table object
show tables
;
