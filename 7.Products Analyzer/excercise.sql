use KxP_store;
--use kaser;

--select * from n
--Excercise 1

--SELECT name, 
	--unit_price,
	--(unit_price * 1.1 ) AS 'new unit'
--from products


--SELECT * 
--from customers
--WHERE points > 2000
--where state != 'va'
--where birth_date > '1980-01-01'

--Excersice 2

--SELECT * 
--FROM orders
--where order_date >'2018-01-01'



--AND, OR, NOT Operators -> So important 

--Important -> using  AND, OR
--Select * 
--from customers
--where birth_date > '1990-01-01' 
	--  OR
	  -- points > 1000 
	   --AND state = 'va'

-- SO SO SO important -> using NOT
--SELECT * from customers
--WHERE NOT ( birth_date > '1990-01-01' OR points > 1000 )


----Excersice 3

--SELECT * from order_items
--where order_id = 6 
	--  AND  ( quantity *  unit_price > 30) 




-- IN Operator 
--Select * from customers
--WHERE state = 'VA'OR state = 'FL' OR state = 'GA'

-- TO minmize this line :
--WHERE state IN ('VA', 'FL', 'GA')

--Using NOT with  IN
--WHERE state NOT IN ('VA', 'FL', 'GA')

----Excersice 4

--Select * from products
--where quantity_in_stock IN (49, 38, 72)



-- BWTWEEN operator

--SEleCT * from customers
--where points >= 1000 AND points <= 3000
--The main purpose of Between is to shorten the process
--where points BETWEEN 1000 and 3000


----Excersice 4

--select * from customers
--where birth_date between '1990-01-01' AND '2000-01-01'


----Excersice 5

--select * from customers
--where   address LIKE   '%trail%' 
	--	or address like '%avenue%' 

--where   address LIKE   '%trail%' 
	--	or address like '%avenue%' 
		--OR phone like '%9'

--where  phone like '%9'
--where  phone NOT like '%9'


----Excersice 6 -- so important Excercise

--select * from customers
--1)
--where first_name like 'elka' 
	 -- or first_name like 'ambur'

-- 2)
--where last_name like '%ey' 
	  --or last_name like '%on'

-- 3)
--where last_name like 'my%'
	-- or last_name like '%se%'

-- 4)
--where last_name like '%b[ru]%'


-- Is NULL Operator

--select * from customers
--where phone is not null


----Excersice 7

--select * from orders
--where shipped_date is null



-- ORDER BY Clause 

--select * from customers
--ORDER BY first_name -- From Smaller to  Greater 
--ORDER BY first_name  DESC -- From Greater to Smaller

--ORDER BY  state DESC, first_name DESC



----Excersice 8

--select *, (unit_price*quantity) as 'Total Price' -- to Add new Column with name 'total price' ot total_price
--from order_items
--where order_id = 2
--order by (quantity * unit_price) DESC
--order by [tOtal pRice] DESC -- the same like above statement -- or -> total_price  without [ ] 




-- OFFSET and FETCH

--select * from  customers
--order by customer_id
--OFFSET 0 rows FETCH next 5 rows only


----Excersice 9
--select * from customers
--order by points DESC
--OFFSET 0 rows FETCH next 3 rows only



-- The most important Part 
-- the JOIN operation and INNER, OUTER [ Left, Right, FULL ], and Cross JOIN, and Self Join

--SELECT order_id,o.customer_id , first_name, last_name
--from orders o
--INNER JOIN customers  c
	--ON  o.customer_id = c.customer_id


----Excersice 10

select order_id , oi.product_id, quantity,  oi.unit_price 
from order_items oi
join products p
ON oi.product_id = p.product_id


