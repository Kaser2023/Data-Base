-- Drop database shirts_db;

Create Database shirts_db;
use shirts_db;

Select database();
-- drop table shirts;

CREATE TABLE shirts (
shirt_id INT PRIMARY KEY AUTO_INCREMENT,
article VARCHAR (50),
color VARCHAR (50),
shirt_size VARCHAR (50),
last_worn INT
);

desc shirts;

-- Did not work the SELECT COLUMNS here
-- SELECT COLUMNS from shirts;

INSERT INTO shirts (article, color, shirt_size, last_worn) 
VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

Select * from shirts;


-- 1. add Purble row 
Insert 
INTO
 shirts
 (article,
 color, 
 shirt_size, last_worn)
Values  ('Polo shop', 'Purple', 'M', 50);

-- 2. Select just rows of article and colors
select article, color from shirts;


-- 3. Select all without shirt id
select article, color, shirt_size, last_worn from shirts;

-- 4. UPDATE polo shirts the Size to L
UPDATE shirts SET shirt_size = 'L' where article = 'polo shirt';

-- 5. update last ron to 0
UPDATE shirts SET last_worn = 0  where last_worn = 15;

-- 6. update white shirts -> size to XS , color to OFF White
UPDATE shirts SET shirt_size = 'XS', color = 'OFF White'  where color = 'white';

-- 7. Delete old shirts last worn 200 days
DELETE from shirts where last_worn = 200;

-- 8. Delete all tonk tops
Delete From shirts where article = 'tank top';

-- 9. Delete all shirts -> Empty 
-- Delete from shirts;

-- 10. Drop the table













