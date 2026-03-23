SELECT * FROM pizza_sales;

-----------------------
-- Daily Sales Trend --
-----------------------
SELECT 
	DATENAME(WEEKDAY, order_date) [Day Name],
	ROUND(SUM(quantity), 2) AS [Total Orders]
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date)
ORDER BY [Day Name];

------------------------
-- Hourly Sales trend --
------------------------
SELECT 
	DATEPART(HOUR, order_time) [Day Hour],
	ROUND(SUM(quantity), 2) AS [Total Orders]
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY [Total Orders] DESC;

-------------------------------------------
-- Percentage of Sales by Pizza category --
-------------------------------------------
SELECT 
	pizza_category,
	SUM(total_price) Sales_per_category,
	(SELECT SUM(total_price) FROM pizza_sales) Total_Pizza_Sales,
	CONCAT(ROUND((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales )), 4) * 100, '%') AS Percetage
FROM pizza_sales
GROUP BY pizza_category;

-------------------------------------------
-- Percentage of Sales by Pizza category --
-------------------------------------------
SELECT 
	pizza_size,
	SUM(total_price) Sales_per_size,
	(SELECT SUM(total_price) FROM pizza_sales) Total_Pizza_Sales,
	CONCAT(ROUND((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)), 4) * 100, '%') AS Percetage
FROM pizza_sales
-- WHERE DATEPART(quarter, order_date = 1) --filter
GROUP BY pizza_size;

-----------------------------------------
-- Total Pizzas sold by Pizza Category --
-----------------------------------------
SELECT 
	pizza_category,
	SUM(quantity) Total_Pizzas_per_Category
FROM pizza_sales
GROUP BY pizza_category;

---------------------------------------------
-- Top 5 Best Sellers by Total Pizzas Sold --
---------------------------------------------
SELECT TOP 5
	pizza_name,
	SUM(quantity) TotalPizzasSold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TotalPizzasSold DESC;

---------------------------------------------
-- Top 5 Worst Sellers by Total Pizzas Sold --
---------------------------------------------
SELECT TOP 5
	pizza_name,
	SUM(quantity) TotalPizzasSold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TotalPizzasSold ASC;

