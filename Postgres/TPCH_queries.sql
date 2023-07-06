
-- Query 1: Calculate the total revenue for each line item in a specified date range.
SELECT l_orderkey, SUM(l_extendedprice*(1-l_discount)) AS revenue
FROM lineitem
WHERE l_shipdate BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD'
GROUP BY l_orderkey;

-- Query 2: Find the top 10 customers with the highest revenue in a given year.
SELECT c_custkey, c_name, SUM(l_extendedprice*(1-l_discount)) AS revenue
FROM customer
JOIN orders ON c_custkey = o_custkey
JOIN lineitem ON l_orderkey = o_orderkey
WHERE extract(year from o_orderdate) = 'YYYY'
GROUP BY c_custkey, c_name
ORDER BY revenue DESC
LIMIT 10;

-- Query 3: Retrieve the average quantity and extended price of all orders with a specific discount range.
SELECT AVG(l_quantity) AS avg_quantity, AVG(l_extendedprice) AS avg_extended_price
FROM lineitem
WHERE l_discount BETWEEN 0.05 AND 0.07;

-- Query 4: Determine the number of distinct customers who have placed orders in a specified month.
SELECT COUNT(DISTINCT c_custkey) AS number_of_customers
FROM customer
JOIN orders ON c_custkey = o_custkey
WHERE extract(month from o_orderdate) = 'MM';

-- Query 5: Identify the total amount of revenue generated per brand in a given container type.
SELECT p_brand, SUM(l_extendedprice*(1-l_discount)) AS revenue
FROM part
JOIN lineitem ON l_partkey = p_partkey
WHERE p_container = 'YOUR_CONTAINER_TYPE'
GROUP BY p_brand;

-- Query 6: