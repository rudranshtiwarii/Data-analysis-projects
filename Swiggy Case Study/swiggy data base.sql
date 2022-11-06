-- SWIGGY CASE STUDY.
USE swiggy;
-- 1)Find customers who have never ordered
SELECT name FROM users 
WHERE user_ID NOT IN (SELECT user_ID FROM orders);	

-- 2) Average Price/dish
SELECT * FROM food;
SELECT f_name, AVG(price) AS 'Avg price'
FROM menu JOIN food 
ON menu.f_id = food.f_id
GROUP BY menu.f_id;

-- 3)Find the top restaurant in terms of the number of orders for a given month
SELECT restaurants.r_name , count(*) AS 'month' 
FROM orders JOIN restaurants ON orders.r_id = restaurants.r_ID	
WHERE monthname(date) LIKE 'july' 
GROUP BY restaurants.r_ID
ORDER BY count(*) DESC;


-- 4)restaurants with monthly sales greater than x for
SELECT r.r_name, sum(amount) AS revenue FROM restaurants r JOIN orders o
ON r.r_ID = o.r_id
WHERE monthname(date) LIKE 'june'
GROUP BY o.r_id
HAVING revenue > 500;


-- 5) Show all orders with order details for a particular customer in a particular date range
SELECT order_ID, r_name,cuisine,date FROM orders o 
JOIN restaurants r ON o.r_id = r.r_ID
WHERE user_ID = (SELECT user_ID FROM users WHERE name LIKE 'Vartika') AND (date > '2022-05-10' AND date < '2022-06-11');


-- 6) Find restaurants with max repeated customers

SELECT COUNT(*) FROM orders GROUP BY r_id;

SELECT r.r_name,COUNT(*)AS 'loyal customers'
FROM (
SELECT r_id,user_id,COUNT(*) AS 'visits'
FROM orders
GROUP BY r_id,user_id
HAVING visits>1 
)t
JOIN restaurants r
ON r.r_id=t.r_id
GROUP BY t.r_id
ORDER BY loyal customers DESC LIMIT 1