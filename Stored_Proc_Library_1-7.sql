
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
		Count (*);
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







