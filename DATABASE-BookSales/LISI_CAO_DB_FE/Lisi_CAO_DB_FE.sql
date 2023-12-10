/* Database Final Exam Data - August 2023
FSD-10
Your Name: Lisi Cao (2387145)

• THIS IS A CLOSE BOOK EXAM. 
• Save this file as Your_Name_DB_FE. 
• Submit only this script with all your answers.
• The Exam duration is 3 hours.

Create the BookSales database that contains five tables: 
1) Authors, 
2) AuthorBook, 
3) Publishers, 
4) BookPublisher, and 
5) Books.

The Books table includes four columns: 
	• BookID, 
	• BookTitle, 
	• Copyright, and 
	• PubID. 
The primary key in the Books table is made up of the BookID column and no other columns.

The publisher listed in the Publishers table can publish one or more books, and 
that publisher is identified by the value in the foreign key column (PubID).

The AuthorBook table includes an FK1 and an FK2 because there are two foreign keys. 
The numbers are used because some tables might include multiple foreign keys in which 
one or more of those keys are made up of more than one column. The foreign keys in the 
AuthorBook table participate in one-to-many relationships with the Authors table and the Books table.

There are generally four steps that you should follow when developing a data model:
❑ Identifying the potential entities that will exist in the database
❑ Normalizing the data design to support data storage in the identified entities
❑ Identifying the relationships that exist between tables
❑ Refining the data model to ensure full normalization


The first step in developing a data model is to identify the objects (entities and attributes) 
that represent the type of data stored in your database. The purpose of this step is to name 
any types of information, categories, or actions that require the storage of data in the database. 
*/

/* ***** Write your answer under each question. ***** */

/* ******************************************** */
/* 1. Create the BookSales_Your_FirstName database that  */
CREATE DATABASE booksales_lisi
;
GO

/* ******************************************** */
/*switch to booksales database */
USE booksales_lisi
;
GO

/* ******************************************** */
/* 2. Creating Schema and Table objects.  */
/* NOTE: Do not apply foerign key constraints at this time,
you will add them later in step 4. Implementing Data 
Integrity by Using Constraints. */

-- choose your own schema names and transfer tables to them.
CREATE SCHEMA book
;
GO

CREATE SCHEMA auth
;
GO

CREATE SCHEMA pub
;
GO

/* ***** 2.1. create the Publishers table  ***** */

-- display the definition of the table Publishers

EXEC sp_help 'Publishers'
;
GO

-- create the table Publishers
CREATE TABLE pub.Publishers
(
    PubID SMALLINT NOT NULL,
    PubName VARCHAR(40) NOT NULL,
    PubCity VARCHAR(20) NOT NULL,
    PubState CHAR(2) NOT NULL,
    CONSTRAINT PK_Publishers PRIMARY KEY (PubID)
);
GO

/* ******************************************** */

/* ***** 2.2. create the Authors table  ******/

-- create the table Authors
CREATE TABLE auth.Authors
(
    AuthorID SMALLINT NOT NULL,
    AuthorFirstName VARCHAR(20) NOT NULL,
    AuthorMiddleName VARCHAR(20) NULL,
    AuthorLastName VARCHAR(20) NOT NULL,
    Born DATE NOT NULL,
    Died DATE NULL,

    CONSTRAINT PK_Authors PRIMARY KEY (AuthorID)
)
;
GO

/* ******************************************** */
/* ***** 2.3. create the Books table  ***** */
CREATE TABLE book.Books
(
    BookID SMALLINT NOT NULL,
    BookTitle VARCHAR(60) NOT NULL,
    copyRight SMALLINT NOT NULL CHECK (copyRight >= 1900 AND copyRight <= YEAR(GETDATE())),
    PubID SMALLINT NOT NULL,
    CONSTRAINT PK_Books PRIMARY KEY (BookID)
);
GO



/* ******************************************** */
/* ***** 2.4. create the AuthorBook table  ***** */
CREATE TABLE book.AuthorBook
(
    AuthorID SMALLINT NOT NULL,
    BookID SMALLINT NOT NULL,
    CONSTRAINT PK_AuthorBook PRIMARY KEY (AuthorID, BookID)
)
;
GO

/* ******************************************** */
/* ***** 2.5. create the BookPublisher table  ***** */
CREATE TABLE book.BookPublisher
(
    BookID SMALLINT NOT NULL,
    PubID SMALLINT NOT NULL,
    CONSTRAINT PK_BookPublisher PRIMARY KEY (BookID, PubID)
)
;
GO

/* ***** 3. Modify the definition of the following objects using scripts: */

/* ***** 3.1 delete the column PubID from the table Books */
ALTER TABLE book.Books
DROP COLUMN PubID
;
GO

/* ***** 3.2. Publisher: add publisher country ***** */
ALTER TABLE pub.Publishers
ADD PubCountry VARCHAR(20) NOT NULL
;
GO

/* ***** 3.3. Author: add the author address (address, city, state, postalcode, country) **** */
ALTER TABLE auth.Authors
ADD AuthorAddress VARCHAR(100) NOT NULL,
    AuthorCity VARCHAR(20) NOT NULL,
    AuthorState CHAR(2) NOT NULL,
    AuthorPostalCode VARCHAR(5) NOT NULL,
    AuthorCountry VARCHAR(20) NOT NULL
;   
GO

/* ******************************************** */
/* 4. Implementing Data Integrity by Using Constraints
/* ******************************************** */

-- Foreign key constraint(s)
-- 4.1. Between AuthorBook and Authors tables
ALTER TABLE book.AuthorBook
ADD CONSTRAINT FK_AuthorBook_Authors
FOREIGN KEY (AuthorID) REFERENCES auth.Authors(AuthorID)
;
GO

-- 4.2. Between AuthorBook and Books tables
ALTER TABLE AuthorBook
ADD CONSTRAINT FK_AuthorBook_Books
FOREIGN KEY (BookID) REFERENCES Books(BookID)
;
GO

-- 4.3. Between BookPublisher and Books tables
ALTER Table BookPublisher
ADD CONSTRAINT FK_BookPublisher_Books
FOREIGN KEY (BookID) REFERENCES Books(BookID)
;
GO

-- 4.4. Between BookPublisher and Publishers tables
ALTER TABLE BookPublisher
ADD CONSTRAINT FK_BookPublisher_Publishers
FOREIGN KEY (PubID) REFERENCES Publishers(PubID)
;
GO

/* ******************************************** */
-- 4.5. set the default author middle name to null 
ALTER TABLE auth.Authors
ADD CONSTRAINT DF_Authors_AuthorMiddleName
DEFAULT NULL FOR AuthorMiddleName
;
GO

-- 4.6. set the book title as a unique constraint 
ALTER TABLE Books
ADD CONSTRAINT UQ_Books_BookTitle
UNIQUE (BookTitle)
;
GO

-- 4.7. add a check constraint to the Author table on Died 
-- column to be greater than the Born column 
ALTER TABLE auth.Authors
ADD CONSTRAINT CK_Authors_Died
CHECK (Died IS NULL OR Died < Born)
;
GO

/* ******************************************** */
/*
5. Populate all tables with data through script data entry 
(using insert into/ values and bulk insert).
Data files are attached to the exam as csv files.
*/

/* *** NOTE: Only write the script - no need to physically import the data *** */
-- load data from external .cvs file 

-- 5.1. Publishers table
BULK INSERT pub.Publishers
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-final_exam/LISI_CAO_DB_FE/Book_Sales_Sample_Data/publishers.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
;
GO

/* ******************************************** */
-- 5.2. Authors table
BULK INSERT auth.Authors
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-final_exam/LISI_CAO_DB_FE/Book_Sales_Sample_Data/authors.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
;
GO


/* ******************************************** */
-- 5.3. AuthorBook table
BULK INSERT auth.AuthorBook
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-final_exam/LISI_CAO_DB_FE/Book_Sales_Sample_Data/author_book.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
;
GO


/* ******************************************** */
-- 5.4. BookPublisher table
BULK INSERT pub.BookPublisher
FROM '/Users/caolisi/Desktop/FSD-Database/FSD-Database/DATABASE-final_exam/LISI_CAO_DB_FE/Book_Sales_Sample_Data/book_publisher.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
)
;
GO
/* ******************************************** */



/* ******************************************** */
/* ***** 6. Manipulate Data ***** */
	
/* 6.1. Retrieve all author id and prevent duplicated values in the Author Book table */
SELECT DISTINCT authorid
FROM auth.AuthorBook
;
GO

/* 6.2. Find out how many authors published more than 5 books */
SELECT count(authorid) AS 'Number of Authors'
FROM auth.AuthorBook
GROUP BY authorid
HAVING count(bookid) > 5
;
GO

/* 6.3. Find out how many books were published by each publisher */
SELECT PubName, count(bookid) AS 'Number of Books'
FROM pub.BookPublisher bp
JOIN pub.Publishers p
ON bp.pubid = p.pubid
GROUP BY PubName
;
GO

/* 6.4. Return author full name and full address */
SELECT 
    AuthorLastName + ', ' + AuthorFirstName + ', ' + COALESCE(AuthorMiddleName, '') AS 'Author Name',
    AuthorAddress + ', ' + AuthorCity + ', ' + AuthorState + ', ' + AuthorPostalCode + ', ' + AuthorCountry AS 'Author Address'
FROM auth.Authors;
GO



/* 6.5. create a view, BooksAuthorsView, that finds out author full name, book title and publisher name. */
CREATE VIEW BooksAuthorsView
AS
SELECT 
    AuthorLastName + ', ' + AuthorFirstName + ', ' + COALESCE(AuthorMiddleName, '') AS 'Author Name',
    BookTitle,
    PubName
FROM auth.Authors a

JOIN auth.AuthorBook b
ON a.authorid = b.authorid

JOIN pub.BookPublisher bp
ON b.bookid = bp.bookid

JOIN pub.Publishers p
ON bp.pubid = p.pubid
;
GO

/* ************************************************************ */
 
 Other database objects
 
 -- 7.1. create function getBookListFn, that retrieves the list of books written by an author knowing the author id.
CREATE FUNCTION getBookListFn
(
    @AuthorID SMALLINT
)
RETURNS TABLE
AS
RETURN
(
    SELECT BookTitle
    FROM auth.Authors a
    JOIN auth.AuthorBook ab
        ON a.authorid = ab.authorid
    JOIN pub.BookPublisher bp
        ON ab.bookid = bp.bookid
    JOIN pub.Publishers p
        ON bp.pubid = p.pubid
    WHERE a.authorid = @AuthorID
)
;
GO

-- 7.2.  create a stored procedure, getBookPublishedByYearPr, that takes one parameter (copyright), and provides all books published in a specific year.
CREATE PROCEDURE getBookPublishedByYearPr
(
    @copyRight SMALLINT
)
AS
BEGIN
    SELECT BookTitle
    FROM Books
    WHERE copyRight = @copyRight
END
;
GO

 /* ************************************************************ */