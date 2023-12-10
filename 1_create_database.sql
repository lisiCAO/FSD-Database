/* Creating Databases (database definition)
create object_type object_name
where object_taype: database, table, view, stored procedure, function, ...
CREATE { DATABASE | SCHEMA} (IF NOT EXISTS) db_name
[create_option] ...

crete_option: [DEFAULT] {
CHARACTER SET [=] charset_name 
| COLLATE [=] collation_name 
| ENCRYPTION [=] { 'Y' | 'N' }
}

<database definition> :: =
CREATE DATABASE [IF NOT EXISTS] <database_name>
[[DEFAULT] CHARACTER SET <character_set_name>]
[DEFAULT] COLLATE <collation name>
*/

-- create a booksales database
create database db1
;

-- create a db2 databae
create database db2
default character set latin1
default collate latin1_bin
;

-- create a new db3 database using shcema clause
create schema db3
;

/* to modify a database object:
alter object_type object_name
*/

/* to modify the character set and collate
ALTER DATABASE <database name>
[[DEFAULT[ CHARACTER SET <character set name>]
[[DEFAULT] COLLATE <collation name>]
*/

-- change the character set to latin1 for db1 database
alter database db1
character set latin1
;

/* delete (drop) a database from the server
DROP DATABASE [IF EXISTS] <databse name>
*/
drop database db1
;

-- delete more than one database t a time 
drop database db2, db3
;

