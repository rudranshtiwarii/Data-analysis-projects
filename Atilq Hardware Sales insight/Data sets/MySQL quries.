USE sales;
-- 1. show all customers record.
SELECT * FROM customers;

-- 2. show total number of customers
SELECT COUNT(*) FROM customers;

-- 3. Show transactions for Chennai market (market code for chennai is Mark001 ans(51210)
SELECT sum(sales_qty) FROM transactions WHERE market_code = "Mark001";

-- 4. Show distrinct product codes that were sold in chennai
SELECT	distinct (product_code),customer_code FROM transactions WHERE market_code = "Mark001";

-- 5. Show transactions where currency is US dollars
SELECT * FROM transactions WHERE currency = "USD"

-- 6. show transactions in 2020 join by date table 
SELECT transactions.*,date.* FROM transactions INNER JOIN date ON transactions.order_date = date.date
WHERE date.year = 2020;

-- 7. Show total revenue in year 2020,
SELECT sum(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date = date.date
WHERE date.year = 2019;

-- 8. Show total revenue in year 2020, January Month,
SELECT sum(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date = date.date
WHERE date.year = 2020 AND month_name = "January";

-- 9.Show total revenue in year 2020 in Chennai
SELECT sum(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date = date.date
WHERE date.year = 2020 AND market_code = "Mark001";


-- 10. Null values in the sales amount data set.
SELECT count(*) FROM transactions WHERE  currency = 'USD' ;
