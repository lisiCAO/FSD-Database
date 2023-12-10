/* Purpose: create query to show data */
/* Author : Lisi Cao */

/* in order to answer any question about the data:
Read the question and then
1. determine the object(s), table (base table) or view (virtual table)
2. determine the column(s) from each object
3. run the script
4. define criteria(s), condition(s), and then run them one after another
5) group the data
6) eliminate the duplicate data
*/

/* Partial Syntax
select * (all)|<comma seperator column_list>|distinct| 
from object_name 
where condition 
limit number_of_rows
*/
use flixlc;
/* 1. list all dvd id, dvd name, and year released */
select DVDID as ID, DVDName as Name, YearRlsd as Year
from DVDs
;

/* 2. list all dvd id, and dvd name released in 2019 */ 
select DVDID as ID, DVDName as Name, YearRlsd as Year
from DVDs
where YearRlsd = '2019'
;

/* 3. list all dvd id and dvd names that have more than one disk */
select DVDID as ID, DVDName as Name, NumDisks
from DVDs
where NumDisks > 1
;

/* General syntax:
 select [table_name].column_name, [table_name].column_name, ...
 from table_name
 where [table_name].column_name = expression
 */
 
 /* 4. using aliases [as], re-write the previous script */
 select DVDs.DVDID as ID, DVDs.DVDName as Name, DVDs.NumDisks
from DVDs
where DVDs.NumDisks > 1
;
 
 /* 5. Using aliases, change the column names in the result set of the Employees table. 
 For example, EmpID -> Employee ID, EmpFN -> First Name, and so on. */
 Select E.EmpID as 'Employee ID', E.EmpFN as 'Fisrt Name',  E.EmpMN as 'Middle Name', E.EmpLN as 'Last Name'
 from Employees as E
 ;
 
 
 /* 6. return the employee full name as a single string. String concatenation: + | &  */
 Select E.EmpID as 'Employee ID', (E.EmpFN + ' ' + E.EmpMN + ' '+ E.EmpLN) as Name
 from Employees as E
 ;
 
 
  /* 7. using concat(str1, str2, ... strN) 
 Syntax: CONCAT(string_value1, string_value2 [, string_valueN])
 */
 select E.EmpID as 'Employee ID', concat(E.EmpFN,' ', E.coalesce(E.EmpMN,''),' ', E.EmpLN) as ' Name'
 from Employees as E
 ;
 
  /* 8. using the coalesce function 
  COALESCE() function is used for returning the first non-null 
  value in a list of expressions. If all the values in the 
  list evaluate to NULL, then the COALESCE() function 
  returns NULL. The COALESCE() function accepts one parameter 
  which is the list which can contain various values
 */
 select E.EmpID as 'Employee ID', concat(E.EmpFN,' ', coalesce(E.EmpMN,''),' ', E.EmpLN) as ' Name'
 from Employees as E
 ;

 
  /* 9. using concat_ws() function - apply to SQL Server version 2017 and above:
 concat_ws(seperator, argument1, argument2, ..., [, argumentN])
 */
   select concat_ws(' ', E.EmpFN, coalesce(E.EmpMN,''), E.EmpLN) as 'Employee Name'
 from Employees as E
 ;
 
 /* 10. return the rating id (NO Duplicate Values) from the DVDs table */
 select distinct D.DVDName as 'Name',  D.RatingID  as 'Rating' 
 from DVDs as D
 ;
 /* 11. return only five records from the table DVDs */
 select *
 from DVDs
 order by rand()
 limit  5
 ;
 
 
 /* 12. return the dvd names and movie type id for the status value S1 */
 select D.DVDName as 'Name', D.MtypeID as 'Type ID'
 from DVDs as D
 where D.statID = 'S1'
 ;
 
 
 /* 13. return the dvd names and movie type id for the status values S1, S2, and S4 */
 
 select D.DVDName as 'Name', D.MtypeID as 'Type ID', D.StatID
 from DVDs as D
 where D.StatID in ('S1', 'S2', 'S4')
 ;
 
/* 14. return the DVD name and the movie type id for the status id = S2, 
and the rating id equals NR or G
*/

select D.DVDID as 'DVD ID', D.DVDName as 'DVD Name', D.MtypeID as 'Movie Type', D.RatingID as 'Ratings', D.StatID as 'Status ID'
from DVDs as D
where D.StatID = 'S2'
and D.RatingID in ('NR', 'G')
;

/*
OR logical operator
false 	false	-> false
false 	true -> true
true 	false -> true
true	true -> true

AND
false 	false	-> false
false 	true -> false
true 	false -> false
true	true -> true
*/