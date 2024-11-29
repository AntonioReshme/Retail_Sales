create database sql_project_p1;

drop table if exists retail_sales;
create table retail_sales(
transactions_id	int primary key,
sale_date date,
sale_time time,	
customer_id int,
gender varchar(15),
age int,
category varchar(15),	
quantity int,
price_per_unit float,	
cogs float,
total_sale float
);
select*from retail_sales;
limit 10;
-- Data Cleaning
select count(*)from retail_sales
select*from retail_sales
where 
 transactions_id is null
 or
 sale_date is null
 or
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 age is null
 or
 category is null
 or
 quantity is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null
 --
 
 delete from retail_sales
 where 
 transactions_id is null
 or
 sale_date is null
 or
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 age is null
 or
 category is null
 or
 quantity is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null
 
 -- Data exploration
 --How many sales we have?
 select count(*)as total_sales from retail_sales;
 --How many unique customers we have?
 select count(distinct customer_id)as total_sales from retail_sales;
 --How many unique category?
 select distinct category from retail_sales;
 
 --Data Analysis and Business key problems and answers
 --(1)Retrieve all columns for sales made for '2022-11-05'
 select*from retail_sales
 where sale_date='2022-11-05'
 --(2)Retrieve all transactions where the category is clothing and the quantity sold is more than 4 in the month of nov-2022
 select*from retail_sales
 where
 	category='Clothing'
	and
	to_char(sale_date,'yyyy-mm')='2022-11'
	and
	quantity>=4
--(3)calculate total sale for each category?
select 
category,
sum(total_sale)as net_sale,
count(transactions_id) as total_orders
from retail_sales
group by 1
--(4)calculate the average age of customers who purchased items from the beauty category?
select 
round(avg(age),2)as average_age
from retail_sales
where category='Beauty'
--(5)find all transactions where the total sale is greater than 1000?
select
*
from retail_sales
where total_sale>1000
--(6)find the total no of transactions(transaction_id) made by each gender in each category?
select
category,
gender,
count(transactions_id) as total_no_of_transactions
from retail_sales
group by 1,2
order by 1
--(7)calculate the average sale for each month.Find out best selling month in each year?
with t1 as
(
select
	extract(year from sale_date)as year,
	extract(month from sale_date)as month,
	avg(total_sale)as avg_sale,
	rank()over(partition by extract(year from sale_date) order by avg(total_sale)desc)as rank
from retail_sales
group by 1,2
)
select
year,
month,
avg_sale
from t1
where rank=1
--(8)find the top 5 customers based on the highest total sales
select
customer_id,
sum(total_sale)as total_sales
from retail_sales
group by 1
order by 2 desc
limit 5

--(9)find the no of unique customers who purchased items from each category?
select
category,
count(distinct customer_id)as unique_customers
from retail_sales
group by 1

--(10)create each shift and no of orders (eg morning<=12,afternoon between 12 and 17,evening>17)
with hourly_sale
as
(
select*,
case
when extract(hour from sale_time)<=12 then 'Morning'
when extract(hour from sale_time)between 12 and 17 then'Afternoon'
else'Evening'
end as shift
from retail_sales
)
select
shift,
count(transactions_id)as total_orders
from hourly_sale
group by 1

--End of Project





