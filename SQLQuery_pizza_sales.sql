-- TOTAL REVENUE
SELECT sum(total_price) FROM [Swayanshudb].[dbo].[pizza_sales$]
-- 817860.049999993

--AVERAGE ORDER VALUE

SELECT sum(total_price)/count(distinct order_id) as avg_order_value  FROM [Swayanshudb].[dbo].[pizza_sales$]

--38.3072622950816

--TOTAL PIZZA'S SOLD

select sum(quantity) as total_pizza_sold FROM [Swayanshudb].[dbo].[pizza_sales$]

--49574

--TOTAL ORDERS

select count(distinct order_id) as total_orders FROM [Swayanshudb].[dbo].[pizza_sales$]

--21350

--AVERAGE PIZZA'S PER ORDER

select cast(sum(quantity)/count(distinct order_id) as decimal(10,2)) as average_pizza_per_order FROM [Swayanshudb].[dbo].[pizza_sales$]

--2.32196721311475 before casting the value
--2.32 after casting the value

--CHART REQUIREMENTS
--DAILY TREND FOR TOTAL ORDERS
select datename(DW, order_date) as DAY ,  count(distinct order_id) as orders FROM [Swayanshudb].[dbo].[pizza_sales$] group by datename( DW,order_date)

--MONTHLY TREND FOR TOTAL ORDERS

select datename(MONTH, order_date) as MONTH ,  count(distinct order_id) as orders FROM [Swayanshudb].[dbo].[pizza_sales$] group by datename( MONTH,order_date)

--PERCENTAGE OF SALES BY PIZZA CATEGORY

select sum(total_price) as Total_Revenue, pizza_category,(sum(total_price)/(select sum(total_price) FROM [Swayanshudb].[dbo].[pizza_sales$])*100) 
as percentage_of_sales FROM [Swayanshudb].[dbo].[pizza_sales$] group by pizza_category


--PERCENTAGE OF SALES BY PIZZA SIZE

select sum(total_price) as Total_Revenue, pizza_size,(sum(total_price)/(select sum(total_price) FROM [Swayanshudb].[dbo].[pizza_sales$])*100) 
as percentage_of_sales FROM [Swayanshudb].[dbo].[pizza_sales$] group by pizza_size

--TOTAL PIZZAS SOLD BY PIZZA CATEGORY

select pizza_category,sum(quantity) FROM [Swayanshudb].[dbo].[pizza_sales$] group by pizza_category


--TOP 5 SELLERS BY REVENUE,TOTAL_QUANTITY,TOTAL ORDERS

--TOP 5 BEST PIZZA BY REVENUE(have set the order by to descending order as it will show the total_revenue from higher to lower)

select top 5 pizza_name,sum(total_price) as Total_revenue FROM [Swayanshudb].[dbo].[pizza_sales$]  group by pizza_name order by sum(total_price) desc

--BOTTOM 5 PIZZA BY REVENUE

select top 5 pizza_name,sum(total_price) as Total_revenue FROM [Swayanshudb].[dbo].[pizza_sales$]  group by pizza_name order by sum(total_price) 

--TOP 5 BEST PIZZA BY QUANTITY(have set the order by to descending order as it will show the Total_quantity from higher to lower)

select top 5 pizza_name,sum(quantity) as Total_quantity FROM [Swayanshudb].[dbo].[pizza_sales$]  group by pizza_name order by sum(quantity) desc

--BOTTOM 5 PIZZA BY QUANTITY

select top 5 pizza_name,sum(quantity) as Total_quantity FROM [Swayanshudb].[dbo].[pizza_sales$]  group by pizza_name order by sum(quantity) 

--TOP 5 BEST PIZZA BY Total_orders(have set the order by to descending order as it will show the total_orders from higher to lower)

select top 5 pizza_name,count(distinct order_id) as Total_orders FROM [Swayanshudb].[dbo].[pizza_sales$]  group by pizza_name order by count(distinct order_id) desc

--BOTTOM 5 PIZZA BY TOTAL_ORDERS

select top 5 pizza_name,count(distinct order_id) as Total_orders FROM [Swayanshudb].[dbo].[pizza_sales$]  group by pizza_name order by count(distinct order_id) 
