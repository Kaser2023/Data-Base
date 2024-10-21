use lms;

-- 1.Books table:
Create Table books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author Varchar(50) NOT NULL
);

-- 2.Memebers table
CREATE TABLE members (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    contact_number VARCHAR(50),
    membership_type VARCHAR(10)
);

-- 3. loans table 
CREATE Table loans (
    loan_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    taken_date TIMESTAMP NOT NULL,
    return_date TIMESTAMP NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

Insert INTO
    loans (book_id, member_id, taken_date, return_date)
VALUES
    (
        1,
        1,
        '2015-10-19 10:21:00',
        '2015-11-01 17:43:00'
    ),
    (
        2,
        2,
        '2016-11-20 10:22:00',
        '2016-12-18 16:43:00'
    ),
    (
        3,
        3,
        '2017-12-11 10:23:00',
        '2017-12-20 15:43:00'
    ),
    (
        4,
        4,
        '2018-08-30 10:20:00',
        '2018-09-01 14:43:00'
    ),
    (
        5,
        5,
        '2019-07-22 10:19:00',
        '2019-07-01 13:43:00'
    ),
    (
        6,
        6,
        '2020-05-09 10:09:00',
        '2020-06-01 12:43:00'
    ),
    (
        7,
        7,
        '2021-01-02 10:03:00',
        '2021-03-01 11:43:00'
    ),
    (
        8,
        8,
        '2022-03-15 10:01:00',
        '2022-04-01 10:43:00'
    ),
    (
        9,
        9,
        '2023-02-19 10:12:00',
        '2023-06-01 09:43:00'
    ),
    (
        10,
        10,
        '2024-01-25 10:20:00',
        '2024-05-01 19:43:00'
    );

delete from
    loans;

delete from
    books;

delete from
    members;

ALTER table
    books
ADD
    COLUMN genre VARCHAR(100);

ALTER table
    books
ADD
    COLUMN is_available BOOLEAN;

desc books;

select
    *
from
    books;

-- These questions cover a variety of SQL concepts, including SELECT statements, filtering, joining tables, 
-- and aggregate functions. Feel free to use these questions to practice and enhance your SQL skills:
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
-- 1-10: General SELECT Queries
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
-- 1.Retrieve all columns for all records in the "books" table.
-- 2.Retrieve the names of all members from the "members" table.
-- 3.Display the titles and authors of books with the genre "Science Fiction."
-- 4.Retrieve the contact numbers of members with a "Premium" membership.
-- 5.Get the total number of records in the "loans" table.
-- 6.Retrieve the distinct genres present in the "books" table.
-- 7.Display the names and membership types of members with IDs between 1 and 10.
-- 8.Retrieve the book titles and return dates for loans with a return date after '2024-01-01.'
-- 9.Display the names of members who borrowed books in 2023.
-- 10.Retrieve the IDs and titles of books that are not available.



-- 1.Retrieve all columns for all records in the "books" table.
-- 2.Retrieve the names of all members from the "members" table.


SELECT
    name
from
    members;

-- 3.Display the titles and authors of books with the genre "Science Fiction."
SELECT
    *
FROM
    books
where
    genre = 'Science Fiction';

-- 4.Retrieve the contact numbers of members with a "Premium" membership.
desc members;

select
    *
FROM
    members
where
    membership_type = 'Standard';

select
    membership_type,
    COUNT(*)
from
    members
GROUP BY
    membership_type;

-- 5.Get the total number of records in the "loans" table.
SELECT
    book_id,
    COUNT(*) as counts,
from
    loans
GROUP BY
    book_id;

SELECT
    COUNT(*)
from
    members;

-- 6.Retrieve the distinct genres present in the "books" table.
SELECT
    genre
from
    books;

SELECT
    DISTINCT(genre) as distinct_genre
from
    books;

-- 7.Display the names and membership types of members with IDs between 1 and 10.
select
    *
from
    members;

SELECT
    id,
    name,
    membership_type
from
    members
LIMIT
    10;

-- 8.Retrieve the book titles and return dates for loans with a return date after '2024-01-01.'
SELECT
    *
from
    books;

SELECT
    *
from
    loans;

Select
    id,
    title,
    return_date
FROM
    books
    JOIN loans ON books.id = loans.book_id
WHERE
    DATE(return_date) > '2024-01-01'
ORDER BY
    id DESC;

-- 9.Display the names of members who borrowed books in 2023.
Select
    name,
    taken_date
from
    members
    JOIN loans ON members.id = loans.member_id
WHERE
    YEAR(taken_date) = 2023;

SELECT
    DATABASE();

-- 10.Retrieve the IDs and titles of books that are not available.
select
    *
from
    books;

UPDATE
    books
SET
    is_available = 0
WHERE
    id BETWEEN 9
    AND 14;

UPDATE
    books
SET
    is_available = 1
WHERE
    id BETWEEN 15
    AND 20;

UPDATE
    books
SET
    is_available = 0
WHERE
    id BETWEEN 31
    AND 36;

UPDATE
    books
SET
    is_available = 0
WHERE
    id BETWEEN 18
    AND 23;

SELECT
    title,
    is_available
FROM
    books
WHERE
    is_available = 0;




--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
-- 11-20: Sorting and Limiting Results
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
-- 11.Display the names of members in alphabetical order.
-- 12.Retrieve the book titles and authors, ordered by genre.
-- 13.Display the names and contact numbers of members, limiting the results to the first 10 records.
-- 14.Retrieve the book titles and authors in reverse alphabetical order.
-- 15.Display the first 5 records from the "loans" table.
-- 16.Retrieve the names and contact numbers of members, ordered by contact number.
-- 17.Display the book titles and authors, limiting the results to the first 15 records.
-- 18.Retrieve the names and membership types of members, ordered by membership type and then by name.
-- 19.Display the first 3 records from the "books" table, ordered by book ID in descending order.
-- 20.Retrieve the book titles and authors, limiting the results to the first 20 records, ordered by title.


-- 11.Display the names of members in alphabetical order.
SELECT
    *
from
    members;

SELECT
    name
from
    members
ORDER BY
    name;

-- 12.Retrieve the book titles and authors, ordered by genre.
select
    *
from
    books;

select
    title,
    author,
    genre
from
    books
ORDER BY
    genre;

-- 13.Display the names and contact numbers of members, limiting the results to the first 10 records.
SELECT
    *
from
    members;

SELECT
    name,
    contact_number
from
    members
LIMIT
    10;

-- 14.Retrieve the book titles and authors in reverse alphabetical order.
-- 15.Display the first 5 records from the "loans" table.
-- 16.Retrieve the names and contact numbers of members, ordered by contact number.
SELECT
    name,
    contact_number
from
    members
ORDER BY
    contact_number;

-- 17.Display the book titles and authors, limiting the results to the first 15 records.
-- 18.Retrieve the names and membership types of members, ordered by membership type and then by name.
Select
    *
from
    members;

SELECT
    name,
    membership_type
from
    members
ORDER BY
    membership_type,
    name;

-- 19.Display the first 3 records from the "books" table, ordered by book ID in descending order.
-- 20.Retrieve the book titles and authors, limiting the results to the first 20 records, ordered by title.




--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

-- 21-30: Filtering and Conditional Queries

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------



-- 21.Retrieve the names and contact numbers of members with a "Standard" membership.
-- 22.Display the book titles and authors of books with "Fiction" or "Fantasy" genres.
-- 23.Retrieve the book titles and authors of books where the author's name contains "Brown."
-- 24.Display the names of members who borrowed a book with ID 3.
-- 25.Retrieve the book titles and authors for books available for loan.
-- 26.Display the book titles and authors of books borrowed in 2022.
-- 27.Retrieve the names and contact numbers of members who borrowed a book in 2024.
-- 28.Display the book titles and authors for books borrowed by members with a "Premium" membership.
-- 29.Retrieve the names of members who borrowed a book with a title containing "The."
-- 30.Display the book titles and authors for books borrowed by members with contact numbers starting with '555.'





-- 21.Retrieve the names and contact numbers of members with a "Standard" membership.
SELECT
    id,
    name,
    contact_number
FROM
    members
WHERE
    membership_type = 'Standard'
ORDER BY
    name;

-- 22.Display the book titles and authors of books with "Fiction" or "Fantasy" genres.
SELECT
    *
from
    books;

SELECT
    title,
    author,
    genre
FROM
    books
WHERE
    genre = 'Fiction'
    OR genre = 'Fantasy';

SELECT
    title,
    author,
    genre
FROM
    books
WHERE
    genre IN ('Fiction', 'Fantasy');

-- 23.Retrieve the book titles and authors of books where the author's name contains "Brown."
SELECT
    *
from
    books;

SELECT
    title,
    author
from
    books
WHERE
    author like '%Brown%';

-- 24.Display the names of members who borrowed a book with ID 3.
SELECT
    name,
    members.id as memberID,
    loans.loan_id
from
    members
    JOIN loans ON members.id = loans.member_id
WHERE
    id = 3;

SELECT
    *
from
    loans;

-- 25.Retrieve the book titles and authors for books available for loan.
SELECT
    *
from
    books;

SELECT
    id,
    title,
    author
FROM
    books
WHERE
    is_available = 1;

-- 26.Display the book titles and authors of books borrowed in 2022.
-- 27.Retrieve the names and contact numbers of members who borrowed a book in 2024.
SELECT
    *
from
    members;

desc loans;

SELECT
    name,
    contact_number,
    taken_date
from
    members
    JOIN loans ON members.id = loans.member_id
WHERE
    YEAR(taken_date) = 2024;

-- WHERE YEAR(taken_date) = 2024;





-- 28.Display the book titles and authors for books borrowed by members with a "Premium" membership.


SELECT * from members;
SELECT * from books;
SELECT * from loans;

-- Select
--     books.title as title,
--     books.author as aut,
--     loans.loan_id
--     from
--     books
--     JOIN loans ON books.id = loans.book_id


use lms;

Select  name, title, author, membership_type
from members
JOIN loans ON members.id = loans.member_id
JOIN books ON loans.book_id = books.id
WHERE membership_type = 'Premium';




-- 29.Retrieve the names of members who borrowed a book with a title containing "The."


Select  name, title
from members
JOIN loans ON members.id = loans.member_id
JOIN books ON loans.book_id = books.id
WHERE title like '%The%';



-- 30.Display the book titles and authors for books borrowed by members with contact numbers starting with '555.'


Select  name, title, author, contact_number, taken_date
from members
JOIN loans ON members.id = loans.member_id
JOIN books ON loans.book_id = books.id
WHERE contact_number like '555%';







--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

-- 31-40: Aggregation and Grouping

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

-- 31.Get the total number of books in the "books" table.
-- 32.Display the average duration (in days) books are borrowed.
-- 33.Retrieve the total count of loans for each member.
-- 34.Display the earliest and latest taken dates for loans.
-- 35.Get the count of loans for each book.
-- 36.Display the book with the most loans.
-- 37.Retrieve the count of loans for each genre.
-- 38.Display the member with the highest number of loans.
-- 39.Get the total number of loans per membership type.
-- 40.Display the book titles and the count of loans for each book.



-- 31.Get the total number of books in the "books" table.

SELECT * from books;
SELECT COUNT(*) FROM books;




-- 32.Display the average duration (in days) books are borrowed.

SELECT * from books;

SELECT * from loans;

SELECT
    COUNT(DAY(taken_date))
from loans;


-- Answer from ChatGPT
SELECT
    AVG(DATEDIFF(return_date, taken_date)) AS average_duration
FROM
    loans;



-- 33.Retrieve the total count of loans for each member.

Select * from loans;
Select * from members;

Select member_id, name, COUNT(*) AS total_loan
from members
JOIN loans ON members.id = loans.member_id
GROUP BY member_id
ORDER BY total_loan DESC;



-- 34.Display the earliest and latest taken dates for loans.

SELECT * from loans;

SELECT 
    name,
    member_id,
    taken_date,
    return_date
from loans
JOIN members ON loans.member_id = members.id
ORDER BY taken_date DESC
LIMIT 1;




-- 35.Get the count of loans for each book.

SELECT * from books;

SELECT * from loans;


SELECT book_id, title, taken_date, COUNT(book_id) as count_loan
FROM books
JOIN loans ON books.id = loans.book_id
GROUP BY taken_date, title, book_id;




-- 36.Display the book with the most loans.



SELECT book_id, title, taken_date,COUNT(book_id) as count_loan
FROM books
JOIN loans ON books.id = loans.book_id
GROUP BY taken_date, title, book_id
ORDER BY count_loan DESC
LIMIT 1;




-- 37.Retrieve the count of loans for each genre.


Select member_id, genre, COUNT(*) AS total_loan
from books
JOIN loans ON books.id = loans.member_id
GROUP BY member_id
ORDER BY total_loan DESC;


-- 38.Display the member with the highest number of loans.

Select member_id, name, COUNT(*) AS total_loan
from members
JOIN loans ON members.id = loans.member_id
GROUP BY member_id
ORDER BY total_loan DESC
LIMIT 1;



-- 39.Get the total number of loans per membership type.


SELECT * from members;

Select member_id, name, `membership_type`, COUNT(*) AS total_loan
from members
JOIN loans ON members.id = loans.member_id
GROUP BY member_id
ORDER BY total_loan DESC;


-- 40.Display the book titles and the count of loans for each book.


Select books.id, name,  title, COUNT(*) AS total_loan
from books
JOIN loans ON books.id = loans.book_id
JOIN members ON members.id = loans.member_id
GROUP BY books.id, name
ORDER BY total_loan DESC;





--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

-- 41-50: Joining Tables

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------




-- 41.Retrieve the book titles and authors along with the names of members who borrowed them.
-- 42.Display the book titles, authors, and the names of members who borrowed the books in 2023.
-- 43.Retrieve the book titles, authors, and return dates for loans, along with the member names.
-- 44.Display the book titles and authors along with the membership types of members who borrowed them.
-- 45.Retrieve the book titles and authors along with the total count of loans for each book.
-- 46.Display the names of members, contact numbers, and the titles of books they borrowed.
-- 47.Retrieve the book titles, authors, and return dates, along with the names and membership types of members who borrowed them.
-- 48.Display the book titles and authors along with the total count of loans for each genre.
-- 49.Retrieve the book titles and authors along with the earliest and latest taken dates for loans.
-- 50.Display the names of members, contact numbers, and the total count of loans for each member.




-- 41.Retrieve the book titles and authors along with the names of members who borrowed them.


Select books.id, name,  title, author
from books
JOIN loans ON books.id = loans.book_id
JOIN members ON members.id = loans.member_id
GROUP BY books.id, name
ORDER BY books.id;



-- 42.Display the book titles, authors, and the names of members who borrowed the books in 2023.
-- 43.Retrieve the book titles, authors, and return dates for loans, along with the member names.
-- 44.Display the book titles and authors along with the membership types of members who borrowed them.
-- 45.Retrieve the book titles and authors along with the total count of loans for each book.


SELECT * from members;

Select books.id, name,  title, author, `membership_type`, taken_date , COUNT(*) as total_count
from books
JOIN loans ON books.id = loans.book_id
JOIN members ON members.id = loans.member_id
WHERE taken_date = 2023
GROUP BY books.id, name, membership_type
ORDER BY books.id;




-- 46.Display the names of members, contact numbers, and the titles of books they borrowed.

SELECT
    name,
    contact_number,
    title,
    COUNT(*)
FROM
    members
JOIN loans ON members.id = loans.member_id
JOIN books ON books.id = loans.book_id
GROUP BY title, name, contact_number



-- 47.Retrieve the book titles, authors, and return dates, along with the names and membership types of members who borrowed them.


SELECT
    title,
    author,
    taken_date,
    name,
    membership_type,
    return_date
from books
JOIN loans ON books.id = loans.book_id
JOIN members ON members.id = loans.member_id


-- 48.Display the book titles and authors along with the total count of loans for each genre.




SELECT 
    genre,
    COUNT(genre)
from books
GROUP BY  genre;


-- 49.Retrieve the book titles and authors along with the earliest and latest taken dates for loans.

SELECT 
    title,
    author,
    taken_date
FROM books
JOIN loans ON books.id = loans.book_id
ORDER BY taken_date DESC;


-- 50.Display the names of members, contact numbers, and the total count of loans for each member.



SELECT 
    name,
    contact_number,
    COUNT(*)
FROM members
JOIN loans ON members.id = loans.member_id
GROUP By name, contact_number








