use walmart;
show tables;

select * from sales LIMIT 50;


select time from sales;


ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- For this to work turn off safe mode for update
-- Edit > Preferences > SQL Edito > scroll down and toggle safe mode
-- Reconnect to MySQL: Query > Reconnect to server
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);




SELECT 
        date,
        month_name,
        `Product line`,
        `Unit price`,
        Total,
        `gross income`,
        `gross margin percentage`,
        cogs
from 
    sales
ORDER BY month_name;



select 
    product_line,
    total 
from sales
GROUP BY Product_line, total
ORDER BY Product_line DEsc;


