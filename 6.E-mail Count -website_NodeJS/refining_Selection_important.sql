-- INSERT INTO
--     tweets (username, tweet_content, N_favorites)
-- VALUES
--     ('Abdullah', 'Kaser is using DB', 5);
use book_shop;

SELECT
    *
from
    books;

select
    REPLACE ('kaser', 'k', 'Abood');

SELECT
    LENGTH(pages),
    pages
from
    books;

-- exercise 
SELECT
    REVERSE (
        UPPER('Why does my cat look at me with such hatred?')
    );

SELECT
    REPLACE (
        CONCAT('I', ' ', 'like', ' ', 'cats'),
        ' ',
        '-'
    );

SELECT
    REPLACE(title, ' ', '->')
from
    books;

SELECT
    author_lname as Forwards,
    REVERSE(author_lname) as Backwards
FROM
    books;

SELECT
    CONCAT (author_lname, ' ', author_lname) as 'Full Name IN Caps'
from
    books;

SELECT
    CONCAT (title, ' was released in ', released_year) as blurb
FROM
    books;

SELECT
    CONCAT(SUBSTRING(title, 1, 10), '...') as 'short titie',
    CONCAT(
        author_lname,
        ',',
        author_fname
    ) as author,
    CONCAT(stock_quantity, ' in stock') as quantity
FROM
    books;

--OR book_id = 5
SELECT
    DATABASE();

INSERT INTO
    books (
        title,
        author_fname,
        author_lname,
        released_year,
        stock_quantity,
        pages
    )
VALUES
    ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
    ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
    (
        'Lincoln In The Bardo',
        'George',
        'Saunders',
        2017,
        1000,
        367
    );

SELECT
    title,
    released_year
FROM
    books
ORDER BY
    released_year DESC
limit
    2, 3;

SELECT
    author_fname
FROM
    books
where
    author_fname like '%da%';

select * FROM books where title LIKE '%:%';

select * FROM books where author_fname LIKE '_____';

-- To select books with '%' in their title:
SELECT * FROM books
WHERE title LIKE '%\%%';

-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';

-- Perfect Exercise for REfining Selections

SELECT title FROM books WHERE title LIKE '%stories%';
 
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
 
SELECT 
    CONCAT(title, ' - ', released_year) AS summary 
FROM books ORDER BY released_year DESC LIMIT 3;
 
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
 
SELECT title, released_year, stock_quantity 
FROM books ORDER BY stock_quantity LIMIT 3;
 
SELECT title, author_lname 
FROM books ORDER BY author_lname, title;

SELECT title, author_lname FROM books ORDER BY author_lname, title;
 

SELECT title, author_lname 
FROM books ORDER BY 2,1;

SELECT title, author_lname  FROM books ORDER BY 2,1;
 
 
SELECT
    CONCAT(
        'MY FAVORITE AUTHOR IS ',
        UPPER(author_fname),
        ' ',
        UPPER(author_lname),
        '!'
    ) AS yell
FROM books ORDER BY author_lname;


SELECT COUNT(*) FROM books 
WHERE title LIKE '%the%';


CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);


CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);

CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);


INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');


CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);


ALTER Table books Drop COLUMN kaser;

ALTER TABLE books MODIFY COLUMN pages INT PRIMARY KEY;


use relationships;


CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
 -- Before using ALTER Clause
 CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT
);
 
 
 drop Table orders;
 
 -- After using AlTER Cluase
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);






