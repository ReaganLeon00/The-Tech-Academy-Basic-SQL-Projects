CREATE DATABASE db_Library

CREATE TABLE LIBRARY_BRANCH(
BranchID  INT PRIMARY KEY NOT NULL IDENTITY (1,1),
BranchName VARCHAR (50),
Address VARCHAR (50));


CREATE TABLE Publisher(
PublisherName VARCHAR (50) PRIMARY KEY NOT NULL,
Address VARCHAR (100),
Phone VARCHAR (25));

CREATE TABLE Books(
BookId INT PRIMARY KEY NOT NULL IDENTITY (10,10),
Title VARCHAR (50),
PublisherName VARCHAR (50) NOT NULL CONSTRAINT fk_publsiherName REFERENCES Publisher(PublisherName) ON 
	UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE Book_Authors(
BookId INT NOT NULL CONSTRAINT fk_BookId REFERENCES Books(BookId) ON 
	UPDATE CASCADE ON DELETE CASCADE,
AuthorName VARCHAR (50));

SELECT * FROM Book_Authors

CREATE TABLE Book_Copies(
BookId INT NOT NULL CONSTRAINT fk_BookId2 REFERENCES Books(BookId) ON 
	UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_BranchID REFERENCES LIBRARY_BRANCH(BranchID) ON 
	UPDATE CASCADE ON DELETE CASCADE,
Number_Of_Copies INT);

CREATE TABLE Book_Loans(
BookId INT NOT NULL CONSTRAINT fk_BookId3 REFERENCES Books(BookId) ON 
	UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_BranchID2 REFERENCES LIBRARY_BRANCH(BranchID) ON 
	UPDATE CASCADE ON DELETE CASCADE,
CardNo INT NOT NULL CONSTRAINT fk_CardNo REFERENCES Borrower(CardNo) ON 
	UPDATE CASCADE ON DELETE CASCADE,
DateOut DATE,
DateDue DATE);

CREATE TABLE Borrower(
CardNo INT PRIMARY KEY NOT NULL IDENTITY (100,1),
Name VARCHAR (100),
Address VARCHAR(100),
Phone VARCHAR (20));



