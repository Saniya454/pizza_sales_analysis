
select * from pizza_sales;

--Total Revenue
select round(sum(total_price),0) as totalReveneue from pizza_sales;

--Average Order Value
select round(sum(total_price)/count(distinct(order_id)),2) as avg_order from pizza_sales;

--Total Pizzas sold
select sum(quantity) as total_pizza from pizza_sales;

--Total orders
select count(distinct(order_id)) from pizza_sales;

--Average Pizzas per order
select sum(quantity)/count(distinct(order_id)) from pizza_sales;



select * from pizza_sales;

--Daily Trend of orders
select DATENAME(dw,order_date) as order_day, count(distinct(order_id)) as orders
from pizza_sales
group by DATENAME(dw,order_date);

--Hourly Trend of orders
select datepart(hour,order_time) as order_hour,count(distinct(order_id)) as orders
from pizza_sales
group by datepart(hour,order_time)
order by datepart(hour,order_time) asc;

--Percentage Sales by Pizza Category
select pizza_category as category, ((sum(total_price)*100/(select sum(total_price) as total from pizza_sales)) ) as pct
from pizza_sales
group by pizza_category;


--Percentage Sales by Pizza size
select pizza_size,sum(total_price) as total, round(((sum(total_price)*100/(select sum(total_price) as total from pizza_sales)) ),2) as pct
from pizza_sales
group by pizza_size;

--Total pizzas sold by Pizza Category
select pizza_category as category, sum(quantity) as pizzas_sold
from pizza_sales
group by pizza_category;

--Top 5 best sellers based on pizzas sold
select top 5 pizza_name,sum(quantity)
from pizza_sales 
group by pizza_name
order by count(quantity) desc;

--Top 5 worst sellers based on pizzas sold
select top 5 pizza_name,sum(quantity)
from pizza_sales 
group by pizza_name
order by count(quantity);