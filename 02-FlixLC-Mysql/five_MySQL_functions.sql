/* Purpose: Find five MySQL functions */
/* Author: Lisi Cao */
use flixlc
;
/* 1. date format */
select date_format(DateOut, '%M %D %Y') as 'formatted date'
from Transactions;

/* 2. count the number of available dvd  */
select count(*) as 'DVD available number'
from DVDs
join status on status.StatusID = DVDs.StatID
where StatDescrip = 'available'
;

/* 3. calculate average days for rent  */
select avt(datediff(DateIn, DateOut))as 'Average Days for Rent'
from Transactions
where DateOut IS NOT NULL;
;

/* 4. find lastest release dvd  */
select max(YearRlsd) AS 'latest_release'
from DVDs
;
/* 5. length of dvd name*/
select DVDName, length (DVDName) as 'length of Name'
from DVDs
; 

select * 
from Transactions;