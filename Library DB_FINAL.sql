create database Library_test_6
Use Library_test_6

alter table library_branch alter column branch_id INT PRIMARY KEY NOT NULL IDENTITY (0,1)
drop table library_branch

select * from library_branch
select * from publisher
select * from books
select * from book_authors
select * from book_copies
select * from borrower
select * from book_loans

CREATE TABLE library_branch (
		branch_id INT PRIMARY KEY NOT NULL IDENTITY (2,1),
		branch_name VARCHAR(50) NOT NULL,
		branch_address VARCHAR(60) NULL,
	);

	CREATE TABLE publisher (
		publisher_name VARCHAR (50) PRIMARY KEY NOT NULL,
		pub_address VARCHAR(50) NOT NULL,
		pub_phone VARCHAR(40),
	);

	CREATE TABLE books (
		book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_title VARCHAR(50) UNIQUE NOT NULL,
		publisher_name VARCHAR(50) NOT NULL CONSTRAINT publisher_name FOREIGN KEY REFERENCES publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE,
	);

	CREATE TABLE book_authors (
		book_id INT NOT NULL CONSTRAINT book_id FOREIGN KEY REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		author_name VARCHAR(50) NOT NULL,
	);

	CREATE TABLE book_copies (
		book_id INT NOT NULL CONSTRAINT book_title FOREIGN KEY REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		branch_id INT NOT NULL CONSTRAINT branch_id FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		number_copies INT NOT NULL,
	);

	CREATE TABLE borrower (
		card_num INT PRIMARY KEY NOT NULL IDENTITY (0,1),
		borrower_name VARCHAR(50) NOT NULL,
		borrower_address VARCHAR(50) NOT NULL,
		borrower_phone VARCHAR(50) NOT NULL
	);

	CREATE TABLE book_loans(
		book_id INT NOT NULL CONSTRAINT loaned_book FOREIGN KEY REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		branch_id INT NOT NULL CONSTRAINT book_location FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		card_num INT NOT NULL CONSTRAINT borrower_id FOREIGN KEY REFERENCES borrower(card_num) ON UPDATE CASCADE ON DELETE CASCADE,
		date_out varchar (10) NULL,
		date_due varchar (10) NULL
	);

	
	/******************************************************
	 * Populate Tables
	 ******************************************************/
		INSERT INTO publisher
		(publisher_name, pub_address,pub_phone)
		VALUES 
		('Henry Holt and Co.','120 Broadway New York, NY 10271','384-576-2899'),
		('Gallery Books','1230 6th Ave, New York, NY 10020','(212) 698-7243'),
		('Anchor','1745 Broadway New York, NY 10019','(212) 940-7390'),
		('DAW Books','1746 Broadway New York, NY 10019','(212) 940-7390'),
		('Tor Fantasy','120 Broadway New York, NY 10271','384-576-2899'),
		('CreateSpace','120 Broadway New York, NY 10271','384-576-2899'),
		('Ace Publisher','120 Broadway New York, NY 10271','384-576-2899'),
		('Harper Voyager','120 Broadway New York, NY 10271','212-207-7000'),
		('Bantam','1745 Broadway New York, NY 10007','(212) 940-7390'),
		('Crown','1745 Broadway New York, NY 10019','(212) 940-7390'),
		
		('Harper','195 Broadway New York, NY 10007','212-207-7000'),
		('William Morrow Paperbacks','120 Broadway New York, NY 10271','384-576-2899'),
		('Vintage','1745 Broadway, New York, NY 10019','(212) 782-9000'),
		('Broadway Books','120 Broadway New York, NY 10271','384-576-2899'),
		('New World Library','14 Pamaron Way Novato, CA 94949','415-884-2100'),
		('SkyHorse','306 W 37th St #11, New York, NY 10018','(212) 643-6816'),
		('Del Rey','195 Broadway New York, NY 10007','212-207-7000'),
		('Little,Brown','1290 Avenue of the Americas New York, NY 10104','(212) 364-1100'),
		('Crown2','1745 Broadway New York, NY 10019','(212) 940-7390'),
		('Ethan Ellenberg','155 Suffolk St.,New York, NY 10002','(212) 431-4554')
	;

	INSERT INTO books
		(book_title, publisher_name)
		VALUES 
		('The Lost Tribe', 'Henry Holt and Co.'),
		('Pet Cemetary', 'Gallery Books'),
		('The Shining', 'Anchor'),
		('Name of the Wind', 'DAW Books'),
		('The Way of Kings', 'Tor Fantasy'),
		('Moby Dick', 'CreateSpace'),
		('Dune','Ace Publisher'),
		('Princes in Amber', 'Harper Voyager'),
		('Game of Thrones','Bantam'),
		('The Martian', 'Crown'),

		('Long Earth', 'Harper'),
		('American Gods', 'William Morrow Paperbacks'),
		('The Fabric of the Cosmos', 'Vintage'),
		('A Short History of Nearly everything', 'Broadway Books'),
		('The Hero with a Thousand Faces', 'New World Library'),
		('The Mueller Report', 'Skyhorse'),
		('Red Rising','Del Rey'),
		('The Tipping Point', 'Little,Brown'),
		('Ready Player One','Bantam'),
		('We Are Legion(We are Bob)', 'Ethan Ellenberg')
	;
	SELECT * FROM books;
	
	INSERT INTO borrower
		(borrower_name, borrower_address,borrower_phone)
		VALUES 
		('Person_1', '1 downing street', '555-5551'),
		('Person_2', '2 downing street', '555-5552'),
		('Person_3', '3 downing street', '555-5553'),
		('Person_4', '4 downing street', '555-5554'),

		('Person_5', '5 downing street', '555-5555'),
		('Person_6', '6 downing street', '555-5556'),
		('Person_7', '7 downing street', '555-5557'),
		('Person_8', '8 downing street', '555-5558'),

		('Person_9', '9 downing street', '555-5559'),
		('Person_10', '10 downing street', '555-5560'),
		('Person_11', '11 downing street', '555-5561'),
		('Person_12', '12 downing street', '555-5562'),

		('Person_13', '13 downing street', '555-5563'),
		('Person_14', '14 downing street', '555-5564'),
		('Person_15', '15 downing street', '555-5565'),
		('Person_16', '16 downing street', '555-5566')
;
INSERT INTO library_branch 
		(branch_name, branch_address)
		VALUES 
		('Sharpstown', '512 N Killingsworth St, Portland, OR 97217'),
		('Beaverton Branch', '12375 SW 5th St, Beaverton, OR 97005'),
		('Central Branch', '801 SW 10th Ave, Portland, OR 97205'),
		('PSU Branch', '1875 SW Park Ave, Portland, OR 97201'),
		('Downtown Branch', '2300 NW Thurman St, Portland, OR 97210')
;
INSERT into book_loans
		(date_out, date_due,book_id,branch_id,card_num)
		VALUES
		('6/17/2019','6/27/2019','1','5','1'),('6/18/2019','6/28/2019','17','4','12'),('6/11/2019','6/21/2019','5','5','2'),('6/20/2019','6/30/2019','7','5','15'),('6/21/2019','7/1/2019','2','4','2'),('6/22/2019','7/2/2019','14','6','3'),('6/8/2019','6/18/2019','15','3','1'),('6/2/2019','6/12/2019','1','2','3'),('6/25/2019','7/5/2019','3','6','11'),('6/26/2019','7/6/2019','12','4','10'),
		('6/27/2019','7/7/2019','11','5','9'),('6/28/2019','7/8/2019','10','3','7'),('6/29/2019','7/9/2019','18','5','6'),('6/30/2019','7/10/2019','9','4','1'),('7/1/2019','7/11/2019','8','2','2'),('7/2/2019','7/12/2019','1','3','3'),('7/23/2019','8/2/2019','16','3','1'),('7/4/2019','7/14/2019','6','3','3'),('5/10/2019','5/20/2019','17','5','5'),('7/6/2019','7/16/2019','19','4','1'),
		('7/15/2019','7/25/2019','18','4','6'),('7/8/2019','7/18/2019','4','2','3'),('4/10/2019','4/20/2019','17','2','2'),('7/10/2019','7/20/2019','16','3','2'),('7/19/2019','7/29/2019','3','3','7'),('7/28/2019','8/7/2019','18','3','3'),('7/13/2019','7/23/2019','4','2','2'),('8/8/2019','8/18/2019','6','2','9'),('8/10/2019','8/20/2019','16','4','2'),('9/1/2019','9/11/2019','20','4','5'),
		('8/28/2019','9/7/2019','6','5','5'),('7/29/2019','8/8/2019','15','5','4'),('8/20/2019','8/30/2019','5','3','11'),('8/10/2019','8/20/2019','19','3','6'),('8/31/2019','9/10/2019','1','5','9'),('8/22/2019','9/1/2019','19','4','7'),('8/26/2019','9/5/2019','14','4','13'),('7/29/2019','8/8/2019','3','3','10'),('8/27/2019','9/6/2019','3','3','10'),('9/2/2019','9/12/2019','20','2','12'),
		('9/1/2019','9/11/2019','13','3','15'),('9/1/2019','9/11/2019','1','2','15'),('8/26/2019','9/5/2019','5','5','13'),('7/24/2019','8/3/2019','2','4','13'),('8/1/2019','8/11/2019','7','5','7'),('7/2/2019','7/12/2019','7','6','6'),('7/30/2019','8/9/2019','5','2','9'),('8/30/2019','9/9/2019','8','5','7'),('8/26/2019','9/5/2019','20','3','5'),('8/30/2019','9/9/2019','17','3','10'),
	    ('8/11/2019','8/21/2019','7','2','11'),('8/27/2019','9/6/2019','9','4','3'),('8/22/2019','9/1/2019','10','4','7'),('7/21/2019','7/31/2019','14','5','6'),('6/29/2019','7/9/2019','11','6','9')
	;    /***************55 Records total with a 10 day loan period******/
	
	select * FROM book_loans

	INSERT INTO book_authors
	(book_id,author_name)
	VALUES
	('1','Edward Marriot'),
	('2','Stephen King'),
	('3','Stephen King'),
	('4','Patrick Rothfuss'),
	('5','Brandon Sanderson'),
	('6','Herman Melville'),
	('7','Frank Herbert'),
	('8','Roger Zelazny'),
	('9','George R.R. Martin'),
	('10','Andy Weir'),
	('11','Terry Pratchett'),
	('12','Neil Gaiman'),
	('13','Brian Greene'),
	('14','Bill Bryson'),
	('15','Joseph Campbell'),
	('16','Robert Mueller III'),
	('17','Pierce Brown'),
	('18','Malcolm Gladwell'),
	('19','Ernest Cline'),
	('20','Dennis Taylor')
;
	
	
	INSERT INTO book_copies
		(book_id,branch_id,number_copies)
	VALUES

	/**2-Sharpston*/(1,2,2),(2,2,3),(3,2,2),(4,2,2),(5,2,2),(6,2,2),(7,2,2),(8,2,3),(9,2,3),(10,2,3),
					(11,2,3),(12,2,2),(13,2,2),(14,2,4),(15,2,5),(16,2,3),(17,2,4),(18,2,3),(19,2,6),(20,2,3),
	/**3-Beaverton*/(1,3,2),(2,3,3),(3,3,2),(4,3,3),(5,3,2),(6,3,2),(7,3,2),(8,3,2),(9,3,2),(10,3,4),
					(11,3,2),(12,3,2),(13,3,3),(14,3,2),(15,3,2),(16,3,4),(17,3,2),(18,3,2),(19,3,3),(20,3,4),
	/**4-CENTRAL**/	(1,4,3),(2,4,3),(3,4,3),(4,4,3),(5,4,2),(6,4,2),(7,4,2),(8,4,5),(9,4,2),(10,4,3),
					(11,4,3),(12,4,3),(13,4,3),(14,4,3),(15,4,4),(16,4,3),(17,4,3),(18,4,2),(19,4,2),(20,4,2),
	/*5-PSU Branch*/(1,5,2),(2,5,2),(3,5,2),(4,5,2),(5,5,2),(6,5,2),(7,5,2),(8,5,3),(9,5,3),(10,5,3),
					(11,5,2),(12,5,3),(13,5,4),(14,5,3),(15,5,3),(16,5,2),(17,5,3),(18,5,4),(19,5,2),(20,5,4),
	/**6-Downtown**/(1,6,3),(2,6,2),(3,6,4),(4,6,3),(5,6,2),(6,6,2),(7,6,3),(8,6,4),(9,6,3),(10,6,4),
					(11,6,2),(12,6,4),(13,6,3),(14,6,4),(15,6,3),(16,6,2),(17,6,3),(18,6,4),(19,6,3),(20,6,3)
	;


	/******** Stored Procedures 1 through 7 ***********/

Use Library_test_6

/******** 1 # Copies of Lost tribe in sharpstown***********/

Create PROCEDURE dbo.uspFindBooks(
     @title AS VARCHAR(50),
	 @branch_name AS VARCHAR(50)
)
AS
BEGIN
    SELECT
        number_copies,branch_name,book_title
    FROM 
        library_branch
		Inner JOIN book_copies ON library_branch.branch_id = book_copies.branch_id
		Inner Join books ON books.book_id= book_copies.book_id
    WHERE
        book_title LIKE '%' + @title + '%' AND
		branch_name  LIKE '%' + @branch_name + '%'
    ORDER BY
        book_title;
END;

EXEC dbo.uspFindBooks
		 @title = 'The Lost Tribe',
		 @branch_name =	'Sharpstown';

/******** 2 # Copies of Lost Tribe  in each branch***********/

   Create PROCEDURE dbo.uspFindCopies(
    @title AS VARCHAR(50)
)
AS
BEGIN
    SELECT
        number_copies,branch_name,book_title
    FROM 
        library_branch
		Inner JOIN book_copies ON library_branch.branch_id = book_copies.branch_id
		Inner Join books ON books.book_id= book_copies.book_id
    WHERE
        book_title LIKE '%' + @title + '%'
    ORDER BY
       number_copies;
END;
EXEC dbo.uspFindCopies
		 @title = 'The Lost Tribe';

/******** 3   Names of Borrowers with no books out***********/

	Create PROCEDURE dbo.uspInActive
   
AS
BEGIN
	Select 
		borrower_name 
	From 
		borrower
		left join book_loans ON book_loans.card_num=borrower.card_num
	Where
		book_loans.card_num is NULL
	ORDER BY
        borrower_name;
	END;

EXEC dbo.uspInActive

/******** 4   sharpstown due date***********/

	 Create PROCEDURE dbo.uspFindDue(
    @date_due varchar (10),
	@branch_name VARCHAR (50)
	
)
AS
BEGIN
    SELECT
        book_title,borrower_name,borrower_address
    FROM 
        book_loans
		Inner JOIN library_branch ON library_branch.branch_id = book_loans.branch_id
		Inner JOIN books ON books.book_id= book_loans.book_id
		Inner JOIN borrower ON borrower.card_num = book_loans.card_num
    WHERE
        date_due LIKE '%' + @date_due + '%' AND
		branch_name  LIKE '%' + @branch_name + '%'
    ORDER BY
        borrower_name;
END;

EXEC dbo.uspFindDue
     @date_due = '9/11/2019',  /******** no records on todays date in sharpstown. Also the due dates were entered as strings so I could not use the date function. ***********/
	 @branch_name = 'Sharpstown';

/******** 5   retrieve branch name and # books on-loan***********/

Create PROCEDURE dbo.uspNumberCheckedOut

AS
    SELECT
		library_branch.branch_name,
		COUNT(*)
		Book_Tally
	FROM
		book_loans
		Inner JOIN library_branch ON book_loans.branch_id= library_branch.branch_id
	GROUP BY
		library_branch.branch_name;
END;

EXEC dbo.uspNumberCheckedOut

/******** 6	retrieve info on delinquent borrowers***********/

Create PROCEDURE dbo.uspBorrowLimit

AS
    SELECT
        borrower.borrower_name,
		COUNT(*) Checked_Out
    FROM 
        book_loans
		Inner JOIN borrower ON book_loans.card_num= borrower.card_num
    GROUP BY
		borrower.borrower_name
	Having
		Count(*) > 5
	Order By
		Checked_Out;
END;

EXEC dbo.uspBorrowLimit

/******** 7   title and # of copies at central***********/
Create PROCEDURE dbo.uspFindAuthor(
    @Author AS VARCHAR(50),
	 @branch_name AS VARCHAR(50)
)
AS
BEGIN
    SELECT
        number_copies,branch_name,book_title,author_name
    FROM 
        library_branch
		Inner JOIN book_copies ON library_branch.branch_id = book_copies.branch_id
		Inner Join books ON books.book_id= book_copies.book_id
		Inner Join book_authors ON book_authors.book_id = books.book_id
    WHERE
        author_name LIKE '%' + @Author + '%' AND
		branch_name  LIKE '%' + @branch_name + '%'
    ORDER BY
        number_copies;
END;

EXEC dbo.uspFindAuthor
    @Author = 'Stephen King',
	 @branch_name = 'Central';