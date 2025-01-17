DROP DATABASE node_project;

create database node_project;

use node_project;

SELECT
    database();

select
    1 + 3;

CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

show tables;

desc users;

INSERT INTO
    users (email)
VALUES
    ('Katie34@yahoo.com'),
    ('Tunde@gmail.com');

select
    *
from
    users;

SELECT
    email as earliest
FROM
    users
Order By
    created_at DESC
limit
    2;

-- Solutions To 500 Users Exercises
-- Challenge 1
SELECT
    DATE_FORMAT(MIN(created_at), "%M %D %Y") as earliest_date
FROM
    users;

-- Challenge 2
SELECT
    *
FROM
    users
WHERE
    created_at = (
        SELECT
            Min(created_at)
        FROM
            users
    );

-- Challenge 3
SELECT
    Monthname(created_at) AS month,
    Count(*) AS count
FROM
    users
GROUP BY
    month
ORDER BY
    count DESC;

-- Challenge 4
SELECT
    Count(*) AS yahoo_users
FROM
    users
WHERE
    email LIKE '%@yahoo.com';

-- Challenge 5
SELECT
    CASE
        WHEN email LIKE '%@gmail.com' THEN 'gmail'
        WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'other'
    end AS provider,
    Count(*) AS total_users
FROM
    users
GROUP BY
    provider
ORDER BY
    total_users DESC;